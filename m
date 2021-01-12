Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A868F2F3620
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:49:14 +0100 (CET)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMr3-00020i-Nt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzMoW-00018B-Na
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:46:36 -0500
Received: from uk.hasbox.com ([2a01:7e00::f03c:91ff:fe91:5fdc]:56667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzMoU-0002yk-SS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:46:36 -0500
Received: from [192.168.86.42] (dev.hasbox.com [151.236.217.240])
 (authenticated bits=0)
 by uk.hasbox.com (8.15.2/8.15.2) with ESMTPSA id 10CGkUQP010553
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 12 Jan 2021 16:46:32 GMT
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
 <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
From: Dave <dave@0bits.com>
Message-ID: <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
Date: Tue, 12 Jan 2021 20:46:29 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:7e00::f03c:91ff:fe91:5fdc;
 envelope-from=dave@0bits.com; helo=uk.hasbox.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

While this (option 2) partially works, it will still search for 
/nonexistent/libexec/qemu-bridge-helper for example so seems that some 
paths are still absolute and some relative.

To explain, what we are expecting that we compile one binary with the 
relevant options, test that and then it goes into production. If we 
compile with --prefix=/usr (it's final resting place will be /usr/bin) 
then everything works as expected once it is in production (since 
/usr/share/qemu, /usr/libexec, /etc/qemu exists as expected).  However 
when we are testing the binary in a directory /root/qemu/5.2.0 with 
--prefix=/usr it breaks since it converts the firmware and bios paths to 
/root/qemu/5.2.0/../share/qemu. This means we need to recompile twice 
with relevant prefixes since if i use --prefix=/nonexistent then we 
can't find the qemu-bridge-helper when the binary goes into production.

It would be nicer with the relocatable binary took some fixed paths from 
/etc/qemu.conf for the bridge-helper, firmware, bios, qemu-ifup/down.

thanks
Dave


On 12/01/2021 18:48, Paolo Bonzini wrote:
> On 12/01/21 15:05, Dave wrote:
>> Is seem that absolute firmwarepath compilation option is converted  to 
>> relocatable in 5.2.0 qemu.
>>
>> # QEMU configure log Tue 12 Jan 14:46:41 GST 2021
>> # Configured with: '../configure' '--prefix=/usr' 
>> '--sysconfdir=/etc/qemu' '--disable-bochs' 
>> '*--firmwarepath=/usr/share/qemu:/usr/share/qemu-firmware*'
>> #
> 
> Yes, all paths within the prefix are relocated.  The workaround is 
> simply to configure the intended prefix with configure:
> 
> ./configure --prefix=/root/qemu ...
> 
> or if you don't know the prefix:
> 
> ./configure --prefix=/nonexistent ...
> 
> Because /usr/share/qemu and /usr/share/qemu-firmware are outside /usr, 
> they will be treated as absolute just like /etc/qemu.
> 
> Thanks,
> 
> Paolo
> 
>> And trying to run the executable
>>
>>     bash-5.1# ./qemu-system-x86_64
>>     qemu: could not load PC BIOS 'bios-256k.bin'
>>
>> If i print out the resultant binary paths
>>
>>     bash-5.1# ./qemu-system-x86_64 -L help
>>     /root/qemu/../share/qemu
>>     /root/qemu/../share/qemu-firmware
>>
>> So there is no way to have a absolute path for firmware /bios and all 
>> qemu's that we test need to be at the right directory nesting to find 
>> firmware, bios etc or else they all need their own duplicate firmware 
>> files. Firmware path needs to honor the absolute paths i believe.
>>
> 

