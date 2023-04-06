Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D16DA183
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:36:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVOv-0006UY-SA; Thu, 06 Apr 2023 15:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVOu-0006U1-AV
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:36:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVOn-0007de-Iy
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:36:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id n14so22588740plc.8
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680809755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ZLzuwGqqykiaxEF6DFaoodhCEP5ZYjTzLhoJsO9SWc=;
 b=rztuEfru4dr/BOHgyJfTgbmzHBxrM3h7J21enzPJxNe/I4lpuNSR8qXb0RvHiTJOrb
 yS2ygQU6CVaQlOGM7eyetXNXR6tMRk4ENaj/so+eKxz32VilTHQNjjJNXYcc38GTBkyX
 +7x/zf+HFxOy2LOMq73aThKiC1dzDlXB/pTkNGP6dOhOXjlmL+JrsXUWXoKUVNpj07KF
 AUuKXV5VJ2katgJzMJt0B7tVRLvpVL+BWOi8iuKKSZZt/UeXQxqRHJEaSzVmL9OoQuvX
 rJoGSmvYaD/JS59sEbIyVihAZ1tr0nLrQnexFkLGJAwjbAWI3TzfGiAjoPZZTvKKa5eG
 OFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680809755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZLzuwGqqykiaxEF6DFaoodhCEP5ZYjTzLhoJsO9SWc=;
 b=cmcM9rij1+q2h9x6TaIObR874rAjEqc6pg4qgWX8poRBT+b8vKeSI446RYXZXNkfk7
 Q0ZS5209JoC2KGaPG/Fc5wNFOvbYPyKxBZzoDEZMdOA68Ejdz3NZ2uYpmIneHgnNmtLa
 ro3GkjVeyzmKKpSg/6Ug20GylwcGY49lemlgrexagC0ORrkpQ81dchRn1EB+3IkC/1om
 7OzahOKDI12wAnkpaxBVqlhW5bJV93xeL9waLgknpyJnPQOX/cEcOe/emHZWk4W20UU4
 dGJ//kUVVmG2eRD5dAlC3UZp6s0AxLw0JCoJIIbhMzFNCm5+gBvYVqfO2VBIKk0YWWho
 4sUw==
X-Gm-Message-State: AAQBX9cfUYHgMINP76ljhsZLWbo3hvP3G/hCe7EwrpAfN1jL2dBuGi1X
 IalPuhnyCAJK2Vv4T/OLeA7yWA==
X-Google-Smtp-Source: AKy350ZQJXf/uiKkjhE6hDQVj7sJ9h2r3Nw8qI1yshAwjI7XYgn22U3n7p7+YtW/LAXM61o0ZuAiFw==
X-Received: by 2002:a17:902:e846:b0:1a1:a4eb:54de with SMTP id
 t6-20020a170902e84600b001a1a4eb54demr416952plg.26.1680809755497; 
 Thu, 06 Apr 2023 12:35:55 -0700 (PDT)
Received: from [192.168.0.4] (174-21-65-249.tukw.qwest.net. [174.21.65.249])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902c1d200b0019e8c3cd3f4sm1715055plc.201.2023.04.06.12.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 12:35:55 -0700 (PDT)
Message-ID: <fabfb2ca-d77a-a2a4-1a95-21d466d397fe@linaro.org>
Date: Thu, 6 Apr 2023 12:35:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/arm: Report pauth information to gdb as 'pauth_v2'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luis Machado <luis.machado@arm.com>
References: <20230406150827.3322670-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230406150827.3322670-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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

On 4/6/23 08:08, Peter Maydell wrote:
> So that we can avoid the "older gdb crashes" problem described in
> commit 5787d17a42f7af4 and which caused us to disable reporting pauth
> information via the gdbstub, newer gdb is going to implement support
> for recognizing the pauth information via a new feature name:
>   org.gnu.gdb.aarch64.pauth_v2
> 
> Older gdb won't recognize this feature name, so we can re-enable the
> pauth support under the new name without risking them crashing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I think the gdb change isn't quite upstream yet, but this is
> for 8.1 so I would expect it to be there by the time we
> get around to committing this patch to QEMU.
> ---
>   target/arm/gdbstub.c      | 9 ++++-----
>   gdb-xml/aarch64-pauth.xml | 2 +-
>   2 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

