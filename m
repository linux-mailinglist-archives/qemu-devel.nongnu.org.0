Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D15F2FF586
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:12:24 +0100 (CET)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gJb-000747-90
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l2gGT-0005bZ-Bd
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:09:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:18391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l2gGP-0007AE-V3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:09:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F5BE7456E3;
 Thu, 21 Jan 2021 21:09:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 753A47456B8; Thu, 21 Jan 2021 21:09:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7364D7456B7;
 Thu, 21 Jan 2021 21:09:00 +0100 (CET)
Date: Thu, 21 Jan 2021 21:09:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] tcg: Dynamically allocate temporaries
In-Reply-To: <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
Message-ID: <4d24ab64-6b6-ae28-4e34-9d68c99a4a48@eik.bme.hu>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
 <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
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

On Wed, 20 Jan 2021, BALATON Zoltan wrote:
> On Tue, 19 Jan 2021, Richard Henderson wrote:
>> My recent change for caching tcg constants has, in a number of cases,
>> overflowed the statically allocated array of temporaries.  Change to
>> dynamic allocation.
>
> This seems to work for me so
>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> but have you done any performance tests to check that this actually improves 
> emulation speed? To mee it seems slower. Booting AmigaOS on sam460ex with 
> c0dd6654f207 (just before your TCG series) takes:
>
> real	0m33.829s
> user	0m34.432s
> sys	0m0.296s
>
> but on HEAD with this series:
>
> real	0m44.381s
> user	0m46.058s
> sys	0m0.532s
>
> This is noticable decrease in speed also without measuring it. With just 
> increasing the TCG_MAX_TEMPS to 2048 on 7c79721606be without this series I 
> get:
>
> real	0m42.681s
> user	0m44.208s
> sys	0m0.435s
>
> So the performance regression is somewhere in the original series not in this 
> fix up series.

I've tried to do more measurements to identify where it got slower but I 
could not reproduce it today. I'm now getting around 42 seconds both 
before and after the series so not sure what made it faster before but 
it's probably not because of a code change then.

Regards,
BALATON Zoltan

