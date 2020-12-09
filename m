Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928732D4504
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:07:11 +0100 (CET)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn13e-0000xm-Jk
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn120-0000Dn-SV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:05:28 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn11z-0000yO-4z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:05:28 -0500
Received: by mail-ot1-x343.google.com with SMTP id d8so1627886otq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VZEN72F383q+BsU66UujFOG35/GBa6nzTEu4APgWtsw=;
 b=fJxd94HSev8eFFWKXPROuZzkvtaY0B0DFPH0TgIyR/yrIESlhKKr6ZIDzNlIrgiVSS
 Wyvgz2IukVqF+0jHxjzndLdxXbcN8is/rzFLALEVPgGEOfUZt4Ih8gswhtaGh240mEEz
 TwQdA0FXpsh5iSpnvt11WSvGL1DWbgSzVGvd2tBYgNLzYPZ9yN1pTq38bjfQF3gUqQmV
 BEl1iX1+TtmCV6QRlHYf+wWbumoR0vcWPCijFab/5LyXr9xcOlivjmXaDj5910w9JOvd
 pw58QSLt+q1e0pZ0NMgrmkSBriV1daxbCfRBtNrmK5a2+vgGJNAGrpOJIRnzIidtljvz
 WFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZEN72F383q+BsU66UujFOG35/GBa6nzTEu4APgWtsw=;
 b=q3t00bjwYGpGiVZ6h2Q+9jiipJASqnr2uu4z+4TxZsAoE1D8NEu5oDfl2XEqMcmmEK
 3h2dhtyFz7o2nB225u/J/NNQ316jwS0bVd+Zj1RzMef6X3gmZlm75p46IDcwRAu82ayd
 TJr/GojTOTyq0Sj0aUFND6p/Xx7QTv5DttVZdFRjCKrEplqbzgngrPdIoCQxvGQyBDeP
 zDjgEJuHUmlW2w4udq9jQYugMJqUFwu8g5pTa7J5x3dPddyqiQ5ompUUYIk0X97F2Waq
 aFje8DE9I0AFSQbcdS+9um69VvksaGLPhQFKWebweEvr+P74SaDs2bDYiqSW00j4ynnf
 Spiw==
X-Gm-Message-State: AOAM533WENy5u+i1aVxpMpRJjftt13j84TaN4v/HCjp7/sUV/knscjOK
 Bq0Mbn4UCm0u4uSXnW7OHie/ww==
X-Google-Smtp-Source: ABdhPJwMpeXxzYPMgSba01O0b/S83NKQ4BHjqBOY+RKXMqCwEqag4PUJY/pgpAjuegXOIOXD+fUETQ==
X-Received: by 2002:a9d:3d64:: with SMTP id a91mr2047051otc.144.1607526325375; 
 Wed, 09 Dec 2020 07:05:25 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e24sm465797otq.9.2020.12.09.07.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:05:24 -0800 (PST)
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
 <a446bff4-04ff-bf3f-d916-2245fdf5436a@greensocs.com>
 <b7d91508-73da-2b26-9a3f-569c7722c99c@linaro.org>
 <CAFEAcA91QPkK-_Ew=Gx-puRtfb0wTHHVF_4BHamq-CgKttg5qw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e6cb69c-c638-41ad-7f10-e7108b3a117c@linaro.org>
Date: Wed, 9 Dec 2020 09:05:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91QPkK-_Ew=Gx-puRtfb0wTHHVF_4BHamq-CgKttg5qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 8:26 AM, Peter Maydell wrote:
> (print "Welcome to the end of the universe" and exit?)

Sounds appropriately Hitchhiker's Guide.  ;-)


r~

