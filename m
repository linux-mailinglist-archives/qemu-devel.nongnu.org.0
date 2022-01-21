Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB314967C8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 23:21:40 +0100 (CET)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB2Hs-0002Vi-0S
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 17:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2D0-0000Qa-HJ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:38 -0500
Received: from outbound5c.eu.mailhop.org ([3.125.148.246]:57007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2Cy-0005t2-PT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1642803392; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=jiJ81D4UPKU8wrLiNz6FEpUitzH/5B5XTsaO8jit/j6uZ6B29nLcVbgNF6u34N6vOT/oEJ9t1wx9N
 31tzsNYDSqZaYm8OBm014NJof2QTTdU/K9uw0VZqgWCoKUF9q1kGFx3Xj95HDU3KzWx6VY3n8ghXEm
 torg2dqfLUhKwyiwPG4SodvAyUfrukY0ak3IjrpaBAAbe4fnnqDjldDkd2jmWx2ZqJK+vhTSjZ9Qc7
 un3LvuskyTAVvVzJ+xegETY/hdkJErNlwWBMDUKPqGehJZMsPwoxKOd0yhek53XeRyyT9vJb0UKwLC
 BdGUbBaCbX8Yreq7G5Rc50pNQP3USuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 dkim-signature:dkim-signature:from;
 bh=HgZEuC89rl0MDJmXPI8+VfE9o8W+5KsLSSTg09HCF7o=;
 b=rcmrDbpi6drUxtE6Mxd8P/0sOGvgPzpX+NiHmXmQShSgZPKDXxmeCMKksRLWyV+NpXmpgcik0WrWZ
 9qB7WsHo+lj0TvCTfEAhUahaBBtJgsikzL/UXl9tJqejqcMmqLHvcw28bDZWr2bM89kgWGJrj53iZ7
 hbng8qMW8MVqzcNVK0gPUk0YtRo/GPSC72wkcre5aZq8X5hhdeikoVOVRT79a72TjjKetbARAdb6N0
 +hseJFzS90qa6aCC15FIDI9BMCg2vm2J5DyDfrCcniyYyEHDeoZOWPdJ3PI5j9Wz/19Cd5vACfqCJT
 amuBr0AWm3aJPIjK5Iq8QMlCQrrKoKA==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=HgZEuC89rl0MDJmXPI8+VfE9o8W+5KsLSSTg09HCF7o=;
 b=VTgK2Y2VOZsTATuS90WVRWg4+9qh4OMF1wIROH9nN5cpju198HpaM0ohK0YOhNHh38gqjXeLv3wVK
 gAOFQ+7LGnu0h7/7pPkPp0/CYdU/HWeMHCKnmMFLYnkdhAuRTHQe/5kpbGtIO90roDNwVU2hoiQouI
 n4HAeD9KT3xp2dao=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=HgZEuC89rl0MDJmXPI8+VfE9o8W+5KsLSSTg09HCF7o=;
 b=cmYi2FiRLTAaE5hMOeXAz/6BFfliH+GiZhy0iCybIqQj+ByMNJxHRM3665v8tnDHxvwEPNWTcrrqW
 EB7kSifj0tSqyXsDP7FUINtG1i6PLaFPxy3Gl1GqlQnOXc/ERloxmX2S8nbU6x5K+2scvvi2jU7Y5t
 WcgeImsJHW2gSPuCXZTExQOiQsoW/0K8DwVNAdAH0kiZmCvBi4bs9sJvvrqbiWBBAIwu2BOY0ZEmxf
 b25SfiymR30dMQtkNOj/9gEHCmaihToy+i37LeFFe9eFgohNmgVpiA7iPC/FZ1oeTyAIUj6UYJkmh2
 hcVviy258zy3AUL13YdDUc6Es0gUxOQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: c78d5e15-7b07-11ec-98b0-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound3.eu.mailhop.org (Halon) with ESMTPSA
 id c78d5e15-7b07-11ec-98b0-95b64d6800c5;
 Fri, 21 Jan 2022 22:16:29 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org)
 by mail.duncanthrax.net with esmtpa (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nB2Cp-005WLL-Ou; Sat, 22 Jan 2022 00:16:27 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/3] hw/display/artist: cursor & buffer mode fixes
Date: Fri, 21 Jan 2022 23:16:16 +0100
Message-Id: <20220121221619.1069447-1-svens@stackframe.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=3.125.148.246; envelope-from=svens@stackframe.org;
 helo=outbound5c.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi List,

this set contains two fixes too make the cursor work with HP-UX' X-server,
and one large rewrite to make the Linux framebuffer work with artist on hppa.

Sven Schnelle (3):
  hw/display/artist: fix cursor position
  hw/display/artist: allow to disable/enable cursor
  hw/display/artist: rewrite vram access mode handling

 hw/display/artist.c     | 449 ++++++++++++++++------------------------
 hw/display/trace-events |   8 +-
 2 files changed, 184 insertions(+), 273 deletions(-)

-- 
2.34.1


