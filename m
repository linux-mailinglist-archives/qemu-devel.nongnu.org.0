Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D79626620
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 02:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oterN-0001nt-EA; Fri, 11 Nov 2022 19:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oterK-0001nZ-D0; Fri, 11 Nov 2022 19:58:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oterE-0003Fn-E4; Fri, 11 Nov 2022 19:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lA+s6z3RQ5bnL49LqcSGmOtCch3FNwg1E+WzT19xRo=; b=QoJdJ8B/8jSMLvISgBHuJsk9r6
 0IMFdEmI9Kc6s2cceD5f+qEjBtMhN1goj8zTk5f9MRd2fxVG19dYb0LiV1QIbpv5MwNoFGGpJqwLk
 8QvEwEiQVjn8dRHkf+dC4A8gZJdhv6zhvPvY4bReeJF4w1LDMGzzpAEJWSIHHhRjn5GRgzufDHKEa
 aC+oEu3ZTTrz7PyajVwBLXR9XzXSivRRFXCZaJsg5yH08eOrz0ZB46Al7q0ZHUHVZUDQDhnMF7rCH
 SqEW/8Dk2G3nYRfRaklm/VZ+LkAibqPnKO80VTx0ypWWDSHmKM8JtjiMion8vrP1Y4EECmUJ9YceH
 S7zRBlc6KMNmnAJi9L8D7LstE6ydwrY4KydJTag9TYR1pqp7oKteVJQ3bcDfMRs92NPB71XSflFUA
 QsLqTSrUR65G5BNeB2Ycy3/JN9l6okpVcSXEjhh1iT0cOX5kGFyvGxDHbGKLvovJZTseRPhi+cqHK
 q9pWd+YBKgtL1KfpRTqUJVExFhHBWM3IvXXTgw4Oj9Pa/cUqWzPNhjbf1DumxtGM3bJlqU7wpYfWj
 7dyqW2X4hEKo4u50lZH9Nc4FvaRWkdZlW+OhmSwFZSn25tqv2R6GTXQIxjNLQxFUScZwNPXws7vQf
 aLNw8QZjaDUBwZna44gdoISD9Q9Le64qaa2e0OdcU=;
Received: from [2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oter2-00011R-Af; Sat, 12 Nov 2022 00:58:44 +0000
Message-ID: <23f249c5-6de6-8654-aac1-799012fc5961@ilande.co.uk>
Date: Sat, 12 Nov 2022 00:58:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221110143459.3833425-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0 0/2] hw/misc: Convert MOS6522 devices to 3-phase
 reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 10/11/2022 14:34, Peter Maydell wrote:

> This patchset converts the TYPE_MOS6522 class and its subclasses to
> use 3-phase reset. This is part of the work I'm doing to clean up some
> of the reset-related code by getting rid of the
> device_class_set_parent_reset() function, which is used by
> legacy-reset subclasses which want to chain to their parent's reset
> function. There aren't very many of these devices in total, and if we
> convert them all to 3-phase reset they can use the 3-phase-reset
> equivalent (resettable_class_set_parent_phases()).  Eventually this
> will then let us simplify the transitional code for handling old-style
> device reset.
> 
> This is 8.0 material. Tested with 'make check' and 'make check-avocado'
> for ppc and m68k builds.
> 
> thanks
> --PMM
> 
> Peter Maydell (2):
>    hw/misc/mos6522: Convert TYPE_MOS6522 to 3-phase reset
>    hw/misc: Convert TYPE_MOS6522 subclasses to 3-phase reset
> 
>   include/hw/misc/mos6522.h |  2 +-
>   hw/misc/mac_via.c         | 26 ++++++++++++++++----------
>   hw/misc/macio/cuda.c      | 14 ++++++++------
>   hw/misc/macio/pmu.c       | 14 ++++++++------
>   hw/misc/mos6522.c         |  7 ++++---
>   5 files changed, 37 insertions(+), 26 deletions(-)

Again, not having played with the new reset code myself I'm not quite confident 
enough to give a Reviewed-by tag, but it appears to do the right thing and passes the 
avocado tests so:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

