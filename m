Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2999568468
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91or-0006Ht-Sg
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91bk-0004W6-LP
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91bd-0001Ce-Hh
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657100759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuX1/epkpkLVCiKU3+ESovk0lEjQi0VoeklsV1F0w9I=;
 b=RYIhjoLxSbu3uNaQ/nKLdG6spBgnzshou3TzWZqehq8zG944q2xAqqovZIcfIYsjj6VPz1
 MJ9w/hxA5RDPvBZZacrf1DZX+9Ema98+bFPgPYGXZUbVicjLA34M5d72ypX58740yJssGL
 weuTqZba+ascA+OgGGZ0iaUegNBrhLA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-wmEsW0yRPjWoD3Hwy2VsIw-1; Wed, 06 Jul 2022 05:45:58 -0400
X-MC-Unique: wmEsW0yRPjWoD3Hwy2VsIw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd35-20020a17090796a300b0072a707cfac4so3579120ejc.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tuX1/epkpkLVCiKU3+ESovk0lEjQi0VoeklsV1F0w9I=;
 b=vY1YuPXmjMxxbHTiVrRmDNq1PzKMcYRLi3eD0NaPTzeTi93bYrUOlsjhg64+fj/537
 MCOdGvDMvnPgevAVACBoywttJy4cxDeY67B4lJSyeTiWz/e42OtJlajeE9eAvtieqLGY
 2mzsKT5GL5tIn82zU4BGbLD/SLscB7UYve1OJnHKGBSZQHhH1qYPVSNXILWgxM+DK9P1
 zX9sU/U8bAZKwEahy5T4Vx2du3FZkC5hqnOIYmJoxOmCHAuNoW2xa8mT9H2S83u/VBtK
 KUnKO542vMjK6lSc9A3hZvui7ez94Fwzr8ksYJygYnPUBitWLH8U4VgrH6zLJlcTf4oG
 xZ8g==
X-Gm-Message-State: AJIora+yK+qBhhSjGVCR0R4X2bL9P3IHJOL8ZwlpOVyhSp25GdwtDCUL
 PNO5cTHcYhxZQKpDSEYWh6iVEiBpw+4DgY76kfVDzvqGLmWUnHl/U2V+cSeilye/UAjIzpbTLeP
 kMLH0DDtfSwk27zM=
X-Received: by 2002:a05:6402:241e:b0:437:d732:20d2 with SMTP id
 t30-20020a056402241e00b00437d73220d2mr52416379eda.39.1657100757629; 
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQh3AWJZzMOG9NJh9TAqxSXVnPLNadZLeJyEtxDH7Rl9QnXQJlhLkCQBVwLQDrbY9FIcnP3Q==
X-Received: by 2002:a05:6402:241e:b0:437:d732:20d2 with SMTP id
 t30-20020a056402241e00b00437d73220d2mr52416328eda.39.1657100757432; 
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a170906b29800b0072629374590sm17167914ejz.120.2022.07.06.02.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
Message-ID: <dcbb1e98-51a3-3a14-616d-45c404d6ca31@redhat.com>
Date: Wed, 6 Jul 2022 11:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/18] Make block-backend-io.h API more consistent
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley
 <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, qemu-arm@nongnu.org
References: <20220705161527.1054072-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 05.07.22 18:15, Alberto Faria wrote:
> Adjust existing pairs of non-coroutine and coroutine functions to share
> the same calling convention, and add non-coroutine/coroutine
> counterparts where they don't exist.
>
> Also make the non-coroutine versions generated_co_wrappers.
>
> This series sits on top of "[PATCH v5 00/10] Implement
> bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
> generated_co_wrapper":
>
>      https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/
>
> Based-on: <20220609152744.3891847-1-afaria@redhat.com>
>
> v2:
>    - Avoid using variables named 'len' or similar to hold return values
>      from blk_{pread,pwrite}(), as they don't return a length anymore.
>    - Drop variables in_ret and out_ret in qemu-img.c:img_dd().
>    - Initialize buf in test_sync_op_blk_pwritev_part().
>    - Keep blk_co_copy_range() in the "I/O API functions" section of
>      include/sysemu/block-backend-io.h.

Thanks!  Applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


