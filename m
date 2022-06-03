Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEBF53CAE7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 15:51:00 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx7hb-0002vc-Dq
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 09:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7f6-00026y-NL
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:48:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx7f5-000493-9B
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:48:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so8948278pjm.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yYh+eFhyei7CHHhsh1+HQAEf8xIjVa2hFOlIn19ki0U=;
 b=g6KBfoFUWTTJ5AOXdV4TuOFvJxpDopWtZt02MK67J4WsYcZrt/feDOLLhf2xNvQIFV
 mj9RLc9qfCowfsVM9Zl3ijo9xBakZD1mlNb87gk8P+wSzprT1rOtrP7fZkN5v+gefkuI
 UnG6SRsamLbr6uGTwwqynBJyqMOUMuWMA/muC2jVLwpiyxgI2nXlnZYYVQX0N7/4SlHq
 405X7Gtl8WAwFkUzv13SRfw/RUr9ojn4E0COSMcTmI7SCjV7HDvqHkDKfh2IrPmy5MBE
 oX3mkS1rdg4eCXwV7jIQRPFfcucEo7vQRfm8eDS9cRDmEC9MP5C3Wvdt5BYKQ52EXkr4
 1rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yYh+eFhyei7CHHhsh1+HQAEf8xIjVa2hFOlIn19ki0U=;
 b=R/w5JOGmwaX4MbzLvbcznAoPtFbwrTTcstsVVxJN7kG6XQDd+X+3n+oCrqfu2VMIdU
 8izH+E0jojDmdykUZ05lgYbQmeAJ4INpzRR14nnlUY6OlRfaXt8b6YiQsq1eWo5pyEph
 i6zspidV2FRRTG+KdiVXZTE8J4xk9HZfH0C2OQgz0HmS2LTwb/OD5a84D3C5W4d7WBz0
 03zI2Dxqqd3KTcEAP8WpoqIeojLbsIipUQHk8Zg+DeEaO3oJhpLjizTVNH8Klwa7X87+
 dysKBgaeHPaQ73g0pLUfwuDe1DOLs7LejlmGi4+oiHd7kep73JTrheI7Tll2eThnieut
 nDpw==
X-Gm-Message-State: AOAM5337YAgBeYDFrUXGB6VdOdQOVEj1F3wR8AEEBsNCtgwYAmT0Leck
 kxgc0npOS4xIfiG1qEDIzKnnQA==
X-Google-Smtp-Source: ABdhPJxLy5eRO5IpY7rztwsZSC+klwW39fcd9U6/ksVklV3VU6WZuj30Dt8fkwpD+cRkLrEmCFhiAA==
X-Received: by 2002:a17:90b:3e8a:b0:1e0:4f19:c63b with SMTP id
 rj10-20020a17090b3e8a00b001e04f19c63bmr11081079pjb.237.1654264101643; 
 Fri, 03 Jun 2022 06:48:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 c142-20020a621c94000000b005180cf8f8c2sm5531699pfc.169.2022.06.03.06.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:48:20 -0700 (PDT)
Message-ID: <81c001a9-7709-66e5-fe71-370ebf3cb39b@linaro.org>
Date: Fri, 3 Jun 2022 06:48:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
 <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
 <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
 <5098180d-334f-7631-011f-6beb3a1434ac@linaro.org>
 <757ff3c0-b77a-b230-6a09-fb3d8c95b1c7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <757ff3c0-b77a-b230-6a09-fb3d8c95b1c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 6/2/22 22:21, Thomas Huth wrote:
> So is capstone disassembly better now with Ubuntu 20.04 or should we still revert the 
> submodule removal?

It's better, yes.  At least it's giving me disassembly of the system registers.

> Also, if libvixl is so bad, why do we still have that in the repo?

Well, we just removed 3 other old disassemblers -- I think libvixl can be next.


r~


