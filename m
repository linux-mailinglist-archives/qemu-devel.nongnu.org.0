Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99869430D0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 22:08:13 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb9XY-0007lR-Qd
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 16:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hb9Uz-00067z-L1
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 16:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hb9Uw-0004Jy-Gb
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 16:05:32 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40387)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hb9Uu-0004Do-Jw
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 16:05:30 -0400
Received: by mail-pg1-x543.google.com with SMTP id d30so9517571pgm.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 13:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NDEljNEiOPAUddn9rpYioR3XrTttvPAys7PCiBhFn48=;
 b=UCQMeQgng5MC2brB+6W4OeTNfpHyiJFZUZALd3WukRvpQ/Jb0pabxRGJ1lezx4qJES
 z+SVYkeRszAloRMlJ1UZHwxwyk46jwcuXWAtXy0Yrl9In/NjXI0HktPcxO0CFlsoUehp
 D9a1qk6CUfMChpLCdMdyl/NFQdUc1g/5s5q7x7nKJbLNk+4cO8Nt8F/Qr/65c/2VrVCo
 9dG3Y0HLSW+YIC3tI3Os0C3TO2rELi76u0vhIAVJkYnHfpRmiILN2yYPItc+C7Ka0xsv
 jHaHZNCVHIScjJnzp9IfnGK663lZRAdlG1MfjRmksRRYfMR3lva+WWv4esR0k5HuECVN
 hVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NDEljNEiOPAUddn9rpYioR3XrTttvPAys7PCiBhFn48=;
 b=lODcyfAakSQtfItU9IcNHfE5VnKdVTEbzTUYmuMH18BIxQtrsd26WR5eI1M7ZKCuZ7
 3JXLc2pNuXZmLQAy4ZtmPYltrZ58dTyM7YlXSqpolznpqlgZNVVpZfxtEoipUVEfKsLr
 6RMp82HX/UrWVCC2lZ78yBeU2GltRyKfO7ujqikAmqs9+ATRBQnjRV07WKPisL4mpMpD
 h8RN8qFcRHzLDcl16Si4EpAb6D8VzrBqzjPV+Yu/UKlrOPHZ2eNNopku6Hue9ZefqS6R
 8kpHeYcetwFKeZPgS2pWjtGnHfd9J/wvy8AfnikDs1kSrOxKYEo846QJhtIEPCm83dP0
 ZxUA==
X-Gm-Message-State: APjAAAXwtkVqs/MyHcUgPoSYdTaN/q1+plMOTJpQOq5D/L5zNziCycnt
 gWlpCoDun6pguKOKaS+TUzMYhw==
X-Google-Smtp-Source: APXvYqwATc9JIio0ugVO5wJzS+D2stJgoajcdiYslInfqyb94RyJdZy/JV+B9+xmv/azQRYL+YVIdQ==
X-Received: by 2002:a63:d652:: with SMTP id d18mr27868641pgj.112.1560369924949; 
 Wed, 12 Jun 2019 13:05:24 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 w132sm385661pfd.78.2019.06.12.13.05.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 13:05:24 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, rth@twiddle.net,
 gkurz@kaod.org
References: <20190602110903.3431-1-mark.cave-ayland@ilande.co.uk>
 <20190602110903.3431-8-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <df03b344-3534-860c-74c2-20e9b672a769@linaro.org>
Date: Wed, 12 Jun 2019 13:05:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602110903.3431-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v2 07/15] target/ppc: introduce
 GEN_VSX_HELPER_X2 macro to fpu_helper.c
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

On 6/2/19 4:08 AM, Mark Cave-Ayland wrote:
> Rather than perform the VSR register decoding within the helper itself,
> introduce a new GEN_VSX_HELPER_X2 macro which performs the decode based
> upon xT and xB at translation time.
> 
> With the previous change to the xscvqpdp generator and helper functions the
> opcode parameter is no longer required in the common case and can be
> removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/ppc/fpu_helper.c             |  36 +++-------
>  target/ppc/helper.h                 | 120 ++++++++++++++++----------------
>  target/ppc/translate/vsx-impl.inc.c | 135 ++++++++++++++++++++----------------
>  3 files changed, 144 insertions(+), 147 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

