Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240975EFB6C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:57:30 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwqm-0000bt-PN
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwfz-0005U6-N9
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:46:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwfw-0005x9-Er
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:46:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v28so3103090wrd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=EKk7gFmAoR6EL8ZKjYJkGHqD32mESXZJPYPbZAR0F+Y=;
 b=KEB6uN4IoBbfZwsStjshr1RbIltlWoVBxXM3uaXlKd3tGbIRyDVXy0W9xvOdT51pQf
 sHJalwJLzbwfM4f9WEO23PLQeF0rLxUAwoHB5YrZeYOLxIA1fXjL7TsYgYsBFFjrEu4m
 Wtuw6zguvJDGCVlRtW0ICvKQplnPo/qYlfNh2aPQHZZKiUQcC10z7VEhZ7sj/0/Vk61d
 OxI7+e5eKjjYu2EbVhZfkG9/sOiewrvvIbI+VXcZ0pSSzHAinupH9kktopveQonOThPo
 qFo32+bWuJRNwwrMZ6ovEdRejKrnnL7ScBeRGsm7t/nuXSP0ChDAx2Iazkl1JpYPh99m
 ttQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=EKk7gFmAoR6EL8ZKjYJkGHqD32mESXZJPYPbZAR0F+Y=;
 b=tsK18cnRz9L+dUDCmEzw2tYRHWcXKuMn/4TOM36cGz77dEzAycjJgUTA94g++rbFpx
 G2Jy9jgMbQjKDMUgXf7YWqJ0PJZzruU6h8CeLc8tbD2LchwzwVPZSUNoxBs0x78VKqI6
 ZU5wp8picXnc52FMgSecTcPl0T4WYvB61rDa9btp/PnnacSniP0p08gGlQdiwbmLL0ql
 VmrDP9LiXucf9LybOEbbmJoKsz4TQxo+LCffsjdalZ3LiYFusEt/PqpLwr0NenIvEpbe
 R64Uoq3/t9sNKeqcFzLdbCoE7ZmMUVYEulVD1aBomFiw950VJIrryB9oK8vhkuI+SBea
 dLTg==
X-Gm-Message-State: ACrzQf0Dfp3PWYf3ba81KqDQ+ixUrceNjj0uglFdN6QprnJo8iG0amtd
 NQie1MS7gDFvO4vCnoePP6GR9Q==
X-Google-Smtp-Source: AMsMyM5XS7DVijzPSleDYoE0HjDz/r/JMmIXoGlyCANbtRRbXTHxDTbTc/s6Ou10Xck5VD0xuXGUeQ==
X-Received: by 2002:a05:6000:10cd:b0:22a:f324:d2f7 with SMTP id
 b13-20020a05600010cd00b0022af324d2f7mr3292505wrx.710.1664469973055; 
 Thu, 29 Sep 2022 09:46:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b003a5bd5ea215sm4846855wms.37.2022.09.29.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:46:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D308E1FFB7;
 Thu, 29 Sep 2022 17:46:11 +0100 (BST)
References: <20220929114231.583801-1-alex.bennee@linaro.org>
 <20220929114231.583801-16-alex.bennee@linaro.org>
 <b2c5703-6015-a9bc-620-aa124c67b73@eik.bme.hu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, Alexey
 Kardashevskiy <aik@ozlabs.ru>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, "open
 list:Virtual Open Firm..." <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v1 15/51] vof: add distclean target
Date: Thu, 29 Sep 2022 17:45:43 +0100
In-reply-to: <b2c5703-6015-a9bc-620-aa124c67b73@eik.bme.hu>
Message-ID: <87bkqyyvqk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 29 Sep 2022, Alex Benn=C3=A9e wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> pc-bios/vof/Makefile | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>> index 8809c82768..990f26af31 100644
>> --- a/pc-bios/vof/Makefile
>> +++ b/pc-bios/vof/Makefile
>> @@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
>> clean:
>> 	rm -f *.o vof.bin vof.elf *~
>>
>> -.PHONY: all clean
>> +distclean:
>> +
>> +.PHONY: all clean distclean
>
> Shouldn't you also do something in this like at least depend on clean?
> By the way make distclean not in VOF but in QEMU build dir fails for
> me with:
>
> Cleaning... 1 files.
> rm -f config-host.mak qemu-bundle
> rm: cannot remove 'qemu-bundle': Is a directory
> make: *** [Makefile:219: distclean] Error 1

In fact it has been broken since:

cf60ccc330 (cutils: Introduce bundle mechanism)

>
> Regards,
> BALATON Zoltan


--=20
Alex Benn=C3=A9e

