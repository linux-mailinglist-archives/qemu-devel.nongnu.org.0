Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A539224B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:49:11 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Oo-0001HC-KR
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm11Q-0002jE-37
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:25:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm11N-0002os-FU
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:24:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id u7so1273004plq.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ywos83TcGS1G77QCPl2bv8mkVrA8wMMCoYf1GmuiodU=;
 b=FGZB80ZPgW4bNdjrAO+jxk5TEPx1r/P1ysMOhkxL5G8IOxhsHM4XPXfRPqEYYS6Npo
 f6rx3MMPWjssPi3e6lNgK0R8DlNa3ucuMxNvf1aZ3d4w3jB1JDvdZqRATzURy0A/mE89
 NpoE3jy5XAHt1rwo8mw6zI+E34tDop3rJniWVbtJKNxvnJFKz+dzpXYay2qqdSJhgVo/
 KLfHBIm/dr116uNTk/Pvep8vYEQbYLImJgB2y7aGom7koWnj/Xf+6XcaNQNjpn2JFX55
 9Qk2VphTzRV2JlSfte6urK3dttCTNRMYtposiB1O/08g43XDflco02nt7KD1qIQJFqPh
 ak8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ywos83TcGS1G77QCPl2bv8mkVrA8wMMCoYf1GmuiodU=;
 b=XvsJ1FlMzfYYPT1jhH9YxpNiIlyXgGuB2+dDpTQwb0XvC5NKzIhW91wJcQF/G4UDyV
 AtxivmDl2V6hmSxImCDw0Zk5gNeschnbGeuxHF0fchWszDN78hY7vaBqudl8H8NuTeQD
 rkylAdpYMrKBCMKz2DgkFe6sUzdNrXmrvT3ExZv2TxjNCfpf6mdj/uVP4wc2MtM4oTfw
 EY4UGBiTsnN3rWeC7pmA/vbr87nJ1zB+2ryeJR+P9mjKxLGIqRUi1vc/vUc7Ac6PDgYp
 +izt3ASf4Gz/QauK52Eep6h5vaN8ZTC5Y3absgmwDTlFntwUQKzVQ2X4OE1rnEJNBmCA
 kvbQ==
X-Gm-Message-State: AOAM533FsTakPX1KHku3HHU2LutEgbIXYrXm/C9TvCkyVKKN9kk2epyi
 +Hq7kg6ngr417xybZYUCSJ2UjQ==
X-Google-Smtp-Source: ABdhPJzq6nJK7dqNeQXZxWHfwJ06fsZdngBKtVf0upeQrGLnHUE5OTBz2e754JJdsGUxp9kJ4gL8DQ==
X-Received: by 2002:a17:90a:62c1:: with SMTP id
 k1mr5873155pjs.151.1622064294371; 
 Wed, 26 May 2021 14:24:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 cu2sm132355pjb.43.2021.05.26.14.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:24:54 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/ppc: fixed GEN_OPCODE behavior when
 PPC_DUMP_CPU is set
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-2-bruno.larsen@eldorado.org.br>
 <CP2PR80MB36687B3DEA1BA59FB969DB5EDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb8e582b-5997-4d6e-60d5-87b03decf88f@linaro.org>
Date: Wed, 26 May 2021 14:24:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB36687B3DEA1BA59FB969DB5EDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 2:13 PM, Luis Fernando Fujita Pires wrote:
> From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> Before this patch, when PPC_DUMP_CPU is set, oname is added to
>> opc_handler_t, but GEN_OPCODE* wouldn't set it unless DO_PPC_STATISTICS
>> was set as well.
>>
>> This patch changes it so those changes would happen when PPC_DUMP_CPU is
>> set, but not statistics, because the latter is being removed.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I suggest removing dump_ppc_insns() altogether and 'oname' along with it.
> 
> Now that we're moving to decodetree, dump_ppc_insns() wouldn't show all the available opcodes anyway. And the only other locations where 'oname' is being used are when registering more than one handler for the same opcode by mistake, which won't happen anymore, as any new instructions should use decodetree.

Agreed.

r~

