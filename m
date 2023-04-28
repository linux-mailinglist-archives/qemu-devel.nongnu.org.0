Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE96F126D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:35:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIdC-0007Eb-Uw; Fri, 28 Apr 2023 03:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psId2-0007EG-Bd
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:34:52 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psId0-00036c-6F
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:34:51 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-506bfe81303so16085127a12.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 00:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682667288; x=1685259288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U64PUQEadja1ghCiImR9SOBw094EAJVnSJKNs4Fd208=;
 b=vXnVLSvOaKRn4+1g5IlcxG2Ll6qlqrHx+exb5x83LnAL03B0N3do75Rtcp2NlP0TAL
 X0pFq4/ITHYCI7wjs4ue8AD6ON+u6CDT/9Qd0DaViT+mnPIJlYMH0VnrhUGAMXwNtspe
 ufzOWkeCSqgMTCLgGQDb3gg88NYl2sJAIsIE4/D3NR51LSlefCmccLH+tt52yHpjLfQG
 poUiPkBjJBKTSr+geztyWxEkJH+53uEzJOLcQ/hoWwC0aItPzjoWIbRuD1ED6M7lNxbk
 BB8Hq92xu1Rv2seeiKE7t4jQLjB1RIvtoT0L9YrYnKNfOhZ2td7rq4nPP5T8IEoE4mdV
 uDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682667288; x=1685259288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U64PUQEadja1ghCiImR9SOBw094EAJVnSJKNs4Fd208=;
 b=WErGlvWiMpp2dp1OPJHz0Gf6OHPEDq5hCsmT3PaUaC3wph9a/aXJ9kjT9LT+NcjL0N
 WWggLWWX+wSaGhnz5FwA/AsCtPW3AcT4SA1yR2VNR59edt5M/Cih+6K6p/lKfqb+Sgh9
 Lin1E2FSUFA1+kBRoNXjF5/iS4VgNSz6zasNC9G2gCVA5Y9kQnnV3s/Xisi/M9gS8fla
 LUacHrqq/+0kCkmmciWnyAT9+WL8EBQsA6qd7auOKUWe991/ybqjjOXZI2Zu2vZ6/9Tx
 QJLp0Zi9NARTrPg+T42Myn9rUBWYmwmiJ0Ib5BgXZ+89fyQ3vbc3Cc0Q3GRw4RYiraNK
 q9mg==
X-Gm-Message-State: AC+VfDx6X9LTZKcpgJGLAr9680NeOYIEyKy+1QsieG8DDta4nX0rlR+A
 gdnIuw7mSZwOWE6wvFNQ7w4x2uWK+QLEgt5gkJFZYA==
X-Google-Smtp-Source: ACHHUZ422KUimT7ezB3ZB/1Ckb7S9Lc/whCeKcWnihwBYesV+AXXk2ADUsQkJcrKkkLoGBw0vbwrYw==
X-Received: by 2002:a17:907:9687:b0:94a:474a:4dd7 with SMTP id
 hd7-20020a170907968700b0094a474a4dd7mr4018215ejc.60.1682667287738; 
 Fri, 28 Apr 2023 00:34:47 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 oq27-20020a170906cc9b00b0094f410225c7sm10687657ejb.169.2023.04.28.00.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 00:34:47 -0700 (PDT)
Message-ID: <9a740112-b864-fb3a-2c4b-ba573b1c8ded@linaro.org>
Date: Fri, 28 Apr 2023 08:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/18] testing and doc updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/27/23 16:44, Alex Bennée wrote:
> The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec35:
> 
>    Merge tag 'migration-20230426-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-04-27 10:47:14 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stsquad/qemu.git  tags/pull-testing-docs-270423-1
> 
> for you to fetch changes up to ef46ae67ba9a785cf0cce58b5fc5a36ed3c6c7b9:
> 
>    docs/style: call out the use of GUARD macros (2023-04-27 14:58:51 +0100)
> 
> ----------------------------------------------------------------
> Testing and documentation updates:
> 
>    - bump avocado to 101.0
>    - use snapshots for tuxrun baseline tests
>    - add sbda-ref test to avocado
>    - avoid spurious re-configure in gitlab
>    - better description of blockdev options
>    - drop FreeBSD 12 from Cirrus CI
>    - fix up the ast2[56]00 tests to be more stable
>    - improve coverage of ppc64 tests in tuxrun baselines
>    - limit plugin tests to just the generic multiarch binaries

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


