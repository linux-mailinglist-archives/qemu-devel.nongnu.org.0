Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1AA3C9AFB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 11:07:51 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3xLS-00012S-75
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 05:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3xKX-0000Nk-KN
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:06:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3xKV-0006Cy-Er
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:06:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id r11so6749611wro.9
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FMPjL/CTJOeJtsWVWs0sx7oXut4ClnqC/VTgDaAEHME=;
 b=ePxAbxPW2Hg/WKGjdpMgGKzsN668vOK5Ib+xWxAd6BVCzOfU5M0CJA4n4W4GX8iPH5
 IdcWf8ycOjOWL2fS1PGj8CRnlrw27io2RZTyMj8GIOoHA8wsQdBjnGLrebySh6R/OT0b
 ij2BByOro2sZiBIGAckVn6DFSYgmC67CVvGGKx29E4R33N1NI/ZHKg+m6PzlAKs7QRYl
 ZCDvaO9T9KUoerkgaL+wWD/vAiB0202xLkz8oaB5WOwe0IuugisZ4TC6EmSx4bCyxSRt
 FftNEEz2FXjGSRkvilj25YpkppPzGCnUfl+cJc8OIXU4Bhb7HIjakk3DdWC0Qr67A3QM
 6vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FMPjL/CTJOeJtsWVWs0sx7oXut4ClnqC/VTgDaAEHME=;
 b=Ujse9UdIew/3ZAwMcsoEZzp2cML7Z6FDsMjnUdqhqFrnYSpbauhcu3mDM45VvqD2Na
 CdZ7QzR1FlLsL+ThUuBMuVaL48DpyaGf8Vzkst3CKSvIivFn4oB9u33raGbNrL7yW/4x
 1RtnuSu7DJVDRE26b3rneVAXCUA1aHkMeanqICtshO4JME8r3QoEaUYXXEvf4I8FY9x2
 bmU303rVNwnSwfkwG2Iw5O0q/fbMhM+0op57K9Y64a6UmTGcwlRtbd+1f5bN6KPZ51jR
 kNtX1BAbQkKTTJNupE/eJ5l5u0yN68g9qcI3t+ALywc0Sn1mHSdUDWW2A/dQFDmpj30o
 hR5Q==
X-Gm-Message-State: AOAM5321GiDvNJz1XrYWsMG6pZlZPIj46/mtk22Nw6fgYzv09B9+hDCX
 Q//sIq9l7VPlza4I+Pzjm55bqw==
X-Google-Smtp-Source: ABdhPJzjoeKGvUzhnXqycBHxwnqm2INmDfRowkVA6tEaijEHQbl6cKsRekuqs7cIivhnvhuxzrVq3Q==
X-Received: by 2002:a05:6000:1248:: with SMTP id
 j8mr4176828wrx.391.1626340009854; 
 Thu, 15 Jul 2021 02:06:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm5536788wrm.13.2021.07.15.02.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:06:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21D721FF7E;
 Thu, 15 Jul 2021 10:06:48 +0100 (BST)
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-11-alex.bennee@linaro.org>
 <YO/MTt7DJ8C1GMKQ@apples.localdomain>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 10/21] contrib/gitdm: add domain-map/group-map
 mappings for Samsung
Date: Thu, 15 Jul 2021 10:06:11 +0100
In-reply-to: <YO/MTt7DJ8C1GMKQ@apples.localdomain>
Message-ID: <871r80ues7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Klaus Jensen <its@irrelevant.dk> writes:

> [[PGP Signed Part:Undecided]]
> On Jul 14 19:20, Alex Benn=C3=A9e wrote:
>> Minwoo's work from their personal address are treated as personal
>> contributions.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Acked-by: Klaus Jensen <k.jensen@samsung.com>
>> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
>> Message-Id: <220210714093719.21429-11-alex.bennee@linaro.org>
>> ---
>>  contrib/gitdm/domain-map            | 1 +
>>  contrib/gitdm/group-map-individuals | 1 +
>>  contrib/gitdm/group-map-samsung     | 5 +++++
>>  gitdm.config                        | 1 +
>>  4 files changed, 8 insertions(+)
>>  create mode 100644 contrib/gitdm/group-map-samsung
>>=20
>> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
>> index efbbb15643..beeb24341e 100644
>> --- a/contrib/gitdm/domain-map
>> +++ b/contrib/gitdm/domain-map
>> @@ -26,6 +26,7 @@ proxmox.com     Proxmox
>>  quicinc.com     Qualcomm Innovation Center
>>  redhat.com      Red Hat
>>  rt-rk.com       RT-RK
>> +samsung.com     Samsung
>>  siemens.com     Siemens
>>  sifive.com      SiFive
>>  suse.com        SUSE
>> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-m=
ap-individuals
>> index 36bbb77c39..4ac2f98823 100644
>> --- a/contrib/gitdm/group-map-individuals
>> +++ b/contrib/gitdm/group-map-individuals
>> @@ -29,3 +29,4 @@ mrolnik@gmail.com
>>  huth@tuxfamily.org
>>  jhogan@kernel.org
>>  atar4qemu@gmail.com
>> +minwoo.im.dev@gmail.com
>> diff --git a/contrib/gitdm/group-map-samsung b/contrib/gitdm/group-map-s=
amsung
>> new file mode 100644
>> index 0000000000..e38c7eeeac
>> --- /dev/null
>> +++ b/contrib/gitdm/group-map-samsung
>> @@ -0,0 +1,5 @@
>> +#
>> +# Some Samsung contributors submit via another domain
>> +#
>> +
>> +minwoo.im.dev@gmail.com
>
> I'm not sure how this groupmap works, but was it intentional that you
> left Minwoo in the Samsung group map?

Doh - no - I evidently forgot to remove the samsung one at the same time
as adding him to individual. Will fix.

>
>> diff --git a/gitdm.config b/gitdm.config
>> index a3542d2fc7..e7a744146e 100644
>> --- a/gitdm.config
>> +++ b/gitdm.config
>> @@ -36,6 +36,7 @@ GroupMap contrib/gitdm/group-map-codeweavers CodeWeave=
rs
>>  GroupMap contrib/gitdm/group-map-ibm IBM
>>  GroupMap contrib/gitdm/group-map-janustech Janus Technologies
>>  GroupMap contrib/gitdm/group-map-redhat Red Hat +GroupMap
>>  contrib/gitdm/group-map-samsung Samsung GroupMap
>>  contrib/gitdm/group-map-wavecomp Wave Computing
>>=20=20
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

