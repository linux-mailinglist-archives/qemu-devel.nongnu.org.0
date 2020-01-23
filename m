Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB714733C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 22:38:28 +0100 (CET)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iukBG-00008S-TQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 16:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iukAG-00083m-Ao
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 16:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iukAD-0006YS-L3
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 16:37:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53064
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iukAD-0006Y2-CB
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 16:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579815440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XlTHO8WHEE9t25LoVisuvVHpQQp/TKWQFsQQ9VLBGDY=;
 b=MyiaOXIcY3axMQs5r1pSsKkawalScuLiDG3+MJUTg3SL1ScFprSSACWJXJfwdON8t071t5
 ykElGYYOubi5OS1NcC0e+tVnDH396jZu3tb2DmH9yGKW20+08F/HynUBNU0ieyXMdq5RZg
 KQaNnd2jlRTU/0iAj3TFkC8jXHBFRL8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-1DdYxr2aO5y9dp-6RPo8-A-1; Thu, 23 Jan 2020 16:37:16 -0500
Received: by mail-wr1-f69.google.com with SMTP id j4so50728wrs.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 13:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y7gax/A5KiNx88GJ4wsoGpzUNZ8rjuZRuMpi4a97L6M=;
 b=p352DBDue7ABRkTiUKrS6dKFBtWbg4F867WGJBp4ZN4NC28LPT0cMFtF2AHARQgh45
 6Wl1yyg7HOrN/THTGi+ze+jrYcfvtPqgK9C6C1DAWXuR7URq0ypBUU7W/wMMDBub4bjr
 pGc8mOEOE7bWhmO7wRpeqAeWaFopkKwXOQJ1zDopgyWTaCD7BaNnXa7piphPlcFTpGWq
 1PG7rmaaRKiV8uWsx13UVucoWyisJvbmkIRtHmSn2TiQ+HVzE5kmlNABLu4aApc2x5Ih
 dhg2kiTgLmttlPj88bZaUUlbcdC4pmiXm4tSy5N3LairQVwvmXUdWYXbfUZwuuXOTPmD
 bHpQ==
X-Gm-Message-State: APjAAAXFdRgv+5jyqkvkg6tL1xxn1frsPLzs4o0bqzUO5EqsR1ZbdSde
 5arJ0qbXM8CKmrDcgEqjgwkPrqPHdBgInArYMI23xyJ6dQXhpZlgTjE6uGBbaMupUL7wZ7jLKgI
 wpZgSz4L0mw9SKno=
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr118018wrw.126.1579815435001; 
 Thu, 23 Jan 2020 13:37:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyspX+3PpoYTXzRA/pvR4bqiz7xrSdrRAoRB/gwCNs10BtjPoSd9495PH9Upqw9Jft3Iigu7g==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr117995wrw.126.1579815434758; 
 Thu, 23 Jan 2020 13:37:14 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id 4sm4056759wmg.22.2020.01.23.13.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 13:37:14 -0800 (PST)
Subject: Re: [PATCH] tests/boot-serial-test: Allow the HPPA machine to shudown
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20200123003603.11610-1-f4bug@amsat.org>
 <a71b6c89-b36c-ebb6-3ff4-c3866309125c@redhat.com>
 <0deda7d0-78a1-6618-e2b5-9b92b301557a@redhat.com>
Message-ID: <1c474db4-a9b6-1103-b34d-c37a5338a91e@redhat.com>
Date: Thu, 23 Jan 2020 22:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0deda7d0-78a1-6618-e2b5-9b92b301557a@redhat.com>
Content-Language: en-US
X-MC-Unique: 1DdYxr2aO5y9dp-6RPo8-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/20 7:29 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/23/20 5:39 AM, Thomas Huth wrote:
>> On 23/01/2020 01.36, Philippe Mathieu-Daud=C3=A9 wrote:
>>> The boot-serial test uses SeaBIOS on HPPA, and expects to read the
>>> "SeaBIOS wants SYSTEM HALT" string, see [*]:
>>>
>>> =C2=A0 122 void __VISIBLE __noreturn hlt(void)
>>> =C2=A0 123 {
>>> =C2=A0 124=C2=A0=C2=A0=C2=A0=C2=A0 if (pdc_debug)
>>> =C2=A0 125=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("HALT=
 initiated from %p\n", =20
>>> __builtin_return_address(0));
>>> =C2=A0 126=C2=A0=C2=A0=C2=A0=C2=A0 printf("SeaBIOS wants SYSTEM HALT.\n=
\n");
>>> =C2=A0 127=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("\t.word 0xfffdead0": :=
 :"memory");
>>> =C2=A0 128=C2=A0=C2=A0=C2=A0=C2=A0 while (1);
>>> =C2=A0 129 }
>>>
>>> A 'SYSTEM HALT' would really halts the CPU, but SeaBIOS implements
>>> it as an infinite loop.
>>>
>>> If SeaBIOS does not use the expected serial port but another device,
>>> we might poll the console indefinitely while the machine is halted.
>>>
>>> Allow the HPPA machine to 'shutdown'. When it does, we'll get
>>> a qtest error:
>>>
>>> =C2=A0=C2=A0 $ make check-qtest-hppa
>>> =C2=A0=C2=A0=C2=A0=C2=A0 TEST=C2=A0=C2=A0=C2=A0 check-qtest-hppa: tests=
/qtest/boot-serial-test
>>> =C2=A0=C2=A0 ** (tests/qtest/boot-serial-test:31924): ERROR **: 01:12:3=
7.604:=20
>>> Failed to find expected string. Please check=20
>>> '/tmp/qtest-boot-serial-sjxoM6Q'
>>> =C2=A0=C2=A0 ERROR - Bail out! FATAL-ERROR: Failed to find expected str=
ing.=20
>>> Please check '/tmp/qtest-boot-serial-sjxoM6Q'
>>> =C2=A0=C2=A0 make: *** [tests/Makefile.include:628: check-qtest-hppa] E=
rror 1
>>
>> The tests are run with -no-shutdown. Why does qemu exit in that case?
>=20
> Because the HPPA firmware called HALT.
>=20
>> Sounds like a bug in another place, and not in the boot-serial-test.
>=20
> Yes, the bug is elsewhere, but with the bug the boot-serial-test hangs=20
> forever.... No output on the console, qtest waiting indefinitely.

Richard explained me on IRC what you probably meant, which was not=20
obvious to me at first.

Now I found in check_guest_output():

     /* Poll serial output... */
     while (1) {
         ...
         /* Wait at most 360 seconds.  */
         now =3D time(NULL);
         if (now - start >=3D 360) {
             break;
         }
         g_usleep(10000);
     }

$ QTEST_QEMU_BINARY=3Dhppa-softmmu/qemu-system-hppa \
   time tests/qtest/boot-serial-test -k
/hppa/boot-serial/hppa:
** (tests/qtest/boot-serial-test:18604): ERROR **: 22:33:25.010: Failed=20
to find expected string. Please check '/tmp/qtest-boot-serial-sZq7ljM'
Command terminated by signal 5
0.31user 0.66system 6:00.07elapsed 0%CPU

Indeed the test fails after 6min, I guess I didn't expect that much=20
while testing interactively.

So please disregard this patch.

Thanks,

Phil.


