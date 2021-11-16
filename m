Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC444537E5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:42:17 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1XE-0003NF-BE
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1RZ-0004e0-RO
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1RY-0005g7-F6
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637080583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HSUr17vRtI/061NtTLiHaZ3q+xxTmbhDa6o83n+S76g=;
 b=HvOTwJThxyCWh1puu5KYiwWTZI9arcvIqFgwMdox2u46nl2G4BahGmnkYwtxLBL6B1+8xy
 7siFtAKXSKJAQWdua7zXAtLAw1n+nuPjC0CEuRfRPuJmolLkjLVu+cvWXBdesrcEJLb24k
 8oUH0fq4N00Z2FdnDCWSpkX2dXhrFe0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-bS_m0C7iMEqU8j6SO3yVuw-1; Tue, 16 Nov 2021 11:36:22 -0500
X-MC-Unique: bS_m0C7iMEqU8j6SO3yVuw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso1721268wmq.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=HSUr17vRtI/061NtTLiHaZ3q+xxTmbhDa6o83n+S76g=;
 b=rtsITPcWr2bMC3ynd7KPN4EpTCcNK4OU1Zo6hw1NpiDPOLVONOuNCYyruiDe1nBYx5
 FObXOc+PRv/HAJcBx3zOxAWZpyEKIHEQCdOLEMNFDeCZvzsdoqnstPuqaOgNmnFqL0IS
 bnFubvgEqf2ni5Jacgrsxj2MMPk46KQ88GHNo+svG7j0igKYnCIhsoEXSLGVCCYjdJjF
 8OWJu3zD6XtcWlNvM8Iy01S7ZtbwznJ2qQF1tEBdzmMVQVI0XNErRg5jk/o9saj0/T5Y
 nn8YW6FCHdRriac7dfSobe/ryPMKLNwbQVrzfgDvKC+3hfG8LUM4IasxMhDErUHEgCuy
 4nrw==
X-Gm-Message-State: AOAM530WWosKa5HaL+QNHDiVTVRUon6cXnnI7VPDjy3iii6bwHs8uP4/
 0hYVxGSBJgWuMe2+Ods+Sos6Wa2uLA/jWXEihxsiu+utC3ntgXgNB7VpYQEriYansh4TkvkFMXT
 EIG/WzHQvKorHoyA=
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr11667733wrq.221.1637080581400; 
 Tue, 16 Nov 2021 08:36:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3gbsqmSwIYF+4Jt2uUafzxYtPcYxsDUTYqIHuoEqZXZ0W++mDr1HX0krj1g9vsLRffCRdwg==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr11667708wrq.221.1637080581270; 
 Tue, 16 Nov 2021 08:36:21 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id m34sm3365855wms.25.2021.11.16.08.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:36:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2] Fixed a QEMU hang when guest poweroff in COLO mode
In-Reply-To: <1636596693-8477-1-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Thu, 11 Nov 2021 10:11:33 +0800")
References: <1636596693-8477-1-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 16 Nov 2021 17:36:20 +0100
Message-ID: <878rxoukfv.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When the PVM guest poweroff, the COLO thread may wait a semaphore
> in colo_process_checkpoint().So, we should wake up the COLO thread
> before migration shutdown.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


