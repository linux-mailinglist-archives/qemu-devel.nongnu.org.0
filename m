Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E566AB2BF
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 23:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYwUZ-0001nX-7S; Sun, 05 Mar 2023 17:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYwUX-0001mr-5G
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 17:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYwUV-0001jO-4S
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 17:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678053955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y28MeNolGFqdyY3Ve52cqMbFFTtEZxaLsCyEm4tUeIM=;
 b=Qt5ZthzQjeXzXBbRzKUlr3Wwgefn1M3FMG8BWwd7YQEm2c9HJstihiD8e4spnEgG6Ln5FP
 unYZs2s/T24MbrlM3oX+TMOTbL/nQ7QmHWBp7p2HdelR35UnQJbAjMFhVXQsuK9SdxJm5f
 jMl6W0zrnnpUEX2/LK9mRymv3/sc0Bc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-YWJuqTaDOs6IlKRRU6j7Pg-1; Sun, 05 Mar 2023 17:05:53 -0500
X-MC-Unique: YWJuqTaDOs6IlKRRU6j7Pg-1
Received: by mail-qv1-f71.google.com with SMTP id
 y3-20020a0cec03000000b0056ee5b123bbso4595617qvo.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 14:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678053953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y28MeNolGFqdyY3Ve52cqMbFFTtEZxaLsCyEm4tUeIM=;
 b=Fk57ogd1kPU0A+5kNd1Go/V2FJSBbDzVYBqHuHjRzSUgcBs7lWCwBf+eE3o7XNt0Au
 1jeZtf5yGCORfbOfsl67fGbMgKMh2XOGDFecRwnYuMBSgM+RDhvtTeuzNec/WNh3LZcQ
 z4Fkk2jTCWX09xuisqjymqWDSzTOtu7iQ1kQ+yCkLjGhMh7PngtNyA6UHu1i/6kNuCEh
 UBRkucFeyknCq8d04DfvEkcuGUnvfjlPrpCRV632HwjSvvJfRzxa5b0AGj5oCv+PZtiv
 w84sCfw7ky/0Gt1VAjIACQT0VH2VdskqyRFZnAdKHL+AOS+cphzhDMFjVdjM5/JJap9Y
 lXEQ==
X-Gm-Message-State: AO0yUKWyhCzFcAEzITeDR89836rmgULLI1FU0skj0x8JMat+h67J9UIv
 7JzGnEzLWQMyaa1Pn92IH0k1g1qjdRyk2MxP5z0puVRFoYMaIt2gK5mUO7ZZa9DHIPGJYKP67BO
 BcSPwkXWwwO5pAkw=
X-Received: by 2002:a0c:b290:0:b0:58c:e188:642a with SMTP id
 r16-20020a0cb290000000b0058ce188642amr782026qve.4.1678053953156; 
 Sun, 05 Mar 2023 14:05:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+QwLFUCJSPtkkb26qAs5fTKlk7kihfchBfCXagtVi8t+TskRvtL4a4084d0Ke9IG+NrnJA1A==
X-Received: by 2002:a0c:b290:0:b0:58c:e188:642a with SMTP id
 r16-20020a0cb290000000b0058ce188642amr782012qve.4.1678053952873; 
 Sun, 05 Mar 2023 14:05:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 p2-20020a374202000000b007429961e15csm6209284qka.118.2023.03.05.14.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 14:05:52 -0800 (PST)
Date: Sun, 5 Mar 2023 17:05:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <ZAUSPo9bJO0udf9p@x1n>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, Chuang,

On Fri, Mar 03, 2023 at 06:56:50PM +0800, Chuang Xu wrote:
> Sorry to forget to update the test results in the last patch of v6.
> 
> In this version:
> 
> - add peter's patch.
> - split mr_do_commit() from mr_commit().
> - adjust the sanity check in address_space_to_flatview().
> - rebase to latest upstream.
> - replace 8260 with 8362 as testing host.
> - update the latest test results.
> 
> Here I list some cases which will trigger do_commit() in address_space_to_flatview():
> 
> 1.virtio_load->virtio_init_region_cache
> 2.virtio_load->virtio_set_features_nocheck

What is this one specifically?  I failed to see quickly why this needs to
reference the flatview.

> 3.vapic_post_load

Same confusion to this one..

> 4.tcg_commit

This is not enabled if kvm is on, right?

> 5.ahci_state_post_load
> 
> During my test, virtio_init_region_cache() will frequently trigger
> do_commit() in address_space_to_flatview(), which will reduce the
> optimization  effect of v6 compared with v1.

IIU above 1 & 4 could leverage one address_space_to_flatview_rcu() which
can keep the old semantics of address_space_to_flatview() by just assert
rcu read lock and do qatomic_rcu_read() (e.g., tcg_commit() will run again
at last stage of vm load).  Not sure how much it'll help.

You may also want to have a look at the other patch to optimize ioeventfd
commit here; I think that'll also speed up vm load but not sure how much
your series can further do upon:

https://lore.kernel.org/all/20230228142514.2582-1-longpeng2@huawei.com/

Thanks,

-- 
Peter Xu


