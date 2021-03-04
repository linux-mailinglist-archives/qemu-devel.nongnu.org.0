Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AD32DA7C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:41:05 +0100 (CET)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtqK-00019C-1a
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtnb-00089I-MX
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:38:17 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtnZ-00066Q-Af
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:38:15 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x24so2453890pfn.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8/KbsUQXoQujQBGoJrpx+Q/5JMYqfSMq2kqKgBgTlkE=;
 b=utqeVOqbf7IIjhRNcaREU+Cga9w4KGpnDcVWyjRut+753kwPIG/jGbEecmKhzVuP7f
 kKnGB5NFeE9KeV6lHfdlCBtnhhPP70eTSzrTvNh9m3SIssAQpRAK8YKT442lilnT+Rjg
 SXXPK5jVFxUsrs+o2FMfmPB7LeRXW35o2xZfh5bnbRvIo5QfOtIHv4l/djB8g9YNszRj
 n1vuVfw1SIt8xAKaI18UxQ5wHnl8C5Xbhbf0Ig0rBXoOCgbJLkm3MBAbY7exhzRySYVB
 1pChUKLTUr3qXXvtQYcudwhKZSlm45V77jAnhq/orzJ3yriGJJcbpTGsXjgVy38Dee5F
 8Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/KbsUQXoQujQBGoJrpx+Q/5JMYqfSMq2kqKgBgTlkE=;
 b=IzjrskBIeR6+YRpPsianUyhj8oqiA8eiN5Swhw6qxsZ+Hpx5eCTDbImIuXp9bedTh3
 sUYar/jLuqHA5YuJDVluPpNpTFKlK3E38j1Cigy4RhIfSg+PhLGK9mrvaAThts+cRXgA
 8Px6kTPhlpxya8ABew3Lbo1LfojcNFkc0ivglUR9u7VDH9TChxKwVuNN+9BTbTJZTSup
 6CCqkjKz059+/9EEK4KE6yiiAM0D0gK19zxxZqaWjthNgwKEflfXoglWUWuppFAIdy2R
 A5cBAKOypSvZEdNZ305B1jBGUSwjUUxnT7txSVPMkXuU8lSHAFx6RTWB/jJR3bFH2TVa
 Y7/Q==
X-Gm-Message-State: AOAM532da4Nzf9Lpi75IIhOf89aTvQwiPROqyQrACQI3waVaXq70txD1
 i0mhNn/IQ5zc2392lykT4p6mCqMBEKkxtg==
X-Google-Smtp-Source: ABdhPJwmEkSNd04q+BdmQ42PN4wmsTLvX1Hfoiqm6qTRk73DdbLVTD93OwClDLntxZMkCVi7s8Fdig==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id
 k19-20020a056a001693b02901ecb0af0d1dmr5166543pfc.42.1614886691962; 
 Thu, 04 Mar 2021 11:38:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q15sm165853pfk.181.2021.03.04.11.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:38:11 -0800 (PST)
Subject: Re: [PATCH 15/44] hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77c90abe-bcfb-b563-3af8-859656f4543d@linaro.org>
Date: Thu, 4 Mar 2021 11:38:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> +            s->initsvtor0 = value;
> +            set_init_vtor(0, s->initsvtor0 & ~R_INITSVTOR0_LOCK_MASK);

As long as you're clearing bits, initsvtor0 begins at bit 7.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

