Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC86AF8D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 23:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZfst-0004bQ-Mq; Tue, 07 Mar 2023 17:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfss-0004b9-J5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:34:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfsr-0004t3-0B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:34:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so85725wmi.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 14:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678228451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xwB3CXpHOTC95oMiVQ23xHFnWrhpwQiq8GkzZEBpzxE=;
 b=Z71V3tvV4H1+HSlMIByjnjskuSkSgZWWaS/MO0/1BkRo7G8vyMGbiu/mafon9fN0jf
 ioGrrEh7q14TZiIXT4HyS3AL8DaZL6v2ia57IthyXBhl+6NbpzCI6QurQrj1X0tGt9gY
 n6jV0AFL3hEjYh+w4PmzoDLvA4327+ySra348qI0A7954pA5zeVDMkLzB85S0+l2A8ra
 jqAwbYouvtkEBScUOm1FkIUA9QH41DpouXDbk3mN0RrNDGnvw9+NbGQ/UczDYYFkQPEf
 PZRuK9G1McCaVySDwK1TwAG4urTTPXv/FipgVRlfjJWQFMJppOjlpZUjOZXWCQknEGZF
 0AOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwB3CXpHOTC95oMiVQ23xHFnWrhpwQiq8GkzZEBpzxE=;
 b=fVsYZT9xISjSbumtmYgKpDtsZaioOFHtO0uG+u3dbMLrBRxowr8/RP+4CfF/RvEG0g
 tcnvnE65lD6SytHpwO3m+sbyHXkmexqvNQve03Opq5OrkCkjg99Pt3XuZy5SfzzYNpX1
 h4ax5SmsFHeC0sSdMty2vdXoF6wMiAaUxpGzYer8QCvWewsTN1yP+sS6ybG23WIxFPDt
 K7ih9b8Dq1mTz93Ugb+b6PJLyYdMYEobHZEtDJ0d3e3ONtIJOveEv2/9bOz6FrIjcmDy
 RlnVFvDTqSbpQfHDst0T3kLL4Kmj7+stIk2ACy8PhyVVHFutQduTAcnJYxiUOpCJc15q
 Jr/A==
X-Gm-Message-State: AO0yUKWfWBfKv0/Ab6d+9aX+Hck3Y1Jf1cBaA0uMnz9TgKW2P11LBc2I
 LPziw/8Njfs0F0vYbDoCkuzpJQ==
X-Google-Smtp-Source: AK7set8nNq+Soub1SNPkNPqC7LxmjgPQKwikKiZGr3EOGefGYPyctH8Z+2EM0i908XMOLIGhCj+CpQ==
X-Received: by 2002:a05:600c:4f13:b0:3eb:3998:8bca with SMTP id
 l19-20020a05600c4f1300b003eb39988bcamr14563970wmq.17.1678228451332; 
 Tue, 07 Mar 2023 14:34:11 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 q7-20020a05600c2e4700b003e70a7c1b73sm13609317wmf.16.2023.03.07.14.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 14:34:10 -0800 (PST)
Message-ID: <71d4adc7-847a-48ca-68b2-a482773342e9@linaro.org>
Date: Tue, 7 Mar 2023 23:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/9] PC cleanups
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
 <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
 <20230305050831-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230305050831-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 5/3/23 11:09, Michael S. Tsirkin wrote:
> On Sun, Mar 05, 2023 at 07:45:55AM +0000, Bernhard Beschow wrote:
>>
>>
>> Am 13. Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>
>>>
>>> Am 13. Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>> This series contains some cleanups I came across when working on the PC
>>>>
>>>> machines. It consists of reducing the usage of global variables and eliminating
>>>>
>>>> some redundancies.
>>>>
>>>>
>>>>
>>>> One notable change is that the SMRAM memory region gets moved from the i440fx
>>>>
>>>> and q35 host bridges into the x86 machine. This will simplify cleaning up these
>>>>
>>>> host bridges which will be done in a separate series. Note that the movement of
>>>>
>>>> the SMRAM memory region apparently doesn't change migration ABI for the pc and
>>>>
>>>> q35 machines (see below).


>>> The last two patches still need review. Comments welcome!
>>
>> Ping
>>
>> Can we queue the reviewed patches (all but the last two) already?
>>
>> Thanks,
>> Bernhard
> 
> Philippe objected to patch 1 - he suggested using
> pci_address_space_io.

I was wrong...

