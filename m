Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2F147254
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:05:31 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuijK-0007Nt-Nc
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuhEQ-0006Lc-2s
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuhEN-0005TH-Ol
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:29:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25681
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuhEN-0005Sh-Kd
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 13:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579804166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rWtqTu/+1viCQ5R6pcrx5pnYcc6j+Wtam76ISG6/Jg=;
 b=Pr7t8Lh1ElOrQ8F+aGuGkwnEhZ49LqmKp/J4vczCllQGDlNOO/j+3jO0NKHgPMnt+32zC+
 zANXE1Vhdi3ft0NI4giVpWmYOpciwurhOluswFWfn/hgO6ZRW+qe+4OL7bZDq871fdjpSI
 PGxzFtYw3neQWJVKBNLVa+ZCEerTd20=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-vbOuCjzKPoaB_6y84KsFzw-1; Thu, 23 Jan 2020 13:29:25 -0500
Received: by mail-wr1-f70.google.com with SMTP id o6so2319238wrp.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 10:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+88S/mukcu4lp7AZ1R7LomPnI5UULjF8AnaQP5sics=;
 b=PS3ul/TYGtBOvAbRPHM3olxRB03kHB5Mv7SPNNP3pdUE/KiCCvJ0TLpciNz3hIdmnZ
 TQopXMJF9XpOpTJhxdNbsq40Nr6uFZhazpLGoeIawaUjLmUE5Y8ZzMlj5I3PY0obC0cU
 sML/8mf9yo7Vjj44VRf1+dq0ePMc+nXo0QiqRS2HJZ68TpAPCG0zon32GuXj5QTHjW7t
 egASDRJqyMVoKK1A6oO/rQwf461Ore+Vs+hrB4lUD8hcsEB5AK5JBvH4GLWDuGMKCIC/
 PsFpTUZg9ZERxbGRXp4OWg+40AHaKG6RG78kDcQO2Gz7l92dZRK/WODgPjCfLw62hIBV
 jZHA==
X-Gm-Message-State: APjAAAVtzsaB/sVggA343pfF/v0tS284M92cusJ4q16lldIW8O1PFIdx
 r2f5EzadQxHD4Ic9PYTj+tAH3okcGztnnnDa1NVzFIpvTBlqOREkbFdGBFGtrOEHCP1YoJQ3Sg3
 6cTlqHMAFE64s8hw=
X-Received: by 2002:adf:b648:: with SMTP id i8mr18832316wre.91.1579804163195; 
 Thu, 23 Jan 2020 10:29:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzi1W7xEwtL/zuTjX6HijBnBG6bDIMMQ6XPzbkJrw42ZheY85BMS/fjbcDqeud3tr4M8dQQCg==
X-Received: by 2002:adf:b648:: with SMTP id i8mr18832304wre.91.1579804163024; 
 Thu, 23 Jan 2020 10:29:23 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id z21sm3821258wml.5.2020.01.23.10.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:29:22 -0800 (PST)
Subject: Re: [PATCH] tests/boot-serial-test: Allow the HPPA machine to shudown
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20200123003603.11610-1-f4bug@amsat.org>
 <a71b6c89-b36c-ebb6-3ff4-c3866309125c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0deda7d0-78a1-6618-e2b5-9b92b301557a@redhat.com>
Date: Thu, 23 Jan 2020 19:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a71b6c89-b36c-ebb6-3ff4-c3866309125c@redhat.com>
Content-Language: en-US
X-MC-Unique: vbOuCjzKPoaB_6y84KsFzw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/23/20 5:39 AM, Thomas Huth wrote:
> On 23/01/2020 01.36, Philippe Mathieu-Daud=C3=A9 wrote:
>> The boot-serial test uses SeaBIOS on HPPA, and expects to read the
>> "SeaBIOS wants SYSTEM HALT" string, see [*]:
>>
>>   122 void __VISIBLE __noreturn hlt(void)
>>   123 {
>>   124     if (pdc_debug)
>>   125         printf("HALT initiated from %p\n",  __builtin_return_addre=
ss(0));
>>   126     printf("SeaBIOS wants SYSTEM HALT.\n\n");
>>   127     asm volatile("\t.word 0xfffdead0": : :"memory");
>>   128     while (1);
>>   129 }
>>
>> A 'SYSTEM HALT' would really halts the CPU, but SeaBIOS implements
>> it as an infinite loop.
>>
>> If SeaBIOS does not use the expected serial port but another device,
>> we might poll the console indefinitely while the machine is halted.
>>
>> Allow the HPPA machine to 'shutdown'. When it does, we'll get
>> a qtest error:
>>
>>    $ make check-qtest-hppa
>>      TEST    check-qtest-hppa: tests/qtest/boot-serial-test
>>    ** (tests/qtest/boot-serial-test:31924): ERROR **: 01:12:37.604: Fail=
ed to find expected string. Please check '/tmp/qtest-boot-serial-sjxoM6Q'
>>    ERROR - Bail out! FATAL-ERROR: Failed to find expected string. Please=
 check '/tmp/qtest-boot-serial-sjxoM6Q'
>>    make: *** [tests/Makefile.include:628: check-qtest-hppa] Error 1
>=20
> The tests are run with -no-shutdown. Why does qemu exit in that case?

Because the HPPA firmware called HALT.

> Sounds like a bug in another place, and not in the boot-serial-test.

Yes, the bug is elsewhere, but with the bug the boot-serial-test hangs=20
forever.... No output on the console, qtest waiting indefinitely.


