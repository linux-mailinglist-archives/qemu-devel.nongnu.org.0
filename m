Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC575595239
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 07:53:16 +0200 (CEST)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNpVr-0005t4-NY
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 01:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNpPT-0002xe-IG
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNpPR-0006YC-1F
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660628796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZ49nfOadLExnLAk2A4ZcCTz/8N0w7LxCrcvqQhY8S4=;
 b=DXNIK4eLdyazYu89pt6AFy3UarTWRwFvyXKaUw/q9SDhkWxySx4rRxGEZ8a05vhNMSiHPz
 EBX9DmwiKtj83jmaU1BCHoYgF4dPHgp4YYl4tlwN6vCyE6SA+k0ORVRxnNirG7EV2MAHcs
 kly0pYlHxBbCOKSxf355rqBNvMSRvzA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-yniA2vrYPYelVLMBavxyng-1; Tue, 16 Aug 2022 01:46:23 -0400
X-MC-Unique: yniA2vrYPYelVLMBavxyng-1
Received: by mail-wm1-f69.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so7166883wms.9
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 22:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jZ49nfOadLExnLAk2A4ZcCTz/8N0w7LxCrcvqQhY8S4=;
 b=fE6f8GN8Kz9cR7VcXfUzBohXMUqNQcRurvmT7R9uudnQmWCmDPlwMiKFGg1nAp9yZb
 nIypxgLbuVdC1ER3OPn6LY8S9wCIsd3WdQCBQmI0xq2ikCoLLxSEOVWWG8fDtb3kfSL2
 6SaBKA/pec5/+Hdj7Z0CUvZvpj2yOXnM4zzzRL62NdkiCi1rjG+L2dC8OaVLGvWVYB3/
 ab6maKzRnFFfB0+UQJGUoYGA+S6IO3Ko2H9PCpTdezIsq4A5wpyz9vaZQWKCftnxi/ml
 T6j2c4Pp7OElrVgYh8bCf59gAthOzH9B1FtfC60otShucghOeHPUXy9bYc7E18u4lNZo
 RpmA==
X-Gm-Message-State: ACgBeo2YVovbCr30Vt3coiQ6RqTD2x0WA3aNklZWKvO3rNxBhPooKgY1
 fJe/4N+59p0E31B+Vzbq0f6xwe2oNDPpOUrQSaqRXiGfdjo+8MNrBkeUtOju6eJ2pYEp2e8c71A
 MtYzVJkeelS6BM6k=
X-Received: by 2002:a7b:cb55:0:b0:3a5:41a:829c with SMTP id
 v21-20020a7bcb55000000b003a5041a829cmr18604342wmj.153.1660628782672; 
 Mon, 15 Aug 2022 22:46:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bg73MQ8H1iAFVTfHZGK8ZNiN2ymvPL/V+Zerg6b7QPk1DgRu7WMTFg9Ly26uCJ7ej+Q8z6g==
X-Received: by 2002:a7b:cb55:0:b0:3a5:41a:829c with SMTP id
 v21-20020a7bcb55000000b003a5041a829cmr18604332wmj.153.1660628782467; 
 Mon, 15 Aug 2022 22:46:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 ck6-20020a5d5e86000000b00223a50b1be8sm9224397wrb.50.2022.08.15.22.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 22:46:21 -0700 (PDT)
Message-ID: <b176754c-7c20-a578-96df-82d08c90316f@redhat.com>
Date: Tue, 16 Aug 2022 07:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/20] disas/nanomips: Remove helper methods from class
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-5-milica.lazarevic@syrmia.com>
 <3f3c773f-3400-861c-04f8-4826f3c3d7be@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <3f3c773f-3400-861c-04f8-4826f3c3d7be@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/08/2022 02.19, Philippe Mathieu-Daudé wrote:
> On 15/8/22 09:26, Milica Lazarevic wrote:
>> Helper methods from NMD class like NMD::renumber_registers,
>> NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
>> declared global static functions.
>>
>> Following helper methods have been deleted because they're not used by
>> the nanomips disassembler:
>> - NMD::encode_msbd_from_pos_and_size,
>> - NMD::encode_s_from_s_hi,
>> - NMD::neg_copy
>>
>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>> ---
>>   disas/nanomips.cpp | 322 +++++++++++++++++++++------------------------
>>   disas/nanomips.h   | 144 --------------------
>>   2 files changed, 151 insertions(+), 315 deletions(-)
> 
>> -uint64 NMD::copy(uint64 d)
>> +static uint64 copy(uint64 d)
>>   {
>>       return d;
>>   }
>> -int64 NMD::copy(int64 d)
>> +static int64 copy(int64 d)
>>   {
>>       return d;
>>   }
> 
> Does that build in C? You are declaring 2 functions with the same name
> but a different prototype... Shouldn't you squash patch #14 here which
> rename these functions with the return value as suffix?

Up to the final patch, this is still C++, so I think it's still valid, isn't it?

  Thomas


