Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D758AEAF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:10:55 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0qc-0008G5-SS
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0mg-00038J-US
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:06:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0mY-0000DX-5J
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:06:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so3489083pjl.0
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/+vgI+CVtQ2zBMxx9T9jPu4jNfTonyqGdyFwKv4F1PY=;
 b=sVcpKDoIQB1Yloo8hnfgarcMsGXe4NO23HxgmF9MMHBL7qaVFkd20HYzMVzo3rcrLo
 eFUvdELF+r1mqZLuSQjloCZZ3iUYsLKfqryU3Nt0SEFVqkaWI+97XwKH5gIa0w9FRcHz
 Yo8sON1SyGPPOZJNzUVtNw5uPHKqs6BlohaTzCVeuruawKiRKPVBVZ0SQUlkO5gFUbSL
 EbcJnNV9yA2vu9w6ZHprpjFudHWyJrjVK6u0ulHuTId5pWo1r3gtx8575qGhiUu9+dyp
 h/5jZgreMfZHqPIpaah8Vy3iBE4shdygP3ruDCWRJSaimB3VKO+3JnKiLKywribhkrMF
 ylBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+vgI+CVtQ2zBMxx9T9jPu4jNfTonyqGdyFwKv4F1PY=;
 b=KZx7BaNydqO7e5ED98KJ+WWWK9QCAOYFaql+kr64qw8QH4RL308/32m7RCubBsI3Q/
 K7qiuaW3CCFYkjXv2JwEcPMTzlC1k06O1bsqSZxZvRsowt4N/xWFanv5Gfkx/TY5m46B
 bFOx1UQgpm5k+dgTgl4Ccvwy4NleU4ZKsR2PNBkZHHURaw3Jvp5RTNguTktZsuLVOzG8
 zMgUfZDM2JkwZpsmvgzFul2Ef51nyn3dOZXwHPjv2PmniYttm/YIaVSC0zrxOcJNuSJa
 C9RbyggP9b+FGh4+QTHMRAjUeKseGifQzpd8KVAVffGfA/W8+4MIkzUv22ZWaglyVcMy
 I4TQ==
X-Gm-Message-State: ACgBeo27/dg4dPd7Ftu6QW1+Yv3zYD1PnsHM+dkO/H6F3NXOt61cnuXf
 wOTIWQZMHFUyyXRGZcoyQrtlBQ==
X-Google-Smtp-Source: AA6agR747RdNN1gLnfxoKKwK8hU37PAgNHiLPDqbANKUcLdSyi9ioJtKVMjcB+w6lRW7oJJHgPBz/g==
X-Received: by 2002:a17:903:247:b0:16c:5017:9ad4 with SMTP id
 j7-20020a170903024700b0016c50179ad4mr7850707plh.115.1659719198714; 
 Fri, 05 Aug 2022 10:06:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a17090acf8f00b001f4f76033f9sm3213314pju.49.2022.08.05.10.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:06:38 -0700 (PDT)
Message-ID: <bfd4fb71-f2f5-a358-2fea-c4c4dee5328d@linaro.org>
Date: Fri, 5 Aug 2022 10:06:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Floating-point OE/UE exception bug
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/22 07:15, Lucas Mateus Castro(alqotel) wrote:
> Currently there's no test in this patch series as there's no way to
> disable MSR.FE0 and MSR.FE1 in linux user, so any overflow/underflow
> exception with OE/UE set causes a trapping exception.

You could check the value in the fp register in the signal handler.  The exception is 
supposed to occur after the register writeback.


r~

