Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC159D165
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:42:45 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNcZ-0006Ld-HT
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNFd-00048J-0R
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNFY-0001ed-9I
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661235535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lduxh9UbKFIWLzbQl5gBiF/tqy2LJY2TYh/YHTfs54Q=;
 b=IE/BAsxtUjZwU/cxaISyePCZHCz8pdzmqk2A0PEvH6zQHg/m4Rnyydh6UmS1GESOdIib2Z
 YSzUHoDTe54VpPuh9TN4kZxnBBbt1j8qXBSI+3I3OX0wPw8Px1gU4amOuqvIB99bPT2ymK
 iSyLURbyReEwNf/vBDblOG7wGuggMpw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-9ucruHjrNpepoLcmS3huvQ-1; Tue, 23 Aug 2022 02:18:53 -0400
X-MC-Unique: 9ucruHjrNpepoLcmS3huvQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 cp14-20020a056a00348e00b0053632d32716so3433820pfb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Lduxh9UbKFIWLzbQl5gBiF/tqy2LJY2TYh/YHTfs54Q=;
 b=ptUBiOkC8OWeg0wAXbDhwNijJbAd6/OxfmxfZ6oCkqzD4lynQLRD/iomj/A57Cc1uc
 yUMeVqKF5Dr+9KFQ5+GHLOTUq8D9i9Z1mM6zOJToSdevctH74xBtLJEOJ0FdZbPRH/3e
 tRBYpXghjSDnBdKKvf0y9JhtpRiuBJCn2T4lmgo1WL/ikpm2BVpy07VlDDMQCUnO0gcF
 d3+I80WgLzA/e67Abo4zVGI/dZ6nNBt68D2z89OqWZidEWGOrEeWoH4pDr45o4q0W0EM
 PcMnBChUn5XT0MJ20RALdZb3Sw0dfs4rFVbOZ2w+b+vGzZM6Qe0Kfl1Z3z3slzuv4iPi
 SOyw==
X-Gm-Message-State: ACgBeo228Clq582Xr5hMwlTmF5jKRWvVEBJN1pijAq53P6DrFcGKIUPK
 pMZr6SLHBK5UNc4PFAhQ+oqWhj8U6GNVypNjSu8hXkz9lC2LXjQ95wqRbCm+CGDFx4SxvOVCw2D
 E4Ho05vCrYEuv9z8=
X-Received: by 2002:a17:90a:6707:b0:1fb:6461:695d with SMTP id
 n7-20020a17090a670700b001fb6461695dmr1406813pjj.158.1661235532238; 
 Mon, 22 Aug 2022 23:18:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6nYrTkzkIbiNCraC5CnAqwRO9dyzXJ3nKZI9OEqDJvwSEjPECt3OTUT2m95Pu0e8b5XpEHFA==
X-Received: by 2002:a17:90a:6707:b0:1fb:6461:695d with SMTP id
 n7-20020a17090a670700b001fb6461695dmr1406791pjj.158.1661235531952; 
 Mon, 22 Aug 2022 23:18:51 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa7971a000000b0052d40c4c06esm4744437pfg.39.2022.08.22.23.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:18:51 -0700 (PDT)
Message-ID: <5c31c89d-4235-c8aa-18f4-0556dc579849@redhat.com>
Date: Tue, 23 Aug 2022 14:18:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 3/7] util: make a copy of iova_tree_remove_parameter
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819165357.3591965-4-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/20 00:53, Eugenio Pérez 写道:
> It's convenient to call iova_tree_remove from a map returned from
> iova_tree_find or iova_tree_find_iova.


The looks like a hint of the defect of current API.


>   With the current code this is not
> possible, since we will free it, and then we will try to search for it
> again.
>
> Fix it making a copy of the argument. Not applying a fixes tag, since
> there is no use like that at the moment.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   util/iova-tree.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index fee530a579..713e3edd7b 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -166,9 +166,11 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
>   
>   void iova_tree_remove(IOVATree *tree, const DMAMap *map)
>   {
> +    /* Just in case caller is calling iova_tree_remove from a result of find */
> +    const DMAMap needle = *map;


Then let's simply make iova_tree_remove() accept const DMAMap instead of 
the pointer to it.


>       const DMAMap *overlap;
>   
> -    while ((overlap = iova_tree_find(tree, map))) {
> +    while ((overlap = iova_tree_find(tree, &needle))) {
>           g_tree_remove(tree->tree, overlap);
>       }


So we had following in iova_tree_insert():

     /* We don't allow to insert range that overlaps with existings */
     if (iova_tree_find(tree, map)) {
         return IOVA_ERR_OVERLAP;
     }

I wonder how overlap can happen?

Thanks



>   }


