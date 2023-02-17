Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58B69AFD5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT32k-0003Ma-SO; Fri, 17 Feb 2023 10:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pT32i-0003MN-HF
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pT32f-0006wy-V1
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676649176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v7KKQH0dzSDqzyogG00u1A6XzP1biy7RKuAB9KUT0XM=;
 b=L1ULYUW+xWnY0zEu1OA1HuThm4X/+WdYrDI4ENpPxQxrNpfNFHxHoZIaUU5csQ4zDaiFkq
 85uo4qUaEOtidzc6w/tPxJIf18fT2/9nQtT25/nA7BX033gKmNoXd1yY6Y7J+MOAmwona5
 NBoBWJx3Wmfr/d5wY41hbbzHSeliJFI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-431v1mfYMvmQqbPUFDGsKA-1; Fri, 17 Feb 2023 10:52:55 -0500
X-MC-Unique: 431v1mfYMvmQqbPUFDGsKA-1
Received: by mail-il1-f199.google.com with SMTP id
 r2-20020a92d442000000b003157534461aso417184ilm.11
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 07:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676649174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7KKQH0dzSDqzyogG00u1A6XzP1biy7RKuAB9KUT0XM=;
 b=r/+RsosKDcBGKF+sMDr1+4PvqyR7ELmwkHsxIXBrCEOUUJGG239FGqux+E3bom2/5h
 Sy8GR26mr2kIHTAhbUSRd/XA1AMohsVtqeJWRl+jrxgUue8mX/p1bHf4WZtRSJAu+x37
 ODrp5hkEZsaEilCXQCVjQ0i9PBbQSnjgzBXdRK15knhRFMgX55q+k3X4g1glwb3gRIrv
 eF5uaDq1SI7PhUo2i7mOn1eDh/J8pv6UgQKYhMAF9g815qVPg153AJnUO+QeEXZlWvym
 sNTOSnG7ddrlU87NPsdbrw25YjtoJLtWJQXiZdS4uXHJEG2ZI8xaRZDRp5taw4lfDAQG
 4vyQ==
X-Gm-Message-State: AO0yUKV73C19xk2ne1wFxvEBH+gxNNNATbN50qs2l8P25bqEeQ93YKk+
 7MapBknayCDyNcHJYgff0NKC1/YaSSINpD71SPCr3vjCHqivdng/OGx4kU5bL5sogVH3jW2CS/0
 T2NB+ECsdUmuapg0=
X-Received: by 2002:a05:6602:2e13:b0:73a:397b:e311 with SMTP id
 o19-20020a0566022e1300b0073a397be311mr1625184iow.0.1676649174577; 
 Fri, 17 Feb 2023 07:52:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/ecy2QAIEO6NGzPdBLU8fsiugG779TP1bdWvTUrjksyw4jvSmINqgujUBoT8fElZ2b243ojQ==
X-Received: by 2002:a05:6602:2e13:b0:73a:397b:e311 with SMTP id
 o19-20020a0566022e1300b0073a397be311mr1625166iow.0.1676649174279; 
 Fri, 17 Feb 2023 07:52:54 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 k23-20020a02ccd7000000b003c4ecd21d5asm1570359jaq.23.2023.02.17.07.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 07:52:53 -0800 (PST)
Date: Fri, 17 Feb 2023 10:52:52 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y++i1NmxUxOPDM/V@x1n>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
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

Hello, Chuang,

On Fri, Feb 17, 2023 at 04:11:19PM +0800, Chuang Xu wrote:
> Error 1 was triggered by our sanity check. I try to add RCU_READ_LOCK_GUARD()
> in address_space_init() and it works. But I'm not sure if this code change is
> appropriate. If this change is not appropriate, we may need to consider other
> sanity check.

I'd suggest not adding RCU locks without a good reason.

address_space_init() is definitely a special context because the AS is
exclusively owned by the caller before it returns.  It means no RCU
protection needed at all because no one else is touching it; neither do we
need qatomic_rcu_read() when read.

So I suggest we directly reference current_map, even though that'll need a
rich comment:

 static void address_space_set_flatview(AddressSpace *as)
 {
-    FlatView *old_view = address_space_to_flatview(as);
+    /*
+     * NOTE: we don't use RCU flavoured of address_space_to_flatview()
+     * because we exclusively own as->current_map here: it's either during
+     * init of an address space, or during commit() with BQL held.
+     */
+    FlatView *old_view = as->current_map;

We can have address_space_to_flatview_raw() but since we'll directly modify
as->current_map very soon in the same function, so may not even bother.

> 
> Error 2 was related to postcopy. I read the official document of postcopy
> (I hope it is the latest) and learned that two threads will call
> qemu_loadvm_state_main() in the process of postcopy. The one called by main thread
> will take the BQL, and the one called by ram_listen thread won't take the BQL.
> The latter checks whether the BQL is held when calling memory_region_transaction_commit(),
> thus triggering the assertion. Creating a new function qemu_loadvm_state_ram_listen()
> without memory_region_transaction_commit() will solve this error.

Sounds right, because the whole qemu_loadvm_state_main() process shouldn't
load any device state or anything that requires BQL at all; in most cases
that should be only RAM states leftovers.

I think we only want to optimize precopy but not the postcopy phase. Note!
it should include the phase when transferring precopy -> postcopy too, so
it's covering postcopy, just not covering the "post" phase of migration -
if you see that's a nested call to qemu_loadvm_state_main() with a whole
MIG_CMD_PACKAGED package which is actually got covered, which is the real
meat for postcopy on device transitions.

So in short: instead of creating qemu_loadvm_state_ram_listen(), how about
modifying your patch 3, instead of changing inside qemu_loadvm_state_main()
we can do that for qemu_loadvm_state() only (so you can wrap the begin()
and commit() over qemu_loadvm_state_main() there)?

> 
> I don't know if you suggest using this patch in postcopy. If this patch is applicable to
> postcopy, considering the difference between how postcopy and precheck load device state,
> do we need to consider more details?

See above.  Yes I definitely hope postcopy will be covered too.

Thanks!

-- 
Peter Xu


