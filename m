Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8915079A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:01:19 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngt6E-0006AF-Jn
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt3l-0004Q8-JZ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:58:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt3k-0004oz-2X
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:58:45 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z16so9214313pfh.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3m8PbUH+SWuAoLH+gfsv0NvG6WwpR8KSk/uMGJkeyVc=;
 b=S1t7LTB0F6LhMPtWd+7+kOTzmhxaLxxIWl9QR+qJK1N5E4SbIvyo1SSjEGmlwJPH+w
 weViw5xdu4iJfV0kei7/VCa1aYIZh/xDbFCFTicm/d6KYzTJvqGi+PwcKgwNDpbw8Rpe
 FlWfjUpuwSYuxzUm8BxVprRiBFFUYdIKezxPSx8CwhDKXIzs36oKDqBIcDAPi4qyVlZp
 4j6mN/P7uVFOiBH95G4AwPsff9dqLV/JeS08+v9+Rt76a5yiB6Ph5NtPpV5wUGdwXv/n
 rqtUhf3z0M15X2dVDgsgbeNR7Bln9qvCJ+1daYbtmIDvC4HLM/u8b4dPg4z4kahLoieY
 gtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3m8PbUH+SWuAoLH+gfsv0NvG6WwpR8KSk/uMGJkeyVc=;
 b=jNKFZ0rAZRjisrcfzLD7yxTTPreDdWLh8TcFvf7D5n+chGz1etoSoFEVva8BlI6rY2
 mFZP/g04zmr9CCdJh1hN8MzPgJoASMu0gxB55i8yKlO0xGDeBL92DZU0sL+wBTouY1bh
 rMtbnjt6pJ2zaBHmj80qYFzMgB4qJ7GmSOk3lLgj9m1LZASFmFTPpQ6kOW1S9gCc7yQO
 wDSeQyI6LVjWalxpssaLjuaIMt/eFKrnf6cRTbkNInZij4UUKBiCJeWG914oLoGbyzzw
 Hts3J2sbRfeyhFnsfsTUFrAyDTcYeARLuss9/p8sJKA4Az6AWRO39OxYxHXdoeGM/ITa
 UOIQ==
X-Gm-Message-State: AOAM532cllkgqTBIgJpxigOLziHzW1UflM7TXFi3mEExVI0q0OtxXO7s
 nD4FhYUSDIYm3wserSOSwEzJEg==
X-Google-Smtp-Source: ABdhPJwl+Ys3hKgFFIj4ht9lrLJMnNsccQY31vNwI19+8+zAjoubg50dfq8mDvPDzA2yvyUXktpOCg==
X-Received: by 2002:a65:49cf:0:b0:3a2:747e:8f28 with SMTP id
 t15-20020a6549cf000000b003a2747e8f28mr15723570pgs.134.1650394722548; 
 Tue, 19 Apr 2022 11:58:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a639412000000b003820bd9f2f2sm17259300pge.53.2022.04.19.11.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:58:42 -0700 (PDT)
Message-ID: <812276ae-9fea-a7ce-a2c8-4daaa3d05ec9@linaro.org>
Date: Tue, 19 Apr 2022 11:58:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 16/25] tests/tcg: list test targets in Makefile.prereqs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Omit the rules altogether for targets that do not have a compiler.
> Makefile.qemu now is only invoked if the tests are actually built/run.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-14-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/Makefile.include  | 14 +++++++-------
>   tests/tcg/Makefile.qemu | 11 -----------
>   tests/tcg/configure.sh  | 17 ++++++++++++-----
>   3 files changed, 19 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

