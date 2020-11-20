Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2622BA32F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:28:58 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0qn-000578-6O
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg0oC-0004ct-Pv
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg0oA-0003Ch-VD
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605857173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHyMdSp7J1NqQxH9eAwEq3cI2cbouOW25opDfBiSzaE=;
 b=MzbO/oHHUOaIyftzIhQS8f56o2J3hRjaF64hoWVvBVklNQDwcIMPpws5es1VGJf2t7PbQw
 rgbv4NYZMj9Vdn+sllFQeUg618qORsFrEq4AIl0m6jbtx1DCEPVahvyqX1pdPRY14qOkJk
 FnNk+wgBOag0FMUnZ5LxdUlWeTbMDaI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-N5_8wVb2PjGJ2YYHSyuR1A-1; Fri, 20 Nov 2020 02:26:08 -0500
X-MC-Unique: N5_8wVb2PjGJ2YYHSyuR1A-1
Received: by mail-ed1-f69.google.com with SMTP id i8so3375208edy.21
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 23:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RHyMdSp7J1NqQxH9eAwEq3cI2cbouOW25opDfBiSzaE=;
 b=mr+4whMdKRd8dEJiemVmYj9ByBn7Sjh20tdqJNYWsRgxgJTV3Yg3TZZkoX2RRhgTcs
 uQnMRMvpkvKw2Kkgn+C4asp0UGj8NKg6Zp4MYtoKOj9v+/Wswsb9aVgsLWGdk7a+RzE0
 9WD7wTwZoEKHZ1invAEXJpmZQBlQh9mj1t5eJyDtlgBcRmJNywHx3drmWkk7yN5ArwZk
 4taJhrcyPxOMdpoccot/f+znVYBWXcn4cwpjL1TF+3z7UnVoRgpHB5nohUav0CmUfctQ
 OqXPA5RDhxnDXPfpmXxTj2m7EY5cqhhbyyCVfYgR6XPWvo0f/u0zHrfj7ycz4hMB7jgc
 3Ilg==
X-Gm-Message-State: AOAM532cwhM7rCFECDmiLu7GRXgV71UB19xZDfS0HSK2EIPzPzum0PCS
 0ro2SzoN4plxOpsn5oh5mUx2/nsCTfIYV9vv6L5Nk6gwkmu5UOYOAkuTm1U37RJJE4OAnRHmkzN
 sLKZLmIRZigWURck=
X-Received: by 2002:a50:d490:: with SMTP id s16mr15635885edi.187.1605857167531; 
 Thu, 19 Nov 2020 23:26:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0mlBgTtfZOURN2GjsCorsl0KKRzWXGw0MhU0oNQsq0j0Hv1VjgHESD1odwSzHshMNSr6GkQ==
X-Received: by 2002:a50:d490:: with SMTP id s16mr15635863edi.187.1605857167340; 
 Thu, 19 Nov 2020 23:26:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t10sm772569eji.61.2020.11.19.23.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 23:26:06 -0800 (PST)
To: Bruce Rogers <brogers@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <20201020074844.5304-1-kraxel@redhat.com>
 <20201020074844.5304-5-kraxel@redhat.com>
 <2b74eb5bd939bdd7ad1b05590a427afa4d742eec.camel@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 04/10] usb/xhci: fixup xhci kconfig deps
Message-ID: <b693b96c-b619-47f9-bd8a-f4b41551f886@redhat.com>
Date: Fri, 20 Nov 2020 08:26:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2b74eb5bd939bdd7ad1b05590a427afa4d742eec.camel@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 01:27, Bruce Rogers wrote:
>>   config USB_XHCI_SYSBUS
>>       bool
>> -    default y if USB_XHCI
>> -    select USB
>> +    default y
>> +    select USB_XHCI
>>   
>>   config USB_MUSB
>>       bool
> I was reviewing what device changes are happening between v5.1.0 and
> v5.2.0 for the QEMU arch's we support and noticed for s390x system
> emulation that usb devices have appeared in the info qdm list in the
> monitor.
> 
> I bisected the change to this patch, now commit 7114f6eac333d99b, which
> does a 'default y' without any conditionals. I'm fairly sure that was
> not the intent, though I do know what the proper conditionals should
> be.
> 
> Can you take a look at it?

Generally, SYSBUS devices should never be "default y" because they're 
not user creatable.  Also kconfig.rst says

   Devices are usually ``default y`` if and only if they have at least
   one ``depends on``; the default could be conditional on a device
   group.

In this case, the right thing to do is to remove "default y" here; 
microvm already has a "select USB_XHCI_SYSBUS" so it would still work. 
That said, I would also change

     select PCI_EXPRESS_GENERIC_BRIDGE
     select USB_XHCI_SYSBUS

for microvm to "imply".  Again, according to kconfig.rst

   Boards specify their constituent devices using ``imply`` and
   ``select`` directives.  A device should be listed under ``select`` if
   the board cannot be started at all without it.  It should be listed
   under ``imply`` if (depending on the QEMU command line) the board may
   or may not be started without it.

Thanks,

Paolo


