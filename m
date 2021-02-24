Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBE32355C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:39:02 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEj8n-0001yq-Si
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj6F-0000ww-5T
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:36:23 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj6C-00077t-Fo
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:36:22 -0500
Received: by mail-pg1-x52e.google.com with SMTP id b21so390532pgk.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BE4EXHjUADiOGVOiajYNFFPIKPGCCbxR8b8s4Rv8dTA=;
 b=wxztMVHiq71iWwBgLsJYGXJyHV3jzWgaqECDiso8ROJGGLDaSU7LBejA8DIZkZC7eS
 25iTCuXDD/ZleZDPvMtH1Ddp8dT5NKnERqaFnz8iw2wQw2zjbAvCRedJs9tde2PVaFXW
 md3Z2P9AKDv7Q6r+9bX3xk8SU8LEAS+bXoXEhIs4Ie6ukQEmOWBrU4+xlQ11OokTW15C
 xAmcPRV0+/MRTSP2jngh7LF3efKNtpjwJiNN/nCi3jzvt6gs/1LNQWkdQWh7lpzLbVv6
 uhyU2m51dW+Arrrmspd7lIdqSS+dBZRBm145RoUsyxP5tBTLIxFAwIfwZO+AG81yKbZr
 UvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BE4EXHjUADiOGVOiajYNFFPIKPGCCbxR8b8s4Rv8dTA=;
 b=PQzqq6gp6eHlQ3vxzjohw2qaioU1jhaIc7ID/pSv0BpJdXYRIn/aw1O/KF9HKsadMM
 IZrHJdQtk0VOo6AHxL60dFjBLed9DkfbQWzhIZziZPFyCs66+hqDJ/NueVWF4VHYBbZr
 6EG6uhPTsHPclGrwDUp+5l9TNqW8zDQRNbWabLrSRAfi2IbS6pSfAcgTqcd9eLQc9+Bd
 PEa4A3ECMZwjd0cYZV09R24yn2gUAPZ7ZBVK57N8OYPG1+6A2YD2rueLvfosRyqqGgOD
 qurJTxgIPHWmiGm1Zcok8qZn/j8etXkOqNr7A8zOiVG15x6ilcGKwxNTdIrzdDJNhsn+
 7zMg==
X-Gm-Message-State: AOAM53062MaH9Y2KEJ5YfAyjsMVBNqAdmv+8Pi9hoELD62Y4tE1DOKD4
 aSlVPuebkFE5n0K7Tu7cjPbovA==
X-Google-Smtp-Source: ABdhPJzfT/WOEaI7MLNqqG7iR6ANCvhofFBNbQghmdNtxI2QDrTBHZfEckO4qehRaEo1dpmoD5tm7Q==
X-Received: by 2002:aa7:9e05:0:b029:1ed:e159:cbaa with SMTP id
 y5-20020aa79e050000b02901ede159cbaamr3164493pfq.49.1614130579127; 
 Tue, 23 Feb 2021 17:36:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l190sm410542pfl.205.2021.02.23.17.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:36:18 -0800 (PST)
Subject: Re: [PATCH v3 07/10] target/mips: Introduce mxu_translate_init()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd7bd18f-c5cd-fddc-473f-41d0b5a4a220@linaro.org>
Date: Tue, 23 Feb 2021 17:36:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> Extract the MXU register initialization code from mips_tcg_init()
> as a new mxu_translate_init() helper
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


