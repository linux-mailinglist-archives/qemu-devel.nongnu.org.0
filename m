Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E66E2684
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:11:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL4f-0004TG-47; Fri, 14 Apr 2023 11:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL4b-0004St-FA
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:10:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL4a-0004IV-0T
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:10:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id j12so1600574wrd.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681485046; x=1684077046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WSlwMoJ91FiH+UzHickGxicl7hyvQvfXxMZdoYjzx1U=;
 b=qnUgfj4NM34alsXO55r0/+fDcVptweJts2uJW4k1qYI5n6INacD0ycx+PpvMTVBEXU
 9Zg8fmRFoT9a4ylDXQMx+rYomeL2or+OhDZDWVrOnGHRFe/2BhkE0krcyCYSmwG5wS6U
 lb3NvRbao5Z+TYk1naFS7hMvwEZUzisk57vpd51y9CjG7lZ51G6dOOmuNxIX0fxwQRw3
 oinVb7dLuNTttxuj43wX/T1UIfYuoy7wsfJXMmTscw2y/UfCN8Ie4kYIgyYlcnNdZBaw
 FJ4K6Er+8nETKpo9QrNRa/OO4yuuPZrsnjPHXslZwrjTny5aYhm+8Aqfvui2kQcdqiFx
 GTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485046; x=1684077046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSlwMoJ91FiH+UzHickGxicl7hyvQvfXxMZdoYjzx1U=;
 b=TARnP+bud5sTRUGCzOLSbzMOJV6O67XJ8fDyvXxQMM1VCLfb0LMKRbd7nl+hDua2LT
 oPwHR7zuqX+i3qALFEni6TrI0PTvQIIWL9RemaRNWTLcbFD0vvwM9f0bB3Vg3KhtzL1z
 uK0D3DBCOGnWvWMcsOFgNKmmyiMoxHzXEink55T5lYdFG+FNB0yBe37JEAqGXijVTR9Y
 xyaNeiL3orOmIOdhYWbpmd2JnwAH4XhyR4rWWeU1/yV8DPQkbhiomJzuV/oFcCfXOecl
 Xj9MlsgO9wTsOjqLPbEsZw1eGU/0Ue1Yks05jhbwI947Ovym3FPe+r+RpnkRaROFOvYo
 Hjaw==
X-Gm-Message-State: AAQBX9fFbYOzTMS9JecjbFzwQ3mS3RJFxc1Uw6P+P5bCGtliY1TLF6+e
 hDv/VFWgdbBp2GErielnAX4iAA==
X-Google-Smtp-Source: AKy350ZtzXVz3b6By5VWxI6SeOMVhrYKHhhACWIfS7Z+jPmDOCX3PcJijRIgXwn2hrWunxkX6sGNoQ==
X-Received: by 2002:adf:f247:0:b0:2f4:d07c:3cff with SMTP id
 b7-20020adff247000000b002f4d07c3cffmr4623174wrp.59.1681485046482; 
 Fri, 14 Apr 2023 08:10:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000108b00b002f013fb708fsm3793130wrw.4.2023.04.14.08.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:10:45 -0700 (PDT)
Message-ID: <c6867654-4a75-b9cb-315a-01e979cc480c@linaro.org>
Date: Fri, 14 Apr 2023 17:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 25/40] net/eth: Use void pointers
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-26-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-26-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> The uses of uint8_t pointers were misleading as they are never accessed
> as an array of octets and it even require more strict alignment to
> access as struct eth_header.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/net/eth.h | 4 ++--
>   net/eth.c         | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


