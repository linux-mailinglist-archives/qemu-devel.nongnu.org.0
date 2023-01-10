Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005A6638D4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 06:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF7Yz-0006xP-Rd; Tue, 10 Jan 2023 00:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7Yy-0006wt-7X
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:52:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7Yv-0005n2-W2
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:52:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id dw9so9766623pjb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 21:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/nl3OM2e4VnI5Xc7P1UglEp4ZguT0/4xQCN6nGkq8c=;
 b=ciYnSxB3vMyKEBAaGJ+Zqg3e/pScy4n/KXPByE+Q6/XqAe9QWG6RXwcl7xPE+Tn8KZ
 CCiKJOK0lc2UlhrKKP0TEcKv3e0FqyVqxG0imhAJF1qczTVxDP2otq/Ge/UUoFbEEVEN
 51CyIYXEXS+qVSqEXUeD+1+7Mt6vHu48neF4YcgEO5HTM7b62fuaQgim5w41w75wY7+d
 ZddEIwhSdmOo2HZmMbTqh8Kpmy6G5kzu7d043W5D9FfP+HuzmfqjlLfow+wJsYrGbqN2
 0/H9eWuV398fySCNWICNo3FnsaRNWj8osPfEx0/Aqt9Wdsy3ZZmtEfbPEUnzmZw+PBeh
 e0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/nl3OM2e4VnI5Xc7P1UglEp4ZguT0/4xQCN6nGkq8c=;
 b=x5x/VanapCDTWbC5uvG50xBZu187LB7NIIW7tSCCKmcaYn12x3Q9WfVZ909db+t41r
 DAf2WOsPHyzuBymarpRq52tsBQifS6TvgKYAHdIcIDLbSzfSplU7TasnbKI/7dNaT505
 Rh/k4XOXcD/9o1odLd7cNw4zjdpyg7QR3sNb+CVmKsO9wxTpV7G3FLgbalchYAMJN2Cs
 X9aTWocjHc3GWUQRXDGzNvi/lzfjqsb/nQfAC/aX1Owe7zT23kUpPyqvh60uNzlzn4XK
 1V6+kYk08U1Gdm2WKzhy761d+z6n8c95nX2d0Va8pT2TgmM3n3vyORymfMcj5Xcu/7tl
 sfcg==
X-Gm-Message-State: AFqh2koJ78JvnalNbvvL4I4c8RzOxhB1SfycJp9mvB7EDfzjFG2pZHbx
 kO6KbA/x9wazfjNPDvfKcfPFHg==
X-Google-Smtp-Source: AMrXdXt5IGcYtNL1tB8lr5UwKavyz1rdNmCt8HELNfpCRGah+6ICx4thtkyqdStx1QSYJSqC9i5rvA==
X-Received: by 2002:a17:90b:70a:b0:227:62:8169 with SMTP id
 s10-20020a17090b070a00b0022700628169mr8333960pjz.35.1673329960504; 
 Mon, 09 Jan 2023 21:52:40 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9?
 ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
 by smtp.gmail.com with ESMTPSA id
 fs7-20020a17090af28700b00218abadb6a8sm6392857pjb.49.2023.01.09.21.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 21:52:39 -0800 (PST)
Message-ID: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Date: Mon, 9 Jan 2023 21:52:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 14:42, Fabiano Rosas wrote:
> We want to move sme_helper into the tcg directory, but the cpregs
> accessor functions cannot go along, otherwise they would be separate
> from the respective ARMCPRegInfo definition which needs to be compiled
> with CONFIG_TCG=n as well.

Hmm.  I would have hoped these could stay tcg-only, somehow.
I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.


r~

