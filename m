Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB56FEFC4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:16:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3KS-0001Re-KX; Thu, 11 May 2023 06:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px3KJ-0001Qt-B4
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:15:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px3KH-0003Ib-Ci
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:15:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so41040805e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683800107; x=1686392107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QD61j4OoC1vj1L5DMD16pUKaCtgVp1PhmKG5Bj8FBXA=;
 b=Valwnot/8Mt8RNcMIPPmbfcq2FrgUfY+bAixczkuA6ICyzO1uy3GYYWVpOO+KHtqOE
 MQHHIWS2/77sHG5a3W0ISk0Pw+ZKki1T9eddt08YIX4t8ddpfSqHuCylWR3yQsdTwOzW
 c9KknlFnxQH3KWip1uZUXDK8hNPwEzvVGWwfoEqY+ISI/nIc7hq3k558QlhpQa8ln8/W
 KlE4UucgU7V00Zi+PtCg+QGgHVPptKZHuvCb+yMyeZFENiEPidEKa7w+KaBQtaLHb+RR
 S/QqBPbyMdWEY3Fz7yxYNGH5IsKmGrbrD9ZOm8RmQtq5QJ1WCxeULShbt++9BjrrH3qF
 hvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683800107; x=1686392107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QD61j4OoC1vj1L5DMD16pUKaCtgVp1PhmKG5Bj8FBXA=;
 b=AF5la4gjP6odT1YxlmQra9AQI6QHtVBcx6srG51LuB/ZzEMwp99J9NIQBHwApS7jp9
 ur8MfagNSrn/ccuftHNNeHNmdGFbxpGc+T9IJ4Cv7gXioZ+26CL+XZaI7tuAmlzNS0Fg
 uzFvvthoSXXuKBpys07RuoWvpZELZWrUIWjxLqR3NXQMM6ntv83TOGCW9gotktO9mg5J
 q4KfFROwdu46XQYjpqNET2L7/Yv8GRPJ1zTIedcdkvAXm538k3rs6Xq2BsrKEISJRL3U
 925Le5QxmEi5fHFTdm8LTd1lYpKnAlGnihx0U/iZWEph2SOjDj/I5P0rdUPbJBhMLiK3
 hpYA==
X-Gm-Message-State: AC+VfDxxuRNmJQiKQVEBne1JUS/O8JY+gZX0rq7E51wGRngg1frnXAed
 ink7sw0qqqwNk377G4cEJTS14A==
X-Google-Smtp-Source: ACHHUZ4SoGOgiDMVYKpfGL3JOp+o6pdozr6jjfAGkm1dn/fsyxD7uP4w8xTo2ch+7/sX4BuBEwA9vQ==
X-Received: by 2002:a7b:cc15:0:b0:3f4:16bc:bd1b with SMTP id
 f21-20020a7bcc15000000b003f416bcbd1bmr11965553wmh.39.1683800107724; 
 Thu, 11 May 2023 03:15:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.161.78])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c230e00b003f4248dcfcbsm12077271wmo.30.2023.05.11.03.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 03:15:07 -0700 (PDT)
Message-ID: <d78c62dc-18f8-4962-96bf-3729607ad5bd@linaro.org>
Date: Thu, 11 May 2023 12:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] linux-user: Drop uint and ulong
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230511085056.13809-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511085056.13809-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/5/23 10:50, Juan Quintela wrote:
> These are types not used anymore anywhere else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/mmap.c    | 2 +-
>   linux-user/syscall.c | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


