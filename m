Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4EB196A28
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 01:07:46 +0100 (CET)
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jILUO-0000D3-Hs
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 20:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jILTF-0008BY-TU
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 20:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jILTE-0002oZ-M0
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 20:06:33 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1jILTD-0002k4-UL
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 20:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585440341; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
 bh=bAszulfYwOvscdzDU+DRZvyWS+oCDnu8Ezi+iHucMG4=;
 b=PZ+h8pxx3JbDpTXod9P55r4vGkM7mDXnivUFumnwG5skeGZd35WDKkYAR1Zm8SZl
 0ii6IkUi8IATCYf2wsg+WpOH3KcKuPWvIcobJr4iwdmo+nWZGG1kvlGQfYPAvfWQrjT
 G4bEA+qxzWEqSp4KV9pob5YAV2nmWLfXEs3xPGJc=
Received: from [10.233.233.252] (115.193.86.228 [115.193.86.228]) by
 mx.zoho.com.cn with SMTPS id 1585440339738319.4768004307472;
 Sun, 29 Mar 2020 08:05:39 +0800 (CST)
Date: Sun, 29 Mar 2020 08:05:37 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <9b0dbaa9-a4de-fa91-9455-c6fcdeb29116@linaro.org>
References: <20200328090853.645433-1-jiaxun.yang@flygoat.com>
 <9b0dbaa9-a4de-fa91-9455-c6fcdeb29116@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] target/mips: Add MAC2008 support
To: Richard Henderson <richard.henderson@linaro.org>,qemu-devel@nongnu.org
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <10F08C52-C2DA-441A-97F9-2266C736D0DF@flygoat.com>
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 124.251.121.243
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
Cc: chenhc@lemote.com, aleksandar.qemu.devel@gmail.com,
 aleksandar.rikalo@rt-rk.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8829=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=883=
:09:16, Richard Henderson <richard=2Ehenderson@linaro=2Eorg> =E5=86=99=E5=
=88=B0:
>On 3/28/20 2:08 AM, Jiaxun Yang wrote:
>> -            gen_helper_float_madd_s(fp2, cpu_env, fp0, fp1, fp2);
>> +            if (ctx->mac2008) {
>> +                gen_helper_float_madd_s(fp2, cpu_env, fp0, fp1,
>fp2);
>> +            } else {
>> +                gen_helper_float_maddf_s(fp2, cpu_env, fp0, fp1,
>fp2);
>> +            }
>> =20
>
>Surely this test is backward, that mac2008 invokes maddf=2E

 Sorry for my stupid fault=2E
Will fix in v2=2E

>
>
>r~

--=20
Jiaxun Yang

