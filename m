Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C0146C53
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:09:52 +0100 (CET)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iue7D-0003Jg-0o
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iubo6-00054V-Sm
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:42:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iubo5-0004Zu-Iy
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:41:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iubo5-0004UU-4s
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QHCsvJ8/uZzm0ycuN9f/wW3GtcMTNctSbelEIMlFhro=; b=JNl19tEYRxiwBwN+hCA+n4x54W
 zX24ArSgR1Z6fS35L6bRJzWnP5pM+2MczvBvD8WIMw65N1VtKSrj9KmJtu7bjCmLs1sMwkjnlBcSM
 dGXs6lm8I+/BAuNEl+E8Z+7Bq25QdNjjc4orgb6yLn2ge6CrzMvxKpEQC1VUjGEg8im24NdvL+mBr
 JsWeLbKV4j4YfyGofJ5e+ecncR2I+UJHP+58AhYgZrrDbQOMLYwqvaEhQA07k3TPjn1OQHrHRRp6V
 GuT9+u3XmDspA214wyB4A3S/GcHvRCO7fAJ+PVWKTcMojNDJxFndEM0kmTwxUx1Sq+qyCQtHNj4Ng
 X9q/ylrJ1GVGejyWbAuKzV0fxrrm+8/P2lMl557IADWRfho0aki9ctiULvlExvg/+pYhPwEiTzP2s
 aO96e/BZxSP/6PJytt/lTxeB8FvKyU8fgvmK4SZWtim2gCmzjStsHLk99Ovw4qdQlCztz7i5PFYlK
 FjF7PjmaPVxMKqFBQII3JMzlLzGJ3UhzxpX65Yzv7oYMAWnf9R330OtXZJggMPpfUUyyTbnPp/Meb
 e/YwFHxRmeNrGoewNNuqhASS8W81u2wBm3aadL1KPNoaq36aPMw7doqMXvIBS5XsztSGwhyxtztU+
 UrXf0P3+m6qclGP2bRKqxVxJPVQAUPJ/effKP6av8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 09/11] hw/9pfs/9p-synth: avoid n-square issue in
 synth_readdir()
Date: Thu, 23 Jan 2020 13:40:20 +0100
Message-ID: <1821765.DM1MFLlEqu@silver>
In-Reply-To: <20200123121351.5a0e9516@bahia.lan>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
 <d385726be4d8146a86561703bc6d77edd39fb654.1579567020.git.qemu_oss@crudebyte.com>
 <20200123121351.5a0e9516@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 23. Januar 2020 12:13:51 CET Greg Kurz wrote:
> Honestly it doesn't seem to change anything significant for me.
> Mean time calculated over 100 runs:
> 
> Without this patch:
> 
> [greg@bahia qemu-9p]$ (cd .mbuild-$(stg branch)/obj ; export
> QTEST_QEMU_BINARY='x86_64-softmmu/qemu-system-x86_64'; make all
> tests/qtest/qos-test && for i in {1..100}; do tests/qtest/qos-test -p
> $(tests/qtest/qos-test -l | grep readdir/basic); done) |& awk '/IMPORTANT/
> { print $10 }' | sed -e 's/s//' -e 's/^/n+=1;x+=/;$ascale=6;x/n' | bc
> .055654
> 
> With this patch:
> 
> [greg@bahia qemu-9p]$ (cd .mbuild-$(stg branch)/obj ; export
> QTEST_QEMU_BINARY='x86_64-softmmu/qemu-system-x86_64'; make all
> tests/qtest/qos-test && for i in {1..100}; do tests/qtest/qos-test -p
> $(tests/qtest/qos-test -l | grep readdir/basic); done) |& awk '/IMPORTANT/
> { print $10 }' | sed -e 's/s//' -e 's/^/n+=1;x+=/;$ascale=6;x/n' | bc
> .058786

:))) Mhmm, that's because you have run this test WITHOUT the actual readdir 
optimization patch. In this scenario the readdir latency issue is so bad, that 
the driver's n-square issue does not even matter, so same here:

Unoptimized readdir, no n-squre correction hack:
Time client spent for waiting for reply from server: 0.082831s [MOST 
IMPORTANT]

Unoptimized readdir, with n-squre correction hack:
Time client spent for waiting for reply from server: 0.082539s [MOST 
IMPORTANT]

BUT, now look at this *with* readdir optimization applied:

Optimized readdir, no n-square correction hack:
Time 9p server spent on synth_readdir() I/O only (synth driver): 0.021304s
Time 9p server spent on entire T_readdir request: 0.022033s [IMPORTANT]
Time client spent for waiting for reply from server: 0.022408s [MOST 
IMPORTANT]

Optimized readdir, with n-square correction hack:
Time 9p server spent on synth_readdir() I/O only (synth driver): 0.001576s
Time 9p server spent on entire T_readdir request: 0.002244s [IMPORTANT]
Time client spent for waiting for reply from server: 0.002566s [MOST 
IMPORTANT]

Got it? :)

I had good reasons for printing out the time spent on raw driver only.

Best regards,
Christian Schoenebeck



