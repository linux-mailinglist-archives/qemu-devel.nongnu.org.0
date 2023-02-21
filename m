Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82069DC70
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOT0-0006Zp-Fr; Tue, 21 Feb 2023 03:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUOSy-0006XM-5t
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:57:40 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUOSv-0004cM-MV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:57:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ky4so5435171plb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTmzP2Ip/krGYM0NnJdgltJdTcGNppiOoof/w4fenvI=;
 b=0aj39yNBFoC2+CuUdtWVs41xFq2aolYyNL/8Hy9dIyyTxIFWHJTfEKSiXWth66Skwc
 2CIjAvoxoRZ34wnA8Py3tId+KXpkigcIDqrAnrvkXZ2D9R8g5JqdfWPpmUEcwL2QsiMs
 reNhQGSJ+OBmL0WGFgyUTumcSKSKjeMeMmfruQlppLYTzaqUYjBF9WMCLmTFL+08kIAz
 61UiXVJeRfMthuPNORukY3rpK3TkPDt7XqqGohmj/c2dvGx9CviHehSSTHxoheYr/He7
 VA+IcWNg25WMXjdtHEHnGx/uJLKcS6nSQ2syNOkqV9zB1O4imDr9hE7MGH8P8Hbd6rg6
 3biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pTmzP2Ip/krGYM0NnJdgltJdTcGNppiOoof/w4fenvI=;
 b=5DDtZn7pKDtltc7K+QxgTxrCSi1tXooPp19mpQAamFaEFuiGqIL/BrF9cl8jhnO8y/
 1yTpv5xJIr8e5moVYHRyGU65pz0Is8S0I2/eYkRvR+lQo6nJWEh+OgAitGwI/8UXAQ8B
 EPY5ityOTv5ATsGYPon701e2DauPwNU4KJzgVTUl0QLEie1M8Ldv76MzeLp8EFsSMPAd
 OALKRrEORhly9qFM0lNjAu2ZtFOUJqT01ITNbenn57vppCzEe2XLCQPFk9j+ve+mZ/OU
 HrM7rzg7/lfWCl/H+c/yHjNFqiMk+o5HLV9cOstMNU1Wk7/ZRKYW/PL9VMF3VUfWu1Eb
 ly6A==
X-Gm-Message-State: AO0yUKV4xL65Zx5UOookERkDbvv7tZ3mo4eOFXC2sl29CQiJJS4uj7jH
 JNG1JMRt+JXX1opNYAkU+5Vz/A==
X-Google-Smtp-Source: AK7set8ccvtoBKb0Gyur4t0AqeptNWc2VhOya4A9IPR9M+EBLDvd2uNKtyChGLV7KgdamzEKKVbYTQ==
X-Received: by 2002:a05:6a20:158d:b0:bc:f0d2:e268 with SMTP id
 h13-20020a056a20158d00b000bcf0d2e268mr16051668pzj.29.1676969855680; 
 Tue, 21 Feb 2023 00:57:35 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a637f0b000000b00478c48cf73csm1327124pgd.82.2023.02.21.00.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:57:35 -0800 (PST)
Message-ID: <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
Date: Tue, 21 Feb 2023 16:57:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com> <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
In-Reply-To: <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter

This email is a supplement to the previous one.

On 2023/2/21 上午11:38, Chuang Xu wrote:
>
> I think we need a memory_region_transaction_commit_force() to force 
> commit
> some transactions when load vmstate. This function is designed like this:
>
> /*
>  * memory_region_transaction_commit_force() is desgined to
>  * force the mr transaction to be commited in the process
>  * of loading vmstate.
>  */
> void memory_region_transaction_commit_force(void)
> {
>     AddressSpace *as;
>     unsigned int memory_region_transaction_depth_copy = 
> memory_region_transaction_depth;
>
>     /*
>      * Temporarily replace memory_region_transaction_depth with 0 to 
> prevent
>      * memory_region_transaction_commit_force() and 
> address_space_to_flatview()
>      * call each other recursively.
>      */
>     memory_region_transaction_depth = 0;
>
>     assert(qemu_mutex_iothread_locked());
>
>
>     if (memory_region_update_pending) {
>         flatviews_reset();
>
>         MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
>
>         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>             address_space_set_flatview(as);
>             address_space_update_ioeventfds(as);
>         }
>         memory_region_update_pending = false;
>         ioeventfd_update_pending = false;
>         MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
>     } else if (ioeventfd_update_pending) {
>         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>             address_space_update_ioeventfds(as);
>         }
>         ioeventfd_update_pending = false;
>     }
>
>     /* recover memory_region_transaction_depth */
>     memory_region_transaction_depth = 
> memory_region_transaction_depth_copy;
> }
>
> Now there are two options to use this function:
> 1. call it in address_space_to_flatview():
>
> static inline FlatView *address_space_to_flatview(AddressSpace *as)
> {
>     /*
>      * Before using any flatview, check whether we're during a memory
>      * region transaction. If so, force commit the memory region 
> transaction.
>      */
>     if (memory_region_transaction_in_progress())

Here we need to add the condition of BQL holding, or some threads without
BQL held running here will trigger the assertion in
memory_region_transaction_commit_force().

I'm not sure whether this condition is sufficient, at least for the mr access
in the load thread it is sufficient (because the load thread will hold the BQL
when accessing mr). But for other cases, it seems that we will return to
our discussion on sanity check..

Another point I worry about is whether the number of mr transaction commits
has increased in some other scenarios because of this force commit. Although
So far, I haven't seen a simple virtual machine lifecycle trigger this force commit.
I did a little test: replace commit_force() with abort() and run qtest.
Almost all error I can see is related to migration..

> memory_region_transaction_commit_force();
>     return qatomic_rcu_read(&as->current_map);
> }
>
> 2. call it before each post_load()
>
> I prefer to use the former one, it is more general than the latter.
> And with this function, the sanity check is not necessary any more.
> Although we may inevitably call memory_region_transaction_commit_force()
> several times, in my actual test, the number of calls to
> memory_region_transaction_commit_force() is still insignificant compared
> with the number of calls to memory_region_transaction_commit() before
> optimization. As a result, This code won't affect the optimization 
> effect,
> but it can ensure reliability.
>
Looking forward to your opinion, Thanks!


