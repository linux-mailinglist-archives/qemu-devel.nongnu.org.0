Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C693F706D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:32:31 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInOf-000191-Tt
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIB-0006a4-Pi
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:47 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIA-0004EP-0Y
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:47 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 4CC0A3F76A
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876344;
 bh=DjLOVvNgKSWiayJZqIzVzzsqbhLzXm3xXQAuip5pBy0=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=oV98Fng5FzWHoUieBFdp2Ka8mveybMF0WmY2DOldqOuGvMMpUDEjgYKL5u78LOo+N
 jLSPbhbvghF+YzqE6Y+LtGYBactY41Jeh8DjyjXsmWwxHMpsQbF4XsyoLfDZK9mvc+
 iRx30Ivp0ko0hD+/hxBRgJ2GigiKbk8T5RTndlfsA+nD9boIXY3J1qxbVVTsaaSd6Q
 Wfcmkun8t0gXdFnmDXpGHGdlejpvoQLPfpN0Y2Kid1MfyIa8w5aY3Uyy/WKpi9kcne
 8UE/EQq6Y5cT0GixG85OZctZ0shUGiXfwmTCxQwZGp5FN2fA4qX+2U1P1IpwYSglPD
 aXX41z0zlfygA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D21D2E8136
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:17:37 -0000
From: Thomas Huth <1892081@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn rth th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159777580973.2034.8843080316751302000.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987585893.22371.14486060803131494077.launchpad@soybean.canonical.com>
Subject: [Bug 1892081] Re: Performance improvement when using "QEMU_FLATTEN"
 with softfloat type conversions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 9f6f270d6b6575d6b17fe61e41dbd1908a9a78c1
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1892081 <1892081@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892081

Title:
  Performance improvement when using "QEMU_FLATTEN" with softfloat type
  conversions

Status in QEMU:
  Fix Released

Bug description:
  Attached below is a matrix multiplication program for double data
  types. The program performs the casting operation "(double)rand()"
  when generating random numbers.

  This operation calls the integer to float softfloat conversion
  function "int32_to_float_64".

  Adding the "QEMU_FLATTEN" attribute to the function definition
  decreases the instructions per call of the function by about 63%.

  Attached are before and after performance screenshots from
  KCachegrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892081/+subscriptions


