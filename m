Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF993990F0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:51:31 +0200 (CEST)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loU5a-00018m-CW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loU3g-0007NE-8i
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:49:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loU3e-0005uL-I1
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:49:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id u18so2626802pfk.11
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MoPC6xwYEeoAMd6vXQIrdBQ25b0GXY/YyPNdrjh96V0=;
 b=gQxHktkOmSRRHz40CfJlVbSqkRpxFw8Nvt9I1lcr3KybyKW9F7p/m4h0GuMu5yuaee
 40UVYMOD7bntKiQll2meZuZPA4Bx7QqQ6nxfX2vQmjLdgOqGidvSKPiggwJnWC+IYKJi
 LNp9DDY+yDCaxXRb3RC3NqU/nJYo+yX8yMt5Wmu0ZcuBnPKeTJ5sND3Iwb5K/Y87tke1
 ahcaYR8F30gykt10dfI6DT1QQXN7O0xK9WNqf3LVAdQYYHZzEfFxL4AINXatHKWMLjG4
 grMV2Lf2b8V0Nm+zdZd9Mwp9dzdNsCIIosqjOecJ4WSH65OjUYDxFOd9FIbpq8/Xm4oL
 qOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MoPC6xwYEeoAMd6vXQIrdBQ25b0GXY/YyPNdrjh96V0=;
 b=TIs2t2u72xRzp1SzJC0JiRmtQI8ibzRiz3ZjzRGP9xcUT0DXbjtrJXm9tg2C0CTD0C
 azICbJUGt1gMdJhoiGSG60L5C425VqtH8hKwb8qi/GClQ+vqOGg9LKPe45mces8efTSQ
 EyIqsqVA4eQdPeOEupX20Ycr4Q7uqFGdPyuIlHrZJRa6yrf/YfIoFosu1Bd4Vcz4e+4x
 j08KpuGX62bQNOqE/y8vwAp2oA9BzOoqw28bUjdW+6MwXiorNpi/bG49SaT8/wHkBJaH
 EFqQi3RMTsFCdSN5kbCXX6lvmmhmUx76zZ5njR3tufrwarpQyaBi4JJdYds4gEgOQXtC
 KSRw==
X-Gm-Message-State: AOAM532LfEf6vAt7ysih81k2g/KLkHIhovwfL0/qJcakcoI37z/Tm/KP
 3HQIaqRHk5KuGA/wjkqI0wM2SuDOI3icVQ==
X-Google-Smtp-Source: ABdhPJxzye19BbUpJzBCZtGGvsaFMkS9Lv5S2aAUHGZknRC2T52nB1xo93Sq1h26H500L91mzfMZlw==
X-Received: by 2002:a62:6d07:0:b029:2e9:1e3c:ad54 with SMTP id
 i7-20020a626d070000b02902e91e3cad54mr27778458pfc.46.1622652568801; 
 Wed, 02 Jun 2021 09:49:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t23sm296955pgj.9.2021.06.02.09.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 09:49:28 -0700 (PDT)
Subject: Re: [PATCH v2] target/ppc: fix single-step exception regression
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210602125103.332793-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42aa7009-7d69-4fa0-683e-5db624b03b2c@linaro.org>
Date: Wed, 2 Jun 2021 09:49:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602125103.332793-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: matheus.ferst@eldorado.org.br, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 5:51 AM, Luis Pires wrote:
> Commit 6086c75 (target/ppc: Replace POWERPC_EXCP_BRANCH with
> DISAS_NORETURN) broke the generation of exceptions when
> CPU_SINGLE_STEP or CPU_BRANCH_STEP were set, due to nip always being
> reset to the address of the current instruction.
> This fix leaves nip untouched when generating the exception.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Reported-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
>   - Removed incorrect nip update from ppc_tr_tb_stop()
> 
>   target/ppc/translate.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

