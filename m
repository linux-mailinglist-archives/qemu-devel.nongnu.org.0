Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D736740E4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZd6-0004Ve-KE; Thu, 19 Jan 2023 13:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZcr-0004Uo-Bq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:27:01 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZcp-0002W3-UK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:27:01 -0500
Received: by mail-pf1-x431.google.com with SMTP id 127so2175225pfe.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z4vK/eppBivo5OxWdpxujWtjOqed+RjIl4aKuCGnteY=;
 b=YBPa+qaMCEjBGUVJvjMn1a8VuhKW4qjfo6/l3OFo7iKgjRnPBQPv4DBl+UvpKf1rK5
 hXtgtIvfo6Y70gbMNubYv7VDNk84UbmWaQiAog5uo5I9Ji4OcmvQZjtIdWhvESkcAw+o
 2xyTu5mpGllr56TRD9seErU4rZZ+MMjzfEahV5Il8Sq6NaGzO0HSEXAQFOYu2BP+ZEoQ
 yi5ULiLSalgviWwEOQvt61q5P4dTwJKyRD0mvTMlP6S2Vd1tlOPioyLNcJIf8JP1UwB2
 zZ5GbbcO4eIQTSYt/ODBsq8Y4d2LE75wX78yqdUllMmmgpF/JksvZxVjJevRlsjVHZlP
 X6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z4vK/eppBivo5OxWdpxujWtjOqed+RjIl4aKuCGnteY=;
 b=S/8FNuLa824bWila+1gMxzmd8zj6LsGkSSF/C5P5Or94FfSuVU66ZN3efznrBVRTbl
 uUk9vK6JM9DxoCpCVKBh1wByJRjNgSP0Im3uAsNJ4mWguFN7xK8fFte04cCpEI7R8T/W
 6/gyFuQY6jQ7Tz22QZLZYN+1YWy06XX90AxK2Ne9Zsn7DFCVk22THkbH+CwL7owtGsuX
 EWmMaiHUOamGmcP/MUa7ZDu7HHTs5wim/qy1ddKKjYGSijZUDEuo8Iv0/z6eRgypoFjg
 VmRPOOlsyA4X2VmhPFCK6NtRWDtqogWqicdnlUNEbQhTD0k3TDa4V5ggix4hoyH1+PTr
 +yjg==
X-Gm-Message-State: AFqh2krGK5dL/4nvZOIfChHSrazcaLlXfDoxF0uUIwktWOlfmn//puQC
 n3Hg0gEHmpzpw04aJEmQ5NBDiQ==
X-Google-Smtp-Source: AMrXdXtbOnS2EZMes4XnBU9OTvMs/c89XZ3i2+9CCAxjpr71Yax4z2RCwwVB9GWGV/b7bzXGeFzP1Q==
X-Received: by 2002:aa7:8650:0:b0:574:cc3d:a24e with SMTP id
 a16-20020aa78650000000b00574cc3da24emr11794380pfo.5.1674152817614; 
 Thu, 19 Jan 2023 10:26:57 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa796a4000000b0058bc7e4ff57sm10567028pfk.144.2023.01.19.10.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:26:56 -0800 (PST)
Message-ID: <306dd60d-c52b-15bb-9a8d-61617cc74c2b@linaro.org>
Date: Thu, 19 Jan 2023 08:26:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] target/avr: fix interrupt processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, philmd@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412018478.3110454.5407396471034616682.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167412018478.3110454.5407396471034616682.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/18/23 23:23, Pavel Dovgalyuk wrote:
> Interrupt bit vector has 64 bits, but interrupt vector is found with ctz32
> function. This patch replaces it with ctz64.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/avr/helper.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

