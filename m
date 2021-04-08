Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA735847E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:19:57 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUZg-0008E5-Rr
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tglx@linutronix.de>)
 id 1lUUYP-0007oD-Qu
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:18:37 -0400
Received: from galois.linutronix.de ([193.142.43.55]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tglx@linutronix.de>)
 id 1lUUYN-00088D-IB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:18:37 -0400
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617887903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=R3zqpOysd+UgmybGo5NkOd2hIbYM3pm4y3c57K63JxA=;
 b=ENEhqGLkUvzI55KKXqGU3V8xzhqVR+tPxf5r7dyk9yRRI7SeIJIaN/+DxQ813iDUkmIjLx
 QXwfKUTPMOCVP+lLCwi17wenWjeNHHO6l84WdKAWYuYBJiwUwZzv1LQJOzGOakQDDII6k/
 4IWVByqdeg1hN8nNAFsSHWR7gdBlaZxiKfGDmLKV89Qoy3lNvtUbpEF6mETNPkEkcgWm6E
 DvOFMMRkRv7wg4kdTCfOcU5LsnEbWohnbfBICbYQFFufPSfVtr6eWVEKsk/vPBqNfIsZ2p
 NqdHOEo76isPI7/BVR37NPHtV874x2mo9eGmTgOl7RBLvreRzQJP06y2zrtmRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617887903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=R3zqpOysd+UgmybGo5NkOd2hIbYM3pm4y3c57K63JxA=;
 b=j0BgA4b2utC5JU1UQGkKE9lOkh/3swaNqVDzrGQ5PbRq2VaxQOjbHjUSPSmzBhoFPBtgM8
 5PzstL9LzDhmDHBQ==
To: Sean Christopherson <seanjc@google.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
In-Reply-To: <YGzW/Pa/p7svg5Rr@google.com>
Date: Thu, 08 Apr 2021 15:18:23 +0200
Message-ID: <874kgg29uo.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=193.142.43.55; envelope-from=tglx@linutronix.de;
 helo=galois.linutronix.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06 2021 at 21:47, Sean Christopherson wrote:
> On Tue, Apr 06, 2021, Michael Tokarev wrote:
>> broke kvm guest cpu time accounting - after this commit, when running
>> qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
>> elsewhere) is always 0.
>> 
>> I dunno why it happened, but it happened, and all kernels after 5.9
>> are affected by this.
>> 
>> This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.
>
> Yes :-(
>
> There's a bugzilla[1] and two proposed fixes[2][3].  I don't particularly like
> either of the fixes, but an elegant solution hasn't presented itself.
>
> Thomas/Paolo, can you please weigh in?
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=209831
> [2] https://lkml.kernel.org/r/1617011036-11734-1-git-send-email-wanpengli@tencent.com
> [3] https://lkml.kernel.org/r/20210206004218.312023-1-seanjc@google.com

All of the solutions I looked at so far are ugly as hell. The problem is
that the accounting is plumbed into the context tracking and moving
context tracking around to a different place is just wrong.

I think the right solution is to seperate the time accounting logic out
from guest_enter/exit_irqoff() and have virt time specific helpers which
can be placed at the proper spots in kvm.

Thanks,

        tglx

