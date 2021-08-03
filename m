Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CD3DEF4A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:49:40 +0200 (CEST)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAunb-0008Cp-AK
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAulu-0005hD-Nz; Tue, 03 Aug 2021 09:47:54 -0400
Received: from relay68.bu.edu ([128.197.228.73]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAult-00007C-4U; Tue, 03 Aug 2021 09:47:54 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 173DkbXT010490
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 3 Aug 2021 09:46:41 -0400
Date: Tue, 3 Aug 2021 09:46:37 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1 v2 0/2] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
Message-ID: <20210803134637.nfrjsnhjnagjt6e7@mozz.bu.edu>
References: <20210802235524.3417739-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210802235524.3417739-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210803 0155, Philippe Mathieu-Daudé wrote:
> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
> 
> The change is (now) simple enough for the next rc.
> 
> Since v1:
> - Simplified/corrected following Peter's suggestion
> 
> Philippe Mathieu-Daudé (2):
>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>     CMD30
> 

Fuzzed this for 20 mins, based on the OSS-Fuzz corpus, without finding
anything.

./qemu-fuzz-i386 --fuzz-target=generic-fuzz-sdhci-v3 -jobs=4 -workers=4 \
-focus_function=sd_wpbits \
~/oss-fuzz/qemu_qemu-fuzz-i386-target-generic-fuzz-sdhci-v3/  

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

>  hw/sd/sd.c                     |  9 ++++++++-
>  tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> -- 
> 2.31.1
> 

