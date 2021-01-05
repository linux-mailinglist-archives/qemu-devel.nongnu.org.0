Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBF2EAB3B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:53:38 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwlqD-0001P4-Rn
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwlmz-0000L1-Ef
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwlmx-0004Fq-Bc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609851014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mU6I7pNZ8b1j87mOeE4SaJJG0gkVSPNPjhPsoR2dc6M=;
 b=I/gUES+Rb6SMiEt0KH2CAFvo6NLRfY3D1Dox8KU3gZKk3Kk0gI4mfSKLbpQSw6Il9eejS2
 FXiHUwOMyYc/HR/OJ6F5yUz402lbx+JRm4dMOZ0VIogWhFfr2LT8JzB6Wbyr/HwZ0AK7O+
 jST+eRBTOnYyYwJ/XtTwfhHczaFr6pk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-mUDi3wNvOmai8jlv6LtSaQ-1; Tue, 05 Jan 2021 07:50:11 -0500
X-MC-Unique: mUDi3wNvOmai8jlv6LtSaQ-1
Received: by mail-wr1-f70.google.com with SMTP id m20so14214315wrh.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 04:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mU6I7pNZ8b1j87mOeE4SaJJG0gkVSPNPjhPsoR2dc6M=;
 b=XVTxrg6Isc1Emw2K5TqIcOYAdepQyglLIcE/LJ5TlY5HTFFHmMOd8eKxsFMpQSbraR
 kNziNHj817xVbJPqh+bekcH7JO97mlBoYs7jUTeosvMFo8ONSAzbOJ9ZiR/LXP2DFJMC
 JXOYG63Q9A5au1mCuDTcmLRuVG/IcF6ophgCh26iSRxUZRP2V1vMc4iBJ0BqZs6/35sQ
 nin+SAWpxWF5dSjtsRWikLxWi4zZBPK6DkdwZYC3GQxAsEXJ2+in9YmqfVk/9/Un5+8y
 6BmvlFzgaG74rUa/eJiy9obc2c2ICiS8tZF+MpqlmoYAQbnCrBAMUZ/XGkcancRc/wZ5
 7KUQ==
X-Gm-Message-State: AOAM532oNkFJ4GSr10rr1NNyXf6OA8dgpECoCV7UPEBqkCqjMh2kuJdi
 JddnKm9n58LuspeQQOY7BQsyXFEU6Qcl/HsUxUNWOe6j/sN6S6orL9YA7KRgPFzfeJsCtMwgZCr
 0VOo8UiqMekeBEj8=
X-Received: by 2002:adf:a495:: with SMTP id g21mr88551054wrb.198.1609851010315; 
 Tue, 05 Jan 2021 04:50:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8VMNRsS/nxcPle0SiTlxtS+1LRvOrFNWElyRfLu+Q5k+IG7opIKWbAt91cOa0rS2NAlWbng==
X-Received: by 2002:adf:a495:: with SMTP id g21mr88551035wrb.198.1609851010147; 
 Tue, 05 Jan 2021 04:50:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w17sm4209942wmk.12.2021.01.05.04.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 04:50:09 -0800 (PST)
Subject: Re: [PATCH v2 2/3] sam460ex: Remove FDT_PPC dependency from KConfig
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
 <41b3af5a-2f2b-41eb-98f1-909e80b26ff@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d50e1ee9-e7e8-9a68-a5ef-3e769e676ea3@redhat.com>
Date: Tue, 5 Jan 2021 13:50:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <41b3af5a-2f2b-41eb-98f1-909e80b26ff@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/21 02:51, BALATON Zoltan wrote:
> On Thu, 31 Dec 2020, BALATON Zoltan via wrote:
>> Dependency on FDT_PPC was added in commit b0048f76095
>> ("hw/ppc/Kconfig: Only select FDT helper for machines using it") but
>> it does not seem to be really necessary so remove it again.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> v2: Do not remove PPC405, reworded commit message
>>
>> hw/ppc/Kconfig | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index 8548f42b0d..f1e1be208e 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -64,7 +64,6 @@ config SAM460EX
>>     select SMBUS_EEPROM
>>     select USB_EHCI_SYSBUS
>>     select USB_OHCI
>> -    select FDT_PPC
>>
>> config PREP
>>     bool
> 
> Something is still not right with this, I've noticed that a few other 
> boards also have this option selected but they don't need fdt.o that's 
> gated by this option in meson.build. That fdt.o is only needed by 
> PSERIES and POWERNV but removing FDT_PPC from other boards I get:
> 
> ../hw/ppc/sam460ex.c:43:10: fatal error: libfdt.h: No such file or 
> directory
>   #include <libfdt.h>
> 
> so apparently this switch also pulls in the necessary CPPFLAGS or libfdt 
> dependency. Is there a separate switch for that or we can only get it 
> with fdt.o. Not a big deal just not trivial why we need an option that 
> at first sight select a source file which we don't need. I think I'll 
> drop this patch for now when resending the series.

You can always do

ppc_ss.add(when: 'CONFIG_SAM460EX', if_true: [files('sam460ex.c'), fdt])

if you want to get rid of the flag.

Paolo


