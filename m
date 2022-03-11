Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A94D687C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:37:11 +0100 (CET)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSk8T-0001xQ-Kt
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tpearson@raptorengineering.com>)
 id 1nSk7F-0000Sb-MK
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:35:53 -0500
Received: from mail.rptsys.com ([23.155.224.45]:12243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tpearson@raptorengineering.com>)
 id 1nSk7A-00055X-Nr
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:35:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 20CD037C373433
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:35:46 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KLrDzy7fzuzs for <qemu-devel@nongnu.org>;
 Fri, 11 Mar 2022 12:35:45 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 956D337C373430
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:35:45 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 956D337C373430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1647023745; bh=hgvib11WeYE1jSXcV+GueybJ53Hkutbli3dcBHeqyes=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=gRbMTKNZY4m4C0hGvIACfUkckVIXdlQzF33miaGELamrqytO6lX8pj0F9GiD/fWzR
 mKnsvPuOx4dTrtwYbucpNeBW62O2qwE+uljM9FzUhkWhP9CfXhypMUBhEPg0cB1nue
 Ubk/gSuZBioQdY+Bayd8H7zNkXtw3MEXgWMzP7ws=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Dr5lbLq7rcc6 for <qemu-devel@nongnu.org>;
 Fri, 11 Mar 2022 12:35:45 -0600 (CST)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 7C3A837C37342D
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:35:45 -0600 (CST)
Date: Fri, 11 Mar 2022 12:35:45 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: qemu-devel@nongnu.org
Message-ID: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
Subject: XIVE VFIO kernel resample failure in INTx mode under heavy load
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC99 (Linux)/8.5.0_GA_3042)
Thread-Index: eEcr6sfC50Umkvs72f1FlQPuKTH8xg==
Thread-Topic: XIVE VFIO kernel resample failure in INTx mode under heavy load
Received-SPF: pass client-ip=23.155.224.45;
 envelope-from=tpearson@raptorengineering.com; helo=mail.rptsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All,

I've been struggling for some time with what is looking like a potential bug in QEMU/KVM on the POWER9 platform.  It appears that in XIVE mode, when the in-kernel IRQ chip is enabled, an external device that rapidly asserts IRQs via the legacy INTx level mechanism will only receive one interrupt in the KVM guest.

Changing any one of those items appears to avoid the glitch, e.g. XICS mode with the in-kernel IRQ chip works (all interrupts are passed through), and XIVE mode with the in-kernel IRQ chip disabled also works.  We are also not seeing any problems in XIVE mode with the in-kernel chip from MSI/MSI-X devices.

The device in question is a real time card that needs to raise an interrupt every 1ms.  It works perfectly on the host, but fails in the guest -- with the in-kernel IRQ chip and XIVE enabled, it receives exactly one interrupt, at which point the host continues to see INTx+ but the guest sees INTX-, and the IRQ handler in the guest kernel is never reentered.

We have also seen some very rare glitches where, over a long period of time, we can enter a similar deadlock in XICS mode.  Disabling the in-kernel IRQ chip in XIVE mode will also lead to the lockup with this device, since the userspace IRQ emulation cannot keep up with the rapid interrupt firing (measurements show around 100ms required for processing each interrupt in the user mode).

My understanding is the resample mechanism does some clever tricks with level IRQs, but that QEMU needs to check if the IRQ is still asserted by the device on guest EOI.  Since a failure here would explain these symptoms I'm wondering if there is a bug in either QEMU or KVM for POWER / pSeries (SPAPr) where the IRQ is not resampled and therefore not re-fired in the guest?

Unfortunately I lack the resources at the moment to dig through the QEMU codebase and try to find the bug.  Any IBMers here that might be able to help out?  I can provide access to a test setup if desired.

Thanks!

