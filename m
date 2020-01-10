Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E04136BD4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 12:16:53 +0100 (CET)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipsHc-0000Ir-Nv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 06:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fflorensa@online.net>) id 1ipsGR-0007oI-O0
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:15:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fflorensa@online.net>) id 1ipsGP-0006eE-8R
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:15:38 -0500
Received: from mail.online.net ([62.210.16.11]:52136)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fflorensa@online.net>)
 id 1ipsGO-00065J-PC
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:15:37 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.online.net (Postfix) with ESMTP id E6063F2B89C0;
 Fri, 10 Jan 2020 12:15:28 +0100 (CET)
Received: from mail.online.net ([127.0.0.1])
 by localhost (mail.online.net [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rPE9V1Ld0uyC; Fri, 10 Jan 2020 12:15:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.online.net (Postfix) with ESMTP id C2ECBF2B89C2;
 Fri, 10 Jan 2020 12:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.online.net C2ECBF2B89C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.net;
 s=4EC61654-9574-11E8-870F-3D38CA7095BF; t=1578654928;
 bh=2JtA7JP84nzbWJmcLB4wX9itp7d/x5FwCWCQpowUoGo=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=QP3T7XpmGBf3kS/bmqecwL+TyHSGq4SVsZJpKTyBR6BvhHU1nUzniFhNs0KZb/whJ
 ldtJ43AB4sWYBJYd4g4OTY1qpFwvLWZyBcS+imolckKdvpx9RexKPHvSE4/j2YuGxg
 izSBuGOhSwcFWRomRJd6K69MEpuwnJbAFI/N3RXEHBYQReI4qcv22wmGo8e6TAT2Em
 MeI2Xzto0Quwp127jM/aRFyK589m9KV1WSWiq40BADSPNa1Zw2/YHNaYKwZnJ0q0eV
 mGuLpHEs/2wuTNCEvHloxj+j4A5xNFl3HgtGw9heE5lIdGhrwWMTgn3Zo2bH2/uBCC
 s3PGPk+h+zLdQ==
X-Virus-Scanned: amavisd-new at mail.online.net
Received: from mail.online.net ([127.0.0.1])
 by localhost (mail.online.net [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VsA9uYHIgYXB; Fri, 10 Jan 2020 12:15:28 +0100 (CET)
Received: from flash.online.net (unknown [195.154.229.35])
 by mail.online.net (Postfix) with ESMTPSA id 9FCEDF2B89C0;
 Fri, 10 Jan 2020 12:15:28 +0100 (CET)
From: Florian Florensa <fflorensa@online.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] block/rbd: Add support for ceph namespaces
Date: Fri, 10 Jan 2020 12:15:12 +0100
Message-Id: <20200110111513.321728-1-fflorensa@online.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 62.210.16.11
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
Cc: kwolf@redhat.com, dillaman@redhat.com, armbru@redhat.com, mreitz@redhat.com,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed the white space issue, no changes other than that.

Florian Florensa (1):
  block/rbd: Add support for ceph namespaces

 block/rbd.c          | 44 +++++++++++++++++++++++++++++++-------------
 qapi/block-core.json |  4 ++++
 2 files changed, 35 insertions(+), 13 deletions(-)

--=20
2.24.1


