Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224717110F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 07:36:20 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7CmR-00048M-Ke
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 01:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7ClR-0003Or-Rp
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7ClQ-0003BE-AP
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:35:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29336
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7ClQ-00039l-4M
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582785315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLvDnEZQktqp8a57Y/BSlMi6trzldVMH09M5lHix0iY=;
 b=SrCaUaxpmeL+DmQHzYGPEdzf1UeSZiI5qU9F6sLy9RunDHnDFHCltIDE4wdvRI38f9pI8H
 xSZhP+nSG/ZrLQw0p378Vqv7f+1F9tUYDtyr6HiussrGWUX9wEaHFS7WxXJ+7evXFRqs1W
 +m5zEw71fs69rQpaCYfKEYYdkf3jFWo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-pQH8aIydPsCpXgkcwSp1vg-1; Thu, 27 Feb 2020 01:35:13 -0500
X-MC-Unique: pQH8aIydPsCpXgkcwSp1vg-1
Received: by mail-wm1-f69.google.com with SMTP id w12so322466wmc.3
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 22:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KLvDnEZQktqp8a57Y/BSlMi6trzldVMH09M5lHix0iY=;
 b=niRvcpEWa26orSMOQiSG0SDh1iQbV7St1nDjf+oOWO5DVs5aOIJfjQxBVMHQK+Tuy3
 sc/3fJkYOXv7aLGowWTjDL4cdIjvU1Ax/zhAn9XgPm3S2eAZ6mHolUVXNe52quZaO4Tp
 zkIIasRTYLzxPo5IkS7h8cXHzYSuBOwRfsbV/q82DaFvOqtZDB/sMxyCpmsS44i1U6Bq
 QtQpr0+vbB7m9hN0mvkiCwN1MONb4m8SUXTx0HRLdfW83eayjHHHOVC3gfCF/5S1Fat6
 KLXGme9TnZM4ShI9OvLr2W7d3D+EUWLPt2UNr+px4YMdeNvy+cBAkfpA0ej8pMCw98Af
 VwqA==
X-Gm-Message-State: APjAAAXWhy9UIyAb73YEAgsH9ZuDurrtM55D1kGmOu15+uusl7lxiMwb
 iRs0JeoxswIJL1ZFJ8/IT9ftR7tpCM4UaMjGJ97zxpWG3UH/1zx58TGw24s0C/OjcN1S61RcR/j
 bc3Z79l0S3Vh5Z6Q=
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr2791286wru.87.1582785312254; 
 Wed, 26 Feb 2020 22:35:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxK5YLtLq5Kjc0oooE/hjPAvY50b1/95b2nOn1aHyY0xfqYbnNjxYrwz5orCxGHt5NURaB+1w==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr2791254wru.87.1582785311886; 
 Wed, 26 Feb 2020 22:35:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:d0d9:ea10:9775:f33f?
 ([2001:b07:6468:f312:d0d9:ea10:9775:f33f])
 by smtp.gmail.com with ESMTPSA id o27sm6665589wro.27.2020.02.26.22.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 22:35:11 -0800 (PST)
Subject: Re: [PATCH qemu v7 0/5] spapr: Kill SLOF
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20200220061622.15064-1-aik@ozlabs.ru>
 <db675fc6-9d07-1780-134d-6a9279328b29@redhat.com>
 <68b71292-48db-e2ec-5f22-fe4580c2938e@ozlabs.ru>
 <4109357e-0912-9633-20ad-28269efb2422@redhat.com>
 <9fc15711-5d06-e73a-798c-6f7c9ee05884@ozlabs.ru>
 <1c8cffc2-9a4a-9389-814b-c40d60a6a919@redhat.com>
 <34b5114d-1023-dc01-dd1b-5019c2da47db@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8063379b-1e02-6e46-0657-72c1e0895235@redhat.com>
Date: Thu, 27 Feb 2020 07:35:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <34b5114d-1023-dc01-dd1b-5019c2da47db@ozlabs.ru>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/02/20 00:38, Alexey Kardashevskiy wrote:
> 
> 
> On 26/02/2020 22:34, Paolo Bonzini wrote:
>> On 26/02/20 00:58, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 21/02/2020 19:27, Paolo Bonzini wrote:
>>>> On 21/02/20 01:18, Alexey Kardashevskiy wrote:
>>>>> I am not quite sure I understood the request.  Write my own small
>>>>> firmware and replace GRUB with it? The firmware from 5/5 reads first 2
>>>>> sectors and the entire PReP, I could add there stuff if that helps (I
>>>>> have "work in progress" patch for the firmware with printk/etc borrowed
>>>>> from SLOF).
>>>>
>>>> Okay, that's great!  I'll take a look next week.
>>>
>>> Just to make sure I understood - you'll take a look on this series, you
>>> do not expect other patches on top, right?
>>
>> No, thanks.
>>
>>> ps. while I have your attention, what was the practical reason for
>>> including capstone to QEMU? Thanks,
>>
>> Newer versions of the binutils disassembler are GPLv3.
> 
> but why does qemu need this kind of disassembler at all? tcg does
> execution and it is not replaced by capstone.

For debugging (e.g. "x/5i $pc" from the monitor, or "-d in_asm" if
you're using TCG).

Paolo


