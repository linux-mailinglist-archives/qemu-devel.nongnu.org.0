Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AA5BDB20
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 06:02:42 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaUT3-0002Hw-CJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 00:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUPE-00080z-WC
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:58:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUPD-0001gS-EL
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:58:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b5so2212036wrr.5
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ehe7pczslOm3G8Nym7aY7Wt2NeP6XPx6izEPKsUsqUQ=;
 b=grxBSJrtvtJpi1QLJ+AWG3JH4pWqgFOsvNvc5ixbrfa1bhqt8A7qFJPKZoHzpcF4VM
 hWMoq3cTO8ubJaSL5R3BHrPKnqL1BLKxxIJqYga/NG283CCEeDiKl9o7sIqIZYoedh+M
 kwkwFohNrwFFBMxI4baCuXx3hg4jLWLEkCAmxt7x37DlWcbK9rZHi1pK20Bx5zVVzPrC
 4sz2xPWru8Xl1okLKUphMpjGzGycDBaMeeZXnjPAeV+Cs23tNZ0XjU3eoUaytzEtk+Jc
 lv+EN5+7dz1Ew0UN1gDmBorB4uQH4tvanJd/QlZDsbssCzruhknHrkKplEiKKrS3NQrB
 f3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ehe7pczslOm3G8Nym7aY7Wt2NeP6XPx6izEPKsUsqUQ=;
 b=LckjwuCrMlXaORTe/jdTVnMdWMtOWkeVpSxxzbFHJYw3mWqK7D5JOGGsfxhu/QPQFJ
 T78tIRfGdluszMy6I2bEBe6p0qZds44408hWrkzDf14r2LcjennquRplZ4Yfr+/JYtAz
 S83R89Wp/tFWwCX6zd2wPX83H4ff3St9o235RUaPObXckdGCSyWB0224ewHXCQPcvMJ2
 CCAEebTdnDU6bGs2Q1vYpl9MessYPv0HpnF3Wg2Zrg7mlrWbxKACtNfugx/CGy1geZ0o
 r1pMrSGnTnF42OFrBLzYDL69cd7U4EF4+QT5Aq+5lw9yjxJ8K7kswdqX+cnvXAQbqaeZ
 ZL0A==
X-Gm-Message-State: ACrzQf3BEDEh8Q0Zi1GaozWnPyKOCLr7ikWFDoe8mlI12rOcC8uYGiuM
 kv6KZrT9xaqhYuJxJmbCEVk4Dg==
X-Google-Smtp-Source: AMsMyM72+it0pggaPX2IUdbKCL6jFtmZ6Lrbqq99Wlzo9iGrD5l/dWsoQutpdMBt6BYDe6ibdwmWaQ==
X-Received: by 2002:adf:bc13:0:b0:228:6d28:d2cb with SMTP id
 s19-20020adfbc13000000b002286d28d2cbmr12728873wrg.375.1663646320355; 
 Mon, 19 Sep 2022 20:58:40 -0700 (PDT)
Received: from [192.168.4.112] (h-213.61.242.164.host.de.colt.net.
 [213.61.242.164]) by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b003b483000583sm493003wms.48.2022.09.19.20.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 20:58:39 -0700 (PDT)
Message-ID: <2f2e2cdc-206f-dbaa-3c01-02ba72ae9800@linaro.org>
Date: Tue, 20 Sep 2022 05:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] build: remove extra parentheses causing missing rebuilds
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220919131723.73749-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220919131723.73749-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/19/22 15:17, Paolo Bonzini wrote:
> Because of two stray parentheses at the end of the definition of
> ninja-cmd-goals, the test that is last in the .check-TESTSUITENAME.deps
> variable will not be rebuilt.  Fix that.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

