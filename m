Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BB6024C7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:53:41 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgTr-0001cG-TF
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okg4V-0005Cf-7G
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:27:32 -0400
Received: from mail-ej1-f46.google.com ([209.85.218.46]:45908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okg4R-00015m-0o
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:27:25 -0400
Received: by mail-ej1-f46.google.com with SMTP id sc25so29769025ejc.12
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IkF0Ps1a40ygt7LNR8Ypl0xJrGJteXrCg2aEveRUdjI=;
 b=ssTfdJSzUwiwSABXlLrsvg8CEHDVeMZ8AJgY3c4OoAeT1d1p9m2NX4Tit9Q0Lcu9NJ
 2678GwW45kIGkWa12jJaBsnaxncZkvypod8X05SPsVYtGTfaM/brXsHfj9NAYtyrkALQ
 3KRGzcUloKv0iXa0aHPTyMVJPv2imJptzvH4SAr/X6JxbUqI2O0FBM1JL9lyTzGfWzRD
 Sj//kLOK89hrkA2moaO405/I6RJYgbMSLhaWekaMk9j/iA5ETA/1vUCtJrtmKf4t1jKS
 hcNzeGt3fo9d4qBzxseUoGBDaAfBQMNs4eWTDwC12JtypYZPTNuHzmqBTc4ZoEHD72gj
 gl6Q==
X-Gm-Message-State: ACrzQf2WEkWcVaFqTh5UCoBMHWw+OOcqSoOm5ThhxP56Zh25OQZCI//I
 sxEi/Vfo6Rkrdb47vmLKhXI=
X-Google-Smtp-Source: AMsMyM5VNqCdsUp91NSZJW6lwSDdZvnk2QUtuwYXrpVjMrorzRNv1kVBPOMaP7BsM3nIvpFh0zAduA==
X-Received: by 2002:a17:906:8a4b:b0:78d:d475:ff74 with SMTP id
 gx11-20020a1709068a4b00b0078dd475ff74mr1046818ejc.131.1666074440500; 
 Mon, 17 Oct 2022 23:27:20 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 vj23-20020a170907131700b0078df26efb7dsm6917772ejb.107.2022.10.17.23.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:27:19 -0700 (PDT)
Message-ID: <0a233177-e61a-05ab-7631-57fa75d15c78@kernel.org>
Date: Tue, 18 Oct 2022 08:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, Chris Friedt <chrisfriedt@gmail.com>
Cc: qemu-devel@nongnu.org, cfriedt@meta.com
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.218.46; envelope-from=jirislaby@gmail.com;
 helo=mail-ej1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 17. 10. 22, 15:44, Alexander Bulekov wrote:
> On 221015 1710, Chris Friedt wrote:
>> From: Christopher Friedt <cfriedt@meta.com>
>>
>> In the case that size1 was zero, because of the explicit
>> 'end1 > addr' check, the range check would fail and the error
>> message would read as shown below. The correct comparison
>> is 'end1 >= addr' (or 'addr <= end1').
>>
>> EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!
>>
>> At the opposite end, in the case that size1 was 4096, within()
>> would fail because of the non-inclusive check 'end1 < end2',
>> which should have been 'end1 <= end2'. The error message would
>> previously say
>>
>> EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!
>>
>> This change
>> 1. renames local variables to be more less ambiguous
>> 2. fixes the two off-by-one errors described above.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254
>>
>> Signed-off-by: Christopher Friedt <cfriedt@meta.com>
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> As a side-note, seems strange that edu_check_range will abort the entire
> VM if the check fails, rather than handling the error more elegantly.
> Maybe that's useful for students developing kernel drivers against the
> device.

Yes, that was exactly the intention. First, as a punishment as they do 
something really wrong. Second, so they notice -- writing something 
wrong to a register of a real HW often freezes a machine too. Especially 
when misprogramming a DMA controller.

OTOH, this sucks too. Ext4 (and other FS too) is fine, they don't lose 
data. However they need to freshly boot, repair FS and investigate/think 
a lot. This trial and run (and crash) takes several loops for some.

So I am for softening it a bit. But they still should be noticed in some 
obvious way.

thanks,
-- 
js
suse labs


