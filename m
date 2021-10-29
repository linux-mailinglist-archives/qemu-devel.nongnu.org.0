Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7920440046
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:25:29 +0200 (CEST)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUh6-0007bv-Pi
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUWn-0004PE-Vj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:14:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUWh-0005Xs-Ty
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:14:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id t184so9732407pfd.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VqNwzjvVAAldizAJA3UwykfyRZ4iPUKJ/D4pjqMKQ/o=;
 b=BxVcO1xjKCB96tLV2Fo1yIvpVselGcQp9Hw5kHi33pCCqWxvRUTdxUisxP/CUJSlvO
 B6yMIX8crdzGZA2ZqhCiU+aNyRNNrQt0GAAjjNJi5Oi0nl5mLNJNWq/RPjGmR6YBZZ/D
 Bk9EuHftylyWaLCTcUEa0W0ayYXyQeYhQjG/tXEHjV0mPi3R0qtcNtBPm8q5qILXKA9S
 s/Mbr9DWUFSkGL75zM3/IntA+/HVE6NeceQOd22BcYen/307aF/SJNN9gDAITvyG0gxc
 t0psllU4OIxIPqbHxqiGWrxAyneznAbo6lUGT0OPiEzV5LYORjxcZ493aQCADzRszLXj
 6SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VqNwzjvVAAldizAJA3UwykfyRZ4iPUKJ/D4pjqMKQ/o=;
 b=B7hw5ADJimsS3lECog5oq1sPQJYAcYl8I0t3CZR93GE1/bpzyfxQ4jaV4jCjyZxRzR
 dSo+ilX/RGqZdfI5M34OSAFDaq4TMki8wCKDRwmii3NxA/VuRJCx0I+rzSMOgZrAtSgB
 4QUsBiYtd7+NG1xcA05XV2k8jby7U1tdm/aYwfEuN4cTmlXnSTf2CaEQ8GXRIIHMIJp5
 92mGl7iov0jQSAj9vpWVncAP67tgfnmbfL1xlKLPpGTpKklrAMh8vks7KA8kXfHUm5pb
 Wd/gBhiHT4VntO+ODsJ7iVHT5LOe3md9grklpnhRkGkcLtFGzrw4IOGwKO+UgTcPBTvK
 p2Xg==
X-Gm-Message-State: AOAM533p1syDr1OyCPVx7tFAqO/k835/sjMElBO3+ub03gVPDgKROD1U
 PbRo/gOYgpxtX9N0OqZsdJdezg==
X-Google-Smtp-Source: ABdhPJyyv/b/mLeEE+OYz7cOyi16LuxdPM97cJ1p5eq7r5A/Z28ilMEpWpDpQs0GKzf7JFBTQu+CGA==
X-Received: by 2002:a63:2c8:: with SMTP id 191mr8754925pgc.293.1635524082470; 
 Fri, 29 Oct 2021 09:14:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h10sm8193182pfh.2.2021.10.29.09.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:14:42 -0700 (PDT)
Subject: Re: [PATCH v3 10/32] target/mips: Convert MSA BIT instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1763df30-18ac-2cc6-7415-d313c508895a@linaro.org>
Date: Fri, 29 Oct 2021 09:14:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> Convert instructions with an immediate bit index and
> data format df/m to decodetree.
> 
> Since the 'data format' field is a constant value, use
> tcg_constant_i32() instead of a TCG temporary.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v3:
> - Renamed &msa_i5 -> &msa_i
> - Remove TRANS_MSA(), call check_msa_enabled in trans_X()
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

