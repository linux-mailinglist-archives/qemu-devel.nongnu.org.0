Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99516ECDED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:28:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwDW-00065R-Uf; Mon, 24 Apr 2023 09:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqwDV-00065J-3a
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:26:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqwDT-00017K-FR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:26:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so32927795e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682342809; x=1684934809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FsFFL78R6cRoeegabhwnJwsEmfP56EJBNO+6fjgxmxA=;
 b=yJfFR38Oe+VTs7oBqIHuskcl9PY3h+tb8jnZBQRdd8ElydNXS17PSWEa+MqRuMsl7s
 /fKcv/U0VHyMTilY7M4+Obw4SJicfxpgL8K08rjnoUIi72MLnk/WVR4NtTru1DQs+iTW
 bZnK+ah02Hk03tvxIugBEhpiQ/00wgtfv1QywesNG3pXJTFuC2HtLWjwtGvbvvK8TI2j
 NO6DRvvCCKg9ZK/suezMN22itMMSm5qO/3zcRN6F+MktzU1vyWtmsdcH9vYCALG9uI/T
 s4hgL3Xci7ns9GsznxV5ue/yBlxvRqstBsqIN4N+080Qxb+S1TEuQpsGIR6AD8GSy7+E
 oC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682342809; x=1684934809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsFFL78R6cRoeegabhwnJwsEmfP56EJBNO+6fjgxmxA=;
 b=KEXEs+6SUCiazcz8ktsDSju1p5lm/yk8/ArGts8bYZ4jvfkciOTcxG7iCtgzMb+l9g
 TyIBvFxE+ewJY8viGJFljTA0bj1CVvouXhAjxlj2SP5dpBXjSRMdYrgCy33E/h5acKV7
 ZrM/5I+4q2odoxf6wjLylZVE3Y2a8ltDwjGeuK+MoEIFuMzMDwOeIGUnjRi5NHieilUU
 n2WKZ8ST42VCbHkUip/oyNaq438fbrwPjV2HHdS5rSFJkrsbbUJXiPkHmjOopyP0wZKQ
 x2QVxr1iqxpjNWljxIR62qyLS8u8TrzNZ+w+/+Huop5wUJYYLiT3mp4gz0qq84GwCeZZ
 ObKw==
X-Gm-Message-State: AAQBX9e3M/Ng3/X9FeQSVDUPJH1awT/aP8exe1PPVHqGWaCvg4WlFIIK
 stovX2rKjjySSqhwd1mXwfW5KA==
X-Google-Smtp-Source: AKy350av+AQDBRlKtUmZ+/QkOm4KMesPTPDyVhBA2JaRvUAKv6bnwzOobrcp6t17QmEouFUfn1rj6w==
X-Received: by 2002:a5d:494e:0:b0:2f7:85e0:de75 with SMTP id
 r14-20020a5d494e000000b002f785e0de75mr10484608wrs.19.1682342808751; 
 Mon, 24 Apr 2023 06:26:48 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm10793921wrq.23.2023.04.24.06.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:26:48 -0700 (PDT)
Message-ID: <c5dabd2e-aed3-e8db-ad62-86d8e3432488@linaro.org>
Date: Mon, 24 Apr 2023 14:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Content-Language: en-US
To: Jamie Iles <jiles@qti.qualcomm.com>
Cc: "Jamie Iles (QUIC)" <quic_jiles@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230424112907.26832-1-quic_jiles@quicinc.com>
 <e612395f-ade3-6ceb-a611-8c9c41caeb31@linaro.org>
 <ZEaCctJfl/5Cye7K@JILES.na.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZEaCctJfl/5Cye7K@JILES.na.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/24/23 14:21, Jamie Iles wrote:
>> Why cpu_budget = INT64_MAX as opposed to 0 or 0xdeadbeef?  It's not set or used except for
>> icount_enabled.
> 
> That's left over from an earlier version, I can leave it uninitialized.

No, you can't, as you'll get a compiler warning, because the compiler won't see that the 
conditional init matches the conditional use.

A zero init value would only need comment for the conditional init/use.  A non-zero init 
value without comment is magic and bad for maintenance.


r~

