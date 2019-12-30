Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D312CE98
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 10:46:54 +0100 (CET)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilrdV-0007aG-HQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Dec 2019 04:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilrcS-00078f-HK
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:45:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilrcQ-0004Jk-Va
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:45:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43322
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilrcQ-0004Dv-LR
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 04:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577699143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iW7nMxFhEo2bJ3ST+MPwnSpS4iT1IljCprc3SZFHBhI=;
 b=GtSKJp/rw6gWRSPTmbX4yAiPLVnQUcB+u146KoESgrOZ3PCUXwyxDsD9aFLlxxMAY6G3B1
 VGfBh6NoyYoyBvQRGZQbDmhqZYQgDogBQrakzCSWzu+Z7WhQtqZs4Z74/iSeYcG8YONbXL
 JsFPQiKyf1PwkdK/r3sTL6DKEqQFJGA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-cUyUzpaTOSSSFRl4MnXyRA-1; Mon, 30 Dec 2019 04:45:40 -0500
Received: by mail-wr1-f71.google.com with SMTP id b13so17402045wrx.22
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 01:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkNXsGYMH7XXqFZaOCveKnF8g5dP10q1/lJf2KIn4LY=;
 b=hGSdg+fxTavDs+7qzVjlPmDRd8UjjPk4Ylkoh2Jv9WsuFcWng8H1vryev2SITPC5JV
 On8DvEgoiDXhNYgpP/JrM+ztsxs9oMP5WTrAc5LQQiOCipbFxj1odx24zW6QPPOxBmYq
 lqJkn1X+Qn/e/0ZPkjTndqjlmzmj4TfpC/XIqsMNpgOURwigpq3FKwRYglWwC3oiscPN
 WnF7x1Wn7L1rk+DmCiY0QqBooPT9hUxowkhqZ+LMIUjoTt8H8m78X+jfFn38mI2r9wzh
 bFTUueH31cNkbqBlFcxPgCdD86nqN7An+gNPzOxyDhHszHCn21Atz1OwpsADtMZIa7UV
 UfXw==
X-Gm-Message-State: APjAAAUjjvEL4aYJAghDTg4Vwrg65/rihWs3zQERe9dQjdW01/Wm+esr
 AQeeHECM/IOmPSrB0pGOiHaIkDH8UbgfDUFtEetvFju1uy00/AJz2L7wbyCrhMPdexneui88U4+
 npfrIeY3wf0l77io=
X-Received: by 2002:a1c:a543:: with SMTP id o64mr33980282wme.108.1577699139194; 
 Mon, 30 Dec 2019 01:45:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyg7CCukh15CascqZJ+dzk9A535hbmtlgWy+F+wKw4jiY5tZz32J49nBbk1D8zbewDdpinofA==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr33980259wme.108.1577699138883; 
 Mon, 30 Dec 2019 01:45:38 -0800 (PST)
Received: from ?IPv6:2a01:cb18:8372:6b00:691b:aac5:8837:d4da?
 ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id q3sm46407696wrn.33.2019.12.30.01.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 01:45:38 -0800 (PST)
Subject: Re: [PATCH] x86: Check for machine state object class before
 typecasting it
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
References: <7cc91bab3191bfd7e071bdd3fdf7fe2a2991deb0.1577692822.git.mprivozn@redhat.com>
 <bda93e70-f737-4384-0422-3901767b6330@redhat.com>
 <e70937bd-15e9-aa75-d894-b32b43052b6a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b718e77c-9b49-9c18-7b9b-55333ab0afe5@redhat.com>
Date: Mon, 30 Dec 2019 10:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e70937bd-15e9-aa75-d894-b32b43052b6a@redhat.com>
Content-Language: en-US
X-MC-Unique: cUyUzpaTOSSSFRl4MnXyRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/19 10:35 AM, Michal Pr=C3=ADvozn=C3=ADk wrote:
> On 12/30/19 9:41 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 12/30/19 9:00 AM, Michal Privoznik wrote:
>>> In v4.2.0-246-ged9e923c3c the SMM property was moved from PC
>>
>> Typo v4.2.0-246-ged9e923c3c -> ed9e923c3c.
>=20
> This depends on how you format the hash :-)
> I've used 'git describe ed9e923c3c' because I find it more readable for
> us humans (at least we see what version the commit was introduced in).
> But I don't know what the praxis is in qemu.

Hmm I never used it. Your explanation makes sense, but the tag confused=20
me because I don't have it locally. However git (and gitk) seems clever=20
enough to only use the useful part:

$ git show randomcrap-ged9e923c3c
commit ed9e923c3c9a2c50c4e82ba178b3fb1feba56867
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu Dec 12 17:28:01 2019 +0100

     x86: move SMM property to X86MachineState

FYI My output is different:

$ git describe ed9e923c3c
pull-target-arm-20191216-1-199-ged9e923c3c

>>> machine class to x86 machine class. Makes sense, but the change
>>> was too aggressive: in target/i386/kvm.c:kvm_arch_init() it
>>> altered check which sets SMRAM if given machine has SMM enabled.
>>> The line that detects whether given machine object is class of
>>> PC_MACHINE was removed from the check. This makes qemu try to
>>> enable SMRAM for all machine types, which is not what we want.
>>>
>>
>> Fixes: ed9e923c3c
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Thanks,
> Michal
>=20


