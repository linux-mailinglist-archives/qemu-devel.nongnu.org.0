Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C724D063B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:18:39 +0100 (CET)
Received: from localhost ([::1]:42350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHwM-00032j-3r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nRGhU-0001yo-UW
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:59:12 -0500
Received: from outbound-ss-761.bluehost.com ([74.220.211.250]:52269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nRGhR-0001BG-C2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:59:11 -0500
Received: from cmgw12.mail.unifiedlayer.com (unknown [10.0.90.127])
 by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id C3B1E1003E987
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 16:58:56 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with ESMTP
 id RGhEnMKYqctgJRGhEnPkhT; Mon, 07 Mar 2022 16:58:56 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=Oq2Kdwzt c=1 sm=1 tr=0 ts=622639d0
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=o8Y5sQTvuykA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=20KFwNOVAAAA:8
 a=ZUl4uMMtE3todO9C-LYA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eFeoocJp0qP8vsEsHydoAqJ0sa5t6FlUIKg9oWxTk80=; b=WQ5+mwa0Cj9nUzj9nvhFc/+RV4
 NfYC7WxGiiT3rYE72LuVNg81t9AGC2hqIrqBxaMC0+ySBj+gY4z5tnm1k9gDQIMn9b2JZhsf9Hfm3
 2PpsFgO/hjI3SiPqFX4gn0ySt;
Received: from 75-166-141-253.hlrn.qwest.net ([75.166.141.253]:47636
 helo=prentzel) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1nRGhD-003b7W-QP; Mon, 07 Mar 2022 09:58:55 -0700
From: Tom Tromey <tom@tromey.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
X-Attribution: Tom
Date: Mon, 07 Mar 2022 09:58:54 -0700
In-Reply-To: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Thu, 3 Mar 2022 11:22:32 +0000")
Message-ID: <87mti11yy9.fsf@tromey.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 75.166.141.253
X-Source-L: No
X-Exim-ID: 1nRGhD-003b7W-QP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-141-253.hlrn.qwest.net (prentzel)
 [75.166.141.253]:47636
X-Source-Auth: tom+tromey.com
X-Email-Count: 17
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Received-SPF: pass client-ip=74.220.211.250; envelope-from=tom@tromey.com;
 helo=outbound-ss-761.bluehost.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Mar 2022 13:16:26 -0500
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
Cc: gdb@sourceware.org, tom@tromey.com, qemu-devel@nongnu.org, pedro@palves.net,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>>> "Stefan" == Stefan Hajnoczi <stefanha@redhat.com> writes:

Stefan> I hoped that "select-frame address ADDRESS" could be used instead so
Stefan> this would work on coredumps too. Unfortunately "select-frame" only
Stefan> searches stack frames that GDB is already aware of, so it cannot be used
Stefan> to backtrace coroutine stacks.

I wonder if "select-frame view" is closer to what you want.

I can't attest to how well it works or doesn't work.  I've never tried
it.

Stefan> Is there a way to backtrace a stack at an arbitrary address in GDB?

IMO this is just a longstanding hole in GDB.  Green threads exist, so it
would be good for GDB to have a way to inspect them.

For Ada, this problem was solved by adding knowledge of the runtime to
GDB itself -- that's basically what the "ravenscar" stuff is about.  Not
necessarily an approach I'd recommend.

I think the main problem with adding green thread support is just
finding someone to do the work.  Personally I think a decent approach
would be to add some core code to handle this, and then expose some
necessary bits via the Python API, so that user programs like qemu could
ship Python code that would replicate the ideas in the ravenscar layer
-- grovelling around in the inferior data structures to find info about
the thread.

Note that some of the GDB work might be complicated.  For ravenscar,
there's still an AdaCore-local patch (sent to gdb-patches but not really
suitable for inclusion) to avoid problems with "random thread switches"
-- there were problems where the current thread would, from GDB's
perspective, unexpectedly change when single-stepping through the green
scheduler.

Tom

