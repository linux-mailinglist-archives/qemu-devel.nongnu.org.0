Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90E5483CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:58:17 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0gps-0005Wk-0S
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0gmP-0004Rr-FU
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0gmM-0002dr-R9
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655114077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iK7UX0WDGYuBKZnGKedeJx9a4/CQliq6bDNiTnoB1wg=;
 b=A28EpoB3vbDOaDx7kdhdqxZBGeUp3GrRvajC/uhnQc8V4TRTQCQwAb3gOqNRFaOq5gFZS3
 wZIZSshaYPHIs2+f89+6RKwzgkDbxOdvXhzYxXJT09VkATulNBUMRl0+8QvPi5CAUc3R7w
 3e5Y14ES17ZKT6xCKA9/XAIE1xoF7Uw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-elxO8SugNLegWVSxzTyYSA-1; Mon, 13 Jun 2022 05:54:36 -0400
X-MC-Unique: elxO8SugNLegWVSxzTyYSA-1
Received: by mail-ej1-f69.google.com with SMTP id
 t15-20020a1709066bcf00b0070dedeacb2cso1580867ejs.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 02:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iK7UX0WDGYuBKZnGKedeJx9a4/CQliq6bDNiTnoB1wg=;
 b=xlYfZEh9RM649ZWsBKtd86+zjVwxDgnI7TGUE6xwkGzryiFgZCVB8xda7fr8dtUz8H
 uDch5IVMbPzftDUtpgVtURZ8NOnXcCNeXE4DCid/uCI79x3FNdbh3G5dnxRmPDjorEdn
 v+AkEIg8/9So/meMP7zeDJQFkIMwwT3J0AMlZIBcvdEZhRP/C8BSZS3nGRT3q434jKWT
 UPls21v3/HBGIB9n4K+zvWKXYQFf5Rqv9BMl9LQIl6OZX8WlbaWz7krZUpF/oPLdZrVY
 oFHj3tOzQIIMWgDCs1ATix4EnUb8X2qkr59QpAA3lrJr7MyMR8B2NxLs6YCqH6hhBtcl
 95RQ==
X-Gm-Message-State: AOAM531CM6pfnlDTtWaNh3xIHcSZzzgQz3EemvAlUVnCmshhzTtXwc1a
 u8LhLCCAVaxH4YH0D7NDDNDrNKdLPFBVtdv1G/nwnnSx+rTMQbJcIbv4e743tRP9SryOvyGcLHr
 ksoi3lyWEZXL2vRQ=
X-Received: by 2002:a17:906:130c:b0:715:785b:b624 with SMTP id
 w12-20020a170906130c00b00715785bb624mr7566643ejb.331.1655114075038; 
 Mon, 13 Jun 2022 02:54:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2raNYtRtc3O3Ix2cTqybS8UWT3DwXa1vQZiBjRx7g5/MaiFwbQZk7sdto1rnv7X2NoblSrA==
X-Received: by 2002:a17:906:130c:b0:715:785b:b624 with SMTP id
 w12-20020a170906130c00b00715785bb624mr7566622ejb.331.1655114074813; 
 Mon, 13 Jun 2022 02:54:34 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056402040800b0042dd4f9c464sm4574308edv.84.2022.06.13.02.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 02:54:34 -0700 (PDT)
Message-ID: <dab57682-a16e-9967-b0d8-b9af63f45691@redhat.com>
Date: Mon, 13 Jun 2022 11:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 29/45] block: introduce BDRV_O_NOPERM flag
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-30-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-30-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Now copy-before-write filter has weak permission model: when it has no
> parents, it share write permission on source. Otherwise we just can't
> blockdev-add it, when existing user of source has write permission.
>
> The situation is bad, it means that copy-before-write filter doesn't
> guarantee that all write goes through it.

I don’t understand how this situation really is bad, because it sounds 
like anything else would just be a safeguard against users adding a CBW 
filter without making use of it.  Which I’d think is their own fault.

As far as I remember the actual problem is that we cannot do 
transactional graph modifications, where e.g. a CBW node is inserted and 
a bitmap is created in a single atomic transaction[1].  Which is a 
problem.  And now I just don’t quite understand how unsharing WRITE 
unconditionally would help with the actual problem.

[1] Then again, would then even be “atomic”?  For that transaction to 
work as intended, the node would need to be drained during the 
transaction (so that the bitmap stays in sync with the CBW state). It 
doesn’t look like that would be the case.

So perhaps I’m just remembering incorrectly.

> And a lot better is unshare
> write always. But how to insert the filter in this case?
>
> The solution is to do blockdev-add and blockdev-replace in one
> transaction, and more, update permissions only after both command.
>
> For now, let's create a possibility to not update permission on file
> child of copy-before-write filter at time of open.
>
> New interfaces are:
>
> - bds_tree_init() with flags argument, so that caller may pass
>    additional flags, for example the new BDRV_O_NOPERM.
>
> - bdrv_open_file_child_common() with boolean refresh_perms arguments.
>    Drivers may use this function with refresh_perms = true, if they want
>    to satisfy BDRV_O_NOPERM. No one such driver for now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>


