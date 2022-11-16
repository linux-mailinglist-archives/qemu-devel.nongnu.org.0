Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1662B999
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovFrq-00036q-6s; Wed, 16 Nov 2022 05:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovFrj-00035q-7E
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovFrh-0001qQ-EU
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668595316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soOJ3pnGlE3Un5hA+o3GwfNr+vbPsAXTO4blSLG9NoM=;
 b=gWKuwbo19JnX681A+4U293GxLNtzc99j2s/6xnHniu+Raemx8wW5XNi+cSchKULSEtmn6Q
 j8eveV0GdrCGeCZHNnlZC+cJOjhVMhrJ7/uskATXE5D9HKiDW6IkH3ISaM7sYbRzcUL7xI
 J+L7as1lkm6+ESk35BOXaauOIk/hPoA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-hmCKZxeTNWa7mZcLAxXuOg-1; Wed, 16 Nov 2022 05:41:53 -0500
X-MC-Unique: hmCKZxeTNWa7mZcLAxXuOg-1
Received: by mail-qv1-f71.google.com with SMTP id
 nh17-20020a056214391100b004bb6c16bd4dso12985774qvb.17
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 02:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=soOJ3pnGlE3Un5hA+o3GwfNr+vbPsAXTO4blSLG9NoM=;
 b=yrRt+72NENUWKCqiK2/kKZ5J/ovB6ge7Al00NPUHlADkZL7Q304oYuvN1PNbXXUTsI
 V6+uIl+iFZ+9G3UUgq+W5ck34SWtSezaeXK35CtLAUInXJyDdENJQt4tFllLp/9BlwAH
 qRCyn01bMQZxIXRDpErsyULbzVp2nbrK1qDV7BJ7wK2IvfleGVJBnOuCDCxNaXnJqz1+
 dKnC0AIadXxC1l09fX9AYm5Zfz+iWOrZillglJHuPfEe0hQTgoH/fRc33CBZ9lJb4qet
 X8ZSdR9MXmcxT+SgpPhiOg0nnr1JuNEjj0IBfR3rrTXt3bkcCCiMFsz6iqkB3gD8kdfa
 tyKw==
X-Gm-Message-State: ANoB5pkwgq2FQP7S2pG9jR446BDm5EvI1UHIveO8C1Sy6XVGUCoZzgNJ
 P2KjpCz/8LjbsWROdZOcR36jN1cg9eggG1VXmmWRJ3ojTNYetTg/dNmyWF5lIPk1V5mmYYbfjQd
 B2rwfUuyWEyUUhxI=
X-Received: by 2002:a05:620a:130c:b0:6fa:330f:77a5 with SMTP id
 o12-20020a05620a130c00b006fa330f77a5mr18114929qkj.361.1668595313392; 
 Wed, 16 Nov 2022 02:41:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6DPc1U+WKf3rBIvXeCeI5V747FbUTkMA2ZInlsVOPzVW42/AfFajImTlVhtYOXgvvBRd43OA==
X-Received: by 2002:a05:620a:130c:b0:6fa:330f:77a5 with SMTP id
 o12-20020a05620a130c00b006fa330f77a5mr18114913qkj.361.1668595313159; 
 Wed, 16 Nov 2022 02:41:53 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n7-20020ac86747000000b00399ad646794sm8454029qtp.41.2022.11.16.02.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 02:41:52 -0800 (PST)
Message-ID: <fefd924d-27be-54d1-2068-e25c060e384d@redhat.com>
Date: Wed, 16 Nov 2022 11:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/8] Still more coroutine and various fixes in block
 layer
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116085050.2295179-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221116085050.2295179-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

I apologize, as discussed also in v2 I just realized I could introduce
generated_co_wrapper_simple already here and simplify patches 6 and 8.

Also I think commit messages are the old ones from v1.

I'll resend. Please ignore this serie.

Emanuele

Am 16/11/2022 um 09:50 schrieb Emanuele Giuseppe Esposito:
> This is a dump of all minor coroutine-related fixes found while looking
> around and testing various things in the QEMU block layer.
> 
> Patches aim to:
> - add missing coroutine_fn annotation to the functions
> - simplify to avoid the typical "if in coroutine: fn()
>   // else create_coroutine(fn)" already present in generated_co_wraper
>   functions.
> - make sure that if a BlockDriver callback is defined as coroutine_fn, then
>   it is always running in a coroutine.
> 
> This serie is based on Kevin Wolf's series "block: Simplify drain".
> 
> Based-on: <20221108123738.530873-1-kwolf@redhat.com>
> 
> Emanuele
> ---
> v3:
> * Remove patch 1, base on kevin "drain semplification serie"
> 
> v2:
> * clarified commit message in patches 2/3/6 on why we add coroutine_fn
> 
> Emanuele Giuseppe Esposito (8):
>   block-copy: add missing coroutine_fn annotations
>   nbd/server.c: add missing coroutine_fn annotations
>   block-backend: replace bdrv_*_above with blk_*_above
>   block: distinguish between bdrv_create running in coroutine and not
>   block/vmdk: add missing coroutine_fn annotations
>   block: bdrv_create_file is a coroutine_fn
>   block: bdrv_create is never called in coroutine context
>   block/dirty-bitmap: remove unnecessary qemu_in_coroutine() case
> 
>  block.c                            | 75 ++++++++++++++----------------
>  block/block-backend.c              | 21 +++++++++
>  block/block-copy.c                 | 15 +++---
>  block/commit.c                     |  4 +-
>  block/dirty-bitmap.c               | 66 ++++++++++++--------------
>  block/vmdk.c                       | 36 +++++++-------
>  include/block/block-global-state.h |  3 +-
>  include/sysemu/block-backend-io.h  |  9 ++++
>  nbd/server.c                       | 43 +++++++++--------
>  qemu-img.c                         |  4 +-
>  10 files changed, 151 insertions(+), 125 deletions(-)
> 


