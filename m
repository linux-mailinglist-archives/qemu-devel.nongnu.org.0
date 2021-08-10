Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CD3E5E11
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:34:56 +0200 (CEST)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSqE-0004fz-RD
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDSp3-0003mL-Kb
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDSp0-00027Y-4S
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628606016;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozv5IuBXeN9fI37tZJ80jNX1pPdk/rvqOi5Y1U+6zNc=;
 b=KR0/D9uCA8W5DjZM3lFlQdnpjWcBxR5GDUYWeBosy0DyplTe5vbzCzR3TpiMtPf8XDg69S
 fIfX11F/QSBNcoT+Wzlu6lRwl+/W5bO6qTWei3UkF16KXWmNwMhkx1hKsMoOcnXC59fP7t
 8UB4pEKys4vBQfsyuJ32EhwZIgtTl7M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-RMfb8ot6MhCcUAFhsoImpg-1; Tue, 10 Aug 2021 10:33:34 -0400
X-MC-Unique: RMfb8ot6MhCcUAFhsoImpg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020adffd870000b02901544ea2018fso6503536wrr.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ozv5IuBXeN9fI37tZJ80jNX1pPdk/rvqOi5Y1U+6zNc=;
 b=gKJW9ZwznrXEgGN64Bm6sBd+gyGRHj2LkcqJdCfqHkaNmFhTH6njD5I/oj1C6zXNvv
 GHh2kEqFdyqPPoeNj174aetNaAaI4LxCUPI5qT1dSa9+bDaFg4s5tJ/+v29AZ/30jmNd
 2tTJo9SQpinQqRPa0EV8Q00n94TMY5gjOSiy95i3jQ90QAFQ6VBLy8PWKpTbj4hCax9S
 QiukKRQRIa72AFr+7cQLEiFVzULLZ+V74qXPml9Faz4p144VHR3EQQNLcqbt9LPXIX3r
 fBL05tvT43Co1iUTLX87Zax21tfQb9r9xVtP3hvI8TGRWn1OFK5uh7TuGUJRrBW2YjCB
 byzQ==
X-Gm-Message-State: AOAM533sZV1c7NkwRtm3X+23gdSDtxc8e6+G1K9wmAqmS7uOmom2GJyu
 ZalS6qWqgRUMsUN0pxsuoZVXMkVjhRH9UdsKuGSvfhGxiYfbgGwuuoXHZlzVYHg1nwdNLiK4LRd
 uN03AhtmFHpHBV4Q=
X-Received: by 2002:a1c:7907:: with SMTP id l7mr5094441wme.87.1628606012742;
 Tue, 10 Aug 2021 07:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFC+Q999kj5izAAlsZCysDAx3hecZZ6COBVGwmNyZcZt8evQ64eYvsPZga473+WQGWQcB8UA==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr5094411wme.87.1628606012534;
 Tue, 10 Aug 2021 07:33:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p14sm3034796wmi.42.2021.08.10.07.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:33:32 -0700 (PDT)
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Ard Biesheuvel <ardb@kernel.org>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
 <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
 <PAXPR08MB6987EDE1A3331050FC312AC490F79@PAXPR08MB6987.eurprd08.prod.outlook.com>
 <CAMj1kXGeVZBqi00Xg8xhE_CoCQnDDmbbhawg-5reNpTTr=bCvA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1b031fe5-60f3-4727-052b-b103fed20910@redhat.com>
Date: Tue, 10 Aug 2021 16:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGeVZBqi00Xg8xhE_CoCQnDDmbbhawg-5reNpTTr=bCvA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jcm@redhat.com" <jcm@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Al Stone <ahs3@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Samer, Ard,

On 8/10/21 3:54 PM, Ard Biesheuvel wrote:
> On Tue, 10 Aug 2021 at 15:11, Samer El-Haj-Mahmoud
> <Samer.El-Haj-Mahmoud@arm.com> wrote:
>>
>>
>>> -----Original Message-----
>>> From: Eric Auger <eric.auger@redhat.com>
>>> Sent: Tuesday, August 10, 2021 6:25 AM
>>> To: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: eric.auger.pro@gmail.com; Michael S. Tsirkin <mst@redhat.com>; Igor
>>> Mammedov <imammedo@redhat.com>; Philippe Mathieu-Daudé
>>> <philmd@redhat.com>; Peter Maydell <peter.maydell@linaro.org>; Shannon
>>> Zhao <shannon.zhaosl@gmail.com>; qemu-arm <qemu-arm@nongnu.org>;
>>> qemu-devel@nongnu.org; Andrew Jones <drjones@redhat.com>;
>>> gshan@redhat.com; Samer El-Haj-Mahmoud <Samer.El-Haj-
>>> Mahmoud@arm.com>; Al Stone <ahs3@redhat.com>; jcm@redhat.com
>>> Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
>>>
>>> Hello Ard,
>>> On 8/10/21 11:36 AM, Ard Biesheuvel wrote:
>>>> On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrote:
>>>>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
>>>>> this latter allows to describe one or more debug ports.
>>>>>
>>>>> Generate an DBG2 table featuring a single debug port, the PL011.
>>>>>
>>>>> The DBG2 specification can be found at:
>>>>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-
>>> debug-port-table?redirectedfrom=MSDN
>>>> Have the legal issues around this table been resolved in the mean
>>>> time?
>>> I don't know exactly what they are. Adding Al and Jon in the loop they
>>> have more information about this.
>>> How did you resolve the issue for EDK2
>>> (DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c)?
>>>>  Also, any clue why this table is mandatory to begin with? The
>>>> SBBR has been very trigger happy lately with making things mandatory
>>>> that aren't truly required from a functional perspective.
>>> It seems there are kernel FW test suites that check all mandated tables
>>> are available and they currently fail for ARM virt.
>>> Indeed from a function pov, I don't know much about its usage on ARM.
>>>
>>> Maybe the SBBR spec should not flag the DBG2 as mandatory and test
>>> suites shall be updated. I think this should be clarified at ARM then,
>>> all the more so if there are legal issues as its spec is owned by Microsoft?
>>>
>> DBG2 has been required in SBBR since SBBR ver 1.0 (published 2016, with the 0.9 draft since 2014)
>> https://developer.arm.com/documentation/den0044/b/?lang=en
>>
>> SBBR requires DBG2 because Windows requires it on all systems: https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-system-description-tables#debug-port-table-2-dbg2 , and Windows is one of the key OSes targeted by SBBR.
>>
>> The DBG2 (and SPCR) spec license issue has been resolved since August 2015. Microsoft updated both specs with identical license language, giving patent rights for implementations under the Microsoft Community Promise, and the Open OWF 1.0. This Foundation.
OK thank you for confirming all the previously known DBG2 legal issues
were resolved.
>>
>> DBG2: https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table
>> SPCR: https://docs.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
>>
> Thanks Samer, for stating this on record here - and apologies for
> suggesting that this was another frivolous addition to a recent SBBR
> revision.
>
> As for the difference between the two: SPCR describes the serial
> console, which is an actual interactive console used for maintenance,
> which exists in addition to the full blown Windows GUI, which is
> always the primary interface.
https://bugzilla.redhat.com/show_bug.cgi?id=1661288#c56
seems to contradict the above statement. Do I understand correctly that
if the SPCR is exposed and if "console=ttyAMA0 console=tty0" is not set
in the kernel params, the serial becomes the primary console instead of
the tty0 (hence your choice of developping console preference DXE in
tianocore)?

Anyway I will respin this patch and use the build_append_int_noprefix() API.

Thanks

Eric
>
> DBG2 is used as a debug port, which is used for the kernel debugger,
> if I am not mistaken. So SPCR and DBG2 are complementary, and it does
> make sense to have both.
>


