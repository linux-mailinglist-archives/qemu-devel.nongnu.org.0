Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E06E8DF6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:23:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTK-0007tM-Rx; Thu, 20 Apr 2023 05:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQTI-0007sR-CO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:20:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQTG-0006u8-Qx
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:20:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f180510299so3190725e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982453; x=1684574453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l63fBVqf+skRhDHzj3FMLixVBb4pNQ9am7013dNRv7E=;
 b=RkV6PNVW6n9JEP7q9QIilInlQZVSD1/Nukfy2DtiYmAiREWPHpL25puerQvfCjRd/d
 Jfr3In2K5OCUpLK9GLr2iS4OXbka8Oo5LHE0WXfw1w39qN+nSmykKFIyGd2n8iYG0gxs
 mixgP+Vhm8HzyWgiwI0yiVPuL0D61uGn9RN3tpQJ2f4nOf6pGYIBebPsN5rG6dRVG6Vg
 GqXZO2hMkJ5HO6aZ3yBCM1ZGET+PM4JWzsTcWkXmfhC+WjOaVEyPcsrWCKvNjlRUo5PH
 uun6FXvPLhDnVUYMTk5XJ+Q3QgSihtsL/HCPmKMs6eGXQz0K++k4Q6j9OIc9p6pGssc0
 /Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982453; x=1684574453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l63fBVqf+skRhDHzj3FMLixVBb4pNQ9am7013dNRv7E=;
 b=ZcZrwyR3MxN6i64T/AI43T3dheqbx+pJ5sCpL6Ga5ylfCX+EQ5yd/THbdPC+kEctlM
 vGU50PElI6W+ErDtI5wBRId5bXoDO0tHhF4DWUxGiAnVbPZM/yUWh8Nu80vKSUur/5/R
 W4rCCej932MgaRPogasPAytZQqYJgXBzKX5sZI7KyxfAZYBaWzb7zC9Sl2fhZEPwb+wj
 dWOdvgdsmN95qK4DqO1Ng6o5JhXU3zK/2jzvsTCb1k7AyQJOsj/A137a0g82WoAsVo47
 AuwysLp/j0N6IR+TlibibsrNNXeKxoa87h21/ewGBQAuuOuG4aPFAXKdGfJu8atEnLLH
 kFvQ==
X-Gm-Message-State: AAQBX9fuqqiqwJVA2SZSrsf/KlKTy+3flTvol+kONuc2Y9b3D4SffaE7
 x7IU77eQVaU3joSdEFxQ5gwu1Q==
X-Google-Smtp-Source: AKy350bqVZdkE+t16ivdHoJLoy8lPC1yzqcOFEbupXS2gmcqWsQz9oPuILTXwJHGCqBltKcLuEmVWg==
X-Received: by 2002:adf:fa88:0:b0:2fc:7a4:839b with SMTP id
 h8-20020adffa88000000b002fc07a4839bmr910612wrr.61.1681982453210; 
 Thu, 20 Apr 2023 02:20:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm1465296wrq.23.2023.04.20.02.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:20:52 -0700 (PDT)
Message-ID: <b9c9d0d8-2177-b2bf-28ce-2601fe3a4840@linaro.org>
Date: Thu, 20 Apr 2023 11:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/6] scripts/device-crash-test: Add a parameter to run
 with TCG only
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Eldon Stegall <eldon-qemu@eldondev.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417134321.3627231-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 17/4/23 15:43, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> We're currently facing the problem that the device-crash-test script
> runs twice as long in the CI when a runner supports KVM - which sometimes
> results in a timeout of the CI job. To get a more deterministic runtime
> here, add an option to the script that allows to run it with TCG only.
> 
> Reported-by: Eldon Stegall <eldon-qemu@eldondev.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230414145845.456145-3-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   scripts/device-crash-test  | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

