Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C3370068
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:23:08 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXn8-00021F-NF
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lcXji-0000JK-Au; Fri, 30 Apr 2021 14:19:35 -0400
Received: from mail.nh2.me ([116.202.188.98]:58451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lcXjd-0008Lz-0C; Fri, 30 Apr 2021 14:19:33 -0400
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nh2.me; s=mail;
 t=1619806763; bh=LulrvU14HVCiKrjE4s0AH/ldm5wtr8Ww1U++dtPzdtc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=jBnKKMKNk4fN6Q4yZjgk0Msowz+s//LsF41p4VEn3V+0ahhaVcoEh3+GQm0lJ61I1
 9q3tRq5eM8JXtf/iHy+Ouw6ruh5vl2T+ftLqz5E9gxyBIzJv4vfziUoWuai3zXlNej
 NMOzKRvZD8TnUYhFJhuk5xuIXyaKgVzIcYEEs/W2ljrDLBGFUhx+vMQBmTeEkl+VqR
 EMoltsSCBFhmkwxLGQVmw7Q5vQcjvstFKk5Unpp/wOm1rO1HlgJqx2PPI9CHwD+MIr
 ZQDzo3A0IgALj9oWUhk4SRztGAm9xOB7BTCo/jhZqSxJSFZQpUdXHW+Y3QIvnBAJRa
 XGBS9AMjXAwGw==
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
 <CAFEAcA-TxOys5d=SAqwqU749j3-UoBf+WsWpMYZW_35w1r2ypQ@mail.gmail.com>
From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
Message-ID: <55c9d253-8f4c-cd06-77b4-fbbb26cda619@nh2.me>
Date: Fri, 30 Apr 2021 20:19:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-TxOys5d=SAqwqU749j3-UoBf+WsWpMYZW_35w1r2ypQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=116.202.188.98; envelope-from=mail@nh2.me;
 helo=mail.nh2.me
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 7:29 PM, Peter Maydell wrote:
> If we add 'force user=whoever' to the [global] section, is it then
> unnecessary to also specify it in the [qemu] section ?

I believe it is, yes.

Source: https://www.samba.org/~ab/output/htmldocs/manpages-3/smb.conf.5.html#id2506183

> All S parameters can also be specified in the [global] section - in which case they will define the default behavior for all services.

And `force user (S)` in those docs is an "S parameter".

My patch does not remove the one in [qemu] because I found it somewhat nice to have the settings for "who owns management dirs like 'locks'" and "who owns the files inside the [qemu] share" both be stated explicitly.
It makes it a bit more obvious what's going on.

