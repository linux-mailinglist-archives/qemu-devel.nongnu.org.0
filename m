Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B773F61541C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 22:20:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opyfL-0003jU-OG; Tue, 01 Nov 2022 17:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1opyfJ-0003ii-8U; Tue, 01 Nov 2022 17:19:21 -0400
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1opyfH-0001eW-JS; Tue, 01 Nov 2022 17:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667337556; bh=cWGf89HPc1+fYeeUcP+wFHLk0HyMzZdNLhY8+gWxLBg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=d9Ea5n/5R3iBUTDN/I6/8TcdAOl6zrnwCooDzESRJDIeMmasGqPKBk0CDrx/q2wDd
 VDvRkBodi/q7GsybQcjMe5YQ6MR717RAVbbweXTgR1X6oi0x/vy8OqGgxCU/M7Zw2N
 +P88a6aw5NzJjjTN/srpBVAWe52htN79Fd2kLb68b1h7ATVVXeXYf5JCC0jyTdP2ql
 qyU3IZCThtkH0Qlc0nykQJkmCpQhuHSKDKCMPvYUK6jXFFYUSnvtef8K99OzFG04vZ
 IMgPLqRPOZCWBxCSx4Dqp+LCptCPMaqs1k0Iaydc6lnlQ79307p+kTTSZSv7DVCC3f
 /lm6rxqCAYo4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([95.115.113.189]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My36T-1pFUIV2bp1-00zV4V; Tue, 01
 Nov 2022 22:19:16 +0100
Message-ID: <7fbf8be0-a067-4c1f-f7b0-3d090171a7e7@gmx.de>
Date: Tue, 1 Nov 2022 22:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH qemu.git 11/11] hw/timer/imx_epit: rework CR write handling
Content-Language: de-DE, en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <166718254546.5893.5075929684621857903-11@git.sr.ht>
 <3ea4f10d-e807-b48d-0eda-19d70763c960@linaro.org>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <3ea4f10d-e807-b48d-0eda-19d70763c960@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2pHJjjxQAPgBHmLzZ3rJxY5ED/BXkQjehuI4cWlKMmbfsYeIPz4
 P7jHH+J5atZXRDjOeKCDVEO+0I74kxJbzWDt63+3nPZKTVs/ryCo0n8Krcj47mvCyHaadPW
 6CVf5a9sq+T9Yz7jj7peNg9z7StEqN2tk5d3IjZc4Eex5I35nodWRAnZF6ep6hKxo70GQuk
 Wbe2kXF0C83nn0VQ3cjbQ==
UI-OutboundReport: notjunk:1;M01:P0:/V1TB5sVSW0=;c/nrfSd2VjgCLyTIIhQr+bn3Y5O
 V5Od076W3cc3vWGifY49z9MyxgFCN2iEv+umBnQbmFUuDAeoqS6+swG8o2VlchLOqt+SI0kad
 ECdO93Y9BuMlC2HTM9628rebrTlc89Lc7JIKqJgZ8GtEBSebKv6zHJ5o1HQ/x6B9D5xVFcaXj
 BB8Bn9nRMURoSsEgFvZUNL99RLYGGK9pJsdgqYqfKLnPAfVJ1cbKksW0Ox9EbYXmDiFjgywPB
 t1lhutZ3sAOJ3hs4IY/KDIsmF80XJXFZrly8ks58FRmT4179bq/FyB6AhkMgxbA39Rde5nisf
 9+Xt4VFJl9ElxHfIAgBCqdDLFkarcE0K3JUA3TJVvWpQUFZTiPlt70Rs198F6yAU+ulz1QTJ1
 QEw9BiC6RNXRjRiokykgK6eLjbHZo5RFN3xDcS85AQLU2n5B7lhJtWQ1lApG37nPJNZd6kuc3
 1A3qDPxlPvz0wdD3/65p64iCuMzTLtcCwHwKjmwglbMU+cx7VUZUDSz7ADhJRhfOURveNgw5E
 eUsFWGYOcUFhMGNcQQYkzN6XA0Pi8dVOvKgD2vNgPmfCdwNjbEdrKAI8kAQzaMmbzEVJvZwqh
 NvvkSXz1TsxewLoxPxSDWuhA5IkTHwIZYfn4qNW9FY/ZM6iL8rXC8KRyJGMfaVMXHj9eFON8V
 P5m7JJ0izJX4ht7dBGtA15gn9s2BnuJHX8PoofR9NblCe+f2qtKXCS6jNi8eDEy2WoiQcoJFx
 KpOYY7Tj0W7YHOVHv/Jx1J4SbWVUOxuyLok6nOkFSAR9CpGePVZGK8ylwrSoerP7YC786HI7t
 f23oj0NU8/+UL3ObCf1HRJ8MyfOWGLO3WBP4ovtwbc+/SEZVtKilAlD0dRwIp/rqbKyg4bjrs
 iSTi5TMbUbJsP+3foTA9VOgTY7dsOov8gryVVosEbEE/a5RBlkhF6TwS7Ntfsc0i4YFpxq06f
 GLB4/P9A1VhX3GbrPzl7yuiN85o=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



=2D------- Original Message --------
> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@linaro.org]
>
>> - simplify code, improve comments
>> - fix https://gitlab.com/qemu-project/qemu/-/issues/1263
>
> This doesn't match GitLab issues closing pattern:
> https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#defa=
ult-closing-pattern

I will change this to use "fix #1263" then. But the issue git closed alrea=
dy
from an earlier patch that got merged a few days ago.

Axel

