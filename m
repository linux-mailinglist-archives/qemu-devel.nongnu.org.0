Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA6381715
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:06:13 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqFQ-0005Z1-Ja
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqC2-0002o7-Ng
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:02:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqBy-00028N-Eb
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:02:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x8so1417616wrq.9
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AKn2bG6Jsc01eGCy+QC/vJazfzxJuOFOsf02ayCKfck=;
 b=kLJQAMG0UW0gUpSAat/zPDjWyYS3vP9dbCGrwBT24ceQAljbqOWtUoMskByxM9tabd
 BVfBAxh+65uswRHE2sDZ4X125EuFh6QkskxvIIDtb+c/Q0uHnqEcMPnkGnVdleojUIEE
 Uh3oJ6wqQnQcieuvu1ieTLCQ0+7TcWS9b5DQDqxlS/R8q5dHY3xVaSjCTNXq76rYt+Hx
 E2X1qpQmgx1JVsxdzv3SKRenzncF/EFxXUKjM8sWqIoX4trHsDq0JimcELXwhC77Oud2
 3GirjGcUdyhm+XWB8ly1px7NRP8Nq02HfO5BDMazBGg5gIF7uLjtN0XQaKMspJzdJsZh
 ev+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AKn2bG6Jsc01eGCy+QC/vJazfzxJuOFOsf02ayCKfck=;
 b=otqXoD/BfX8kisiORWfzEYo9fiLV4pIpLDRZeFajSSR0FPT5MR+h2fHZDuS7XWP0Kx
 vJvnBFG7QWIPf0hpLrpKtcwHrRAJzzqLl+d6q1QiOeUu3HAl1X55k8aRfudNWm/JtJRP
 uGeOLKy9M0TX5A/P4BKiQyaMfH+Sl/KVazdBmhmMK2U7tfNFEWHR5IrGvatNFnLhRL+Q
 o3WOcxoPGN3TDpyWArovy8o3nQFkwGBOd/YknTb0dYRwxpUQeoVjvqi6HudTgM1MXnpO
 9uJ5ViM5/N082w3X9obow8Gm0ma64tmIZIw+oI4tedxrxhaeDVrj8ywS2K1D2ZEwq+n2
 PfaQ==
X-Gm-Message-State: AOAM532ombVg13ZIevIhSyCCx/oqZr8zrDx7ppwBH1ZB+WYGriwKsiI3
 kOrjVAMAVI86HRP6aqM7XOc=
X-Google-Smtp-Source: ABdhPJw8vJmZWwOsnnWpjsq3f6WrtWkmPmoM0WK5SJsazYqIS8bdf3Ka3kWrNaEm2+eieIW44OK4dA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr28525065wrs.394.1621069357069; 
 Sat, 15 May 2021 02:02:37 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e20sm739204wme.26.2021.05.15.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:02:36 -0700 (PDT)
Subject: Re: [PATCH v6 05/26] accel/tcg: Add tcg call flags to plugins helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2346d1fb-4900-9a7e-c225-f3acca32a81a@amsat.org>
Date: Sat, 15 May 2021 11:02:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> As noted by qemu-plugins.h, plugins can neither read nor write
> guest registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/plugin-helpers.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
> index 853bd21677..9829abe4a9 100644
> --- a/accel/tcg/plugin-helpers.h
> +++ b/accel/tcg/plugin-helpers.h
> @@ -1,4 +1,4 @@
>  #ifdef CONFIG_PLUGIN
> -DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
> -DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
> +DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
> +DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
>  #endif
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

