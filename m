Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5523278BE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:57:51 +0100 (CET)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdR9-0005OS-0Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdPF-0004h9-IQ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:55:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdPE-00060x-6s
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:55:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a18so6814663wrc.13
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4kYMezYsRU21FWv/o1aoUeq66Hvz1kIB//2TnRqdbO0=;
 b=NW6RZhM05Y9rQe9/Gz2gaWLAFhGrOcUq0tyeVrAN3rk0zPGzGrFmPoNjkcZhKeINaS
 gGHOjJ3WkHoqNRZzww+aKP4Sp6DK54knOEDQm9cDG6S2ekS3V3WorFOT07LbdAuKOz49
 2E7CEusKaEeOFjFHrmT4zQkS/+/5Iplt9l28q3YrSV+Y0VXs9b1osbQnCO6DRXLl0Ieo
 usPnMYzYY+e9kfMOUyFybjWOiAoepA04hA3avHwpIEg1D6sjkrf9rUNiHAIiNrgVNTr/
 jFTa85kf9d+0wlimv/FFE3nZQh0Iv2r0wyB3516rBEPFvg9b5WfqdDKKR6qrGTwjc8Wo
 Cthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4kYMezYsRU21FWv/o1aoUeq66Hvz1kIB//2TnRqdbO0=;
 b=QSwBe2T6UVLb4YjYP8fRyxJDA1sUoEjDPUP2R0YmIdXF930Gdax5z50AYii6XEhaEq
 RPuhJu/olVcqR21q3Qy3STBmuaBJkjxNdVbipZxekRUdQSNX0gTM4PNMCIYrjLvl2Qrs
 s16/NoFksCsoWWXgrgUIHBoV7b4eg+eBto4WDe1seW/HDE5Qp8NuXNIhryHbjydRULnU
 hbJJ/6/2POVSSzbExwF5oey+bJBKOjnsgr0irgWKn1q5/gxZQl3QX1t3SMt4EzFJsk64
 eQvKlvP35Zcw2goGhvpY3ZJuyrzvAL9mKYe25BhgXPxncL70tLb1QE8egXo7odYAmssb
 ezzQ==
X-Gm-Message-State: AOAM5305L8JRwNPZ/cF87cHlAfSKpCy0S4f6dV3ikSTLrDVmTF77Rnb1
 gR8ggdjf84ZDjQHMUsvSvy4=
X-Google-Smtp-Source: ABdhPJxgafY5tulz5D5RtJF6ZkSo399HAVhHnoEpDMcPH0s85iWiaQZVI+ZpQdMov7UrQpMp5icOgA==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr6365029wrq.339.1614585350618; 
 Sun, 28 Feb 2021 23:55:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w16sm10956269wrk.41.2021.02.28.23.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:55:50 -0800 (PST)
Subject: Re: [PATCH 49/50] target/i386: Move helper_check_io to sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210228232321.322053-1-richard.henderson@linaro.org>
 <20210228232321.322053-50-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acc2086e-5108-1415-f81d-b2349645bfea@amsat.org>
Date: Mon, 1 Mar 2021 08:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228232321.322053-50-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:23 AM, Richard Henderson wrote:
> The we never allow i/o from user-only, and the tss check
> that helper_check_io does will always fail.  Use an ifdef
> within gen_check_io and return false, indicating that an
> exception is known to be raised.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/helper.h                |  2 +-
>  target/i386/tcg/seg_helper.c        | 28 ----------------------------
>  target/i386/tcg/sysemu/seg_helper.c | 29 +++++++++++++++++++++++++++++
>  target/i386/tcg/translate.c         | 11 +++++++++++
>  4 files changed, 41 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

