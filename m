Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2066FB2D8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:29:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1r7-0004UL-St; Mon, 08 May 2023 10:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1r6-0004UD-O2
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1r5-00052g-5G
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683556126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=en6kxyCno2ln0YWnE4nyCkwf7KRwOWcp/7OScciELkw=;
 b=JdqxWsFLGhkHa8FNubVxPKazsLycPUHsQO+HNxSq5hcuFr2KY3GekahqK78Z/uVX9gi+jp
 0KmmjYYSKf9xdmgRrTcK/JociPC2yOQ+rD1uJmU87tR0ji6iSogkfpr02yGrWY62n9aMDP
 QvwTTPX2VIOScTKBjB8nbh+sJ9xAPWs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-w-vGgjZEP0GrQoOFxkCOWQ-1; Mon, 08 May 2023 10:28:45 -0400
X-MC-Unique: w-vGgjZEP0GrQoOFxkCOWQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f4245ffbb4so6378965e9.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556124; x=1686148124;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=en6kxyCno2ln0YWnE4nyCkwf7KRwOWcp/7OScciELkw=;
 b=kY+N1jES0Z3FJm0Udyf+d+lYXA5Z5zwamBD9L60ULzkjWX2pYFztbbKKk/kLCsd3xC
 ep+HTyVFlsJL8kuY2ESgBAcncyWNe4NrbSiaZEdlLVkHh9Gzw07erd411Ll+8zH+1LAk
 9J3wKFJeeLZ2ViAAM9A1CcYPtahh3AsoKPovdCSBkCk+7NUsjurR+NpZilANi3B5EZ7X
 +m7UeVVsJTJ8dBjO9b+kYpn2U6w28drTLI9BTPPL6ZY+dIkQVL4Lt8CfJeFkZe86Kc2J
 sd1pfXZQwLF8vZsi/VS7szKcFgaoAzfn4CGYqi/YVoFGdY2fKFlWcF4H2Hz9AigOs/D0
 cJ0g==
X-Gm-Message-State: AC+VfDyoQced0vjJLvUn8n9qpMYVoqG10LJY3ZyZV+cptt9ghcnXcHyw
 C9xAbWMKG9arRF6cSd20v9Vwt1iIfn/2f8eD+OPUKd6fKaVEsUXWq7hRrOkORLPer9a0h7D01LA
 MS35dQ16muJRaXGA=
X-Received: by 2002:a7b:ca45:0:b0:3f4:2300:e00d with SMTP id
 m5-20020a7bca45000000b003f42300e00dmr3139291wml.3.1683556124222; 
 Mon, 08 May 2023 07:28:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49Ggn8enifRXS1i8Gt6UrSGcPjTK3nRMxiZY89kiGiTZmfXDtXStub/yrkb6IZhsJtia4SMQ==
X-Received: by 2002:a7b:ca45:0:b0:3f4:2300:e00d with SMTP id
 m5-20020a7bca45000000b003f42300e00dmr3139280wml.3.1683556123978; 
 Mon, 08 May 2023 07:28:43 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003f188f608b9sm16974486wmf.8.2023.05.08.07.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:28:43 -0700 (PDT)
Message-ID: <0b96a5c9-26ac-1878-9a4b-72a87e47ea17@redhat.com>
Date: Mon, 8 May 2023 16:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/2] Make the core disassembler functions
 target-independent
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
References: <20230508133745.109463-1-thuth@redhat.com>
 <5b21cdb6-fbc6-b9fd-edcc-6ca7e4c88885@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5b21cdb6-fbc6-b9fd-edcc-6ca7e4c88885@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 08/05/2023 16.04, Richard Henderson wrote:
> On 5/8/23 14:37, Thomas Huth wrote:
>> Move disas.c into the target-independent source set, so that we
>> only have to compile this code once instead multiple times (one
>> time for each target).
>>
>> Marked as RFC since we have to replace the target_ulongs here
>> with hwaddr, and the TARGET_FMT_lx with HWADDR_FMT_plx, which is
>> a little bit ugly ... what's your opinion?
>>
>> Thomas Huth (2):
>>    disas: Move softmmu specific code to separate file
>>    disas: Move disas.c into the target-independent source set
> 
> Patches 79-83 from
> 
> https://patchew.org/QEMU/20230503072331.1747057-1-richard.henderson@linaro.org/
> 
> do the same thing, using uint64_t instead of hwaddr (it's not).

Ah, great, so I can scratch this from my list :-)

But FYI, you missed to update bsd-user/elfload.c in the patch that updates 
linux-user/elfload.c.

  Thomas



