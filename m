Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2C453789
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:32:42 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Ny-0005mR-3v
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:32:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1Lb-0003jP-8O
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1LY-0004qX-Ce
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637080211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZbuDUcabzPfJgBYqHrTl4V9EUnwAZW6oB7LlwLyBr4o=;
 b=AWD+mFrohou2Q/EAbJfoZX5y4TVUohy+xQCYOLVpBoqjKQWYh+UA7BwV17yyt67kjt83QF
 plIrATjVCll/TcAiNwsFqe9RY+yfR94PqTceSziQSKjyoAAYw1scEk6XM9+C1Q+nu2sa1R
 t46/oMmxXKcRM8ogh4/JJ07vAw1NlsU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-YZs99jMTMQS96Cfpfhaa4w-1; Tue, 16 Nov 2021 11:30:09 -0500
X-MC-Unique: YZs99jMTMQS96Cfpfhaa4w-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so4646674wrp.8
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ZbuDUcabzPfJgBYqHrTl4V9EUnwAZW6oB7LlwLyBr4o=;
 b=mjGSVs76n5IlEqOOCYOsqPf3cc2tNLL9kOo4Xtzxz4pH5n75oH+aunZLGpCnF8+Ds1
 5k8rcG2Wld/71dQaXpGmMfg2RmxXqvD8OI1PdB9zP9lQl9lAp6CHJgo1aISb/7/nCPIm
 btW7Nqbwll1xbq8dLGe1e8l4UPqSUyD8vaRGm7wb8+FH/Ve0k00rk7lNwX63196c6GPl
 07RM99CdA2796qD7Jl+4bOnmnf57J0ooVVM4jopiVfCm6Ga32IcEiaKk4mCJ4b7RxB8S
 /vB8pjQ0EM1nLwIkN9YRlFwMM+rXWtCAE9N+xNpVLJ4jLeIIUi+eZ+j2Fz7a73ue6nPf
 4d3w==
X-Gm-Message-State: AOAM532VDmaeneqMhw4F/DhZkX2dM1BmOS39c0gCbaz2wlm1k7biEa0z
 OMpvFK/QA+ziMT9rHG/GBFaLjuBWCizQrH/jpn0hL3vEKmL0t+0fgTDqxOaHtGOq2tZ1q5r8LXh
 WDuLJ0tKlLtjIZ/s=
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr9465345wmk.135.1637080208191; 
 Tue, 16 Nov 2021 08:30:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTMXlJ2DExEjEclwmq5XXoesJCkjgJ8JHY1V1cWYjs/82l7svl5b1ERRGlZRPQPGogGKoAVQ==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr9465315wmk.135.1637080207994; 
 Tue, 16 Nov 2021 08:30:07 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id z5sm3491465wmp.26.2021.11.16.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:30:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 2/2] migration/colo: More accurate update checkpoint time
In-Reply-To: <20211110174156.3834330-2-chen.zhang@intel.com> (Zhang Chen's
 message of "Thu, 11 Nov 2021 01:41:56 +0800")
References: <20211110174156.3834330-1-chen.zhang@intel.com>
 <20211110174156.3834330-2-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 16 Nov 2021 17:30:06 +0100
Message-ID: <87h7ccukq9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> wrote:
> Previous operation(like vm_start and replication_start_all) will consume
> extra time before update the timer, so reduce time in this patch.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued for 7.0.


