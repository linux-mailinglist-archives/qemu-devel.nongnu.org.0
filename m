Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A34DE354
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 22:14:40 +0100 (CET)
Received: from localhost ([::1]:45226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJvi-00060E-Iw
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 17:14:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nVJuZ-0005Cu-Pe
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 17:13:27 -0400
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:43537
 helo=progateway7-pub.mail.pro1.eigbox.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom@tromey.com>) id 1nVJuU-0002XI-UB
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 17:13:26 -0400
Received: from cmgw13.mail.unifiedlayer.com (unknown [10.0.90.128])
 by progateway7.mail.pro1.eigbox.com (Postfix) with ESMTP id 96A6D10042D1A
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 21:13:10 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with ESMTP
 id VJuIngqylY8ycVJuInImwI; Fri, 18 Mar 2022 21:13:10 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=ff9od2cF c=1 sm=1 tr=0 ts=6234f5e6
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=o8Y5sQTvuykA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=ZxGhNnm9vJj_tofHrAgA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKcDFMdDKQw0jtDjRrWrjQ4ZnT3NHPgedhAN+HPlA1s=; b=GHLoBWU/t3Ms6I09D27KumF+Tc
 nXp09VtjvCxi4iEFN2Mrv7LunhUxpXPTD01gN6RsUQNcsTt8JqHrCpP2++Yeritk/nIoqC0fxvtu5
 d8WcPCR5E6l7LZ7uEqU7+lCxV;
Received: from 71-211-175-224.hlrn.qwest.net ([71.211.175.224]:43178
 helo=prentzel) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1nVJuH-000547-I8; Fri, 18 Mar 2022 15:13:09 -0600
From: Tom Tromey <tom@tromey.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: How to backtrace an separate stack?
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87mti11yy9.fsf@tromey.com> <87r174gtuv.fsf@tromey.com>
 <YjCf8BPW+jITJain@stefanha-x1.localdomain>
X-Attribution: Tom
Date: Fri, 18 Mar 2022 15:13:08 -0600
In-Reply-To: <YjCf8BPW+jITJain@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Tue, 15 Mar 2022 14:17:20 +0000")
Message-ID: <87ee2zezh7.fsf@tromey.com>
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
X-Source-IP: 71.211.175.224
X-Source-L: No
X-Exim-ID: 1nVJuH-000547-I8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 71-211-175-224.hlrn.qwest.net (prentzel)
 [71.211.175.224]:43178
X-Source-Auth: tom+tromey.com
X-Email-Count: 3
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Received-SPF: pass client-ip=67.222.38.55; envelope-from=tom@tromey.com;
 helo=progateway7-pub.mail.pro1.eigbox.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: gdb@sourceware.org, Tom Tromey <tom@tromey.com>, qemu-devel@nongnu.org,
 pedro@palves.net, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> You can play with this if you want.  It's on 'submit/green-threads' on
>> my github.  Be warned that I rebase a lot.

Stefan> This looks cool! Would it be useful to see a port of QEMU's coroutine.py
Stefan> script to your green threads API?

Wouldn't hurt :)

Stefan> QEMU's coroutines aren't in a scheduler list so there is no way to
Stefan> enumerate all coroutines. The Python script can register a GDB command
Stefan> (e.g. "qemu coroutine 0x12345678") that makes GDB aware of the
Stefan> coroutine.

On the one hand, maybe this means the model is wrong.

On the other, I suppose qemu could also have a new command to create a
temporary "thread", given a ucontext_t (or whatever), and switch to it.
Then when the user "continue"s, the thread could be deleted again.

Tom

