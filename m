Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEFF5A6289
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 13:56:06 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSzqf-0007VZ-6f
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 07:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSzkJ-0000zb-O9
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:49:31 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSzkH-0002Bo-Uh
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:49:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x19so9215800pfr.1
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=J+pxOPk9hpYiuyTNElQIFNH5lhiBex8qYZDyO3fqneI=;
 b=h4WO1BtIq/2MaawqRPwvXO5MXt5tnGge3Hqe6xw54H9lCLD5tmD0BDa28nLJXD51dW
 0zNNmwFL4XqUp6bPjZbh0zes1biXkLaUcN+AhoHsbFP+v+B8l9If5jG2j0FDLY40t+3N
 zm3pviOjBuy/7wz7f/jZ4Yy5IJW8MXzDl2ejwW/1TWDwOKxx0Yp24mPUDm+HzfqQMBc2
 p2ybTfQn/E0Y481tSbg88c1lyerJKkB1/pzZDkwdbJY6NskmS4cl3GCjDCzIe4ta9/u1
 rIwkLmuMmomAA2RaNh1EWJc2oBqPWBd+8Pw53zrXE65e52aCPDGpOediFzCJJ3TNK+O1
 OqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=J+pxOPk9hpYiuyTNElQIFNH5lhiBex8qYZDyO3fqneI=;
 b=wfB3FrsSM37EbDU6BnyTdXDE7Drz2MYx8C9KwKZgnTcSulpmHj2vwp6Yjdout8IFv0
 3X/Ls/edcsP04A6iOok0I3YtqzgZmVLdgrHutIJeRrHVwsgAD9vct37QByXf49xuCTiV
 mUE+tfwH8pfISlT2qspKYmWPNgwP2tqSETK5HXzl0o1KVSWUseDbgtt7sgXYty2GO1zU
 iqciPHu07e6S6yEQPPXSi1eH2qaNG2/baPIHLui59PdkPODVAbnqzV2Rv3vRHjLXlM2T
 x/DrRbTP1tSzf6cVRu1zykqjI6+YX6gMbd9HRziIitluIhPyx9JsaldJShdYgmmtVM1B
 FkKA==
X-Gm-Message-State: ACgBeo2fiG4qqbmJKDhOcixo6+fouvcyQFpMZGGwbJOzu9baDRY3frHi
 LJGeC9hpR7s/OPdHHmCJV9s=
X-Google-Smtp-Source: AA6agR6sMmPuZ1zCnkklI2h1fsEjWNkQjxSoShDHTd48w8LtrO/xQA/35gX8mYwMpl0LfoNZfUd1dA==
X-Received: by 2002:a05:6a00:3306:b0:538:444d:87d3 with SMTP id
 cq6-20020a056a00330600b00538444d87d3mr8804330pfb.38.1661860168669; 
 Tue, 30 Aug 2022 04:49:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6230c4000000b00537d74f58cbsm8143099pfw.69.2022.08.30.04.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 04:49:28 -0700 (PDT)
Message-ID: <767af9ca-bccd-a41d-a77b-76ca21a02380@amsat.org>
Date: Tue, 30 Aug 2022 13:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] target/avr: Fix skips vs interrupts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
In-Reply-To: <20220826205518.2339352-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/8/22 22:55, Richard Henderson wrote:
> Fixes https://gitlab.com/qemu-project/qemu/-/issues/1118

Thanks!

> 
> Richard Henderson (3):
>    target/avr: Call avr_cpu_do_interrupt directly
>    target/avr: Only execute one interrupt at a time
>    target/avr: Disable interrupts when env->skip set

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


