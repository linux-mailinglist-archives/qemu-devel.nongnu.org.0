Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC486F556D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:56:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9DE-0006lt-C6; Wed, 03 May 2023 05:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9DB-0006lM-VG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:55:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9DA-0004kd-Ds
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:55:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso2732649f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107746; x=1685699746;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1dmFxe3aDASORIgcNcqURuHCWbrP/tv325Tp70O8Wbs=;
 b=f/Q1Hugn3fF9ZMpa8Ni1EdftRAy8lULCI+fc8nD9m/uqGDEnHnKOHpqW+wNyHzO8Oc
 7oPu8BS8QOg4iJuuiLaKAfb7GHQuapHs8JSZOTQpeMcGoz6Yn0e8uCqfTxDFBAbtM5+w
 52b0oPVbN3N9dMBhAGwIrnvZjSgtEeUQSKPHlXBvG84atfwLOQmJguqpyeoPtcHbyUfQ
 cwjsI1qjQbxK54aklCpJdbNWfNFCKqOWWFY2AarRrzdAmdJRxVAz+CTCIPKKVhMHKUUJ
 Xn9+Gwll6qMwMFbWiSBPwQ6YeTZYpZtGjDFKI0KifLpMoo/4B0FvKL0g7fLSIidtxufB
 0mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107746; x=1685699746;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1dmFxe3aDASORIgcNcqURuHCWbrP/tv325Tp70O8Wbs=;
 b=Ggj3h7EMKH6yL5cSU79Tqqm9iD+xcgHD6F+OiSTfj7R6byWgg3qj6YFJ3PcjzYQScM
 3UyU6FPH9tfNi73gx4+/0qXkwz/h331TFtktLALuPm5mgysT9Wq3Vouoyysmq/rjJ2cW
 IsPGX24A0DRap9SiR/FMtTVHA1tghIh3WjuNpfqmfuII5vrb18tnFRqaeHUI7LwZ4sDo
 CAUuqF1WoyNwhQTRGRikpFcTZfvtK8E0zJzltRDxBBmlLbLZFf00J20L64uQ39Bk1UPP
 lXCuYubWUibBdzeVuXQLPKzTPlS82PqfJaR/LvmW1IE2wpJ+Nf0kF1CAhllaCgV7VkCZ
 lPcg==
X-Gm-Message-State: AC+VfDxShaa5YIrvhyRC01agqiGjbYQqi0ddd1zoSvfeZJs7j6hxXBEW
 jxHkog7+gpQHY9H9IRVndMIvjmTGSoD+/2zXxB5Stw==
X-Google-Smtp-Source: ACHHUZ4d10G8c9sVtCIGTRatIK/qKn9xmyfpRxPTpHn/iUPykfHyo4IpCwdueoizv0OrZLeU1hOByQ==
X-Received: by 2002:adf:e70c:0:b0:306:321c:995b with SMTP id
 c12-20020adfe70c000000b00306321c995bmr5407782wrm.41.1683107746673; 
 Wed, 03 May 2023 02:55:46 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm33271070wrw.12.2023.05.03.02.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:55:46 -0700 (PDT)
Message-ID: <11bcc3c8-5e84-6303-e6c2-d0be3eefeeac@linaro.org>
Date: Wed, 3 May 2023 10:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/10] qapi: make the vcpu parameters deprecated for 8.1
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:17, Alex Bennée wrote:
> I don't think I can remove the parameters directly but certainly mark
> them as deprecated.
> 
> Message-Id:<20230420150009.1675181-6-alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   qapi/trace.json | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

