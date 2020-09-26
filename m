Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0C279C5E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 22:31:04 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMGqW-0007Md-01
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 16:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMGpe-0006xS-Dp
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 16:30:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMGpb-0001dz-Vf
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 16:30:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so7602757wrm.2
 for <qemu-devel@nongnu.org>; Sat, 26 Sep 2020 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vj/ulqbJQQ2Gv79pYtKm/Xfxa/inuWzIXFZZZzPY+gg=;
 b=ppcvvNk9zCSuTzDNm0l+c+Nl1sXFfi4V4rdrdcti7fjpJzdP7DsIDaycHBi3Wcc1Ak
 tekFAgTW0VFrSXIsOMdT1X97pOwDV1qPSbLQ40rBw3XX1BO1fgGoEQCgUm2/8uiirk0p
 IeN/dcPKEfufI83aGLJHEiL+s3LuK8ofdHwBAT/LQnGhnwgfKI63NJvJt//p+3BOOXdh
 nitQ7ugUEEHR37MOEzSYcIOGthC9zlg3RAMuAhvKFhsKDrAmZ8kH+4WSAmdDGkVvutf2
 MymK16ZmDqoxrM2ys9K6V4OhuKhBHaTleWh2FcHvN9G+bUxM532bKKJJnA0f92cIZmqq
 nh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vj/ulqbJQQ2Gv79pYtKm/Xfxa/inuWzIXFZZZzPY+gg=;
 b=o9SwCJ/jUoG5QS0S3UODV9SwTJ1NghNJ0h8QOeLTbNKdhewHaOhPsAcO8HbeePiC3T
 M1etmuhglvc5W7Tin2W5QfvD7pkgDemHrHrWia7fkywNwA40jq3bR3tZI+o6JzMeyYHw
 rTuxZKQmzqtdSTdkiuReQHQkKaNTU7eUIhRqdyRwiLPqp+pGVtXGkFbLSVUC+PXNOhrv
 yK4Y64xOyVlgD8AopZsAhrcquKFsACeW+He5cT0y3nX8NTp5RPAPTxKxFcaXLqN8ptHN
 uZmb2e43jdPn+k7Y4v5cDnjJGboDNj7qRJyjWR8o6XbzSTix4N+L2IziYYOf/jtdRouk
 OBwA==
X-Gm-Message-State: AOAM53339OJKq0xI+oeWSoE3gN4VrjXPbAcvpi5XIFH3CUYWq2RAgaMb
 M27eeQ3tIBCEUYTyYoZ+UJU=
X-Google-Smtp-Source: ABdhPJzPAkFzH8xfbyP63+L3FOyCHwlRc83sbEPpI24gS6axiTdwIak00YL+trV62YNhf/9nKExxKQ==
X-Received: by 2002:adf:ef4a:: with SMTP id c10mr10416889wrp.13.1601152206245; 
 Sat, 26 Sep 2020 13:30:06 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id c205sm3603850wmd.33.2020.09.26.13.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 13:30:05 -0700 (PDT)
Subject: Re: [PATCH 1/4] plugins: Fixes a issue when dlsym failed, the handle
 not closed.
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200926140415.1286-1-luoyonggang@gmail.com>
 <20200926140415.1286-2-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4d4abf95-734d-0721-23ff-aae059678097@amsat.org>
Date: Sat, 26 Sep 2020 22:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200926140415.1286-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.213,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/20 4:04 PM, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>

Superfluous trailing '.' in patch subject.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  plugins/loader.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 685d334e1a..8ac5dbc20f 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -235,6 +235,7 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
>      return rc;
>  
>   err_symbol:
> +    g_module_close(ctx->handle);
>   err_dlopen:
>      qemu_vfree(ctx);
>      return 1;
> 


