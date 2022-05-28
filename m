Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC3536D56
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 16:47:35 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuxj4-0006Gr-DK
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 10:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuxhj-0005UV-B8
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:46:11 -0400
Received: from mout.gmx.net ([212.227.17.20]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuxhe-0005zx-4f
 for qemu-devel@nongnu.org; Sat, 28 May 2022 10:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653749163;
 bh=QfTdd6IKIR4VSrWEDLZajc7lI0UWScoCierMrXn5X04=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FyatSAmU66YcMp58CwsERue3YMGWTxgjQad85PAyekETQKgHdU1QnQr3g8KlEwdVD
 b2tleMdnoHAHtSuczSm86x1ZmBoUCHKnngGROvenB5ICLQkrHxbjtnO1UJkRS000PD
 KFzl9hq86qSMrHkiOxHqOzkYZ4k4vt5ZWXtDdiU4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.176.6]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1oOQPE1QP1-00Uctc; Sat, 28
 May 2022 16:46:03 +0200
Message-ID: <68e9f940-c8f4-2e9b-56f9-cd0d267cf0f0@gmx.de>
Date: Sat, 28 May 2022 16:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] hppa: Fix serial port pass-through
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220526111926.19603-1-deller@gmx.de>
 <20220526111926.19603-3-deller@gmx.de>
 <CAFEAcA-Lzg_OcEU4gytwCzm-QwVWAqio=xcUC8Lf_zofS1Pi+g@mail.gmail.com>
 <CAFEAcA_1R-Z-KBj4x9g0tzgz=1nzL+qUEa+64MKkZetq5+2E5Q@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA_1R-Z-KBj4x9g0tzgz=1nzL+qUEa+64MKkZetq5+2E5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:opYAh1RKD/Mbblrv7/SlPw9iEypkc38VZ06sO/LdB0BNgEBZQfX
 mBZlo11rSnewP+R+56Kfo9ZjLLsPF6QG2A6LELs90qZ+qDQg9DPVnf3zO7AkWkCKnfgeM+6
 jH/Idvod84b18xE7TKD5LQjXOfWKhMGwSEwDhI3ztuRNLsykqXBneguMyrJj+F5VWLFJp/I
 e9yBrOgfNwz2gMIpRorpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+KYK+uMK1f4=:DkIw/HdTqwuwUTCyUtNzyb
 WlAJa4gL/zPfLnEKaXiZldWYVpTPhlTXdqtrSMCsJczecJLa3KpttzX3QI9tMgxHFMxzfWeg9
 uJn6dVeu+unuq1nT8yECebncau4tmW251fowX/1C2WBCguWYnJKEIGZnKrnAvk3vGTJrbrI7h
 CF0zyxDVX0C14jm1OqZ1dn3XSctWden4gCdcNC9g2gPcrqZSPbdL4MZMLray/flKnxK7iWIN7
 ImahC/8avO+j1Ds7jJGrYeQcXGzxnYvci3SPoI06DXKOZJtJgj2coMoJRBGtTmokBebU58cuv
 shaH9/lmdGxMznwoDdHDc5XY2hmFuie3S92PvC3c8W1VtbNxsCITr3y8XN1u/tUPLYrS0V0Bw
 xAiDzjG7nZaaWwZ0KsJFIeyLasxnh99FMFdz/cEPyWJXAnrf+olVGnPgFtWM7D7z8loyrOcOx
 49lnEJBeBq8NXjajb2gpHn2LA4aXKTLv8cjTMXf3r8FGnCEKfmYW9mLTMoNR3Q5EWa++DW16P
 pUJk2mJrJ+6J+VnSbaatLs2o5zubD0RqitRXG1fBTsosqblDMahgfSuk1ooPhsrbL/J1tkK7A
 FpZL+1vwT+/J3eBS9HvbRrT8JJ0i1IAM03x4PAqAc09cy0m02dqFTrFYOUpuMQ1WRD7hsrKdh
 ywUGnVP/LKkYWsOGX1uQ6haf1IhE3IVMAYBVG83hE+0T9403HNVVKSHrxNHnr1lhOtAAFe8JB
 vEaebtuGt6tAhkdRaeY6Uq7YlbnKwBCWwKH8X7WgJGaeeWSavUTOwl1RcufUYKJC+cLBXjx3N
 SpawoxiAZQ+Rv2GUvaltbPPbFFKwDBNt+swMnX+qY/Tzjc75ehPwAp4tFGDV1RmPSrOaXQ8Lj
 DpLhDuldR3H8vV5nwjNbD+fB4VG2V/MUtio2e1GxO1pvHaSvAW+1Hc80GE4WAVbwu1/mQndUk
 cPJlPznudxaN463L9fbKKuKSAK43w/0WGtwnp8metjKdAQVOzkFl58n6kxpKNkvjn9pLhHLzy
 NaJkFYwBkvhuw8rCEueDuOJKBBB8ZFRlNrzQa7Byo1Fa37cAOATnYim9+2+w+FZc7N2IjD8tG
 z2/J/EdAR663nXhipvPSvUXDfXLyEg/VZrB
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 5/28/22 16:25, Peter Maydell wrote:
> On Sat, 28 May 2022 at 15:24, Peter Maydell <peter.maydell@linaro.org> w=
rote:
>> Not related to this change, but you should consider removing these
>> "if (serial_hd(n))" conditionals.
>
> ...oops, I just saw the 3/3 patch in your pullreq which does
> exactly that, so ignore my email :-)

Yes, in v3 (and the pull request) I fixed that since Mark
had the same suggestion as you.

Helge

