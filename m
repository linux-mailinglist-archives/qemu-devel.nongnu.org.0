Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A821D1DFC70
	for <lists+qemu-devel@lfdr.de>; Sun, 24 May 2020 04:24:02 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcgIz-0002yx-Ar
	for lists+qemu-devel@lfdr.de; Sat, 23 May 2020 22:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jcgI9-0002RM-OD
 for qemu-devel@nongnu.org; Sat, 23 May 2020 22:23:09 -0400
Received: from relay68.bu.edu ([128.197.228.73]:53568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jcgI7-0003eM-S8
 for qemu-devel@nongnu.org; Sat, 23 May 2020 22:23:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 04O2Malm030667
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 23 May 2020 22:22:39 -0400
Date: Sat, 23 May 2020 22:22:36 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2] hw/i386/vmport: Allow QTest use without crashing
Message-ID: <20200524022230.rij2ehcmerhoj3ur@mozz.bu.edu>
References: <20200518103113.9882-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200518103113.9882-1-f4bug@amsat.org>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/23 22:23:05
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200518 1231, Philippe Mathieu-Daudé wrote:
> Trying libFuzzer on the vmport device, we get:
> 
>   AddressSanitizer:DEADLYSIGNAL
>   =================================================================
>   ==29476==ERROR: AddressSanitizer: SEGV on unknown address 0x000000008840 (pc 0x56448bec4d79 bp 0x7ffeec9741b0 sp 0x7ffeec9740e0 T0)
>   ==29476==The signal is caused by a READ memory access.
>     #0 0x56448bec4d78 in vmport_ioport_read (qemu-fuzz-i386+0x1260d78)
>     #1 0x56448bb5f175 in memory_region_read_accessor (qemu-fuzz-i386+0xefb175)
>     #2 0x56448bb30c13 in access_with_adjusted_size (qemu-fuzz-i386+0xeccc13)
>     #3 0x56448bb2ea27 in memory_region_dispatch_read1 (qemu-fuzz-i386+0xecaa27)
>     #4 0x56448bb2e443 in memory_region_dispatch_read (qemu-fuzz-i386+0xeca443)
>     #5 0x56448b961ab1 in flatview_read_continue (qemu-fuzz-i386+0xcfdab1)
>     #6 0x56448b96336d in flatview_read (qemu-fuzz-i386+0xcff36d)
>     #7 0x56448b962ec4 in address_space_read_full (qemu-fuzz-i386+0xcfeec4)
> 
> X86CPU is NULL because QTest accelerator does not use CPU.
> Fix by returning default values when QTest accelerator is used.
> 

Ah - it was QTest. Thank you for this - I would always run into this
crash within a second of fuzzing.
-Alex

