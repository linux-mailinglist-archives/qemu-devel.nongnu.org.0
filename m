Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832196D68CE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:28:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjUn-0001GF-6Z; Tue, 04 Apr 2023 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pjjUl-0001G3-8g; Tue, 04 Apr 2023 12:26:55 -0400
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pjjUj-0001Zr-7W; Tue, 04 Apr 2023 12:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1680625608; i=axelheider@gmx.de;
 bh=QgcTG/L39fN5XsY15DUy97fsvXEO6bd6AgJMk2vVYVY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bUPPqWnwYY1YBZ9dc/eK5gnW+tWHlYVjKWVn/F9Itst5xTSmGpt7IkmghlW6pbR27
 efGpNOI6X8+ezzS0NVLoHQgZKeha3HEZ84wDk7IwW8hakWJIzqY3neofYljZ0y+3by
 9+xIouHjGbpfSvOMCtjq+bdbpjUGWbF08i1McA8DBAmwdOjAAc6SIgb/xBBawvjbPG
 /dQLvar3Je5SvhjOQF9xdovWdRcG+WHT2D2SRjjErjklWusO6OpR68LprGvmqEmK7S
 cfTZ2zVfs8gaTqfpSfyIYtwPQ3duUsLjtgKGjbOB/4BN3cw1El1++sSeOS+O74BY0u
 5WjqIXQsQ8ANg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.125] ([5.199.177.82]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1qYw8Q1NpS-00tn2q; Tue, 04
 Apr 2023 18:26:48 +0200
Message-ID: <941a4787-6a24-c2e0-fd01-51b489512831@gmx.de>
Date: Tue, 4 Apr 2023 18:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
 <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Content-Language: de-DE
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:983sZNNfx6CrfuiV1PSGdn8aoh1UEthYhkBYeiuIIHUyAE43aBh
 2qW8KjVbaD5edYhc5U2EvVkfxf57NZM9ExTupoCLgXl0a5TY3GuRtTEUN3nOVJ5teXTUsOs
 s/M0bw3LFzl+G3gkvu3ARLN1lnFABZvHRg5RxXXDHYLNNCdq1R2P05PSy9V+Ki5BQRUUgdS
 DgKz2F3J/rdaiuZwRK0pA==
UI-OutboundReport: notjunk:1;M01:P0:ihYQ6Wt/Lis=;soz0Nrt/mLqtzCaAl1j5NcZnWAU
 QGeIAV2/I8Z/aTddFNwzWQgHgxAN9qiqKGPheap4N0u8Ue6UhRaKOvVtYUBYBPTAXApw0zd/2
 wGpNwr5DrzU03oQ47eQxCaSkMTtRMG3q2g1ze2hDWk4NO1+uzUb8kMAn1jSytGSN+wguJePbS
 Wpb3qwNYyEIBzDN7namsOfXxqs5senf5pjownvLH76V2Dwkz/cxqZmAaJKag3ZjeOnpol/iOc
 J4G4cusq4x/DWirLyDXUUxZJyuXtKCiHxv2FpcqiAjM2uhYsUWXgldWTWvfHTJzeqikvrYBQ3
 bqWSF6LYa4xmED7K2t7ckSF3y19hdMWkvWhWdtvxaN6ZfKIIM/TZcx1Vt5I+77m0WDwNh2gvZ
 cDbMUKW6xKciE2Ig4BRKqjka/b2GsOSZ8cKOKGqc6EYcz3dUcMoeq/rGyuN2dYghvUx+evXjY
 okI5eVQgT2P6fgkUtrx9+vbQI3ybs4ifjDHXQVkdCXk3FB6TqFDgSfuexUBLSwrii7MPGK1jC
 rXXKf2WwYICtHEHg18t4DnqzTv6kL3kte0M3ErBRHThoKbviNpt0M1JRFzbrObeYXYMuVmi/p
 uJmRXBadk2KspPJtJ33vPkMsexYUuCV5xouxzCtnU2zBwR80gxcaBKCQbxMVS8vmWzuFrGOHK
 3FWo3tjLiYTKyDW5+VZuXw8Hk9f+7Ps6zFDk+DmxwrgOhTSve/FJ5+zOaCneszNlczabeU4dF
 qqiIGlvanaWDO9p1eYoivrfImpIEIl1M/QMqpMYwFkkJOf2zXGBIjzFOiqUwD9RIQoX5qInLY
 bfEyMIM21wHJnxDZOjir7KFr61K1IzIuQXuZ52M0xEVDEx+Psk52ynpmBmzbuib7cMu96zcEp
 bUSSRrI4k8PXt0qKQpAX+Q+ojkjUSCV9xqG/nqpsV/1n+7jaqpirmLsH7g31fJIEYuAzAEZK0
 C6OIng==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Peter,

> Hi; Coverity has just noticed an issue with this patch:
> [...]
> Here we declare the is_oneshot variable...
> [...]
> ...but here we declare another is_oneshot, which shadows the first
> declaration...
> ...so here when the inner variable is no longer in scope, the
> value of the outer is_oneshot variable must always be 'false',
> because there's never any assignment to it.
> What was the intention here? My guess is that there should only
> have been one 'is_oneshot', not two.

The shadowing is not intended, as this does not make any sense. There
is only one instance of this variable, it is FALSE by default and can
become TRUE.

> [...]
> There's also been this bug report:
> https://gitlab.com/qemu-project/qemu/-/issues/1491
> which suggests that the condition for setting is_oneshot
> should be "(limit <=3D s->cmp)" rather than ">=3D".
> What do you think ?

The Bug report is right, that the check should be
"(limit <=3D s->cmp)", as it's about the on-shot characteristic and not
the periodic characteristic (which earler version of the patch had).


I will provide a patch to fix this.


Axel

