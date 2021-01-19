Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22A2FC469
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:07:15 +0100 (CET)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l205i-0001UY-LB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l204t-0000sw-8s
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:06:23 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l204q-00034S-G5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:06:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 58A4A7456E3;
 Wed, 20 Jan 2021 00:06:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 289267456B7; Wed, 20 Jan 2021 00:06:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 271127456B4;
 Wed, 20 Jan 2021 00:06:16 +0100 (CET)
Date: Wed, 20 Jan 2021 00:06:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] tcg: Dynamically allocate temporaries
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
Message-ID: <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, alistair23@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021, Richard Henderson wrote:
> My recent change for caching tcg constants has, in a number of cases,
> overflowed the statically allocated array of temporaries.  Change to
> dynamic allocation.

This seems to work for me so

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

but have you done any performance tests to check that this actually 
improves emulation speed? To mee it seems slower. Booting AmigaOS on 
sam460ex with c0dd6654f207 (just before your TCG series) takes:

real	0m33.829s
user	0m34.432s
sys	0m0.296s

but on HEAD with this series:

real	0m44.381s
user	0m46.058s
sys	0m0.532s

This is noticable decrease in speed also without measuring it. With just 
increasing the TCG_MAX_TEMPS to 2048 on 7c79721606be without this series I 
get:

real	0m42.681s
user	0m44.208s
sys	0m0.435s

So the performance regression is somewhere in the original series not in 
this fix up series.

> I'll note that nothing in check-acceptance triggers this overflow.
> Anyone care to add some more test cases there?

The proposed test for the upcoming pegasos2 machine may also catch this 
(when that will be merged, its dependencies are still under review) or the 
sam460ex test that currently only checks the firmware could be enhanced to 
try to boot AROS if somebody wants to do that. The drawback is that it 
needs an external iso whereas the current test doesn't need any additional 
images but it did not catch problems with IRQ and neither this problem 
with TCG temps. This problem was also found with riscv and mips I think 
but don't know if those would be easier to test.

Regards,
BALATON Zoltan

