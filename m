Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083F3B0726
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:13:23 +0200 (CEST)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvh9W-00072p-Jh
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5t-0002eE-Q1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:37 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5r-0000gn-6F
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:37 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-LBTeLARcMKKbAYYZmXXvZQ-1; Tue, 22 Jun 2021 10:09:29 -0400
X-MC-Unique: LBTeLARcMKKbAYYZmXXvZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ACCF804140;
 Tue, 22 Jun 2021 14:09:28 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE095C1A3;
 Tue, 22 Jun 2021 14:09:27 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()
Date: Tue, 22 Jun 2021 16:09:24 +0200
Message-Id: <20210622140926.677618-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class method is overkill and cause code duplication in CPU setup functions.=
=0D
Switch to a more lightweight solution with a unique inline helper.=0D
=0D
Greg Kurz (2):=0D
  target/ppc: Introduce ppc_interrupts_little_endian()=0D
  target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()=0D
=0D
 target/ppc/cpu-qom.h     |  1 -=0D
 target/ppc/cpu.h         | 15 +++++++++++++++=0D
 target/ppc/arch_dump.c   |  8 +++-----=0D
 target/ppc/cpu_init.c    | 17 -----------------=0D
 target/ppc/excp_helper.c |  3 +--=0D
 5 files changed, 19 insertions(+), 25 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


