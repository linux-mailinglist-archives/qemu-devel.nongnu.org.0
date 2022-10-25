Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A760C34D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 07:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onCWT-0004a0-BW; Tue, 25 Oct 2022 01:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCWP-0004XX-3v
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:30:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCWN-0001Hc-C4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:30:40 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so5543529pjc.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dV72J4kNgIJHCrZpDwhNxJe4o1zmAmg0HiN7Kkqw8p0=;
 b=C71ewDhqSpBtGoZ2sqQAVVwZJ6rZYamKdF2/m6l1U4iooGFjm5j7Oh5NxO1N/heXow
 uUtT6ftHmiUA2wSr87tdhLVsRCSsR+FSENeYB/C2mxhKTQ9UOQTni7AD46c+8goGTAEe
 Z0doLgHoSuAtzXjwkUV4EoAW9rcLeyELBzrSJLYhw2Sr758deKncI41b4V1iH4e+zlWz
 MpQyenLmufOgnSJ4puN3MrJUC0AUEfe9U/WNq4tdFUEYRuAxz69yHtg2QhmdY4AURm9t
 uhRV5lVYicAwtvnJGHnYDlHfeyy5hBmsuqF7bp6A9ROnHp4d/qb4Nnp8a5yLkXq13b40
 CizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dV72J4kNgIJHCrZpDwhNxJe4o1zmAmg0HiN7Kkqw8p0=;
 b=WOsN0iIijegxsHn5fD5M8S2mEZkKOaX/d0+PElc7cvtYqtPDUA8MINc0Do0dl0YppA
 +cUv5oFOvp/YiI0LORC8zXpXd0tTeX9FiLJMV0VwgR6oyUHrHc+HCLEyNOqg75XpZa7K
 +6EH9wHdOLI9JU2oJEu4lXY455ToTTiqnuxLq+PYqWvnKSYVkWA/L89Z0U57ywI6jk6C
 3f7sobIna8hfaFrpL09YpurzmTQSUqTf9Ishrk0qwCZFebVgdnlfR3B9SbVmVpBVtEK4
 zQfPFGKwT09CJY46jM3k8wmx8MwiQ4D9Arv0eCu2uVmLkG2/vhYfds/ay0Ogqgx8IrCS
 WofA==
X-Gm-Message-State: ACrzQf1IEcjhZCAQdoP8fu7hBsbCO2yJojF6F5/dS1hwB2sdDbZaN5R5
 XTwbzHVnsMiOAJDRj/52wI8SAw==
X-Google-Smtp-Source: AMsMyM4pnOOPQeyDgWFEZ+SIl9QsydYWHk0AbCwFE5NnLsXVowdPVokmX/88lzD3rglpuJKz77i/OQ==
X-Received: by 2002:a17:90a:fab:b0:213:1431:86d0 with SMTP id
 40-20020a17090a0fab00b00213143186d0mr9396246pjz.154.1666675837760; 
 Mon, 24 Oct 2022 22:30:37 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170902ccd000b0017a0e78ed0dsm533866ple.254.2022.10.24.22.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 22:30:37 -0700 (PDT)
Message-ID: <79a89e1a-394b-52d0-a0a1-c3c7a48fbab5@linaro.org>
Date: Tue, 25 Oct 2022 15:30:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5] linux-user: Add close_range() syscall
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <Y1dLJoEDhJ2AAYDn@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y1dLJoEDhJ2AAYDn@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 12:34, Helge Deller wrote:
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---
> Changes:
> v5: Simplify check of arg2 against target_fd_max even more
> v4: Fix check of arg2
> v3: fd_trans_unregister() only called if close_range() doesn't fail
> v2: consider CLOSE_RANGE_CLOEXEC flag

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

