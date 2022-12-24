Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23AD655B12
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 20:16:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p99zR-0006I8-Ny; Sat, 24 Dec 2022 14:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99zP-0006EV-FZ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 14:15:23 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99zO-0005Iy-0Q
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 14:15:23 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b2so7680268pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 11:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kiAlwK4wf8gmCoZV830YH6dhrDLbORH67Rd5TqWf63c=;
 b=CazhN4MskMxbwIWs6GOhxs3mYV6Ik9j4pKRvSJ6YTRfi1unbeWLqK9Of/2oa8P+XN0
 EPOmBLzrlpKasj2J6MD7HjWCc+3ojnFX1EiDWliEFFoP0nEGFIpdAQ0rHbVEoaz6eNY3
 2vpVktqzU9IIA5/Kc0HjcRFI2bd7wxWhUQbrogK8iLK/Yl21OQWo8S4CLpINEOzcsdKl
 fxw4stPUs6Hp4p07WbijSBBnBJFxwtFziUNVzOdWy+iAgVyOIbo8S70/uczJ7Qxxxlmm
 +QN5rKaZawVnIgYQmX8shgWXjKs5gCeQkNhRtj4sFU0LZTdT1Pp4hd62To2upppTu47G
 tpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kiAlwK4wf8gmCoZV830YH6dhrDLbORH67Rd5TqWf63c=;
 b=Z7XhtynbLTz2oNjZX5hzMJ1PG/uwnaQABuq2B2MG6Fd+5ZqfRWnh6yNa7QcrvgbDO9
 kxKvRzg1m8p4Xo0X2Rwo/kZ71tXv/H/c0b7FvjRL6uHS9r7FKrYYzywTcFec5KT6d5SO
 424cIENJTgF9J1kunPcryklfFA1rYY2oTbOmKf0YZIfNUewf2T1RX86Wa4iI4BqoaYm+
 RcrE68V4L6t5ZuOMs8YC5Qb7MazmEDItzDhs363OoguoUHdQxl9v7loUrQ0xj9oD2Rw7
 C/6N1c+to4ihWTkR/tSRCXUxmv+lWfBo3FI5mzQ1b2jnKYxlAZeWsyBlHkHbKGKTGGNk
 A6Tg==
X-Gm-Message-State: AFqh2kqg3G6ij3YsJ+VDykTM1u+UajTmuFLugAXvfyDaPIT9oZ/oGfbK
 Wpbnv4M2yCFnAACqjvWBd1fBsA==
X-Google-Smtp-Source: AMrXdXu1m2OMnQnNgey7EIHbKffLRMLYaXFxVqt7UN8MgyDlg7rXEGyEftnE294N/0ly5hVuGx/I3w==
X-Received: by 2002:a17:902:cec2:b0:185:441e:6ef3 with SMTP id
 d2-20020a170902cec200b00185441e6ef3mr22113548plg.61.1671909320106; 
 Sat, 24 Dec 2022 11:15:20 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1709026b4100b0018853dd8832sm4419033plt.4.2022.12.24.11.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 11:15:19 -0800 (PST)
Message-ID: <0c7aed70-fe19-65af-7c2b-7b71fd5dcd0e@linaro.org>
Date: Sat, 24 Dec 2022 11:15:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 38/43] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-39-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-39-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:16, Song Gao wrote:
> +DEF_HELPER_5(vbitsel_v, void, env, i32, i32, i32, i32)

This is tcg_gen_gvec_bitsel.  The immediate version would require dupi.

r~

