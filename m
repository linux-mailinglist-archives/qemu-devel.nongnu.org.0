Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA533E252
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:45:31 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJNS-0007W1-7T
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJLn-0006w5-12
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:43:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJLl-0004Ny-QU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:43:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id j7so12531wrd.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EKOB/4YHltZdWIqdYIOGVEAghnDbCmevYo8Rb4vc9so=;
 b=l1rgTHUwe8EaNfPC609lTRqH0MD4H0+mG0ceEOic7kNLxvg4DHiPyeJsyHBccDJF4R
 wtpOdjlV4K7DGyeGGFccTSptD5aukA3PXHqSDhFHUX6G5jJAvLkbtuyWpc0QErJxRMo+
 pymJTnHypbXjShUhU1bU4F9AB8dVa07tHQuMCrfaC097Fgfb8VpgNzVbG81/SLBtn6oA
 /WC8QfIcMU34+NpQ0E9Jhp6qxBTsUQXqUma50YYm4eCCWHIPBln+GsD+gC09LFC7HgIZ
 ickKPYacnfs9+gkgO9onqED+NHPDpbniPd1Bt82uJGtbGwvok89LY8soMFeVKyOQjNNc
 JfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EKOB/4YHltZdWIqdYIOGVEAghnDbCmevYo8Rb4vc9so=;
 b=nwI3ZcYn/SVGr1qG55TN1T0PQ9LvqAb900xLfC7D9E9LU3gwLnKoNzU7Y9p9ibx3AY
 Vpjl7J9KDjxVI4wy2KTBayaRx45hooxoXHL0sIYPspCaOmBXM+INbRX0ApN1ACiYzji3
 iN51EAJyYYfRJ3jwUdQvBW7sgNi1cK3rGzQRKoUNuRNmw6+uQ8/IArhgVn3rSlZ4C+Yg
 OzutTGMfY/+cxwdDS+MQL3GWpeYZ0GSoeqDmu3vu8soK8AmBFNd+t/qmKGugSVHYKu1K
 oeRn1a0zPi2LJzGZaRoAu6I0WfDp5VolUBT+0uKqoFoxkFdhBe9n7dpoMpH4unv9VcGE
 chTg==
X-Gm-Message-State: AOAM5329lra2RVKfPqdea8otaoCam1ogVJntr0SsmRAiXlc4f5MTVjhE
 VpdkQxfuYrLfyBElyuR9U5Q=
X-Google-Smtp-Source: ABdhPJxhIXVzwJ/KT0D6hrcSUREkW77lXm/cmCHTpo3jazWun0Crqc94QuMwDxhpLAlQE9Kpe8iejA==
X-Received: by 2002:adf:f3c2:: with SMTP id g2mr1418443wrp.300.1615938224448; 
 Tue, 16 Mar 2021 16:43:44 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j20sm713393wmp.30.2021.03.16.16.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:43:43 -0700 (PDT)
Subject: Re: [PATCH v5 39/57] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <557ac8d7-e105-b29f-62f0-5515d8b8313f@amsat.org>
Date: Wed, 17 Mar 2021 00:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++----------
>  1 file changed, 53 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

