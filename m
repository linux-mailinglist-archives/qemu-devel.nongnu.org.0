Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBB65A8BC
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 04:32:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBp4Y-0002uj-PV; Sat, 31 Dec 2022 22:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBp4W-0002uN-Sp
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 22:31:40 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBp4V-0002AH-9f
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 22:31:40 -0500
Received: from [IPV6:2601:646:8600:40c1:5967:deb4:a714:2940]
 ([IPv6:2601:646:8600:40c1:5967:deb4:a714:2940])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 3013VRi51840087
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 31 Dec 2022 19:31:27 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3013VRi51840087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022120601; t=1672543888;
 bh=lR+4TdzkHpeKvvcDRlvTiBP6ffmLVC1yR5HIRaZiqGE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Mh39Voc1zeiiz6SOGBH3JBhx9oNvq1G3lb/EXlf0xoCPJ3JFx8l/Dpo3DCSoj07Qu
 N9o1IdNgkdKjgGEK0FOSI3O9PyGhgO4kwjkAwfq25pt6KnWzj5JQOhJJW0h//RqMW0
 TZNUT+hron3KS8trGua3eVH6f9MdQtSK8eqJAn7bJIMmleex0ypXv+ZgNA4oAwZjbz
 dwd0po5z8y5fDUNErsoqxnyjeNto2+2MHq5HMILOwYcYD1OXDnq/PeFv3FzLPTfAm3
 4oMW161e9MGX36vM3LSQ7OS2GsTUy5NZYRcDAfXXIRnQgyWyfYhPyF0Aq18AjZ2Cla
 GE4rmoGuBr3qQ==
Message-ID: <8f072588-7d66-0932-7486-ed9159ae93ae@zytor.com>
Date: Sat, 31 Dec 2022 19:31:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, philmd@linaro.org
References: <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com> <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com> <Y7A76+IBS4fnucrW@zn.tnic>
 <Y7A8qP05B0YRbQIN@zx2c4.com> <Y7A9nBud6UeH+wYd@zn.tnic>
 <Y7A+YELM7m5E2PUQ@zx2c4.com> <Y7BGIAL4z6o6FEI5@zn.tnic>
 <Y7B993P1+jYB/etX@zx2c4.com> <Y7CGzde+qPB7YJP4@zn.tnic>
 <60566f8b-c90f-12e7-c13e-94e9829eee2d@zytor.com>
In-Reply-To: <60566f8b-c90f-12e7-c13e-94e9829eee2d@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.153,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

On 12/31/22 19:21, H. Peter Anvin wrote:
>>
>>> Alternatively, setup_data could be relocated, the boot param protocol
>>> could be bumped, and then QEMU could conditionalized it's use of
>>> setup_data based on that protocol version. That'd work, but seems a bit
>>> more involved.
>>
>> I think this is at least worth considering because the kernel overwriting
>> setup_data after having been told where that setup_data is located is 
>> not really
>> nice.
>>
>> Well not explicitly at least - it gets the pointer to the first 
>> element and
>> something needs to traverse that list to know which addresses are 
>> live. But
>> still, that info is there so perhaps we need to take setup_data into
>> consideration too before decompressing...
>>

It would probably be a good idea to add a "maximum physical address for 
initrd/setup_data/cmdline" field to struct kernel_info, though. It 
appears right now that those fields are being identity-mapped in the 
decompressor, and that means that if 48-bit addressing is used, physical 
memory may extend past the addressable range.

	-hpa


