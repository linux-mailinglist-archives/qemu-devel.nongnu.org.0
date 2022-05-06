Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E026A51DA95
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:33:14 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmz17-0008Fl-PJ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz03-0007Z3-GB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz00-0004cS-7B
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/BsOmPKH6MCMvStCfO4hEeH1Jk5NSSg1Q/X9eNIGIE=;
 b=bZCAY2Zlcv0Z8KFem1DB8idCBCxs7+dl7UYa+VkaKMA0gjmuJ1kG8HJ+Y5abRdInrJFLRT
 VhDznQTn9mlbsIjeRE6hh5JaOzIvmW0AvN1xYWxQbiQH3z405z/X45wh4zeFQCph/p9nOR
 b8uNoG88/lCsWugFv/0h9y89O9P/yh4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-hOXbtt9IO_KYB8aVOaD_2Q-1; Fri, 06 May 2022 10:32:01 -0400
X-MC-Unique: hOXbtt9IO_KYB8aVOaD_2Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so1615905wrb.18
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 07:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s/BsOmPKH6MCMvStCfO4hEeH1Jk5NSSg1Q/X9eNIGIE=;
 b=cXpN+N2e2j5yUt1BWtnaWNxm50oyaGoRqoDCNKrxGjIhKCkiC+33nriN6379z0wO+H
 DYwGAm7WAVkL81wHIUUKvtt9aVi9LiruEbLPHA/XqrFMbaS88y7NbpycNIdo/Jyn+F6s
 zK0pcxCZBd9utdiB6EUWgbYkM+rGovJYkBK8CkT9VBYaKK66/8IgTVUyWlsTTGmyB0Vy
 8Eft32z4d9ct8ilhEvgDvzZuCWc6g2CUY66nHvwoOt506007fUYOVqHj0DR97ZRNUyOv
 PNCitdULbzs9bq42B8UD2cubZPbf64N1lCMCnJN3ILFTJaH0XwqeAB6nQdc9JK9iHEJN
 sLGQ==
X-Gm-Message-State: AOAM532RSUN8UcoyJB+JxxTGPYqbXPJagjNpQbuk/PHptV8Bybe+HAuW
 WfOUKpAGZIQsxcIs3sqKz1tDv2wkvaetVJ5RdaJVMez5H7qo8S8ezTESV5CwEMC1PICmiaLAkOi
 NKkoq2ay2qvKUpgE=
X-Received: by 2002:a7b:cc13:0:b0:38e:67e3:db47 with SMTP id
 f19-20020a7bcc13000000b0038e67e3db47mr10145617wmh.133.1651847519512; 
 Fri, 06 May 2022 07:31:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ4zAFFYq6IgytWi+h1+BBJxtR6MRM+7NoJes+cNeO3G2a1zgTb18ZQ/DHoEP/+wWtPF9FLw==
X-Received: by 2002:a7b:cc13:0:b0:38e:67e3:db47 with SMTP id
 f19-20020a7bcc13000000b0038e67e3db47mr10145597wmh.133.1651847519232; 
 Fri, 06 May 2022 07:31:59 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 y6-20020a5d4706000000b0020c5253d91fsm3666182wrq.107.2022.05.06.07.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 07:31:58 -0700 (PDT)
Message-ID: <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
Date: Fri, 6 May 2022 16:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Gautam Agrawal <gutamnagrawal@gmail.com>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06/05/2022 16.24, Stefan Hajnoczi wrote:
> On Sun, May 01, 2022 at 05:55:05PM +0530, Gautam Agrawal wrote:
>> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
>> has been used to track the creation of vga interface. If the vga flag is passed
>> in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
>> To warn user, the condition checks if vga_interface_created is false
>> and default_vga is equal to 0. If "-vga none" is passed, this patch will not warn the
>> user regarding the creation of VGA device.
>>
>> The warning "A -vga option was passed but this
>> machine type does not use that option; no VGA device has been created"
>> is logged if vga flag is passed but no vga device is created.
>>
>> This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.
>>
>> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
>> ---
>>   hw/hppa/machine.c         | 1 +
>>   hw/isa/isa-bus.c          | 1 +
>>   hw/mips/fuloong2e.c       | 1 +
>>   hw/pci/pci.c              | 1 +
>>   hw/ppc/spapr.c            | 1 +
>>   hw/sparc/sun4m.c          | 2 ++
>>   hw/sparc64/sun4u.c        | 1 +
>>   hw/xenpv/xen_machine_pv.c | 1 +
>>   include/sysemu/sysemu.h   | 1 +
>>   softmmu/globals.c         | 1 +
>>   softmmu/vl.c              | 6 ++++++
>>   11 files changed, 17 insertions(+)
> 
> Gerd or Richard: do you want to merge this patch?

I'm just in progress of preparing a pull request with misc patches, I can 
also throw it in there if nobody minds.

  Thomas



