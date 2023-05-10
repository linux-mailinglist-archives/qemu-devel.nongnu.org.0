Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A66FDBE0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:45:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhJw-00088B-Dj; Wed, 10 May 2023 06:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwhJr-00087w-Ny
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwhJp-0002Lj-UT
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683715513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cI7kH27oxC6baS45BJkTvHX3pCI95Z029OWAZsllqgw=;
 b=CfBxG9xcMpeVMLAqRhmrmcICOAZtEDIGcT2f3JWYR9YJ/FsMScUqAusqgxK4k8cqS4OWY3
 CK76nftXCn2QWn1Sh0J0KatOfV1Dp/HrWoe5/O+zND6UBfeOHIF2CWN8hIdY+iHNEX4lZ7
 MmhGzcKFB5fouxrKE5RwGpBd/LpxPR0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-VA6crfR0NieuxhnlsGidag-1; Wed, 10 May 2023 06:45:11 -0400
X-MC-Unique: VA6crfR0NieuxhnlsGidag-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bf847b267so8042588a12.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683715510; x=1686307510;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cI7kH27oxC6baS45BJkTvHX3pCI95Z029OWAZsllqgw=;
 b=eF1scjtbkZTgYlBKF5HOdV+b/ppYojhPTPm/HJyWPgIKILTQKArUWL2xGmMnVdUXMx
 RlorB4svgTpVIFM/vaRw50y7EUJQYpit3R6Zx1roLLrZOAPhEGgkfUPuFMRxxVZLPDTq
 ldVTHDNWrm3cU1JTdHV5urLQzTvG6VYRLAPvjCq6F+W1MXfIWnaasy4b4byHGSSc58Vq
 qlgACKSWSwB8CZeqbHOZPDP7RcvNrIQ5cHdMfvvnPNTgKkELqLK73nsQREKZf1XzOjk6
 EEbZHILWakjG6KexAxAaZdJDeMeM0UgADgIWqQoCwk7XepXpyKGqagZIO7tiDKpsvhdh
 vZcA==
X-Gm-Message-State: AC+VfDys25/Nz5Lut7B3uFGez47Mem1yMrn8JKtg1JqWboSJgON2AflZ
 Q65W3A68VCfg/gDjXoVRvPOO6nr0/3q+Q6GJe9gn5gu0I02Aa+i6jTpR/KkAmbkmoytlGCl2oiO
 Lj95ciU+WLOSiAIP0Bf7jlSQ=
X-Received: by 2002:a05:6402:1255:b0:50b:cadd:21e6 with SMTP id
 l21-20020a056402125500b0050bcadd21e6mr15178162edw.8.1683715510217; 
 Wed, 10 May 2023 03:45:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ptJTywSRUhAYURt7I4MWfOV7/9v4PwEPXO+qxIDnd0S1tyK1kHtvAHd5rbe28QIaN08dTig==
X-Received: by 2002:a05:6402:1255:b0:50b:cadd:21e6 with SMTP id
 l21-20020a056402125500b0050bcadd21e6mr15178139edw.8.1683715509769; 
 Wed, 10 May 2023 03:45:09 -0700 (PDT)
Received: from ?IPV6:2003:cf:d706:2e02:6e14:9279:969b:d328?
 (p200300cfd7062e026e149279969bd328.dip0.t-ipconnect.de.
 [2003:cf:d706:2e02:6e14:9279:969b:d328])
 by smtp.gmail.com with ESMTPSA id
 w23-20020aa7cb57000000b0050b57848b01sm1708248edt.82.2023.05.10.03.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:45:09 -0700 (PDT)
Message-ID: <0a51c480-204d-1103-317e-fd638584eb84@redhat.com>
Date: Wed, 10 May 2023 12:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] QCOW2: Add zeroes discard option
Content-Language: en-US
To: Jean-Louis Dupond <jean-louis@dupond.be>, qemu-devel@nongnu.org
References: <20230509090118.358857-1-jean-louis@dupond.be>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230509090118.358857-1-jean-louis@dupond.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thanks for the patch!

As a note for hopefully many future patches ( :) ), you should run 
scripts/checkpatch.pl on them to check for coding style issues. Here, it 
reports two lines that are longer than 80 characters.

Second, ideally, patches are not just sent to the qemu-devel list, but 
also to the maintainers for the code base in question (because they’re 
the ones who will have to look at patches eventually, and because 
qemu-devel has so much traffic, more often than not they don’t monitor 
it).  scripts/get_maintainer.pl can tell you who they are (including 
their email addresses).

On 09.05.23 11:01, Jean-Louis Dupond wrote:
> When we have a sparse qcow2 image and discard: unmap is enabled, there
> is a lot of fragmentation in the image after some time. Surely on VM's
> that do a lot of writes/deletes.
> This causes the qcow2 image to grow even over 110% of its virtual size,
> this because the free gaps in the image get to small to allocate new
> continuous clusters.
>
> There are multiple ways to properly resolve this. One way is to not
> discard the blocks on a discard request, but just zero them. This causes
> the allocation the still exist, and results in no gaps.
> This should also cause a perfectly continuous image when using full
> preallocation.

I think you should also mention why you want discard to work at all.  As 
far as I remember, it was that guests tend to prefer discard over 
write-zero when they don’t care about the data in some unused block, and 
you want those blocks to be efficiently copied when doing a back-up.  
You’ve explained why discard=unmap doesn’t work well in your case, so 
you want it to be a write-zero operation, which will still have 
everything be handled efficiently while retaining the allocation.

Did I get that right?

> RFC because my knowledge of qcow2 is limited, and I think its best some
> developer with qcow2 knowledge has a look at it :)
> Tested and seems to zero the blocks correctly instead of unmapping them.

Now that I’m actually reviewing this patch I wonder whether we need to 
do it in qcow2 at all.  Would it be simpler and better (because it would 
work not only for qcow2) to have bdrv_co_pdiscard() translate a discard 
request with UNMAP_ZERO into a bdrv_co_pwrite_zeroes()?

> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1621
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> ---
>   block.c                              |  2 +
>   block/io.c                           |  2 +-
>   block/qcow2-cluster.c                | 85 +++++++++++++++-------------
>   include/block/block-common.h         |  1 +
>   qapi/block-core.json                 |  3 +-
>   qemu-nbd.c                           |  2 +-
>   qemu-options.hx                      |  2 +-
>   storage-daemon/qemu-storage-daemon.c |  2 +-
>   8 files changed, 54 insertions(+), 45 deletions(-)

I have a question for the patch as-is, though, too: What is supposed to 
happen if you use discard=zero on a non-qcow2 block device?  As far as I 
understand, they will just unmap the area then, not leaving it 
allocated.  But I think that isn’t the intention; I don’t think we want 
to have discard=zero fall back to discard=unmap, so for drivers that 
don’t support discard=zero, we should just do nothing and not call their 
discard function.  (We could achieve this by having bdrv_co_pdiscard() 
call bdrv_co_pwrite_zeroes(), as described above.)

I think the behavior we want should also be explicitly described in the 
documentation, as well as a guideline on when people may want to use 
this option over discard=unmap (i.e. what I’d also like to have in the 
commit message).

Finally, a technical thing: To keep the diff smaller, I wouldn’t move 
the whole qcow2_cluster_discard() function down, but instead 
forward-declare zero_in_l2_slice() above it.

Hanna


