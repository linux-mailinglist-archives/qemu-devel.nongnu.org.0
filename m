Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C374D0649
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:21:09 +0100 (CET)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHym-0000NU-LG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nRHDu-0003hK-O2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:32:42 -0500
Received: from qproxy1-pub.mail.unifiedlayer.com ([173.254.64.10]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nRHDs-0006xA-4W
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:32:41 -0500
Received: from outbound-ss-761.bluehost.com (outbound-ss-761.bluehost.com
 [74.220.211.250])
 by qproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id D93A4802E89F
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 17:32:37 +0000 (UTC)
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
 by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id 601D610047AAD
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 17:30:37 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with ESMTP
 id RHBsnwgSxwm8iRHBtny8sy; Mon, 07 Mar 2022 17:30:37 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=DpSTREz+ c=1 sm=1 tr=0 ts=6226413d
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=o8Y5sQTvuykA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=2mottZ3TzAcfEraIx6QA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OiQd9bmJK/1bRHjOOTVLJnOzNeuSIhQa++nU1UsQMww=; b=dNCJsc5PUYmQ00GUXBJIPxunYG
 eSmRisIcezk8tGd3ft2o74Jp1dESeL+3fEHCBMn5EbISdKKJKLnovjLOuyfV19F9T4VBJ+jlbglEl
 ozTYojqs7m+2g18IN0EbJlVVW;
Received: from 75-166-141-253.hlrn.qwest.net ([75.166.141.253]:47640
 helo=prentzel) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1nRHBs-0047PU-AM; Mon, 07 Mar 2022 10:30:36 -0700
From: Tom Tromey <tom@tromey.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87sfrtakce.fsf@oldenburg.str.redhat.com>
X-Attribution: Tom
Date: Mon, 07 Mar 2022 10:30:35 -0700
In-Reply-To: <87sfrtakce.fsf@oldenburg.str.redhat.com> (Florian Weimer's
 message of "Mon, 07 Mar 2022 15:49:37 +0100")
Message-ID: <87fsnt1xhg.fsf@tromey.com>
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
X-Exim-ID: 1nRHBs-0047PU-AM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-141-253.hlrn.qwest.net (prentzel)
 [75.166.141.253]:47640
X-Source-Auth: tom+tromey.com
X-Email-Count: 4
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Received-SPF: pass client-ip=173.254.64.10; envelope-from=tom@tromey.com;
 helo=qproxy1-pub.mail.unifiedlayer.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: pedro@palves.net, Stefan Hajnoczi via Gdb <gdb@sourceware.org>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, tom@tromey.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Florian> I'm a bit surprised by this.  Conceptually, why would GDB need to know
Florian> about stack boundaries?  Is there some heuristic to detect broken
Florian> frames?

Yes, the infamous "previous frame inner to this frame" error message.  I
think this is primarily intended to detect stack trashing, but maybe it
also serves to work around bad debuginfo or bugs in the unwinders.

This error was disabled for cases where the GCC split stack feature is
used.  There's been requests to disable it in other cases as well, I
think.

Tom

