Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127AB4D68AC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:48:30 +0100 (CET)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkJQ-00068h-JT
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:48:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSkGq-00059m-AQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:45:48 -0500
Received: from [2607:f8b0:4864:20::102a] (port=32933
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSkGo-0006bl-AQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:45:47 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso9306853pjc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tv66JYVN8FgHHBpGxMQETAHIq/g8sQ5xsoOWfGxz4iI=;
 b=RyMExdHXqCmWbiGdcvhKgthRyJlQjmeVTf9x2kDUd5W6a8I5+8oUFf4w3QiPMSvIJH
 GpCW+m/jM1O/l6XOoJAuwrIiocyvrygG5FSSG2SrGCNFDCgcuqif0eeFHCD0fiMv25hq
 XAqkB24Q27MuYgiEKSY+HxapKeuv4kkMIx+cPuhVqhnp2sX6+gOUuS19IrMnI6rLaUxU
 9GyZZVeVHXgTGy3PlDYb545KEiFJjzfgQ7kfGQXEteZ+5+r9ItqbT8UAo3aETTxVX4VY
 YXbLr0vbmI4cYTFx1oldLomU9c8iEQcU+vZUtkFQ2KWedYuySccrzAHqRU+2LRG4Tn9H
 47Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tv66JYVN8FgHHBpGxMQETAHIq/g8sQ5xsoOWfGxz4iI=;
 b=fNpIqXri0msrtMTK573l2FMTk/2uHQybF8nyAJyAxbvcOhbrGnI0jvP0W1SejHT+HD
 fzLLsSPPXUoGRSLQEMEQ4GZ6+nZDc0Z6mVrbaLJfCmJwjEoW2PMd7mLRNPKcVRZZGxaw
 W3iiAExSmmrB+5WOvZ3sX5Hk2NUlQI1vAQeT9pn3sBntn/bT9H0noUxQ1ieg6OrF7prp
 iErc6inBLO1bUZePZoQ21myofbA6GXL/52GYXDfwuj/lV4htZ0rmDwDMgVxhs1RS6nOw
 dDETjCCzAZ3tT0JS/yUWMG28NlsByC24ltnRNQxXaIvi+DyP5VeJ6xhCz8qB/pDjFmUI
 sHpw==
X-Gm-Message-State: AOAM533br1zgPZoiUFXLIJq0gSEHnr4YkKajx7LcUWq0k1Nw+YTnXdRd
 AdrNMFcIEmdravfcdlHILf1R2Q==
X-Google-Smtp-Source: ABdhPJztTuOX2Y30taaU/LxzQ73fU+hua0qIH3fKTP3tkB0KjeMMjrv/1xUZtDl44r8t5xJKWDfWAw==
X-Received: by 2002:a17:902:d511:b0:151:fa36:f1a1 with SMTP id
 b17-20020a170902d51100b00151fa36f1a1mr11723571plg.17.1647024344550; 
 Fri, 11 Mar 2022 10:45:44 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004f78e446ff5sm3108194pfv.15.2022.03.11.10.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 10:45:43 -0800 (PST)
Message-ID: <5b78fc2e-335a-5a11-fc59-2eaffcedc55e@linaro.org>
Date: Fri, 11 Mar 2022 10:45:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/9] dump: Use ERRP_GUARD()
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-2-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-2-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> Let's move to the new way of handling errors before changing the dump
> code. This patch has mostly been generated by the coccinelle script
> scripts/coccinelle/errp-guard.cocci.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c | 144 ++++++++++++++++++++++------------------------------
>   1 file changed, 61 insertions(+), 83 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

