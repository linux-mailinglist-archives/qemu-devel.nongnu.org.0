Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3B12219A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 02:36:31 +0100 (CET)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih1mo-0007Vc-8A
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 20:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ih1lw-00073F-UA
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 20:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ih1lv-0006Km-4R
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 20:35:36 -0500
Received: from mga06.intel.com ([134.134.136.31]:27288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ih1lu-00064x-Rl
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 20:35:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 17:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="240238481"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.238])
 ([10.239.196.238])
 by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2019 17:35:23 -0800
Subject: Re: [PATCH v2 0/4] Add extra information to versioned CPU models
From: Tao Xu <tao3.xu@intel.com>
To: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
References: <20191209071303.24303-1-tao3.xu@intel.com>
Message-ID: <f7ee32e2-2d70-469b-7420-1305c25f93f8@intel.com>
Date: Tue, 17 Dec 2019 09:35:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209071303.24303-1-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for comments.

On 12/9/2019 3:12 PM, Tao Xu wrote:
> This series of patches will remove MPX from Denverton, remove Remove
> monitor from some CPU models. Add additional information for -cpu help
> to indicate the changes in this version of CPU model.
> 
> The output is as follows:
> ./x86_64-softmmu/qemu-system-x86_64 -cpu help | grep "\["
> x86 Broadwell-v2          Intel Core Processor (Broadwell) [no TSX]
> x86 Broadwell-v3          Intel Core Processor (Broadwell) [IBRS]
> x86 Broadwell-v4          Intel Core Processor (Broadwell) [no TSX, IBRS]
> x86 Cascadelake-Server-v2  Intel Xeon Processor (Cascadelake) [ARCH_CAPABILITIES]
> x86 Cascadelake-Server-v3  Intel Xeon Processor (Cascadelake) [ARCH_CAPABILITIES, no TSX]
> x86 Denverton-v2          Intel Atom Processor (Denverton) [no MPX, no MONITOR]
> x86 Dhyana-v2             Hygon Dhyana Processor [no MONITOR]
> x86 EPYC-v2               AMD EPYC Processor [IBPB]
> x86 EPYC-v3               AMD EPYC Processor [IBPB, no MONITOR]
> x86 Haswell-v2            Intel Core Processor (Haswell) [no TSX]
> x86 Haswell-v3            Intel Core Processor (Haswell) [IBRS]
> x86 Haswell-v4            Intel Core Processor (Haswell) [no TSX, IBRS]
> x86 Icelake-Client-v2     Intel Core Processor (Icelake) [no TSX]
> x86 Icelake-Server-v2     Intel Xeon Processor (Icelake) [no TSX]
> x86 IvyBridge-v2          Intel Xeon E3-12xx v2 (Ivy Bridge) [IBRS]
> x86 Nehalem-v2            Intel Core i7 9xx (Nehalem Class Core i7) [IBRS]
> x86 Opteron_G3-v2         AMD Opteron 23xx (Gen 3 Class Opteron) [no MONITOR]
> x86 SandyBridge-v2        Intel Xeon E312xx (Sandy Bridge) [IBRS]
> x86 Skylake-Client-v2     Intel Core Processor (Skylake) [IBRS]
> x86 Skylake-Client-v3     Intel Core Processor (Skylake) [no TSX, IBRS]
> x86 Skylake-Server-v2     Intel Xeon Processor (Skylake) [IBRS]
> x86 Skylake-Server-v3     Intel Xeon Processor (Skylake) [no TSX, IBRS]
> x86 Snowridge-v2          Intel Atom Processor (SnowRidge) [no MPX]
> x86 Snowridge-v3          Intel Atom Processor (SnowRidge) [no MPX, no MONITOR]
> x86 Westmere-v2           Westmere E56xx/L56xx/X56xx (Nehalem-C) [IBRS]
> 
> Changes in v2:
>      - correct the note of Cascadelake v3 (Xiaoyao)
> 
> Tao Xu (4):
>    target/i386: Add Denverton-v2 (no MPX) CPU model
>    target/i386: Remove monitor from some CPU models
>    target/i386: Add new property note to versioned CPU models
>    target/i386: Add notes for versioned CPU models
> 
>   target/i386/cpu.c | 112 +++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 85 insertions(+), 27 deletions(-)
> 
> --
> 2.20.1
> 
> 


