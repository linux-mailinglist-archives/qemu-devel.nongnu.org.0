Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F508688824
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 21:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNfzN-0005d3-6C; Thu, 02 Feb 2023 15:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNfzE-0005cU-8e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNfzC-0002Db-GI
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675368909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YFLvbVdxu2NC6q00IziTNmwnOxllQKDkU4HfcQ+d/O8=;
 b=fxYWUo6R2X0TXeRZl2Uvy158sbTRvNd+o0O29z0Z0YMIgkt0DetDUSpDmzocbkSiEOISHl
 BVLyrCUl1J2ISTEvRg0kJoYzADP5JOVkt4OR6bISH3bsaWgCBoxWPMohfYVybzRzka9Zv+
 zGY2R/11p3REF+cmZZKTucCS9lAZ5EE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-h6e7PZ3UMUqtPtQkRsF59w-1; Thu, 02 Feb 2023 15:14:54 -0500
X-MC-Unique: h6e7PZ3UMUqtPtQkRsF59w-1
Received: by mail-wm1-f69.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so1187890wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 12:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFLvbVdxu2NC6q00IziTNmwnOxllQKDkU4HfcQ+d/O8=;
 b=G9skRk1qowBHGJ3nrBAlPxb2wUuM9QbCS+DgfID5dhyuDzm3EI1bE6bzHdlG/1F0Ns
 Xu6d0T40f3vK6TD+qzT7W+Jd0hs0nozMks5pR+1noaqouTm6ZLUR6rBsUfcgDKg5/lA6
 9RSGdV+/JSz7uAJbcuexw4slYo5bMsfPuCV3b9nBG4BDBhDe5Qz7610nCSOIOqAKtYhY
 o4tDbXvdtkytlfeLKbKLQunvJ+ZuV3AA84Nm1CLHy71BUuY+GBaoPLqVmVWt7DbVNnzh
 zuitl2aRx1lomf+8eEuEu3PdSh7+CTLQUqgXsvoatmoO7c6VN1M2p1jGOSNEXUSZax4Y
 ijmw==
X-Gm-Message-State: AO0yUKUKA6YQZc8bu0C6SdDW7ybQ1UhOspoG9Z/Mr3cA6BeuIYsl/Xjl
 IwmXHHMFkeJwHZNPW3VsbHWFQglH5Rmy8bd/D2CpAI1GFwM6UEwF+Ghe4rOFaeuSRgK3NAZi55H
 ogHLgZ26sOOHBtek=
X-Received: by 2002:a5d:6d46:0:b0:2bf:bac7:30d4 with SMTP id
 k6-20020a5d6d46000000b002bfbac730d4mr6752602wri.53.1675368888206; 
 Thu, 02 Feb 2023 12:14:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+UItgcb7EyB8E2F21Q9/YTXnHjkcmYgPvwtAm46LQJQHe30BsHAkdknN7d9nU+BAmCyi0ryw==
X-Received: by 2002:a5d:6d46:0:b0:2bf:bac7:30d4 with SMTP id
 k6-20020a5d6d46000000b002bfbac730d4mr6752589wri.53.1675368887961; 
 Thu, 02 Feb 2023 12:14:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5d654f000000b002ba2646fd30sm325153wrv.36.2023.02.02.12.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 12:14:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com
Subject: Re: [PATCH 2/2] multifd: Fix flush of zero copy page send request
In-Reply-To: <20221017075351.2974642-2-zhenzhong.duan@intel.com> (Zhenzhong
 Duan's message of "Mon, 17 Oct 2022 15:53:51 +0800")
References: <20221017075351.2974642-1-zhenzhong.duan@intel.com>
 <20221017075351.2974642-2-zhenzhong.duan@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 21:14:46 +0100
Message-ID: <87wn4zsu2x.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
> Make IO channel flush call after the inflight request has been drained
> in multifd thread, or else we may missed to flush the inflight request.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Good catch!!!!!

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued the whole series.


