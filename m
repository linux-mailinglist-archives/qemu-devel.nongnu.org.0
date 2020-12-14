Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0952D9B31
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:39:03 +0100 (CET)
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopwE-0008WE-Qq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1koptu-0006Ir-Ev
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:36:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kopts-0006pL-1P
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607960194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bN0DNXNSInI/PUznMbccKGFx80g50n+CDIyuUroqsW4=;
 b=C067UH3TdvaZ4X1xrNoV6ZicgiptMGnOs5JVT/oQgFAabiBxNik/mUWm8Ts/NOWHs8GlNT
 uEXNOach7BVdSZUJZ0cMsTTFAOOXQqGCGeDhaHB3j5i6nVTtRJuym/Mg//qr+taDrmvbKT
 rNve/l09KNg+MC2QR4Vh1v8MwIyctSU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-N-GSU9P-PvmeDq9HY9Qz-Q-1; Mon, 14 Dec 2020 10:36:28 -0500
X-MC-Unique: N-GSU9P-PvmeDq9HY9Qz-Q-1
Received: by mail-qk1-f200.google.com with SMTP id 188so4089307qkh.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bN0DNXNSInI/PUznMbccKGFx80g50n+CDIyuUroqsW4=;
 b=gXArzhDbOF7JnwB8RHEnZwxcWZ5B8joQeuX6RuSAcv7B002Emh8Vd1OkeOw4aCHKAj
 l2TPG8nBzD2gLrBQgQTRDZBZvlt00+ELIaKu9bYZFPMzII7gQPyoXShXv0Lr+OW7SCJ7
 U7e3BLMagAasslUVcUf3BAmYn/B+DJclv3Eo5UPO8e8COPXH2ZBto16/GoofVZTLy7E9
 5tLCYKqP4wQFQqZKvg3WzfgeVZ6fLRNYOBKJulTsphf1wsf9t/g/hGptYUvpte2eRE30
 l44zLpToFgG4I8MZVdneWSFtPN/5MAUBNdVi+bBfCf7FzBRUYFE2oUfFaPXAhzeAVAZk
 5dRg==
X-Gm-Message-State: AOAM530Pg3gtBbqWzooHeBSJBQXRmHQtafT0/4onyutx8eS3QEFTpBMh
 lRvvcn/7sBEZqKyHBfnHw1kbybqW2zVN4OTEJfn1CDd9pc8NuNGWnq2k7mIvv9JTVn8aVm30G9m
 LrGN6ZMQtnMoc+mc=
X-Received: by 2002:a37:6cc3:: with SMTP id
 h186mr32579071qkc.108.1607960187797; 
 Mon, 14 Dec 2020 07:36:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykvHj4SSbQUE1fyPW4Lw1LHi89WsTLrZKzd7STsbg7mwY967kfHk7Lt6rTYtPI7FoHa/vpEA==
X-Received: by 2002:a37:6cc3:: with SMTP id
 h186mr32579042qkc.108.1607960187513; 
 Mon, 14 Dec 2020 07:36:27 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id f10sm5240190qtg.27.2020.12.14.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:36:26 -0800 (PST)
Date: Mon, 14 Dec 2020 10:36:25 -0500
From: Peter Xu <peterx@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201214153625.GF6520@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
 <20201210145006.GD3211@xz-x1>
 <2607b4cd-524c-2360-6261-224736861fc4@huawei.com>
 <20201211152518.GD6520@xz-x1>
 <41d9ac96-83af-e8c3-6e54-c702f5527f5e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <41d9ac96-83af-e8c3-6e54-c702f5527f5e@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 10:14:11AM +0800, zhukeqian wrote:

[...]

> >>> Though indeed I must confess I don't know how it worked in general when host
> >>> page size != target page size, at least for migration.  For example, I believe
> >>> kvm dirty logging is host page size based, though migration should be migrating
> >>> pages in guest page size granule when it spots a dirty bit set.

[1]

> Hi Peter,

Keqian,

> > OTOH I'm more worried on the other question on how we handle guest psize !=
> > host psize case for migration now...
> I think it does not matter when guest_psize != host_psize, as we only need to interact with
> stage2 page tables during migration. Stage2 is enough to tracking guest dirty memory, and even
> if guest close stage1, we also can do a successful migration.

I don't know why 2-stage matters here, since I believe KVM can track dirty
pages either using two dimentional paging or shadowing, however it's always
done in host small page size.  The question I'm confused is there seems to have
a size mismatch between qemu migration and what kvm does [1].  For example, how
migration works on ARM64 where host has psize==4K while guest has psize=64K.

Thanks,

-- 
Peter Xu


