Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE32248E18
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 20:47:06 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k86dV-00009K-5D
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 14:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k86cA-0007La-BH
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 14:45:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:36954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k86c7-0000LD-EV
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 14:45:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k86c5-0002rD-KJ
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 18:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 92C142E806F
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 18:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2020 18:36:49 -0000
From: Ahmed Karaman <1892081@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Ahmed Karaman (ahmedkrmn)
Message-Id: <159777580973.2034.8843080316751302000.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1892081] [NEW] Performance improvement when using "QEMU_FLATTEN"
 with softfloat type conversions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 754ad804d5a0eb0a9f62a76cb0174500a0a513fc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 14:45:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Public bug reported:

Attached below is a matrix multiplication program for double data
types. The program performs the casting operation "(double)rand()"
when generating random numbers.

This operation calls the integer to float softfloat conversion
function "int32_to_float_64".

Adding the "QEMU_FLATTEN" attribute to the function definition
decreases the instructions per call of the function by about 63%.

Attached are before and after performance screenshots from
KCachegrind.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "matmult_double.c"
   https://bugs.launchpad.net/bugs/1892081/+attachment/5402577/+files/matmu=
lt_double.c

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892081

Title:
  Performance improvement when using "QEMU_FLATTEN" with softfloat type
  conversions

Status in QEMU:
  New

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

