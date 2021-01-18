Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E832F9E77
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:41:59 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Sv0-00018b-ET
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1StX-000074-4a
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:40:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1StP-0003qV-Th
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610970019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+0W24whe+iA6wwPKOj8wIkdX6E8uuDp60YaH23KRD4=;
 b=OAT0j8tCxLynKapjXwLtX5UF2vwmaP5CIiuV3apafeAC9YJ/HTYFfc3erdRwxkKxtnFgXd
 2rfUy4pK4WFg03s/lSFRD1O8lNFBcZZWKTlyajnvljdEMfWj6FL3PKF5bk6YxDMSpzV+3n
 Zbxneatw4ioHJUE2nfYwI7y9tvPT/Kw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-ZP8shskwNT61zacfb8AN5A-1; Mon, 18 Jan 2021 06:40:17 -0500
X-MC-Unique: ZP8shskwNT61zacfb8AN5A-1
Received: by mail-ed1-f69.google.com with SMTP id j12so3572864edq.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s+0W24whe+iA6wwPKOj8wIkdX6E8uuDp60YaH23KRD4=;
 b=sUTmF2MsNCDstMFtjg21fK22BGn1a1d2KMpwINhAX8woA7iDFN40AVbvXN88zlpDkk
 Z12YnnI5MtC0oV16rzArkw8GT0oz3pM32omdQcUIsHUtRnpdkyMUHvwFGmeg49cgnbBa
 SGE1TS/mSwknfv7xL/vwcJ3oGxWMyySCsn2k/qmewEcoIvLR2F6Bse3Ch9alfy8Q+hjJ
 Ex+KcGwEF9pC6LNw6qyJXABazjxtMceqdyJ1xvA95AjD8XSHBYtbINUbaUrAMyZxVr/a
 XhyQfSaARVMqgANy6AaCBSzHaZtdIj1SylNJ/Bz39Rh0Fa8lw3TatetbyJQQZ4zUpNsn
 FlmQ==
X-Gm-Message-State: AOAM531jtpNaiLsP02ytgPh+N8SG1zY6jkBFOVpWqtInwLu0uy9EJ8Af
 O/Ak/PfuSsuRu5iaeGhrfOX/6J3xPI6nnHtDicTmC3hBh/Ehku5g0JOL+76U0dgvVusiffeZJ2L
 iI0Wn5r3HAw3p5GQ=
X-Received: by 2002:a17:906:971a:: with SMTP id
 k26mr17341743ejx.279.1610970016072; 
 Mon, 18 Jan 2021 03:40:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJtct9evNiYD9EbED4qOko7dSqsiAI7XfS0aqxTBgREmKlj6Fa7xcSTYJY600ThX53Edg7Dw==
X-Received: by 2002:a17:906:971a:: with SMTP id
 k26mr17341736ejx.279.1610970015858; 
 Mon, 18 Jan 2021 03:40:15 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l16sm1810454edw.10.2021.01.18.03.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 03:40:14 -0800 (PST)
Subject: Re: [Qemu-devel] [PULL 7/7] hw/usb: avoid format truncation warning
 when formatting port name
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20190503065954.17069-1-kraxel@redhat.com>
 <20190503065954.17069-8-kraxel@redhat.com>
 <227c9e6b-61e4-d9ec-1b4b-b33d6323bbd9@redhat.com>
 <20210118113538.GF1789637@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4cc75f3-f4e5-a9f2-279b-d43370b0e1a1@redhat.com>
Date: Mon, 18 Jan 2021 12:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118113538.GF1789637@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 12:35 PM, Daniel P. Berrangé wrote:
> On Mon, Jan 18, 2021 at 12:31:07PM +0100, Philippe Mathieu-Daudé wrote:
>> Hello,
>>
>> On 5/3/19 8:59 AM, Gerd Hoffmann wrote:
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> hw/usb/hcd-xhci.c: In function ‘usb_xhci_realize’:
>>> hw/usb/hcd-xhci.c:3339:66: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 5 [-Wformat-trunca\
>>> tion=]
>>>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>>>       |                                                                  ^~
>>> hw/usb/hcd-xhci.c:3339:54: note: directive argument in the range [1, 2147483647]
>>>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>>>       |                                                      ^~~~~~~~~~~~~~~
>>>
>>> The xhci code formats the port name into a fixed length
>>> buffer which is only large enough to hold port numbers
>>> upto 5 digits in decimal representation. We're never
>>> going to have a port number that large, so aserting the
>>> port number is sensible is sufficient to tell GCC the
>>> formatted string won't be truncated.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Message-Id: <20190412121626.19829-5-berrange@redhat.com>
>>>
>>> [ kraxel: also s/int/unsigned int/ to tell gcc they can't
>>>           go negative. ]
>>>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>> ---
>>>  hw/usb/hcd-xhci.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>>> index d8472b4fea7f..2e9a839f2bf9 100644
>>> --- a/hw/usb/hcd-xhci.c
>>> +++ b/hw/usb/hcd-xhci.c
>>> @@ -3306,7 +3306,7 @@ static void usb_xhci_init(XHCIState *xhci)
>>>  {
>>>      DeviceState *dev = DEVICE(xhci);
>>>      XHCIPort *port;
>>> -    int i, usbports, speedmask;
>>> +    unsigned int i, usbports, speedmask;
>>>  
>>>      xhci->usbsts = USBSTS_HCH;
>>>  
>>> @@ -3336,6 +3336,7 @@ static void usb_xhci_init(XHCIState *xhci)
>>>                  USB_SPEED_MASK_LOW  |
>>>                  USB_SPEED_MASK_FULL |
>>>                  USB_SPEED_MASK_HIGH;
>>> +            assert(i < MAXPORTS);
>>>              snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>>>              speedmask |= port->speedmask;
>>>          }
>>> @@ -3349,6 +3350,7 @@ static void usb_xhci_init(XHCIState *xhci)
>>>              }
>>>              port->uport = &xhci->uports[i];
>>>              port->speedmask = USB_SPEED_MASK_SUPER;
>>> +            assert(i < MAXPORTS);
>>>              snprintf(port->name, sizeof(port->name), "usb3 port #%d", i+1);
>>>              speedmask |= port->speedmask;
>>>          }
>>>
>>
>> I am confused, I upgraded Fedora 32 -> 33 and am now getting this
>> error back, the assertion being apparently ignored:
> 
> I'm not seeing this on F33 myself, but our CI is still F32. We
> should upgrade that.
> 
> What are your configure args ?

Ah sorry, this is my --extra-cflags=-m32 config directory.


