Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F32CFB59
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:53:03 +0100 (CET)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klX3e-0004az-6P
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWzM-0001kg-VU
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:48:37 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:37026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWzL-00065C-91
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:48:36 -0500
Received: by mail-oo1-xc42.google.com with SMTP id t23so2082478oov.4
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EQNA1J/BnPOvXb5ojou82n2poO/K+m47tE0GOZJrpPw=;
 b=LPHieyIhk6sqCBXq2jUxOvBPDKouRDC9mV2V5k7aAOAhMWS+qZ+9LBGNGP9F8IRi3r
 UOL13j3ranxu8Q5/sVMnOovkUijXrCvvHymQeJtcG69rthc6HzGCZZ0t9hkpnAdbK0Cs
 Tzd0mjfVx68HS519t+zrE1PzJNd9ar8mJNtWMfkjukDdxm04Clk2uflRnh/3OvuaskFs
 doFSoEDfxMGNv1Llgoj8RaxOFVhFItorCnhqfrnDdLmfNWJ0+GjBMClqsRVdEhKYsSdV
 bhJKcY1dzVg9swPRHXwNqNFsEF4ofrvPVuUnVpodUXIFJ2KMNVYVnohYlWxjiBHLrbTX
 7DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQNA1J/BnPOvXb5ojou82n2poO/K+m47tE0GOZJrpPw=;
 b=R4bDuZ4QF2hFqqBniSo2POmCx+hhvdyYsGFyfvQ5Gm8pjnXh8jc1H84StepOBRDSzj
 DABRYyY/H4VZsGZCasR+DJzx3j+TP1gDy9/x2hcj1NGdZpIsuZ4Ds4oGFkdkia9Rq0fM
 yUqidCMhOhD/Xtv9dHiuu+TOF8vdTzIa8bVL5K452NZ+3B3xxGHTltfL3XeuYbJ6H99r
 +HE66vFVNM8h+3LJdBOcpjZc+A5A1JpYf7QG6NFLZN2Fcgof7mvk7v9sR/ZWl8nEIJGV
 SqHeTPquojztvF50Dr+xXmsvtOBA9XDNvyLo26CZWzk/jhlCL9+/xcxjoUjME7YxTHa4
 ZRYQ==
X-Gm-Message-State: AOAM532ix4MRm482S+wSL0JFdg6opcmzvFPA8xgr0BtF60vuxcBgwWcX
 1BYmC0zYbbMEjyQHzEQgqZXWnQ==
X-Google-Smtp-Source: ABdhPJwE3TId+gQceHI//A1RKf9GSIamlXZBYSx/YSwK35jDkR/h+SpaK9FpTDOZaVaPPkted6aOJQ==
X-Received: by 2002:a4a:97f1:: with SMTP id x46mr6878738ooi.64.1607172514270; 
 Sat, 05 Dec 2020 04:48:34 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k3sm82251oor.19.2020.12.05.04.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:48:33 -0800 (PST)
Subject: Re: [PATCH 4/5] hw/mips/malta: Do not initialize MT registers if MT
 ASE absent
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
 <20201204222622.2743175-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80217531-00e5-b726-6d29-7cdf8d7ef25d@linaro.org>
Date: Sat, 5 Dec 2020 06:48:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:26 PM, Philippe Mathieu-Daudé wrote:
> Do not initialize MT-related config register if the MT ASE
> is not present.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/malta.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

