Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB30F59797E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 00:10:38 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oORFG-0006Le-0k
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 18:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORCW-000469-UJ
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORCV-0006ZX-4R
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660774065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUcydZgHcpvE+O6ngcbaHh5f09nexNAfdtm0zsskFyY=;
 b=A6v/UIguymIGuYyMsWxKtDQKrgE1CZ/r7omvKZbU5vU10fsYo4iIbUhkvHK6fby+OJRiAv
 qHl7rSvBRRugH5XB636msnEe4PtlrNOXWaA2/eRb+8py408WL0KgV8v1pHR+yGVmJ/dHvv
 UV5eoFZ1kxkSCpaZOkBtW0eD9o+j5YI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-C01nMBRUNgye1gv_R9mUJg-1; Wed, 17 Aug 2022 18:07:43 -0400
X-MC-Unique: C01nMBRUNgye1gv_R9mUJg-1
Received: by mail-qk1-f197.google.com with SMTP id
 f16-20020a05620a409000b006bacc0fcf23so12799140qko.13
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 15:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=GUcydZgHcpvE+O6ngcbaHh5f09nexNAfdtm0zsskFyY=;
 b=OMOVjBcJwXM9CZ2nua/QPjNAJv+70Sk068KfhME4drEczTa2KnwCqrFm95SivOlu1o
 RLtlx+qDwojW4A85eyrLWJGMpbe08CZ6K0LANqWshh+ybvUa28OznYtCuIHDGcyUFIbh
 AC4b0cS/UxColb6UJzbkGlKeOVdUQkFbMk8LMzkDhkLsc9upqtCHdZUkJx5wPs2jc5HK
 3n9zbTlPzWXvmte2KEPE4V6D6/dOKMybLLBGbZQTwDI3qfgLKXIJJ7Rzv0NDtPqyfrp2
 cFt/5z+J5ewkKRKu8yzN9R23UGSmRl4BNNBAonKe3QZj1626S12cVahSUhCaey6sfUsA
 eX3Q==
X-Gm-Message-State: ACgBeo1y6phhgNFIpSoWbZ0kTcKIXgIxLoqeCBCl8n5+uMYh6eXdiavJ
 XwT7fwa+2TOkSpJ3VuXauuXqEF0YmPESK+R7XX+B9/mYUGOL/SspkMb8TWbjNqdtAlb+bnwxHwX
 mocCC+BU4mWtCV4A=
X-Received: by 2002:a05:620a:318e:b0:6b8:83b1:62d0 with SMTP id
 bi14-20020a05620a318e00b006b883b162d0mr126574qkb.2.1660774063348; 
 Wed, 17 Aug 2022 15:07:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6RcaA1yvecC8Uxy5Jw+spv3M2zUnIKNevKwg8KxvGK6Dc75sVD335unJo3QxNSoVgwn5dz3g==
X-Received: by 2002:a05:620a:318e:b0:6b8:83b1:62d0 with SMTP id
 bi14-20020a05620a318e00b006b883b162d0mr126551qkb.2.1660774063062; 
 Wed, 17 Aug 2022 15:07:43 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a05620a409500b006bb2bca5741sm10130qko.93.2022.08.17.15.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 15:07:42 -0700 (PDT)
Date: Wed, 17 Aug 2022 18:07:41 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 2/8] qapi/migration: Introduce vcpu-dirty-limit parameters
Message-ID: <Yv1mrddIGIBjOv3I@xz-m1.local>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <01d837637e7725a49d1fd3cd22370d6c9f6b9e61.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01d837637e7725a49d1fd3cd22370d6c9f6b9e61.1658561555.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Jul 23, 2022 at 03:49:14PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "vcpu-dirty-limit" migration parameter used
> to limit dirty page rate during live migration.
> 
> "vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
> two dirty-limit-related migration parameters, which can
> be set before and during live migration by qmp
> migrate-set-parameters.
> 
> This two parameters are used to help implement the dirty
> page rate limit algo of migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c | 14 ++++++++++++++
>  monitor/hmp-cmds.c    |  8 ++++++++
>  qapi/migration.json   | 18 +++++++++++++++---
>  3 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 7b19f85..ed1a47b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -117,6 +117,7 @@
>  #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>  
>  #define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT            1       /* MB/s */

This default value also looks a bit weird.. why 1MB/s?  Thanks,

-- 
Peter Xu


