Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5187251
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 08:41:48 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvyax-0004y7-QH
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 02:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46791)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hvya0-0004EA-8q
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hvyZz-0006i7-45
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:40:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hvyZy-0006gq-Uu
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:40:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 400028E237;
 Fri,  9 Aug 2019 06:40:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.10.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2E319C70;
 Fri,  9 Aug 2019 06:40:38 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri,  9 Aug 2019 12:08:33 +0530
Message-Id: <20190809063835.6717-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 09 Aug 2019 06:40:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/2] scsi: lsi: break infinite loop after
 10k instructions
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
Cc: Fam Zheng <fam@euphon.net>, Prasad J Pandit <pjp@fedoraproject.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Bugs SysSec <bugs-syssec@rub.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

While executing script, the LSI SCSI Adapter emulator could run into an
infinite loop, if next instruction read by 's->dsp' index has an empty
opcode. Raise an illegal instruction interrupt and exit the loop after
10k iterations.

 -> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg01427.html

Thank you.
--
Prasad J Pandit (2):
  scsi: lsi: exit infinite loop while executing script (CVE-2019-12068)
  scsi: lsi: use macro LSI_MAX_INSN instead of a magic number

 hw/scsi/lsi53c895a.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

--=20
2.21.0

