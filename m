Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD26D7CB3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2Jq-0001SJ-Rc; Wed, 05 Apr 2023 08:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pk2Jo-0001Rx-Ni
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pk2Ji-0002up-8g
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680697965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gH6hKv0/CB/tS9oY86pZHfQ5WQFUt3mLMEPbrpXb/nI=;
 b=Yet/W6oXOj6jCnbmAZdXIuhVvAZ0EHqMdmlMzGP1dBtyCmTgGQhIGIVki+66hg4bazYhr/
 UC1BgFFL+aa1Zy3Zd7+quLB91ZnHQ5BbT1lipcq2+An+/ZLn0vmRD7zu5U5V2LBPX+nmHn
 kEUlMwE7K+Z2SZlwk1lAxeZIGubL+o4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-5QHZarmzOnyXx8TVwlzK9g-1; Wed, 05 Apr 2023 08:32:43 -0400
X-MC-Unique: 5QHZarmzOnyXx8TVwlzK9g-1
Received: by mail-pf1-f197.google.com with SMTP id
 n3-20020a056a00212300b0062dfd10c477so5141746pfj.20
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680697962;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gH6hKv0/CB/tS9oY86pZHfQ5WQFUt3mLMEPbrpXb/nI=;
 b=HqLkGA32VE4Ck1iCbKpFt9lmeRdq+uOjJCELIuiaiAOwtUn6AnntEHDdaS82FtF/fa
 YI9/UHYsnrHuVzNsom+xd6h8/CGpSlI8qwFj+pAa8P0DswxTbeMXXBQ/Mo5GL6CoM7ym
 dIt4qjWAR8ScFazBkEDRgYfuv7TIsxZxDFPtJFVx4X5iaTHKI/lP7hLrq9aY8/iEIi8Y
 Sms4+cGNdz1IXTtOEYezMwwJRaJHvFzDFOYeVIlIrw7f3A8Nt6bZAfrGXzHSZRa0MMHA
 uHAqfggAyqyl2t3R1MDitQoo/SNC6GDpKAI3GeDbFyHf4QDVq1eTz6iPyYsNwmU9uDt/
 5Gjg==
X-Gm-Message-State: AAQBX9dTglUDiM0p4X0KDG4hGunl66bpoi48mdSI3VVVOaUUFk0xkeP6
 gFbWjBYbZSe06JtUUq/BOXGOtAvugHCDMPtoWfAl3nlQ5Cy+8MNJ3BJ9fnxdCfoL+z9xRXOXFYR
 Y+CUY09q+Ejw89ac=
X-Received: by 2002:a17:903:410c:b0:19e:73a9:c21b with SMTP id
 r12-20020a170903410c00b0019e73a9c21bmr4860836pld.45.1680697962629; 
 Wed, 05 Apr 2023 05:32:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YeWsepfN+bPWJyT0RgGHzIB90z8tdwiKbCtIuHXsMU7fRDJ0quXR2l53/FcKmDGksPc9XBpQ==
X-Received: by 2002:a17:903:410c:b0:19e:73a9:c21b with SMTP id
 r12-20020a170903410c00b0019e73a9c21bmr4860811pld.45.1680697962292; 
 Wed, 05 Apr 2023 05:32:42 -0700 (PDT)
Received: from smtpclient.apple ([203.163.238.156])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a1709027d9700b0019cd1ee1523sm10083388plm.30.2023.04.05.05.32.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Apr 2023 05:32:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230405082425-mutt-send-email-mst@kernel.org>
Date: Wed, 5 Apr 2023 18:02:37 +0530
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, kraxel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C6CD1E3A-8B2B-43AC-81B4-AF318FB2C573@redhat.com>
References: <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <20230404104122-mutt-send-email-mst@kernel.org>
 <20230405093020.3cbcd6e7@imammedo.users.ipa.redhat.com>
 <20230405043026-mutt-send-email-mst@kernel.org>
 <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
 <20230405055833-mutt-send-email-mst@kernel.org>
 <20230405140332.2dd50298@imammedo.users.ipa.redhat.com>
 <20230405082425-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On 05-Apr-2023, at 5:57 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> 
> On Wed, Apr 05, 2023 at 02:03:32PM +0200, Igor Mammedov wrote:
>> On Wed, 5 Apr 2023 05:59:06 -0400
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>>> On Wed, Apr 05, 2023 at 11:24:16AM +0200, Igor Mammedov wrote:
>>>>>> PS:
>>>>>> See commit message, Windows is not affected as it doesn't
>>>>>> clear GPE status bits during ACPI initialization
>>>>>> (at least the one version I've tested with, and I won't bet
>>>>>> on this with other versions or staying this way)    
>>>>> 
>>>>> So I am saying linux should match windows. Clearing GPE
>>>>> is a bad idea as you then miss events.  
>>>> 
>>>> I'd say it depends on if guest OS is able to handle hot[un]plug
>>>> at boot time when it enables GPE handlers (or any other time).
>>>> (My point of view here, it's a guest OS policy and management
>>>> layer should know what installed guest is capable of and what
>>>> quirks to use with it)
>>>> 
>>>> I'll try to send a kernel patch to remove GPEx.status clearing,
>>>> though it might be more complex than it seems,
>>>> hence I'm quite sceptical about it.  
>>> 
>>> In the world of ACPI, windows is basically the gold standard,
>>> whatever it does linux has to do ;)
>> I'd say other way around (with their limited acpi interpreter,
>> it's getting better though),
>> While linux basically is acpica reference code.
> 
> For a spec compliant acpi like ours maybe but on real hardware
> it is like this because BIOS vendors test their ACPI with windows only.

I thought they used bios bits :-) 


