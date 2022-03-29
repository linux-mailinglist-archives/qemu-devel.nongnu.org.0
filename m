Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653C4EB270
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 19:04:49 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZFGy-0000dS-08
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 13:04:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZFFv-0007mn-Ok
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:03:43 -0400
Received: from [2a00:1450:4864:20::331] (port=52860
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZFFu-0007VB-4X
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:03:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id r7so10723904wmq.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6ZtcMZawI0x7va21I2YLUVS/GFmtNibrDwcDfbZTZRc=;
 b=csBFaWDg5i9OzVOKbGNn/BqrT3JV5UBzIuQGkjPgHXi2oilZVrBvzE0D62MO+g2j+y
 xEoraiqUXErL3Mr80Yk4Dt01fXBNfq4oXsSQnfKbIjMETIN2BDmatmfh8IxnSePcQ3vz
 vHIScuGiocOcNOTGCiesfLMqyIIjkRC/axeWpCYKijsCioex11OZCtCgPgZh336tTJ0F
 znfYwzleYrxtrcIyICvusqVY6Nw2BOtEVPgZd73x/MghQ+81pmkzioMT0hOEeldvY7p/
 k9cdByRlmhjwVIOhKBBurR+k9FMRcWqPnJD66mtsVR09G+X3lq95DNw1L2RtQ+7USsMp
 cdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ZtcMZawI0x7va21I2YLUVS/GFmtNibrDwcDfbZTZRc=;
 b=RfTdjYpqmBvCfJWlNI1SltqJ+WEKW8EhjRBv5OTldx5swm513dCnKEF+/4nNq2KMFM
 O6/sE85xIs+/gt9mLkZ1MhZIMaaNJZl6gdFS6YR2E4Dx0chln1gRMMzhbRDL38Xrus1Q
 culVv7he6JZF6PuK+cKLAF1KSkJdJ7t7SiSUIMJSEN1BtOe8ZP4dGbjub3WE60EYR4MJ
 jX4mlPBARNwWGMUwKghGpZARfiLMbIXly5bChJtkSBrYLt0+pSidHIKJi7/GQR2+j6Ky
 yOliLL1o+/shNUMuF8VbxX804BBbZ29s3azCilYB84MAUnpjwomdyTlvPHvAoAZC8MPO
 PGxw==
X-Gm-Message-State: AOAM531O2ALjdv/+x4PMuQWzl39qZ4XGuxxhyZGedNsp64BWDMRy8LFL
 UmLD38YUgTOfSYklcSR3GXo=
X-Google-Smtp-Source: ABdhPJy9OoeQMscm0Vmb0PlA7mUdv3cQXDKKl6vdobWyuD6kZC7hwDMGg9n6Njaf0+Z22pK64NRmgg==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr231212wmc.2.1648573413754; 
 Tue, 29 Mar 2022 10:03:33 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:7175:c9f2:ce76:a519?
 ([2600:70ff:f07f:0:7175:c9f2:ce76:a519])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b0038cb84f4218sm2823569wmq.27.2022.03.29.10.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 10:03:33 -0700 (PDT)
Message-ID: <9c553bff-1b1a-9251-c0cb-4d33bb4745a5@gmail.com>
Date: Tue, 29 Mar 2022 19:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL 0/4] Darwin patches for 2022-03-29
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
 <db936fb1-268e-9486-b954-fc6cb7ef3c32@gmail.com>
 <d71bdcf6-d697-f667-e6c2-a02e6d73cb9f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <d71bdcf6-d697-f667-e6c2-a02e6d73cb9f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 14:10, Hanna Reitz wrote:
> On 29.03.22 12:27, Philippe Mathieu-Daudé wrote:
>> Hi Peter,
>>
>> On 29/3/22 00:40, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> The following changes since commit 
>>> 27fc9f365d6f60ff86c2e2be57289bb47a2be882:
>>>
>>>    Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu 
>>> into staging (2022-03-28 10:16:33 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/philmd/qemu.git tags/darwin-20220329
>>>
>>> for you to fetch changes up to a4fd374364d4e23e0861273aaf7ff2ebddd57a17:
>>>
>>>    ui/console: Check console before emitting GL event (2022-03-29 
>>> 00:19:37 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Darwin patches
>>>
>>> - UI fixes
>>>
>>> ----------------------------------------------------------------
>>>
>>> Akihiko Odaki (2):
>>>    ui/cocoa: Respect left-command-key option
>>>    ui/console: Check console before emitting GL event
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    gitattributes: Cover Objective-C source files
>>>    qemu/main-loop: Disable block backend global state assertion on Cocoa
>>
>> Do you mind putting this PR on hold to see Hanna's answer whether we
>> take her patch instead:
>> https://lore.kernel.org/qemu-devel/dab63073-d532-2795-fce4-77bd0839f578@gmail.com/ 
>>
> 
> To explicitly reply here (too): I would like to rebase my patch (and 
> subsequent PR) on this PR here.  I’d therefore like this PR to proceed 
> (if possible).

I couldn't update earlier due to a power outage...

Thanks Hanna for following up, and Peter for merging!

Phil.

