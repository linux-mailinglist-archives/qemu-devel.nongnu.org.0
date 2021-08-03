Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF3DF3F6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:33:27 +0200 (CEST)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyIA-0004N6-Er
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyGk-0002zF-8b; Tue, 03 Aug 2021 13:31:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyGi-00067b-P9; Tue, 03 Aug 2021 13:31:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso2288415wms.1; 
 Tue, 03 Aug 2021 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rqvPqnMCREWqgmJen1txNHOto/Cp5QZUJdminsrdodE=;
 b=rCIQMpjw2KWrV6AL2LeMGVuaQkpr2yWlHtylnXwEM5XvX9dj3nNUhSXr1rxGB23ybV
 3yKnfbJT11Fci/YSDxYqPI2d9uNtsXqiUeThW2JQjdkbP7AHPvAJFAi52udMAu80oeca
 0JtpDtsDj0/tH2ZVyTLw3BU5S9DHSe202bSvWiM860UsoCY25zCz2yrvJL0dZo+x03/R
 IW1xigqV558Fk2z56AO9+6O5EJm7BT8zdRU8TAuTNomuuEHc7uuaeJYw3sy8dbS+X85g
 7ZYIhmwB1Huz0Rr5WV2/5mlj2f2SXWc3GSIO9pUPyJms8SK+Erj44IROhVYHglgU69uQ
 KKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rqvPqnMCREWqgmJen1txNHOto/Cp5QZUJdminsrdodE=;
 b=TtOJx7yVmqEQtSidL4H1ivIIpYt8W+Z36eg8744vB0PM+EnIW+GtBU/vWBhw1QrnKi
 l4GANxn080o9GGyugOMOYzpCev4ZA00VfjlCXCLK/0a8tcVvOO3GKVcrlRNlOP/JLEJk
 9Bav3VQ+Nk9Py43TJsYVl44VHE47dkKcmuMYAmDEO9ynBVyVJUdv3Rsn0VqmCfP2aLWm
 bJnPRp215oQ/NR3Hg4yL9CUX7mZhplRitlyuuF0WZqRCAay0aHMrl5Vwjx3v4UBixZbj
 vMi7RcbhrcVz61ikLyn3B5vBGXo2eHGk0yHSp2kXeEAAx7zMDB1bEYuxiQ0y5FiYSbzM
 X8EA==
X-Gm-Message-State: AOAM531XhNCKU3U6Cm/D9y7R5ZDhYWgKu2MpXwCHHK0jcMdzX7wzPAFH
 HVedQsJbg6kRomCirnjCTUvAZ84Hd6uYTw==
X-Google-Smtp-Source: ABdhPJxbpnFhTOVcifN3LUKtEcDeNpsGV/7BjaQJ2Gctm9W7B5UqeSxMJlN9osxAowQBqdawOovtRw==
X-Received: by 2002:a05:600c:c2:: with SMTP id
 u2mr3204163wmm.106.1628011911585; 
 Tue, 03 Aug 2021 10:31:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f74sm1537147wmf.16.2021.08.03.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 10:31:51 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v2 0/2] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210802235524.3417739-1-f4bug@amsat.org>
 <20210803134637.nfrjsnhjnagjt6e7@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b44e40b-7f62-3ff4-4d68-63c9564aa608@amsat.org>
Date: Tue, 3 Aug 2021 19:31:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803134637.nfrjsnhjnagjt6e7@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 3:46 PM, Alexander Bulekov wrote:
> On 210803 0155, Philippe Mathieu-Daudé wrote:
>> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
>>
>> The change is (now) simple enough for the next rc.
>>
>> Since v1:
>> - Simplified/corrected following Peter's suggestion
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>>     CMD30
>>
> 
> Fuzzed this for 20 mins, based on the OSS-Fuzz corpus, without finding
> anything.
> 
> ./qemu-fuzz-i386 --fuzz-target=generic-fuzz-sdhci-v3 -jobs=4 -workers=4 \
> -focus_function=sd_wpbits \
> ~/oss-fuzz/qemu_qemu-fuzz-i386-target-generic-fuzz-sdhci-v3/  
> 
> Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thanks both!

Queued on sdmmc-fixes.

