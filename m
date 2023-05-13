Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED62701620
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 12:23:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmOL-0006Ax-C2; Sat, 13 May 2023 06:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxmOI-0006AU-Th
 for qemu-devel@nongnu.org; Sat, 13 May 2023 06:22:18 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxmOH-0006v9-5A
 for qemu-devel@nongnu.org; Sat, 13 May 2023 06:22:18 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so16427905a12.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683973335; x=1686565335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGLR4IVkMPntJRLilMPGdfFFYpmZb4O68hDXPYWGoiU=;
 b=LY0Lq/cNpZkWcK1RpU1/YjgDBnrqJxHuQoqSZuD6fFBLWBnN3AM7R6ZkBNuBkVKpXk
 tpJ/hVqD/RPyhXIAV1HshtQyO5URP2QtcZCXxsCFCUPmKjvG/I04AqHkef3x0VwEba+L
 8rHmvMRmuX4c+i1c4QdVy24lBOAMdf9IIUhWp+DpnRfBZpxzdt6OnchyABfCpYiQQXve
 FjqqPXyGbe8bRajR9ylUdwZ7FxbZvPw3v+zfhKh4rd3w3qEHQ7JwZTP6yfzVoInAKoag
 gZjV80jAcnsaZ+ScZJqgxK7SsQxLA4dBh1Sv59M0pAyTb7YQteQuZUnEbgbToQkfimb4
 ZZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683973335; x=1686565335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGLR4IVkMPntJRLilMPGdfFFYpmZb4O68hDXPYWGoiU=;
 b=SSn3RlJTY9ycY6nIoVonREr6Bn1kM6ALCOtsZE9poSKRL8Er+SoHkqHXm/TisNR5ra
 rsvDHhrd2uuT93MhU44+bxTcLMuFOhan4mYzBsUi098PtKcfpl8zFJd9cedAUknEUHCD
 iPn02AiTrjaMTONepzIYnRg/TywItSxUEZPnnghdC/RMhLi1hU2RLKsPemqp3rGjd+dP
 UcP3XNpgIvif7KP9XlS/aqTMgrVi3WATQoq7xuQzAyHu9DyNzRZ4PKBnKfpEEhpknR/5
 AZrM6pS/8WPZQPHzjl3FHja+2+86co1bQyZqcNMn2AQVNTCQmzwzYlQco6nexyWPpmd4
 RHeQ==
X-Gm-Message-State: AC+VfDyf1a8unmdRRBwE2GaVyJO37mGOYC7fYO6qr+Z5CjsLvPZiTGH1
 NfAuVx6ub8hQhlp+h2eNrVVbyg==
X-Google-Smtp-Source: ACHHUZ77Zhw7CwPK0tkPx4FYbUwUsO8B9cuD4WwGVS2Yp4d6cFnmJu2WAbUV5JYZDu2nlxOtl0LTew==
X-Received: by 2002:aa7:d945:0:b0:50b:d26d:c57e with SMTP id
 l5-20020aa7d945000000b0050bd26dc57emr20154900eds.12.1683973335316; 
 Sat, 13 May 2023 03:22:15 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402089300b0050bd9d3ddf3sm4701678edy.42.2023.05.13.03.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 03:22:14 -0700 (PDT)
Message-ID: <bb4d8b79-6616-44bf-0446-fcabdd85f248@linaro.org>
Date: Sat, 13 May 2023 11:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/44] Hexagon update
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com, ale@rev.ng, anjo@rev.ng,
 quic_mliebel@quicinc.com
References: <20230512214706.946068-1-tsimpson@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/23 22:46, Taylor Simpson wrote:
> The following changes since commit 278238505d28d292927bff7683f39fb4fbca7fd1:
> 
>    Merge tag 'pull-tcg-20230511-2' ofhttps://gitlab.com/rth7680/qemu  into staging (2023-05-11 11:44:23 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/quic/qemu  tags/pull-hex-20230512-1
> 
> for you to fetch changes up to a1c042e1cc4c1da209f7c3e04aec5e622c7bcdc0:
> 
>    Hexagon (linux-user/hexagon): handle breakpoints (2023-05-12 14:43:14 -0700)
> 
> ----------------------------------------------------------------
> This PR can be broken down into the following parts
> - Add support for new architecture versions v68/v69/v71/v73
> - Short-circuit writes to temporaries when packet semantics permit this
> - Move bookkeeping items from CPUHexagonState to DisasContext
> - Correct '-cpu help' output and handling of unknown Hexagon versions
> - Enable LLDB debugging
> - Miscellaneous fixes and improvements

Please always test 32-bit host.  You have a CI failure:

https://gitlab.com/qemu-project/qemu/-/jobs/4279656830#L873

/builds/qemu-project/qemu/target/hexagon/idef-parser/idef-parser.lex: In function 'yylex':
/builds/qemu-project/qemu/target/hexagon/idef-parser/idef-parser.lex:435:38: error: format 
'%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int64_t' {aka 
'long long int'} [-Werror=format=]
   435 |                               printf("value = 0x%lx\n", value);
       |                                      ^~~~~~~~~~~~~~~~~  ~~~~~
       |                                                         |
       |                                                         int64_t {aka long long int}



r~


