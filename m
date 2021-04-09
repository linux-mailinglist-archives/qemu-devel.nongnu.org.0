Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E935A2A4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:07:19 +0200 (CEST)
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtfA-0002tE-2T
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbo-00012j-DS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:48 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbm-000672-Np
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:48 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-LoAm3ouIPwWN4rnruty9Vg-1; Fri, 09 Apr 2021 12:03:42 -0400
X-MC-Unique: LoAm3ouIPwWN4rnruty9Vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C852107ACE3;
 Fri,  9 Apr 2021 16:03:41 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-173.ams2.redhat.com [10.36.114.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 052B45C230;
 Fri,  9 Apr 2021 16:03:39 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] cpu/core: Fix "help" of CPU core device types
Date: Fri,  9 Apr 2021 18:03:37 +0200
Message-Id: <20210409160339.500167-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth recently reported an annoying crash:=0D
=0D
$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help=0D
/home/thuth/devel/qemu/include/hw/boards.h:24:=0D
 MACHINE: Object 0x5635bd53af10 is not an instance of type machine=0D
Aborted (core dumped)=0D
=0D
This is caused by an early use of qdev_get_machine(), before the=0D
machine creation, which triggers a side-effect of creating a=0D
dummy "container" object instead of the machine. This is needed=0D
by user mode emulation, which doesn't really care about the=0D
type of the parent of the CPU model. This is toxic for system=0D
mode though because the system mode specific code usually assume=0D
MACHINE(qdev_get_machine()).=0D
=0D
This series brings separate implementations between user and=0D
system mode. The breakage with "cpu-code,help" is fixed by using=0D
current_machine.=0D
=0D
Greg Kurz (2):=0D
  qdev: Separate implementations of qdev_get_machine() for user and=0D
    system=0D
  cpu/core: Fix "help" of CPU core device types=0D
=0D
 hw/core/machine.c        | 14 ++++++++++++++=0D
 hw/core/qdev.c           |  2 +-=0D
 hw/cpu/core.c            | 10 ++++++++--=0D
 include/hw/qdev-core.h   |  1 +=0D
 stubs/meson.build        |  1 +=0D
 stubs/qdev-get-machine.c | 11 +++++++++++=0D
 6 files changed, 36 insertions(+), 3 deletions(-)=0D
 create mode 100644 stubs/qdev-get-machine.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


