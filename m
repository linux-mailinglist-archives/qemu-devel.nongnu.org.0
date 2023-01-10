Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313336639D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8yP-0003Um-CR; Tue, 10 Jan 2023 02:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8yD-0003TM-2G
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:22:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8y9-0004Oi-T4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:22:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so9080572wms.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wrwPGSZM8dsQAtB0GKciCfOPw2cKmLJ8c4zQ2J+c/50=;
 b=OEcwZ4RQ0v5GC2dRF1/dY0mRBIB07GmG/aaXCezRneOCuqkyJ98APCeP9oNxFG8g0b
 YxEB/Jn/4uAmQnR30/2U2LqTGnbg7KOKhhN3x0AseKU1wRHCpUxQvLySO/e0T5cLjI7K
 o0bqcTFvtuf4HwPNF/TysjmEvjwo1C+B/uk4tv1zJG/7m1U/1DEAnr4sVVktjSCI8gn9
 6XqMtHfxusDftxwQRE4DPB8b19r/f4qRoI90Fv8Ah9VRyPnQAgoQ9v+1NuFi12ZSr6dD
 RT2moRQrDQcgzLHoW8uqdg9TOS/4HehDmJs3SFxWVejDPVQmAIJXInVsi82FKaN2+wpT
 5STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrwPGSZM8dsQAtB0GKciCfOPw2cKmLJ8c4zQ2J+c/50=;
 b=A1qDpGcWoUXobvvvnkc/jUcfJcgREDx9t6QGzmSufWd4x653jeZ+HoyK8vwZ0P7Nse
 62b7NjXaeckFtuMk7mbFe5fV6+nW1ipOfcKEHzX3rmErZjVY+bYUcnqoznC4zzDnxdck
 NoHG1BLfN3Zvff70RyLR4u6oZ3eql6AzwyO1DkXeOF4mnysAEh8NagO59XorjdIcsGrL
 psX9XhdPG0w2Tkn2qhRFxzLXqoVr03esOM8YPCK6EYHQikzKG1N7VqAU7chVg+QWpm6v
 A1cJniaGtDN17B3/2xsaictDr+QlP+beH/fylqDkNuBZR1G7Xz0VYm5RHiRQERdYUjpL
 jznA==
X-Gm-Message-State: AFqh2kqs8h6cPBpQGr5ZG1pilMcq3y1odlSqC6Jzz+dlQ7c6gC/xq1ZF
 uJsPs7Kvhgiqg6rBqyEhYqfd1g==
X-Google-Smtp-Source: AMrXdXvFY8Hzl3WWSpI9z2v3tmfr4Tlc0pQLYysmFXQJXOlIsl/6Sm+c7fVvqgDxTLEzdrM3zJUabg==
X-Received: by 2002:a05:600c:3d8b:b0:3d9:ee3c:7730 with SMTP id
 bi11-20020a05600c3d8b00b003d9ee3c7730mr5988513wmb.34.1673335368345; 
 Mon, 09 Jan 2023 23:22:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c4b0600b003d9e91cd08dsm8777882wmp.4.2023.01.09.23.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:22:47 -0800 (PST)
Message-ID: <b72aa497-9237-4726-324a-066d58ac9a7b@linaro.org>
Date: Tue, 10 Jan 2023 08:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/17] ui: Fix silent truncation of numeric keys in HMP
 sendkey
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20230109190321.1056914-1-armbru@redhat.com>
 <20230109190321.1056914-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109190321.1056914-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 9/1/23 20:03, Markus Armbruster wrote:
> Keys are int.  HMP sendkey assigns them from the value strtoul(),
> silently truncating values greater than INT_MAX.  Fix to reject them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   monitor/hmp-cmds.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



