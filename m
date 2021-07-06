Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF33BC80F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:45:20 +0200 (CEST)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ghi-0007Ph-2S
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0gZx-0003eX-U2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0gZq-0000Vg-R1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4yFrqXJ6r7LTxh+1PWYXEOYPxGShtLbumvfXtAg9EQ=;
 b=Xk5bijx+OA06Mh9g4SlEaW2ga4qznVlY7rG7Mi2qxj2hPZuEWMWLiZOlWyUySk9v+KIlDj
 J+K2RI1hWUQI0/qUmt4BdHS8MSSYjUr94PKTEi4prJg2pr5oNdH5f/9hr3NTNiGKSLs0c0
 4PtTyyUDTGHsJ2YqZHutkcsNdv69eBM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-B0OVvlx9PLKq-BVMWTiMJQ-1; Tue, 06 Jul 2021 04:37:06 -0400
X-MC-Unique: B0OVvlx9PLKq-BVMWTiMJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d16-20020a1c73100000b02901f2d21e46efso609186wmb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4yFrqXJ6r7LTxh+1PWYXEOYPxGShtLbumvfXtAg9EQ=;
 b=puK93vMjqgDVrN/2wJOFYRrOHlQ7Va85CJV9DNc0J275fa9O5EzFnbXTu05QGnmLRv
 0v68o+k08of02CimcJe3GmSxbPrcsJxZSllkNRFsb2sVhGdlTdRzimKBAKbJtvYgB/e0
 ONxMELV0kgCQBztZxY9d91h+m1FpFDMzFFfvo8yxz+ya0XcoJqJp1yfxUmT1bvSxhtCu
 YvrkffnIR+Btyb8uf7NH4R17DXnbMUKCvQzxD8bxb93SbkRfE/dXNtpLmBNAnP6GTF0L
 o/G1MkQSOCyOecMgoxLL7kRz1ReY0w4q0UiHwdNJNMoWkzQlZM9sVhHTNIsRq8c/Tec8
 AfyQ==
X-Gm-Message-State: AOAM530u2KPap44jHQD0kpgifgLTDHHwQLznGhi/k6pxRNUIAFpkONBB
 AAp3hz7qSMinARiu8zi+DldUCRs9V61OnDhLtkauraePXJqTed2VTJY1lG4dv5NbNPGZkytRApq
 ZJI2fHiAjrqm3VCk=
X-Received: by 2002:a1c:208a:: with SMTP id g132mr3462222wmg.140.1625560624914; 
 Tue, 06 Jul 2021 01:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznFYfjCkjM6+PulpjNWpFqmgG2YfMz+bvDS6mTsvMkCmGBbd3vcRLEjUAp0zcE29xn+dLONA==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr3462197wmg.140.1625560624747; 
 Tue, 06 Jul 2021 01:37:04 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y66sm15164976wmy.39.2021.07.06.01.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 01:37:04 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <a8c1e845-bf1a-dde6-64a1-dfc89686f6f4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6091448-00d3-fb47-c830-a473f426a539@redhat.com>
Date: Tue, 6 Jul 2021 10:37:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a8c1e845-bf1a-dde6-64a1-dfc89686f6f4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 10:24 AM, Thomas Huth wrote:
> On 16/04/2021 14.52, Thomas Huth wrote:
>> QEMU currently crashes when the user tries to do something like:
>>
>>   qemu-system-x86_64 -M x-remote -device piix3-ide
> 
> It's now several months later already, and this crash has still not been
> fixed yet. The next softfreeze is around the corner and the
> "device-crash-test" still stumbles accross this problem.
> If the other solutions are not mergable yet (what's the status here?),

See this big thread about ISA vs PCI IDE modelling / design:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg809678.html

TL;DR: short term we are screwed. long term, not worth it.

Stefan, IIRC the multi-process conclusion was we have to reject
PCI devices briding another (non-PCI) bus, such ISA / I2C / USB
/ SD / ... because QEMU register the bus type globally and the
command line machinery resolves it to plug user-creatable devices,
so we can not share such buses. Is that correct?

> could we please include my patch for QEMU v6.1 instead, so that we get
> this silenced in the device-crash-test script?

Yes please.

Regards,

Phil.

>> This happens because the "isabus" variable is not initialized with
>> the x-remote machine yet. Add a proper check for this condition
>> and propagate the error to the caller, so we can fail there gracefully.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/ide/ioport.c           | 16 ++++++++++------
>>   hw/ide/piix.c             | 22 +++++++++++++++++-----
>>   hw/isa/isa-bus.c          | 14 ++++++++++----
>>   include/hw/ide/internal.h |  2 +-
>>   include/hw/isa/isa.h      | 13 ++++++++-----
>>   5 files changed, 46 insertions(+), 21 deletions(-)


