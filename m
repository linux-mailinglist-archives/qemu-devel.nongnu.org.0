Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA653AE86
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:37:25 +0200 (CEST)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwW1s-0005q4-No
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW0F-00051K-6e; Wed, 01 Jun 2022 17:35:43 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW0D-0001OX-Ie; Wed, 01 Jun 2022 17:35:42 -0400
Received: by mail-wr1-f48.google.com with SMTP id h5so4059275wrb.0;
 Wed, 01 Jun 2022 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=Hw2icPdGFgcF/FkdKzCmpur2Y/DvwUob4HkfArNHRLQ=;
 b=MId+N5U1UwBuR/NqVf2pplsY3aP3Vp2l2ROIfPaDICdi4ggY3IIwmfANxI4cuZK8yU
 9oq6JACso/L+EycpKubxCbaH0h1w2WlF1OxLH89e82n/ja3tpYhIIx/Uk8QXTLm313IO
 r4FJdkm4T/gBH5N4JM3CuvZCrLiMKbI5S/gYXc2cH+Si6muhZzTxqZxV1FESACu468pn
 DMx32eSSP0Umd/XgT0kDUoEYtme3HLqIRIJ12I9WpH7905n7RJhmAzjGoEVDlgeyBLP9
 LkcvvWDfgde7NqRwDHRVCvun5yhvGDvS/9Qgt/fUAnFuRtTObYZ/Yi7UFipB5j7X/6OQ
 kydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=Hw2icPdGFgcF/FkdKzCmpur2Y/DvwUob4HkfArNHRLQ=;
 b=USok6OwpDoQ4J/6yVhPNoWlkezG9+3/J1t0YUKUOxmokjCvio5QazFWy3vGKArvwsr
 PhJUaI/ZHG80cl5wejYguNsRYikntKne8hekDqsegXiDwGOwwjM6wWEVd0chXjxbB29X
 mquffkIojYXXv7iZCczXH+DbER5KcW4bn2aUs14NqxkvDf4SarbJmDQVFu/AFWLfNulk
 YDBnPS3qb44IdsqiRMQKAXozsBarsOAdVcRcw1I20ZXwDeiU4yQbygmOStHoY0F20uji
 mMTNzl2Memeg7IsVBdlE4TNo9e8I8b8Vjm+XVEPeg/YvPRD0aGueHHcrySHhZ9nt3dxY
 3Wyg==
X-Gm-Message-State: AOAM533D8uENMRdSfbUt516nHfo9zs5V7LLLZMa1kugJk1E2eTScj84G
 CZQe8ImTQilZyUXPCEdeDOw=
X-Google-Smtp-Source: ABdhPJxvfp1cnWeOV6JyQRtz4yBogAxavQigiF2a0S661NL1HWnU9gE/poJs7BCtkhsoEMOLqsjYWA==
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr1068649wrc.315.1654119279381; 
 Wed, 01 Jun 2022 14:34:39 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d009176c769e13c486f.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:9176:c769:e13c:486f])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056000118f00b0021033ba8b15sm2573754wrx.44.2022.06.01.14.34.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 14:34:38 -0700 (PDT)
Date: Wed, 01 Jun 2022 21:34:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/7=5D_include/hw/southbridge/pi?=
 =?US-ASCII?Q?ix=3A_Aggregate_all_PIIX_soughbridge_type_names?=
In-Reply-To: <f5cf718e-fc56-c271-5827-dc2d3c86a231@amsat.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-2-shentey@gmail.com>
 <c62dad6a-9bd9-a2ef-ab24-c65912baa8bd@ilande.co.uk>
 <CAG4p6K4v8qEUpZKqJ4R6aXXoKWSoBUORySsjt_eJFPzggsZVvg@mail.gmail.com>
 <f5cf718e-fc56-c271-5827-dc2d3c86a231@amsat.org>
Message-ID: <17BC6462-42FC-49D8-BD35-BE98CBEFFA4F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.48; envelope-from=shentey@gmail.com;
 helo=mail-wr1-f48.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 30=2E Mai 2022 13:19:33 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4bug=
@amsat=2Eorg>:
>On 29/5/22 20:09, Bernhard Beschow wrote:
>> On Sun, May 29, 2022 at 11:05 AM Mark Cave-Ayland <mark=2Ecave-ayland@i=
lande=2Eco=2Euk <mailto:mark=2Ecave-ayland@ilande=2Eco=2Euk>> wrote:
>>=20
>>     On 28/05/2022 20:20, Bernhard Beschow wrote:
>>=20
>>      > TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remai=
ning
>>      > ones, too=2E
>>      >
>>      > Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom
>>     <mailto:shentey@gmail=2Ecom>>
>>      > Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2E=
uk
>>     <mailto:mark=2Ecave-ayland@ilande=2Eco=2Euk>>
>>      > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg
>>     <mailto:f4bug@amsat=2Eorg>>
>>      > ---
>>      >=C2=A0 =C2=A0hw/isa/piix3=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 3 ---
>>      >=C2=A0 =C2=A0include/hw/isa/isa=2Eh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 --
>>      >=C2=A0 =C2=A0include/hw/southbridge/piix=2Eh | 4 ++++
>>      >=C2=A0 =C2=A03 files changed, 4 insertions(+), 5 deletions(-)
>
>>     One tiny nit here: there's a typo in the subject line which I misse=
d
>>     when reviewing v2=2E
>>=20
>>     s/soughbridge/southbridge/
>>=20
>>=20
>> Ack=2E Will fix in v3=2E
>
>Can do=2E Also, "include/" in subject is not helpful=2E

I'll take care of this in v4=2E

Thanks,
Bernhard


