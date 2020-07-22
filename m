Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92796229140
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 08:49:37 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy8ZM-0006jF-Dv
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 02:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jy8TO-0004AW-4A
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 02:43:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jy8TM-00010A-5A
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 02:43:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0EF5A40627;
 Wed, 22 Jul 2020 09:43:13 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id B1B4471;
 Wed, 22 Jul 2020 09:43:13 +0300 (MSK)
Subject: Re: [RFC PATCH-not-for-5.1? v2] hw/isa/isa-bus: Ensure ISA I/O
 regions are 8/16-bit accessible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200720185758.21280-1-f4bug@amsat.org>
 <d4fbf384-91cd-2820-abd8-157f9849ef53@msgid.tls.msk.ru>
 <c4388215-aee7-f609-9f19-8e2a66675971@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d0c1aa70-47c4-ce5b-fdea-1d62a830308d@msgid.tls.msk.ru>
Date: Wed, 22 Jul 2020 09:43:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c4388215-aee7-f609-9f19-8e2a66675971@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 02:43:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.07.2020 15:29, Philippe Mathieu-Daudé wrote:
> On 7/20/20 9:45 PM, Michael Tokarev wrote:
...
>> For now we don't have any released qemu version with this situation
>> so not many project enabled workarounds for broken qemu behavour
>> like the xen-devel link above.

Note: all of the entries below have min_access_size = max_access_size = 0
I dunno what it gives us, but it is a different issue.

>> qemu-system-x86_64: ISA device 'kvm-i8259' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'kvm-i8259' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'kvm-i8259' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'kvm-i8259' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'mc146818rtc' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'kvm-pit' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'isa-pcspk' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'isa-serial' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'i8042' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'i8042' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'vmport' requires I/O max_access_size of 2
>> qemu-system-x86_64: ISA device 'port92' requires I/O max_access_size of 2
> 
> This is better to find the full list:

I found no other entries which restrict access to >1.

/mjt

