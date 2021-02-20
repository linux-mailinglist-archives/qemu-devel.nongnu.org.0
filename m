Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500043205C9
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 15:47:16 +0100 (CET)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDTXO-0006Og-RU
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 09:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lDTVj-0005lA-UT; Sat, 20 Feb 2021 09:45:31 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50872
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lDTVh-0002FC-20; Sat, 20 Feb 2021 09:45:31 -0500
Received: from mini.fritz.box (p5b1511bf.dip0.t-ipconnect.de [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A029DDA06BD;
 Sat, 20 Feb 2021 15:45:25 +0100 (CET)
Subject: Re: [Bug 1916112] Re: Illegal instruction crash of QEMU on Jetson Nano
To: Bug 1916112 <1916112@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161371415849.8154.11815373638536869361.malonedeb@gac.canonical.com>
 <161382791482.29356.5013965818751172438.malone@soybean.canonical.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <acab5bae-b354-2266-c9db-d1f83782c598@weilnetz.de>
Date: Sat, 20 Feb 2021 15:45:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161382791482.29356.5013965818751172438.malone@soybean.canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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

Am 20.02.21 um 14:31 schrieb Stefan Weil:

> TCG works and I get a Linux boot prompt in the guest Raspbian when
> vector instructions for TCG are disabled, so obviously the undefined
> instruction is simply unsupported for Jetson Nano and Xavier.
>
> Patch used to disable it:
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 5ec30dba25..2240adad1e 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -125,8 +125,8 @@ typedef enum {
>   #define TCG_TARGET_HAS_mulsh_i64        1
>   #define TCG_TARGET_HAS_direct_jump      1
>   
> -#define TCG_TARGET_HAS_v64              1
> -#define TCG_TARGET_HAS_v128             1
> +#define TCG_TARGET_HAS_v64              0
> +#define TCG_TARGET_HAS_v128             0
>   #define TCG_TARGET_HAS_v256             0
>   
>   #define TCG_TARGET_HAS_andc_vec         1



cc'ing qemu-arm@nongnu.org

I think QEMU TCG for AARCH64 hosts needs a runtime check to decide which 
vector instructions are supported by the host (like it is done for 
AMD64). It currently fails because it generates instructions which are 
unknown for NVIDIA Jetson Nano and Xavier (Tegra CPU).

TCI works (now tested on Apple M1), too.

Stefan



