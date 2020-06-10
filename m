Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FA1F5507
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 14:40:01 +0200 (CEST)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj01Q-0000lO-Dr
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 08:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jizj3-00050B-I1
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 08:21:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jizj2-00083d-Az
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 08:21:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jizix-0004Tm-C1
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 12:20:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 40BB12E810A
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 12:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2020 12:12:32 -0000
From: r1ng0hacking <1858415@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=samuel.thibault@ens-lyon.org; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: r1ng0hacking th-huth
X-Launchpad-Bug-Reporter: r1ng0hacking (r1ng0hacking)
X-Launchpad-Bug-Modifier: r1ng0hacking (r1ng0hacking)
References: <157830904702.27324.6826841321216823570.malonedeb@chaenomeles.canonical.com>
Message-Id: <159179115377.9600.15257820878115304726.launchpad@wampee.canonical.com>
Subject: [Bug 1858415] Re: in tcp_emu function has OOB bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 615c70980879adfac69c18ec5c3b28f6f066332a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 06:30:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1858415 <1858415@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Information type changed from Private Security to Public

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858415

Title:
  in tcp_emu function has OOB bug

Status in QEMU:
  Fix Released

Bug description:
  qemu version: 4.1.0

  ```c
  int tcp_emu(struct socket *so, struct mbuf *m){
  ............
  case EMU_REALAUDIO:
  ............
      while (bptr < m->m_data + m->m_len) {
          case 6:
  ............
              lport =3D (((uint8_t *)bptr)[0] << 8) + ((uint8_t *)bptr)[1];
  ............               =

              *(uint8_t *)bptr++ =3D (p >> 8) & 0xff;
              *(uint8_t *)bptr =3D p & 0xff;
  ............
      }
  ............
  ............
  }
  ```

  bptr)[1] and  bptr++ ,may make bptr =3D=3D  m->m_data + m->m_len,and cause
  OOB=EF=BC=88out of bounds.=EF=BC=89

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858415/+subscriptions

