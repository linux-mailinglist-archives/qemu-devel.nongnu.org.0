Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF18161CCE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 22:33:01 +0100 (CET)
Received: from localhost ([::1]:53326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3o0i-0002Y9-ES
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 16:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3nzq-0001uw-60
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 16:32:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3nzp-0008GR-4T
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 16:32:05 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:47008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3nzo-0008Fd-So
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 16:32:05 -0500
Received: by mail-pf1-x441.google.com with SMTP id k29so9541810pfp.13
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 13:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SoeM7QLrjPjbm2c+Vot0BOvlPIKe2WT5EWxhA6IsmEc=;
 b=YA8igVpGVz0Aj3DzwWpKo3C+x4DV/iq3Oo0H4Sgr1WIfWETGOqQUBVCyuC1Bt2Ma+f
 PZP1CzooWcI0qT9cqvT4iFyw/K/qW7Iisn6W6ndkXDVAtPM2N4EqjXi+Nm2luRTxsc/f
 G4h/kQZGTj9MltstY++xlLNNT4uypLRL/eixL86Ung7OF/gWZed3v0LAW8Z1Fb4SvvMR
 jiy2tuXyRm3azCOaYyFdB/8LAKpt6Ymm1ryPMs2icrHoTqot3/x1qxAFShXjR93ycM+H
 iJ3nA1qv5lhNK67XfEEmEetX+ENmM4m6nkuREVaPEUZ3/P1UapM1ShrsttbeByUzd+8t
 rtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SoeM7QLrjPjbm2c+Vot0BOvlPIKe2WT5EWxhA6IsmEc=;
 b=VvZtql3q0cr1bVBsd5sAc85APTVAsmy12fuq7nKz7SM6uGFo3dEnL3SnaUJsiuGDoL
 JGLx5c3aN6t1thklmJ7pklaplwtP0l2zB9UL86kX9o4AEAZTN+6Peai18ku9C8nPmce2
 +2Go8iAT7GSaj3ZlP0QmbElWdq2mM2Sy8vQkc/rLkbO10rdKCAGGKt9Ua1m8uembWBFb
 LLAX3Je5NXkfo0QpTAa6QfLQ6QNs8vqI2j+cWOTGh1Hhc+CPT3z+U2LOFwowwMDSQlca
 xY4T4Ppubq/qPA70XEprKmduoFdwFPProNan/JBATqs3ysCrpgbRiPg22WztYsVBvVyv
 JJPg==
X-Gm-Message-State: APjAAAVWddx5gR7yEGo+Vo5Zf7TPByNJdNJxCDlZtiRslBpvrlKo6zM+
 qaL87fX7KwsoFuzbz9vPxP8Z0A==
X-Google-Smtp-Source: APXvYqxgBFTt0rmBL1Xwksf180k26HFnEK13BBfqrd9U5RkkSTm4ij3mwF40V/8aLMdYjHL7lUujrQ==
X-Received: by 2002:a63:2bd6:: with SMTP id r205mr19479205pgr.69.1581975123507; 
 Mon, 17 Feb 2020 13:32:03 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z5sm1378387pfq.3.2020.02.17.13.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 13:32:02 -0800 (PST)
Subject: Re: [PATCH v5 05/22] target/arm: Suppress tag check for sp+offset
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-6-richard.henderson@linaro.org>
 <CAFEAcA9ps2JZHi2nTUrog7rgRc5gL8QbqYhSgFCS_-ARe_0T1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4685425b-5412-19f3-a6fb-3b2c6b0f25e1@linaro.org>
Date: Mon, 17 Feb 2020 13:32:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ps2JZHi2nTUrog7rgRc5gL8QbqYhSgFCS_-ARe_0T1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/19 6:07 AM, Peter Maydell wrote:
> The load-literal case is implicitly tag-unchecked because
> the address calculation doesn't go via clean_data_tbi(), right?

Yes.


r~

