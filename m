Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92791366007
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:08:46 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvjp-00064v-Lt
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYviP-0005Py-0m
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lYviN-00023j-6i
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618945634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+GqaHEE98VpsfTBpc6n0WESBAyIBmrUSF4SZxsZHMI=;
 b=JjS2LJcWMIM8/yc58bgDJvpvjP1APNW2UcVjly3q/Wawlf8SnCuhSZl50nLvCX2lwHwBv5
 Eg0dJ/OldgWiKeVjFIdrjmRKdifkLLaC+ZSMtyoCXyLY+TEoXYi4fglYxtrXHVsO+t031j
 p8BYr1cEbNEoYmBHvODZLFLkKT3Ibck=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-JmCbYR1pMuKV-dUoFIBCyA-1; Tue, 20 Apr 2021 15:07:12 -0400
X-MC-Unique: JmCbYR1pMuKV-dUoFIBCyA-1
Received: by mail-qk1-f198.google.com with SMTP id
 h22-20020a05620a13f6b02902e3e9aad4bdso3714303qkl.14
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z+GqaHEE98VpsfTBpc6n0WESBAyIBmrUSF4SZxsZHMI=;
 b=hMNjn9gHgc/Dr4NgINiNf26X3sWjZDGoH7aH+bsFdFmXnBCP6lW9MTlaNQDVVWgjR0
 hwT84RBeDtCRv/rLYe6j4wQOo0nhF+tcfdA3L9hBtADMRZsu6mXqAD3+lcuTrh1UDeFe
 OGO2YOOZYLhi42Ib090z0k7vup6IhupBUAPl/m7o01cPqAMfiR/LMBbr0v1sh2tjJ7Jc
 qg0Hu8X8zU5DT2rvrLs4AaZRH33mDvLMPMDe39ilD/40et5xqkKPFBXn3QtCTtqVkbx7
 m/2bm8OsXrtManMk5PHwk9E0op7d5Et5A9QkzCwMgOzIUqc6+d5jXIxXK45+tcmFBcxd
 Woxw==
X-Gm-Message-State: AOAM53116vsBEg4OIchKDooNs7+lWYsW/o4stNLE/R4r0pgHPvIQ8FFx
 vyXwbZDCyAZwXJiwORa6zqY0l8uWuX4ZUJXebuoN8BA9q3ZC8hCaT2QZvdyiuI5FwGbpLkCs/CQ
 kqUm+EFHwm4XgyNE=
X-Received: by 2002:a0c:9b82:: with SMTP id o2mr28862696qve.47.1618945632100; 
 Tue, 20 Apr 2021 12:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa7fPuDKZnmd6bWkxJsJZuoSkEzyb/xueVB0ux7EfEUNFS/DbLuUjf/W/FMenZIaqm0WfquQ==
X-Received: by 2002:a0c:9b82:: with SMTP id o2mr28862675qve.47.1618945631831; 
 Tue, 20 Apr 2021 12:07:11 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id h193sm3024624qke.90.2021.04.20.12.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:07:11 -0700 (PDT)
Date: Tue, 20 Apr 2021 15:07:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 00/11] memory: Forbid mapping AddressSpace root
 MemoryRegion
Message-ID: <20210420190709.GE4440@xz-x1>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 17, 2021 at 12:30:17PM +0200, Philippe Mathieu-Daudé wrote:
> AddressSpace are physical address view and shouldn't be using
> non-zero base address. The correct way to map a MR used as AS
> root is to use a MR alias.

Today when I rethink this, I figured another way (maybe easier?) to fix the
issue.

The major problem so far we had is that mr->addr can be anything for a root mr
if it's added as subregion of another mr.

E.g. in current implementation of mtree_print_mr() MR.addr is constantly used
as an offset value:

    cur_start = base + mr->addr;

However afaict mr->addr is defined as "relative offset of this mr to its
container", as in memory_region_add_subregion_common().  Say, mr->addr is
undefined from that pov if mr->container==NULL, as this MR belongs to nobody.
And if it's defined, it's only meaning is in its container's context (or say,
address space) only.

That said, when we do mtree_print_mr(), another solution could be as simple as,
not referencing mr->addr if we _know_ we're working on the root mr, as this is
definitely _not_ in the context of the mr's container, even if it has one
container after all:

---8<---
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e43..d71fb8ecc89 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2940,7 +2940,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
         return;
     }
 
-    cur_start = base + mr->addr;
+    cur_start = base + (level == 1) ? 0 : mr->addr;
     cur_end = cur_start + MR_SIZE(mr->size);
 
     /*
---8<---

Phil, do you think it'll work too to fix the strange offset value dumped in
"info mtree"?

I don't know (even if it works, perhaps I've missed something) which is better,
as current series seems cleaner, then any mr will either belong to a AS or a MR
(never both!), but just raise it up.

Thanks,

--
Peter Xu


