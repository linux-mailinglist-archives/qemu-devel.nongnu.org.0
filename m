Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F243E756
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:26:47 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9At-00041p-3b
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg99w-0003K2-NM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:25:48 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg99t-0007f3-Dw
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:25:48 -0400
Received: by mail-pg1-x52f.google.com with SMTP id b4so14997pgh.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wYfYpTTCMZIpQcyjBxhBDpF4DcIZOv0AYwhSLZ19T+Q=;
 b=Y7y+C5hZBy4IZDUGO/Q1BS+HOtX/M+EC7SQl6ibRtco/S5wY214art5nKv5f6tk1P6
 MjmUulqwByFGRFKbGS+frMLP95x4ys3ApeA37J1XIt98MD2VH5zYK+oSQ1jGJT9w3tq8
 06daqPB53ISzHcg20UMLpohRmdcIagO+j9nfKGbTyUJIuuWs695Dkhsd7rdFYYg20Dmf
 Wo1C4AavU9SvY3B04G096ioVeqLCgeVqK9i7UAPhNI6lkz5RHljEchGg4fU9Z0NDEESj
 9OA2tCMELSU1Z1Uy58Eu2Sxv+FnUO4bWSTOPI8/nYQPlZNBdwLXjL1XqLx5Pu7HmVdPz
 +Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wYfYpTTCMZIpQcyjBxhBDpF4DcIZOv0AYwhSLZ19T+Q=;
 b=t5T8v2FgAvgWyunb07fDf/A8aiAe0N0DbYNlsUTcsz7YjvE8774LLJ+l1cBkWfk3ut
 ty8m4JE8yWXIq7avyxxC/Fm0nVdOkfXvpQNtrqaiHeco6b85Y+koHKok4Yl5VqipHH/n
 PHRVZruUYSjX3dRQsxzs+9+O4fP7Xi+BgBPqD1db3MzB/rE3CkwpWgawD+0Br2hvfIiv
 wNEg7VSR5Y4+SiGzpken9+/MzqEsfox/nbDTLW2FSJQvM8H9mrqRpWpTMOgmfe1DzvoO
 j3bM9P3GHY3tlQ5n1vo3G5IRmTyjTmmw4jACRF9usmIDw9g4JeZBcyv6jnVlQE3BIYNp
 bEqg==
X-Gm-Message-State: AOAM532zh7GXcGnkhQfUOenrlBGNo9vpO0WZrc0t9ef5k69sEigJVAQ6
 daJl4665JpLCkfd/zTFm1BV4Cw==
X-Google-Smtp-Source: ABdhPJwWh9lhJWsQPgg7hVhhFtrYkUFvfzwwUxPgpBUvqzNGCRC3bEKBhRaxF7UCjvlyv1gH4JBCcg==
X-Received: by 2002:a05:6a00:1709:b0:47e:493e:ca5f with SMTP id
 h9-20020a056a00170900b0047e493eca5fmr4839715pfc.60.1635441944105; 
 Thu, 28 Oct 2021 10:25:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id m2sm3158947pgd.70.2021.10.28.10.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:25:43 -0700 (PDT)
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
Date: Thu, 28 Oct 2021 10:25:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;

Surely there should be some handling of thumb addresses here.


r~

