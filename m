Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1856845F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:56:28 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91lj-0000YE-J3
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XF-0007Pn-5V
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XC-0001By-06
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657096641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=ZocWAx0ejlGAzlP1l6e1FvZZn3d3ZpE/fJrWDWtWlsKGjMS+XUMKREQYiWsP5ZDL+FXaYw
 s12Mh7+pk5BgclKE2uwgNdnZ6ryFFP0x4wOG2IuYRlCRCpNqK564qPkqPwsxauKtwoKjea
 VlqeGhqj4vNG8lc3tGi+mRJKN6EBIek=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-kAm0wKnZOTuYqQXR6d4K_Q-1; Wed, 06 Jul 2022 04:37:19 -0400
X-MC-Unique: kAm0wKnZOTuYqQXR6d4K_Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 y18-20020a056402441200b0043564cdf765so11202133eda.11
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=pn1yklkv8FlrhfDoxvrdwT+d8pkG46DcAaiMUPsb7KL6ZC1JByE+C5wqpAu+HXPO9t
 OtxAsGVkf/mDFlc5EeJO2MaF7iCW4fdim8a9jZaA9hPzqzC4zcEsJhTybtWSg5zMYCiS
 Y7K8PMh4GyPMLoUk0Q4grPXQQs/PtAkxpFDU+yYpM00uEhn/5SEI8HxVucHFgNJzMl3e
 Ia5gyPzp8w4QFEqAA337UfOqnlDW9LqRTblfpKkEugK6EjP1mvyBPpnXM3emxO8ibyNX
 NjjOnb8OAdmge5H+BCrhQr+ZjDrz1BlGvOM5ufHH04NiHHyqHph8YgxGCXoBb66pmH9+
 Tjqg==
X-Gm-Message-State: AJIora89zLDkZ+/B/X5A5FClNJbVfxgHiAvtUH6jyPqApqdvox3DwjeW
 ARM9vs4m3/QBCCbNvaqdm2cXI+YMroiyA0sQRC3OALzMwNOG0Hm2SnnKrRduwSvBEPF0M9+t7Z4
 MBYej0iAiyeTIoFM=
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833105ejc.415.1657096638791; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpoAx3JeURa60gKtgyp2NQ8Sq9WLvyQDxukCX0S2QItgGPcvBO9mCfqoztOn4N0+JjK5Rz1g==
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833068ejc.415.1657096638595; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm12717489ejd.33.2022.07.06.01.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Message-ID: <a0c487f3-c111-44cc-0f4a-c1ecbe85d769@redhat.com>
Date: Wed, 6 Jul 2022 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/18] block: Make blk_{pread,pwrite}() return 0 on
 success
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
 <20220705161527.1054072-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
> They currently return the value of their 'bytes' parameter on success.
>
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                          |  8 +++++---
>   block/block-backend.c            |  7 ++-----
>   block/qcow.c                     |  6 +++---
>   hw/block/m25p80.c                |  2 +-
>   hw/misc/mac_via.c                |  4 ++--
>   hw/misc/sifive_u_otp.c           |  2 +-
>   hw/nvram/eeprom_at24c.c          |  8 ++++----
>   hw/nvram/spapr_nvram.c           | 14 +++++++-------
>   hw/ppc/pnv_pnor.c                |  2 +-
>   qemu-img.c                       | 25 +++++++++----------------
>   qemu-io-cmds.c                   | 18 ++++++++++++------
>   tests/unit/test-block-iothread.c |  4 ++--
>   12 files changed, 49 insertions(+), 51 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


