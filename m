Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C143445B9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:29:51 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKcw-0001SN-Ou
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKaz-0000QZ-FL
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:27:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKax-0001Ts-VM
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:27:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id x13so16758977wrs.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b74ar1E1yW7SF8EXC2Ncbif+ClKawjMInqOISoAB2ig=;
 b=JhRWwzhd4RCfYuChC3BSFTTa0oY93bie4QGgeKYnzzhryXQIopBY8ip/oSa/zlboYg
 s9oRh6qa0Zx2PNIVXSyjwusy4p3PSXxHLIgXUXMAfuFHY9ISKIh3KqzfUT7XWic8JDLa
 TySqyq+NT+jmAC3pt+++8XBv9ze/kzFCrEf79Jw3h5fmeHZRlTiyHDsU41MHRHNTiA9t
 YmBWpA2qd+Cm3B7nRxk7avO0kK0bnI5NCFtmOI4IUleFI/93XqIisFbLXzVtQSlEk1Eo
 NXlpRtJuw6Kr9DbrobnNlmo1Lq5lz93RFmeW36Q1kIui3khas0WTbq/n4LNoeRQW5AsD
 7PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b74ar1E1yW7SF8EXC2Ncbif+ClKawjMInqOISoAB2ig=;
 b=ARro4yoFQAYIOog+37NT3SVlRMf6ikjCPM7+bNMZJkaWkDRglDkMMCgskLOeY0vghw
 HG+HSn0bUlMc7n1VXdmyw3spHUxUWyHtiNwti0hUbdE4bPxIfxFXPnz6DT6w/I1/xoP0
 nqR364iTziYai2V/Nz90pi2/TLzenLbieysnyDy+EoIg3ugHyrrSgu6RfFoJHJ0N1xHV
 mFubS4EeRnwnoIsouHhJcNIlc/fMSRwAiXpb2oMWygJZijZD/UqVKWvK4ol8pVjrz1GF
 sncfQd579SELBJrIbCdPmbvgooBaSvqX4ZQbLpPMdCJhOHDlPtEftnUS9NgLFO/6A/T0
 is8A==
X-Gm-Message-State: AOAM532ArHeFmr3m7M0brzJZHUn8lykTbUl0/KKvCwXeDL7bOOIjYViG
 kBneFBh3YwUFGZ2Xv8Ie9Ps=
X-Google-Smtp-Source: ABdhPJxCuVbD0qkId9bgtZ7SZF4uQ9XZ/xHfsjj1kD2OQDquGlT4gZVcSN0dzgav2UETAywrOfXH3g==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr16176258wml.147.1616419666102; 
 Mon, 22 Mar 2021 06:27:46 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k13sm10309465wri.27.2021.03.22.06.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:27:44 -0700 (PDT)
Subject: Re: [PATCH] tests/meson: Only build softfloat objects if TCG is
 selected
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210322114739.4078408-1-f4bug@amsat.org>
 <4962691b-b5fb-535e-2aec-55eaa0cfa9a9@redhat.com>
 <faf72503-ce74-d04a-bafb-79db97937b51@amsat.org>
Message-ID: <64240581-58b3-7639-f160-6187dbfc955f@amsat.org>
Date: Mon, 22 Mar 2021 14:27:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <faf72503-ce74-d04a-bafb-79db97937b51@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 2:09 PM, Philippe Mathieu-Daudé wrote:
> On 3/22/21 1:57 PM, Paolo Bonzini wrote:
>> On 22/03/21 12:47, Philippe Mathieu-Daudé wrote:

>> I would rather first start removing CONFIG_TCG from target-dependent
>> files (such as tests/qtest/bios-tables-test.c and
>> tests/qtest/qmp-cmd-test.c), and then just remove the
>>
>>   config_host += { 'CONFIG_TCG': 'y' }
>>
>> line that is not needed anymore.

This looks the correct thing to do but not something I'm
willing to do now, so please simply disregard this patch.

Regards,

Phil.

