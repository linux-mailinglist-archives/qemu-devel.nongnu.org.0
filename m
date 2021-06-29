Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3F3B75DA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:49:13 +0200 (CEST)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFz6-0006KC-T8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@sigbus.net>) id 1lyFxI-0004xH-9c
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:47:20 -0400
Received: from phong.sigbus.net ([2605:2700:0:17:a800:ff:fe3e:ad08]:40190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@sigbus.net>) id 1lyFxG-000130-AJ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigbus.net; s=2020;
 t=1624981634; bh=PIPEN8nk0b4ip7/6j+aEUrT5ESvdtZooZsSxeT2jn8k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YmZ6gqRkEM58uB/xAVoB5JmrSmqLsoNTL1Auk+PJXpcxFF8wHN058Pvna4XlqrDzd
 L1jPwOPFEA8EQaj5jlHr8J4hsO8Lbyw0ySbcYZLPR3KFkflSi/oXvLzmfKIhaBHipO
 SA/xlgnkxSSNAam+pcrFRdG5eTseNQfazSL1T5bOBp0FKNFOoV43H3SQQFCkRr2ov6
 EV7ZRt6k5s12oybeMrimmZKYDkLjbH0lzmznSsFlyNBiIS07QX6oEqYBjsgy2gTrMh
 Tmuv0Xca/DKwBCiW5Ha6dO3RPAGvz9dOGL3NED5UmnB3RCnl8WBqiok0JqpKJejUD2
 sjHAN/MrftBWQ==
Subject: Re: [PATCH v3] Add basic power management to raspi.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210625210209.1870217-1-nolan@sigbus.net>
 <4fe1c908-6d2e-8481-81c6-2c68c367e5e3@amsat.org>
 <CAFEAcA_dZekwW0VXLUJWnDR9Etfc3kcEndckRKj-LyPa+0a2WA@mail.gmail.com>
 <15380b6a-8886-9076-69c2-f782ebebdf49@amsat.org>
From: Nolan <nolan@sigbus.net>
Message-ID: <ce773045-f094-978a-f309-151b9f2c77f2@sigbus.net>
Date: Tue, 29 Jun 2021 08:47:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <15380b6a-8886-9076-69c2-f782ebebdf49@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2605:2700:0:17:a800:ff:fe3e:ad08;
 envelope-from=nolan@sigbus.net; helo=phong.sigbus.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 12:46 AM, Philippe Mathieu-Daudé wrote:
> I had to do move bcm2835_peripherals.c to build (otherwise meson
> complains and refuses to finish the configure script). I assumed it was
> a problem on my side (or with my git version) and didn't noticed
> bcm2835_peripherals.h was not under include/.

This must have been an artifact of my busted diff, in my tree:
$ find . -name bcm2835_peripherals.h
./include/hw/arm/bcm2835_peripherals.h

> Nolan, can you tell us what OS/distribution you are using? You used
> git v2.30.2 which might be badly packaged there, and could deserve
> a proper bug report.

Debian Bullseye. I had diff.noprefix=true set in my .gitconfig for some 
reason or another. I've removed it.

