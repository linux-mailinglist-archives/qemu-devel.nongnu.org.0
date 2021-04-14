Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5456C35FBBC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:39:14 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlM1-0000M8-27
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlKl-0007xC-50
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:37:55 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlKg-0006JV-Sy
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:37:54 -0400
Received: by mail-pf1-x431.google.com with SMTP id 10so5563835pfl.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhPlmKlvoUZaszoLlQr4fyyPOGdgQx0nroHAjYdw8fQ=;
 b=XxANShzaZt2vEu6L2dccCd+MYuojU+1bDekTYCT+ugEammUEBPAqSla9x8oDiiS6tR
 s4kM03zoZUO676YgODeBpQIWDfS6sh3je7OlZf7cr2O9Zwl6iXKC2MFxNRvrHlk3qwZO
 cwFTAPdo1hSqBhhxbnatwGyBc17ijOOKdWcfG/CCXiJNQHCCBz4g10Ossm2fres2E+QQ
 W3XaDG/5NyeG7FdygGiynKczyg8oN5NvCSc7Qhj6JwmuFhA03kaU1VJ5r/PfOJs+UBvP
 nNWGtZpt8QgxvhqmGVDQYmHRx3UeAgNPnIKS0fzHSnDDCt4u9EVdKug01jK6owEDldEB
 G46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhPlmKlvoUZaszoLlQr4fyyPOGdgQx0nroHAjYdw8fQ=;
 b=nyGxtCEiUuiyTg5prYloleB27/k4y3K5feUxidvCeq7K4Uiu37tHGLyeA3+0FjzKDi
 q3lpd8YHdpX8d418gl6GjLC28j8zGo6BxOLeH5F90PM1bEYr6H4yz7TFKAmJolgRwPYY
 5RGUSM7hgwETIjkeOpWDaGVz5dUUhnJn6tssD6Q9ucHYoJDmrxuxve82GAYH6r3J4stv
 st5yBCpGJZwsB0ANh9mRpd6R3RbFsutKL/Wpkq4WHIRoB8V9o/Z6hy+68q0vlwAvd0Mk
 wKodZfamRA/BMoXBdPAY1DvLgLlySYMOpUjq1D/aAIxxOuJGD0XuUmdLA12x6C9OZtgm
 n1Pw==
X-Gm-Message-State: AOAM5301O7kukCHOrsG1VrHsjwWcYM+Ci3WppDMAnazT/9ZTm1YdtDRe
 aEG2HWjEFx4pXDRLggp+67Ut1w==
X-Google-Smtp-Source: ABdhPJzNrnXo7U/KCpXIjVKtpLaCk9IqegPLQLBLFEQoUpNv7HC+ESoRVrCejDp3H84HSU2cOWTlng==
X-Received: by 2002:a63:c66:: with SMTP id 38mr39386938pgm.69.1618429069190;
 Wed, 14 Apr 2021 12:37:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w21sm184547pjy.21.2021.04.14.12.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 12:37:48 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f935c45-21f2-91b2-f787-dd528858c838@linaro.org>
Date: Wed, 14 Apr 2021 12:37:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 10:43 AM, Bruno Piazera Larsen wrote:
> The trivial path is to:
> * rename translate_init.c.inc to cpu_init.c (since it has to do with
> initial definitions for CPUs, and it's not related to translating
> anymore);

Anymore?  You mean after you've moved out everything related to 
create_ppc_opcodes?  Sure.

> * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> used for some sprs, and whatever needs to be moved with it

Well, gen_* things are specifically translation related, since they emit tcg 
opcodes.  But I see it's used as part of a callback from the SPRs.

I think it would be worth moving all of the SPR code out to a separate file, 
apart from cpu_init.c.  There's a lot of it.  And, yes, I would move everything 
that you can that is related out of translate.c.

> * move is_indirect_opcode and ind_table to translate.c, since they
> are used to translate ppc instructions, and the things defined for
> these functions

Yes.

> * move opcodes and invalid_handler into cpu_init.c, because they
> are only used by stuff in this file.

You could move the opcodes to a new file of its own, including invalid_handler. 
  Moving them to cpu_init.c does not seem helpful.

However, I think the surgery required to disentangle the legacy decoder and all 
its macros is probably not worth the effort.  What will be worth the effort is 
completing the decodetree conversion so that the legacy decoder goes away entirely.


r~

