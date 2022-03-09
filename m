Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ACA4D3AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:54:16 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS2Nz-00063m-Kg
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nS2KK-0003tT-B0
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:50:28 -0500
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nS2KI-0002HE-B0
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:50:27 -0500
Received: from cmgw13.mail.unifiedlayer.com (unknown [10.0.90.128])
 by progateway4.mail.pro1.eigbox.com (Postfix) with ESMTP id AB57A100471D8
 for <qemu-devel@nongnu.org>; Wed,  9 Mar 2022 19:50:24 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with ESMTP
 id S2KGn2rabY8ycS2KGnek8H; Wed, 09 Mar 2022 19:50:24 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=Ue6U9IeN c=1 sm=1 tr=0 ts=62290500
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=o8Y5sQTvuykA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=xOBOemYoxZh_mOWJZlwA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/s8WAyehLbw1fBq7BL3kzJeGtiFqFw8d9utJs/FoEyY=; b=dFaZKBZ7huem1HhfeJDCDfr6qk
 42GxnmEYFKSHBmkyDacUbqLkEvl4wTdobja4BmzLXy6ttUu2BhVeBj5vz9o29NqX5HZj4huoxVrH0
 dz6DJ7b+wvySPm2hfWPqJ38r6;
Received: from 75-166-141-253.hlrn.qwest.net ([75.166.141.253]:40576
 helo=prentzel) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1nS2KF-002lQe-NK; Wed, 09 Mar 2022 12:50:23 -0700
From: Tom Tromey <tom@tromey.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87sfrtakce.fsf@oldenburg.str.redhat.com> <87fsnt1xhg.fsf@tromey.com>
 <87ilsn784k.fsf@oldenburg.str.redhat.com>
X-Attribution: Tom
Date: Wed, 09 Mar 2022 12:50:22 -0700
In-Reply-To: <87ilsn784k.fsf@oldenburg.str.redhat.com> (Florian Weimer's
 message of "Wed, 09 Mar 2022 11:06:19 +0100")
Message-ID: <87fsnqgb29.fsf@tromey.com>
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
X-Exim-ID: 1nS2KF-002lQe-NK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-141-253.hlrn.qwest.net (prentzel)
 [75.166.141.253]:40576
X-Source-Auth: tom+tromey.com
X-Email-Count: 6
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Received-SPF: pass client-ip=69.89.18.3; envelope-from=tom@tromey.com;
 helo=gproxy2-pub.mail.unifiedlayer.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pedro@palves.net, Stefan Hajnoczi via Gdb <gdb@sourceware.org>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Tom Tromey <tom@tromey.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Yes, the infamous "previous frame inner to this frame" error message.  I
>> think this is primarily intended to detect stack trashing, but maybe it
>> also serves to work around bad debuginfo or bugs in the unwinders.

Florian> Is there a user-level command to disable the check manually?

I don't think so.  I think it would be fine if someone wanted to add
one.

Tom

