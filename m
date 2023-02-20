Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4969D65B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 23:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUEiD-0008Rq-Lc; Mon, 20 Feb 2023 17:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pUEiB-0008Rf-Bu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:32:43 -0500
Received: from gold.funkthat.com ([2001:470:800b::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pUEi9-0007g0-DX
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:32:43 -0500
Received: from gold.funkthat.com (localhost [127.0.0.1])
 by gold.funkthat.com (8.15.2/8.15.2) with ESMTPS id 31KMWWRC037145
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 20 Feb 2023 14:32:32 -0800 (PST)
 (envelope-from jmg@gold.funkthat.com)
Received: (from jmg@localhost)
 by gold.funkthat.com (8.15.2/8.15.2/Submit) id 31KMWVvI037142;
 Mon, 20 Feb 2023 14:32:31 -0800 (PST) (envelope-from jmg)
Date: Mon, 20 Feb 2023 14:32:31 -0800
From: John-Mark Gurney <jmg@funkthat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Detecting qemu from guest on arm/hvf (apple arm)
Message-ID: <20230220223231.GO95670@funkthat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8UDrzWQjutAwWQE2kzP7-RgjbFCnWb2j4ve+UARnHh7A@mail.gmail.com>
X-Operating-System: FreeBSD 11.3-STABLE amd64
X-PGP-Fingerprint: D87A 235F FB71 1F3F 55B7  ED9B D5FF 5A51 C0AC 3D65
X-Files: The truth is out there
X-URL: https://www.funkthat.com/
X-Resume: https://www.funkthat.com/~jmg/resume.html
X-TipJar: bitcoin:13Qmb6AeTgQecazTWph4XasEsP7nGRbAPE
X-to-the-FBI-CIA-and-NSA: HI! HOW YA DOIN? can i haz chizburger?
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (gold.funkthat.com [127.0.0.1]); Mon, 20 Feb 2023 14:32:32 -0800 (PST)
Received-SPF: none client-ip=2001:470:800b::2;
 envelope-from=jmg@gold.funkthat.com; helo=gold.funkthat.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, FAKE_REPLY_C=1.486,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hello Peter,

btw, please keep me CC'd, as I'm not subscribed to the mailing list.

> I guess the question is, why do you want to know? Typically

The main reason is that FreeBSD (and other operating systems)
adjust some of the clock periods to be longer for better
effeciency.  When FreeBSD detects that it's a VM, is slows
down hz to 100 instead of 1000:
https://cgit.freebsd.org/src/tree/sys/kern/subr_param.c#n177

And in my case, if I didn't set hz to 100 manually, even an
idle machine would consume tons of host CPU, and on top of it
(I'm not sure why), it would run at a constant >1000 int/s,
compared to running hz at 100 where the int/s would drop to
around 50/s...

I'm not sure how good/bad the time counter is on ARM hardware
as I'm more familar w/ x86 time counter hardware, and I do know
that there's a large variety of quality of time counter hardware
and the expense to accessing it.

FreeBSD is using the ARM MPCore Timecounter, and it reports:
kern.timecounter.tc.ARM MPCore Timecounter.quality: 1000
kern.timecounter.tc.ARM MPCore Timecounter.frequency: 24000000
kern.timecounter.tc.ARM MPCore Timecounter.counter: 2182594876
kern.timecounter.tc.ARM MPCore Timecounter.mask: 4294967295

There isn't any other time counter hardware reported (except dummy,
but that isn't usable)...

FreeBSD has code to detect hyperv and xen, and detect VMWare through
SMBios.

> the guest OS shouldn't care about whether it's running
> on bare metal, under a hypervisor, or under emulated QEMU,
> except to the extent that it wants to use specific features,
> in which case the question is more "how do I query for the
> existence of feature X?".

Thanks for your help.
-- 
  John-Mark Gurney				Voice: +1 415 225 5579

     "All that I will do, has been done, All that I have, has not."

