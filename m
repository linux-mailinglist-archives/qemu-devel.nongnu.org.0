Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151D2A67D8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:38:34 +0100 (CET)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKrp-0006NM-0y
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kaKfn-00074E-Pt
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:26:07 -0500
Received: from relay64.bu.edu ([128.197.228.104]:37919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kaKfl-0000Y8-RT
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:26:07 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0A4FP6Jp001017
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 4 Nov 2020 10:25:09 -0500
Date: Wed, 4 Nov 2020 10:25:06 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <ppandit@redhat.com>
Subject: Re: Ramping up Continuous Fuzzing of Virtual Devices in QEMU
Message-ID: <20201104152506.abplvggv2ll36m6v@mozz.bu.edu>
References: <20201022161938.7clfymu6a3zl46s2@mozz.bu.edu>
 <20201022162416.iccjosbeg753qbzc@mozz.bu.edu>
 <20201022163925.GE428835@redhat.com>
 <p2qq7p64-r88p-s228-133q-n770po2ssonp@erqung.pbz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p2qq7p64-r88p-s228-133q-n770po2ssonp@erqung.pbz>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 10:26:04
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.379, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, rjones@redhat.com,
 0ops@0ops.net, liq3ea@gmail.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, andrey.shinkevich@virtuozzo.com, dimastep@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201104 1600, P J P wrote:
> +-- On Thu, 22 Oct 2020, Daniel P. BerrangÃ© wrote --+
> | On Thu, Oct 22, 2020 at 12:24:16PM -0400, Alexander Bulekov wrote:
> | > > Once [2] lands upstream, we should see a significant uptick in oss-fuzz 
> | > > reports, and I hope that we can develop a process to ensure these bugs 
> | > > are properly dealt with. One option we have is to make the reports 
> | > > public immediately and send notifications to qemu-devel. This is the 
> | > > approach taken by some other projects on oss-fuzz, such as LLVM. Though 
> | > > its not on oss-fuzz, bugs found by syzkaller in the kernel, are also 
> | > > automatically sent to a public list. The question is:
> | > > 
> | > > What approach should we take for dealing with bugs found on oss-fuzz?
> | 
> | If we assume that a non-negligible number of fuzz bugs will be exploitable
> | by a malicious guest OS to break out into the host, then I think it is
> | likely undesirable to make them public immediately without at least a basic
> | human triage step to catch possibly serious security issues.
> 
> * Maybe the proposed 'qemu-security' list can receive such issue reports.  It 
>   is more close than qemu-devel.
> 
>   But it also depends on the quantum of traffic oss-fuzz generates. We don't 
>   want to flood/overwhelm qemu-security list or any other list for that 
>   matter.
> 

If I understand correctly, this is analogous to what happens with
Coverity reports. Access to Coverity is closed (not sure if there is a
process to apply for access). It also seems that there is a push to fix
CID issues prior to new releases. Maybe a similar process can be used for
fuzzing?

> * Human triage is required to know potential impact of an issue before it is 
>   sent to a public list. It would not be good to send guest-to-host-escape
>   type issues directly to a public list.
> 
> * Ideally preliminary human triage should be done on the fuzzers' side.  
>   After it hits an issue, someone should have a look at it before sending an 
>   email to a list OR maintainer(s).
> 
>   Ex. TCG issues are generally not considered for CVE. They need not go to a
>   security list.

Of all the issues found by the fuzzer, I think there are two major
categories of "false-positives".
    * Intentionally-triggerable assertion failures
      (e.g. "assert Feature X not supported !")
    * Problems only triggerable through CPU (e.g. problems related to
      referencing the thread-local "current_cpu" variable.

These should be a minority of all issues for which we can automatically
generate qtest reproducers. As far as I know, OSS-Fuzz isn't fuzzing any
devices unsupported by KVM. 

Thanks
-Alex

> 
> 
> 
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


