Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0655BC488
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 10:44:28 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCO9-00038Y-Ps
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 04:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBuN-00037J-23
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:13:39 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:42638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBuH-0008Iy-Pi
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:13:38 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so19258751oti.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=nFLWkCsUNwlhjc2249lgL2AKnejydHvPdKIRu4VxVa0=;
 b=PzaLbVXMRMLtpnTXpsCJlqSfPOjvPwY8yGR0c7dgCEIDGgf1eW0fKMpdpLkpNk93Gu
 jpNWrGKpazQyuf/Bbbokb/s9ZTmTbnNp0InLhKVM8sHBc37vo7RjO4NBTM4PqZI38o38
 lPoup/eM2kbaJKP7555dBDCdq3wwUYjaYZc8jKG1NgREyrhBwKa5M8EppknESGrsFtIm
 SmBZ9CBNapez1iYeBiysug/JwtQDMau3SG44hwhOkfpFWn9LgsLwNUwTqZPnoglJHLwE
 h0mIHCfrxo7JymjV0FSrP+pzTqAvVOHdbTtz2d0TjzFNJEcl8+Xfh2uiCvAF/Wlvic/0
 BEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nFLWkCsUNwlhjc2249lgL2AKnejydHvPdKIRu4VxVa0=;
 b=zWFr+rsZrqfGv/OJV+u4bH8JwqpxKFByo8Nug/J5FbyNMAZxQmU+2Zo6s/rpWkwzHV
 GTUOgIy7pBt7WbcKTh+fLAIj7nYAfFoNIw0BsYdzCVL7AjbhKOb/O5luBG1p4epusJQf
 znbm9J9NOsVrn4QNZOOL+KyGNj+sa6/MjUe2TCim0OEtnVRNnc+H6hVx+/a4ts1evyY4
 bJrGilPgdOwJz8QZvbSP3L8+I5//YxB5nyQy3kMT+tXcTRC9csYvVnwDIb/cEcYrEw/j
 PiFIbRZUngnsvu1BJfg2eNImqbsLYNMXLASMnRvUzxFPiYk3mO9RJIFFtt8V0q0JpsiN
 p9vQ==
X-Gm-Message-State: ACrzQf34boj39kmkgySbDfrljXlcd+1lT7XwWFA0kxwNoN4pG8v3vsXx
 JwP3XBaVeg2WIm2cxLtA0HvsHg==
X-Google-Smtp-Source: AMsMyM7mtrBL+6V8mU9xN3oTAiwoUxcEWX1Mzk0ocYPfPXOkP0iIk6r4usyiO+3bmLdHxzQy1e5jRQ==
X-Received: by 2002:a05:6830:278b:b0:657:cec2:e1b5 with SMTP id
 x11-20020a056830278b00b00657cec2e1b5mr7358198otu.226.1663575212615; 
 Mon, 19 Sep 2022 01:13:32 -0700 (PDT)
Received: from [192.168.199.227] ([172.58.107.41])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a9d6350000000b0065689e13f52sm8464605otk.71.2022.09.19.01.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:13:32 -0700 (PDT)
Message-ID: <c3226a65-e4d9-bb23-ecc5-d5dc6aea954c@linaro.org>
Date: Mon, 19 Sep 2022 10:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes
 to SR
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 13:25, Mark Cave-Ayland wrote:
> Any write to SR can change the security state so always call gen_exit_tb() when
> this occurs. In particular MacOS makes use of andiw/oriw in a few places to
> handle the switch between user and supervisor mode.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

