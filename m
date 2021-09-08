Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F154403C91
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:34:36 +0200 (CEST)
Received: from localhost ([::1]:48952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzat-0002fb-Kb
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mNzXQ-0006k3-8P
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:31:00 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:38918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mNzXN-0008LP-DK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:30:59 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 8D66E450A5
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1631115051;
 bh=dj1/NQWL0JHo+k09ZtZe8tWy2i36Y6BY4D8qnrYH5Cw=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=QVGdIoMadH7v976BcoRM4Q/m9Ij2Kcav6fbCDabkD4/f0EwYi2fPE08+ZTW6puN2o
 M/wgwhSvc4mmy3rLWF41u9ntcvA67nvSyBBApUYsUUV3ttyzVwsqxuMDMLjv7o01/2
 uEJl23aA+EHyTO3c95DpMlC5tNY5c6GyHKpkpXnqriMogirSoqfYDCFT50YFwco1ES
 w5vnTo0qBGUkjvB3+cZxATVyJd7rQab4BWO8ME+F+zYLfKDGATXitppRXGI3w/ke/e
 Ecl5WanWL/YD1FgkATUV3q9KMsV7nlGpQqd4tfcxPp/V4TLvM5G8R5UTTW/lEEfWyj
 XrfPOtdKoZXEg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 034CA2E818E
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 15:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Sep 2021 15:24:04 -0000
From: Paolo Bonzini <985288@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asad-saeed bonzini th-huth
X-Launchpad-Bug-Reporter: Asad Saeed (asad-saeed)
X-Launchpad-Bug-Modifier: Paolo Bonzini (bonzini)
References: <20120418224744.9275.96744.malonedeb@soybean.canonical.com>
Message-Id: <163111464439.11033.3447451866979572293.malone@gac.canonical.com>
Subject: [Bug 985288] Re: scsi disk emulation doesn't enforce FUA (Force Unit
 Access) in write-back mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7c7f88b97a343c08e2236a0e8fed37e23c234dc2"; Instance="production"
X-Launchpad-Hash: b3cc8205ba3e8baf83c956a1ced2b0809843cf76
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 985288 <985288@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in 1.1 (commit 7e8c49c56154ab5c45d4f07edf0c22728735da35). :)

** Changed in: qemu
       Status: Won't Fix =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/985288

Title:
  scsi disk emulation doesn't enforce FUA (Force Unit Access) in write-
  back mode

Status in QEMU:
  Fix Released

Bug description:
  Microsoft NTFS utilizes the FUA bit in SCSI WRITE CDBs to insure
  integrity when a device advertises that it has write caching enabled.
  The FUA bit is meant to ensure a write is written to non-volatile
  storage before returning.  This seems to not be enforced by QEMU's
  SCSI emulation code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/985288/+subscriptions


