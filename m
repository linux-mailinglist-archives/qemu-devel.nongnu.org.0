Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3659A538
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 20:09:01 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6QW-0001HZ-M3
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 14:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP5qT-0004M9-Mu
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:31:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP5qO-0006GW-71
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:31:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id pm17so5254095pjb.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gcl/CxCDJ7xwTvpI4kXCheCYk/TrvnPyWXtrzkbHXgA=;
 b=uB0lfutwJTXOHMk9+9C5cdG60SP7XbWNS1/G54Gs36S8n9KFCISsM5jt1RMSSMvQ2l
 6BUzWF/rwSPYpertu5ICDewzCWMomPhoiR5OhF/QpAF3QVJ63cCKjlWKoTdtVEUClxRT
 4cTResXcOqRhqxK/KiWV07ejjKfVXOot5hRjGPv6SiMeqY/Eu6xZzkWMtGVPBlQ4G1kP
 nR+n578iBen8l8w9ODoD8plGNdZoSW68coiNprJ7QT8s/TChMh63g6XkpKzHldUd7fP3
 HQj2wLzTfBk8A3N1D+hByKlmkse67tDrW87NzxhlrnqbuQ7SdKVqQiStAFLGrFEJNgSw
 s4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gcl/CxCDJ7xwTvpI4kXCheCYk/TrvnPyWXtrzkbHXgA=;
 b=A+oBTL6B26iH5W27W+GvMrI+nU9zMZ3TXInvuzWqCmbx24jahZFlMziUTHDP3WwuZ9
 AS7BLQ+wHQTK5UGyTY1CLS8DcN79Egyu6c/TouwHq34SdNT0S3M1jWbRrNj7t/F0yH9y
 SvrQG/cKaES3duXtPAk4oxDFXhQVnw3qS2pWuvKARgdiYMUMo3o38+lbZS58DlG+NIhM
 O7DoeCvsoli8mJWU77D9VPtSsUZEFAPjQZRVAN1NZxxa4VCzYwsKimYxLvj7YySnpG3x
 wqpuwA9Mrse6y+T9gIInidSMgm57tYOdYgZh2fvU+G9S13c1TgosJM4cAos+N/cvqDYg
 xn4w==
X-Gm-Message-State: ACgBeo2y6g2H6KOISfQ1dBKi2h+ohuCcua9K6V19Q2nwHZheUZjuNrl/
 +p4Ql2eI5/TDeMp5Uo3n1cPpmw==
X-Google-Smtp-Source: AA6agR4a6lu9kP8Qx8jZItYBrvaZ0ybJxLgERwuXueaohU93+dgNCFlCyfeihPaxXsBBXwFSBnmr8w==
X-Received: by 2002:a17:903:40cd:b0:172:8952:9a4f with SMTP id
 t13-20020a17090340cd00b0017289529a4fmr8457070pld.66.1660930297817; 
 Fri, 19 Aug 2022 10:31:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 ij29-20020a170902ab5d00b0016dc26c7d30sm3436243plb.164.2022.08.19.10.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 10:31:37 -0700 (PDT)
Message-ID: <b3cb991c-3eae-d7a0-7c85-ada4fd6114b5@linaro.org>
Date: Fri, 19 Aug 2022 10:31:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/62] target/arm: Create GetPhysAddrResult
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-9-richard.henderson@linaro.org>
 <87zggcmes1.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zggcmes1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/10/22 06:02, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Combine 5 output pointer argument from get_phys_addr
>> into a single struct.  Adjust all callers.
> 
> This looks to be an improvement - I guess the real benefit is the
> compiler isn't jamming so many closely aligned pointers on the stack
> frame for all the return values?

Correct.  The number of parameters is also down to 6, which fits all in register arguments 
for most hosts, including x86_64.   And in turn, we need to copy fewer arguments down to 
the subroutines.


r~

