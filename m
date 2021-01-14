Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0FE2F6574
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:09:03 +0100 (CET)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05BG-0007WV-UT
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l04s0-0000aC-1N; Thu, 14 Jan 2021 10:49:08 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l04rx-0004rD-4L; Thu, 14 Jan 2021 10:49:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id t30so6297719wrb.0;
 Thu, 14 Jan 2021 07:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3x0O8sPNXEDYftnuGsjOeZIu2Ubh3rhs2GG4FkkBl5M=;
 b=BRtb84e0mahJhjpESPiR25z/dIoIswKCdGQlfDurjL7ceaB23gSSfX3pirb8BpgtLi
 Z0M0jcwu6yXQQE8F8B4kNK3CKCZGHe5M5Cc9uW7gHUEgPUpRVylzZAzohwqXq5aDySqu
 gCN8RXTdEm7HAQ/cpQCA+CxG3+gP3hiZkrlSEsjGR1dnTLZla6p6KdvPYd9ePf8g746B
 XwUfa8srWqcAE+IncAIVKG//AmeRStnAbcf0v3MQSqU1YhAa5T75zNT2GGgpUqY5W0x2
 tCEjojaiCj+t9ho3vWMneSYvEuuDdI0eYo+1UeZt0Wyv32huf0gJavDz/hY/BeSMuZfk
 8LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3x0O8sPNXEDYftnuGsjOeZIu2Ubh3rhs2GG4FkkBl5M=;
 b=GNJ6Tsx7XObq3tSD0FpJhDXrt8AbjCkWAVUdQjsFkZCKH31N5OCLldGpjGOL3mXH75
 iOO/2zpUD11HgFnHr57m7pw2KnYS4ik4aV6nMKoRhNSv2zkfD8W4rSRnvbA5Ivuwn76Y
 u/Ru6UXJx2Kz4Nxx8sWtchxf+8rEa/q3hQEITIJS7h5zbkzivBtxdi1pg2e07Z1YFWUG
 yNuIlCqo53piFuMJIFiLgUJb8kPhVseFfPaxUjDV5RDmW3TuGKy2HUZR4Ra4C7/St+pR
 XKuAbrmg17LsQPn0UiAQX4gBdBH0TIo5H9aqnJvd4meyocITf+MY4WLt12f1relSXLWA
 HeRQ==
X-Gm-Message-State: AOAM530WiQjCExWFXZtLmx1TO0Kt37E8d6pBi6q/6x9KkP+6/HxFTDIv
 0dzQncV8/qtUXwUQv+aRe+c=
X-Google-Smtp-Source: ABdhPJxTetp2r5RZzf3ZoUqszMuaWnagUi5z6kNXw3xapm69Q1iSA/EoT0ofiVPgoEpQX5n7FPdCLw==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr8551968wrr.342.1610639343004; 
 Thu, 14 Jan 2021 07:49:03 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h187sm9015911wmf.30.2021.01.14.07.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:49:02 -0800 (PST)
Subject: Re: [PATCH 00/18] hw: Mark the device with no migratable fields
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <CAFEAcA8Cu2N5qX55rUk_yd4R6PdJX+X5KPQmMiQPFakP3ShZ-A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <17a5ddc4-c7d9-08f3-5260-f17e1bd48dac@amsat.org>
Date: Thu, 14 Jan 2021 16:49:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Cu2N5qX55rUk_yd4R6PdJX+X5KPQmMiQPFakP3ShZ-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
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
Cc: Juan Quintela <quintela@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/20 9:19 PM, Peter Maydell wrote:
> On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> This is a proof-of-concept after chatting with Peter Maydell
>> on IRC earlier.
>>
>> Introduce the vmstate_no_state_to_migrate structure, and
>> a reference to it: vmstate_qdev_no_state_to_migrate.
>> Use this reference in devices with no fields to migrate.
>>
>> This is useful to catch devices missing vmstate, such:
>> - ads7846
>> - mcf-uart
>> - mcf-fec
>> - versatile_i2c
>> - ...
>>
>> I am not sure about:
>> - gpex-pcihost
> 
> I think it's correct that this has no internal state:
> the only interesting state is in the GPEXRootState, which
> is a TYPE_GPEX_ROOT_DEVICE which migrates itself.
> 
> I made some comments on the "meaty" bits of the patchset,
> and reviewed one or two of the "mark this device as
> having no migration state" patches, but it doesn't seem
> worth reviewing all of them until the migration submaintainers
> have a chance to weigh in on whether they like the concept
> (I expect they're busy right now with freeze-related stuff :-))

Now that we are far from freeze-date is a good time to ping
again on this concept :)

Most of the devices are ARM except:
- cpu-cluster (Eduardo/Marcel)
- hcd-ohci (Gerd)
- mac-nubus-bridge (Laurent)
- generic QOM (Daniel, Paolo)

Is someone against this proposal?

Regards,

Phil.

