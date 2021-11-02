Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6F442ED2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:08:10 +0100 (CET)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtWL-0000xr-49
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtU7-0006Jt-V0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:05:51 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtU1-0005dS-0B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:05:51 -0400
Received: by mail-qk1-x72f.google.com with SMTP id bk22so12778050qkb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cy8h+qEhvfF8y2oclsgLmxcXQNfqPttopW147oQ1Uss=;
 b=R/nqxFy5bSfcC72A446EZwdoAl+4tcrVqrlCkFB6XwoelQSpc6hUdbHuAiA34KxQLn
 8LEKkU89Jm88yjg7q4Y9BPwnKdsH538Y6lURTGJ3dqNOMZ9BNwlWaobwWsGm/qBCmFmy
 lvq9ltdsR5hn4Zj3zcWQM4J29LpVYOA1Dlmc3Bk9T0uNteKEVHGtlfWrwHJZ8XIVZnLJ
 WkdiGP68yPkxZ3cLZSf4C79h8gB6jLabp83Bp53ZYrlEOFGxKLKqhouln/22vC1Mi2tS
 VDBUfF2QYBrmslPVXBPBw/WPeyU4OHC4UoiJTKUa1ejfPCvathbtLrveczbTC8UpP9gR
 RI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cy8h+qEhvfF8y2oclsgLmxcXQNfqPttopW147oQ1Uss=;
 b=FCo3m55T8i++afw2Vhjfm8JMJOefl2CGwytQz1BAVCTQ+6q/hXQ6MutOSoK0Jdt1XX
 IkgrwZJKoeRYEKdj6NeyyRoGuMfzFoKfpVYBRjXhxpOFql11a9p4eHRkq2tMCH+coKTg
 WdeMVMvRBEnsDSvj8V9gsnUN4vcFR0fp6r+lC2dbhjd5JQMolNFUBaD87hB3fcp8v4a/
 0uI66kqvX5rpsPGyEkP/QshO/PoofMAa+q7waKhpcAFRKJ7bGpKvWCDe2cMG8aaNa55t
 fsAhapqQPniNHo6uFl1M8GkX8rkxnr3q/e2YAFGefiDhe4n3LHK/srRWkohzKVBPcG90
 i51Q==
X-Gm-Message-State: AOAM530FSejDHMpuouqOXC3hWc/pYKnXyADbIaCskD2vf1Yk0hSgR/wj
 j8pDb2JQs1zh3EV21mgXvmKPRw==
X-Google-Smtp-Source: ABdhPJwSWM+w7/A1N4rR0gO/UVJtS7qBiPgK5IoGZJt4HyTPsYA1Xt4pG0canvB/bjG3x//YNse8/w==
X-Received: by 2002:a37:68cd:: with SMTP id
 d196mr23918655qkc.490.1635858343713; 
 Tue, 02 Nov 2021 06:05:43 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id s22sm13125231qko.88.2021.11.02.06.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:05:43 -0700 (PDT)
Subject: Re: [PATCH v4 13/17] target/riscv: support for 128-bit M extension
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-14-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6c7f698-a23f-7f62-657f-91abd22ab27e@linaro.org>
Date: Tue, 2 Nov 2021 09:05:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-14-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 8:28 AM, Frédéric Pétrot wrote:
> +static void gen_mulu2_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)

This should be named gen_mulhu_i128.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

