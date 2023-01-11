Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8566584C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXps-0000Ls-5c; Wed, 11 Jan 2023 04:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFXpq-0000Ld-Gm
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:55:54 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFXpn-0001SA-E8
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:55:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso13916350wms.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5x9/vDGChQF9U9TtMWEfLV8kbt/5dXVGluDp/rqfvE8=;
 b=SkeqKYqfQn7J+ZHaEzFGBnsQOrHff37a8q/L+p/lNRa7rcW3stNQhKZdRtSrqR4IYE
 DZX33zq/N6azp99y5PfAkJtsHXemXvpS6BD78X/mBT1p6+v92F5KB3ipcZqHAl7EQapo
 GrnEljRX6j54TxGipxmd0Jkq28uc3g0R67FG2KmSJ5rtdtdKQ43uFH5J7FrMk0599p3Q
 Vur0190pKnm6If1DMglMoyeRJ/hA4x9q+tbWeS/MLoq9Lm9tp+4k69zXuLqtOATr/LMb
 nGG2Za3pK06qwU0AoZ2g6R7NdjIMOj0Df8oLN4UWEO0Fv2d4EihUN3QIQDGD0VdVBCaj
 WEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5x9/vDGChQF9U9TtMWEfLV8kbt/5dXVGluDp/rqfvE8=;
 b=u2If043QMI61aHjHpMRCjW4z9h1wArBk5OH6ZYXWNAYQxQSWpqGbUxeoDGOpJ2lh3/
 KHl2fQILV0Y1GMkP0O+7bWjodunF+rqB4dakudZi0kwYdx/jKhaTQqUz7O15FLS0e9j2
 OLdfA6AgeV4gsdhoFQxEuJV6b8VeD/aPTm0pa1cCQLCbXiGVzorx8ApsLW4yTysw5Cwf
 UlP7y9Z79CvgJMisahAHg+bTp3pppnPZ/Sq0bBmLXhzL0SAC8xjYURxeRIKD/JdyhyJE
 Y6FT0MATRFXaHKcxrgLP4TCb3LExVPhD+kLxc+yhTwRYUTrnGH+LNtpLALVTG03Jsnv0
 UizA==
X-Gm-Message-State: AFqh2kpT3IFhVy6i7a5PP6gmjFX7NvCQ+3W/yJaDXS08YBnoAbDB7GPk
 R07OEt3+dSCGJUNSGRmLwubDAA==
X-Google-Smtp-Source: AMrXdXtPPuWhUm6rLiIr4QSXRyzXcMTk5q2Ukrxj1jcv6Q/zN30ZLjKwvGonBLjYhzJRrqiBEH0rLA==
X-Received: by 2002:a05:600c:3b21:b0:3d9:bad8:4e9e with SMTP id
 m33-20020a05600c3b2100b003d9bad84e9emr24673120wms.40.1673430949210; 
 Wed, 11 Jan 2023 01:55:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b003d9e00dfccfsm15091403wmf.8.2023.01.11.01.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:55:48 -0800 (PST)
Message-ID: <53028cf2-0028-b810-348f-b17df33a8149@linaro.org>
Date: Wed, 11 Jan 2023 10:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <Y71h8JAqYxeB2hPe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y71h8JAqYxeB2hPe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/1/23 14:02, Kevin Wolf wrote:
> Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daudé geschrieben:
>> Hi,
>>
>> There will always be a need to deprecate things. Here I'm
>> tackling the QOM (class) properties, since they can be set
>> from some CLI options (-object -device -global ...).
>>
>> As an experiment, we add object_class_property_deprecate()
>> to register a class property as deprecated (since some version),
>> then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
>> finally as a bonus we emit a warning when the deprecation period
>> is over, as a reminder. (For that we introduce few 'versions'
>> helpers).
> 
> The last part means that increasing the version number (i.e. the commit
> that opens the development tree for the next release) can change the
> output, and this is turn can break test cases.
> 
> If we are happy to introduce breakage with a version number change that
> will require future commits to open the development tree less trivial
> than they are today because they need to fix the breakage, too, why not
> make it a build error instead of a different warning message at runtime?

To avoid build breakages, maybe it is clever is to store the deprecation
version in ObjectPropertyInfo and let QAPI inspection scripts enumerate
/ report deprecated features?

