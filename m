Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677C6AB7DB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5jw-0001zA-PZ; Mon, 06 Mar 2023 02:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5js-0001ul-E0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:58:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5jq-0004yg-OI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:58:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so4619993wmq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678089508;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UIzQ0OaM9PaRVaL01acGbe8YbP0Yzs6DQjOHiFxexeA=;
 b=pt8pItXDjap3srIajs80nMk8a0BsE2GnoVAMPuIgSrAT61YNAJiSvRqQBKz+Qxog1i
 7mXLcTj9nz758HhEdW0r6MWLfnIU/Jzv2i7iuztS9x8hvhpIfvcEFSHcNHYkdTh5sQ+U
 vVXuttG280VJoYo0pmR8aKtyhBKkbeu50UDORqOiOeMd5kwHEeVdVxZW4W1yPd2g35Kc
 Mb6DB0fRLxg0Rk4MSpjQRQQqDSyXV3pOy5uF2aLil6gQZdM8Htr1Y2+lKB7IuxIDr5fM
 NQSVg6Qspp9ibJ6IpCh1PxU/3+0zVbkz5+uU7yNqxEcW31qvABFQcUBy3esy/uVj6mg1
 HVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678089508;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIzQ0OaM9PaRVaL01acGbe8YbP0Yzs6DQjOHiFxexeA=;
 b=y1yJBrnHiVYMgHA3ttJqviB8XVg2GeL2hAxII6Q5/ACWzu1rwU8FGHjno8KIEN/+v7
 Qd7TewvzcTDaWUsD+ZB7HFYUI/qkHQUldjTo9OSMq6oo4yI1AxfoLf7AocS2QZ4EvTPE
 Clq9QJwOiLx4eEYlBCUTTqug5SW/Osc/1kCIQEfbrTZuY5BOeUt8kxtluRNbGwZ2wZa+
 j0PeCMdfXjsFVMXAWpspay2swlL/67sY838PhKpizVrIAhJt06WXwkMGntG73AkAB9XU
 dtYBttUyQJ8w293yvtFhJW/Uaf713r/ZkM1Ppm44RH8MGKwPcPb1viZ1Xi3sBUiP5jSS
 H/VA==
X-Gm-Message-State: AO0yUKUx6MfYVPGz4AP1ThoeJzAZB1bnN7aFo2pQJDsiVIbw9InTMSce
 FP51HmaVUQD+EzoBKpGrNNXeMFrsE/zLgUJsbH8=
X-Google-Smtp-Source: AK7set9wDclS6ghG5+DwqFBBWUtTZBgxvkeZ0Qdm3+uhBP68Jn59shPeSS/tXuOGAb1EQJwhxKGhhw==
X-Received: by 2002:a05:600c:3108:b0:3ea:ea6b:f9ad with SMTP id
 g8-20020a05600c310800b003eaea6bf9admr8336357wmo.31.1678089508721; 
 Sun, 05 Mar 2023 23:58:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm9078164wro.86.2023.03.05.23.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:58:28 -0800 (PST)
Message-ID: <c6319ec6-6dec-b619-b23a-6306877a34d3@linaro.org>
Date: Mon, 6 Mar 2023 08:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 9/9] accel/tcg: Pass last not end to
 tb_invalidate_phys_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 6/3/23 03:13, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/exec-all.h   |  2 +-
>   accel/tcg/tb-maint.c      | 31 ++++++++++++++++---------------
>   accel/tcg/translate-all.c |  2 +-
>   accel/tcg/user-exec.c     |  2 +-
>   softmmu/physmem.c         |  2 +-
>   5 files changed, 20 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


