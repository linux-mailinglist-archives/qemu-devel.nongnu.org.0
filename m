Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CF484B0B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:06:50 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4stF-0000Bq-WD
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ss8-0007pq-R5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:05:40 -0500
Received: from [2607:f8b0:4864:20::531] (port=44660
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ss7-0001FH-6s
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:05:40 -0500
Received: by mail-pg1-x531.google.com with SMTP id y9so5423325pgr.11
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yXUoBJiii6lAE1Fo9DFYxYFbnVNKhEVWVM9LhnNXgEw=;
 b=ABxCKCQwZosD93O9BpDJo0jhaAyn7nlvyKNKlrzlDzkfk1TeELIHk60msV8WOflOHW
 MDydk/g8N065mhc6phiOGZQu9/EQu1IuVd9TI9k4psg8Qyv0Wlv5Fq14dwkLEkuFOsCu
 iPeJ2ZRr3dir8NfeUmn/XO0AjvNFxF/l/Exr98FKYT3EMPckA6cyJKjPqX6PBH2uiTOd
 H5wAAiXdlKV7OquI5+vDRyfxRgZcq+Hzm2NIwZFHd3Th/lUJomTQuzVd20GawXAzXPsL
 /kLQ2yRxptLtrJ4qzo94Llcv6piJkuLBsFI04y+NF2Ep0pEiF/gO5EDoIed5iQXWaj/b
 niTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yXUoBJiii6lAE1Fo9DFYxYFbnVNKhEVWVM9LhnNXgEw=;
 b=IDAj3Y0kOadJVpKOw07TAY+7UukvCPGGB9L0Hqi3jhBNrb0ZPwwazxQLRTDitrinAd
 0uVKwakw1/zHGQmyfO0s2DkGqWYbFKO1YJ2w0+c7KPDicwsuBkcePfEknXxoL2TOdANL
 6KHtyt37BcK1iymcdZMOOmsedoijMmjfEeg+5Qtw2YWWrBf5d5yX4rlvYGMTbOoLoeo7
 E1/is/bPWxR5iq9EL0sh+cZdG+AbwXZ3au3+G7YhrbCw9NmOgbwbqDDq490FnVF1l0Nf
 n7T2QgR/75c6vl4Tg85HTSkAHCxsbOpOCkJAdn9gBK8mPcV6rx4757R+D0Fi7uYqr3/D
 Jvjw==
X-Gm-Message-State: AOAM530h0I4xHv9JaHFFgna5RaqKWg6kUlVmvZjGKNYL7a8Qh4EKTkUm
 fLE/DpQ0riopCnNMODvj1psqVQ==
X-Google-Smtp-Source: ABdhPJzoC3m4S7+A9c9V5sq+GfyWcMmqij18GJ8okwCiQJiNQtgu23UlI1OUC9LSXHVHSb8/x45XZg==
X-Received: by 2002:a63:9d8a:: with SMTP id
 i132mr31139634pgd.329.1641337537829; 
 Tue, 04 Jan 2022 15:05:37 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p10sm42376785pfw.69.2022.01.04.15.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:05:37 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/tcg/multiarch: Read fp flags before printf
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211224035541.2159966-1-richard.henderson@linaro.org>
 <20211224035541.2159966-2-richard.henderson@linaro.org>
 <SN4PR0201MB8808AF7EEDDDC2159F0845E5DE4A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65ba46e0-204c-9778-991f-cc1a5729d956@linaro.org>
Date: Tue, 4 Jan 2022 15:05:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB8808AF7EEDDDC2159F0845E5DE4A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 2:48 PM, Taylor Simpson wrote:
> Was Hexagon the only target that needed new ref files?

Yep.  A curiosity of the guest libc, I guess.

r~

