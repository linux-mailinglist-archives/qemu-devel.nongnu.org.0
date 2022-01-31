Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC484A3E8E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:19:02 +0100 (CET)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERts-00022I-W9
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nERo5-0008Ka-06
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:13:01 -0500
Received: from relay64.bu.edu ([128.197.228.104]:53695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nERo2-0004op-Tg
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:13:00 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 20V8Bd0P008077
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 31 Jan 2022 03:11:42 -0500
Date: Mon, 31 Jan 2022 03:11:38 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: build-oss-fuzz CI job often times out
Message-ID: <20220131081138.etmpzep4hz7rgyxo@mozz.bu.edu>
References: <CAFEAcA8V0jAjv1HS8QRa9AQHCxg=BVVH_jYVMYUVSP-Szstq-Q@mail.gmail.com>
 <7a56fef0-0ac0-f4d5-eae7-23028e49d2bb@amsat.org>
 <ba4b4c1e-3328-4375-b877-9eec06f04ff1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba4b4c1e-3328-4375-b877-9eec06f04ff1@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 220131 0806, Thomas Huth wrote:
> > On 29/1/22 14:34, Peter Maydell wrote:
> > > Hi; the build-oss-fuzz gitlab CI job seems to intermittently
> > > but quite commonly hit the 1 hour timeout mark and get killed.
> > > Examples from the last couple of days:
> > > 
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2030815488
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2029246068
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2029013479
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2024871970
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2022584981
> > > 
> > > Can we do anything to cut down on the runtime of this job
> > > and make it reliably complete inside the time limit?
> 
> All the jobs that you've listed hang in the very same test
> (qtest-i386/boot-serial-test), so I assume it's rather a test that now hangs
> occasionally, and not a generic slowness (otherwise the jobs would fail
> sometimes earlier, sometimes later).
> 

Judging by this job, from one of those pipelines, the big qos-test is
next up after boot-serial-test (the last test that finishes
successfully):
https://gitlab.com/qemu-project/qemu/-/jobs/2024872156#L57

So something is likely timing out there, when built with ASAN..
-Alex


> Thus we likely have a regression in the code that only shows up occasionally
> in these builds... Can you mark a point in time when these issues first
> happened?
> 
>  Thomas
> 

