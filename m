Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15B32119F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:53:43 +0100 (CET)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE62I-0007M8-4i
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1lE61W-0006o0-2m; Mon, 22 Feb 2021 02:52:54 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:33752
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1lE61T-0007y1-MU; Mon, 22 Feb 2021 02:52:53 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D7492DA0774;
 Mon, 22 Feb 2021 08:52:47 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210220212903.20944-1-richard.henderson@linaro.org>
From: Stefan Weil <stefan.weil@weilnetz.de>
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
Message-ID: <d5f00b72-4436-d891-a589-20bc011630af@weilnetz.de>
Date: Mon, 22 Feb 2021 08:52:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.02.21 um 22:29 schrieb Richard Henderson:

> I guess it has been a while since I've run aa32 risu on aa64 host.
>
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
>
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.
>
>
> r~
>
>
> Richard Henderson (2):
>    tcg/aarch64: Fix I3617_CMLE0
>    tcg/aarch64: Fix generation of "scalar" vector operations
>
>   tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++----=
-
>   1 file changed, 182 insertions(+), 31 deletions(-)


Thanks. This fixes https://bugs.launchpad.net/qemu/+bug/1916112.

Tested-by: Stefan Weil <sw@weilnetz.de>




