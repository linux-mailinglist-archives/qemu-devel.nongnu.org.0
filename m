Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1DF40AFEA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:56:56 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8vf-00074t-LH
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8me-0004Yo-42
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:47:37 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8mc-0004wK-CJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:47:35 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so2836690pjq.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pGJ2MKDk+2eNhc761uVh/12vnidTbllk2P4pc6QEwis=;
 b=ERAjWMMNxI0+jfAyAITsdSQRLrPpQ9KWiPU/KnJ8T1brt15RQmsoKWpC92ydnN5DCV
 QafYks9pQUBQW6OhRbrpW6F3PhwDY4PL64LbCAEWPCr13pmSmmCnnVV+jaUluHLPmyQM
 0vnT2XMo9hHE+WcMDNbWxA6WsMQA+VwI2DFFR2ivsVf8GxyHmumrxiuTLXIRYZyHI5QX
 K7zxbjv1lJ/VoB6EZDovANQW+dtHh4kKAQq4zscM0Ie6wcWTsh6xYf9VywNfUaou4kVC
 aWZuCwXMzP+QSQt+57FoX+1zewo5hernwh/ZwUleovU8G7eCYKkDFmaJD5SAv9F0rLHA
 DYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGJ2MKDk+2eNhc761uVh/12vnidTbllk2P4pc6QEwis=;
 b=2zcEaq6Fl8bet2BITpx1LhVtLzKisWPwExCJxBHCHrjJ5qmSka0wqIoGJ4uwJa/Et4
 4y/OTKXI1Gh5gdKZtOXCa64hoMorGUxkdFFcOLdd0DgvKcnJ9eXa+LRzYGfnuJqPjo/A
 j82nKhG3PoA1T9Z24Hgm4u0yVloK+IVNHYaTsdoNSs3DfWdm1dHpgf9EUrk6paC7dX7m
 YvtnchBjqrtswmTwxeshfZYrjdejCG+FSp0fFMCEKyLarOaQTHX8TaLAiObnFwZqBj73
 COF5GO6eMK0x0o+aaFaTzULNHJifmw1AOZWE7FZr/lrr89VboNcKo0kI5ryrM+ID6Vin
 gcZg==
X-Gm-Message-State: AOAM533zKJbNQCw+f6UyqQ8B5vJMAQcCestsAHbk9ffrVzkSkhQsV8pz
 3ixe2Ytaa8Qau5pvsy4pk4asww==
X-Google-Smtp-Source: ABdhPJyZhbrbGjHpsmXwKPIROUrFhFx6iX6uAOrpXBlmKrJ6Fo15n3zXjETRUYkulwigeO5BWkvfaQ==
X-Received: by 2002:a17:902:d48e:b0:13a:60a5:f410 with SMTP id
 c14-20020a170902d48e00b0013a60a5f410mr15112819plg.64.1631627252825; 
 Tue, 14 Sep 2021 06:47:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v26sm10625588pfi.207.2021.09.14.06.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:47:32 -0700 (PDT)
Subject: Re: [PATCH v5 07/21] target/loongarch: Add fixed point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-8-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <665a3713-c1b1-f641-af90-2ee536072721@linaro.org>
Date: Tue, 14 Sep 2021 06:47:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement fixed point load/store instruction translation.
> 
> This includes:
> - LD.{B[U]/H[U]/W[U]/D}, ST.{B/H/W/D}
> - LDX.{B[U]/H[U]/W[U]/D}, STX.{B/H/W/D}
> - LDPTR.{W/D}, STPTR.{W/D}
> - PRELD
> - LD{GT/LE}.{B/H/W/D}, ST{GT/LE}.{B/H/W/D}
> - DBAR, IBAR
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/helper.h                  |   3 +
>   target/loongarch/insn_trans/trans_memory.c | 235 +++++++++++++++++++++++++++++
>   target/loongarch/insns.decode              |  58 +++++++
>   target/loongarch/op_helper.c               |  15 ++
>   target/loongarch/translate.c               |  30 ++++
>   5 files changed, 341 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_memory.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

