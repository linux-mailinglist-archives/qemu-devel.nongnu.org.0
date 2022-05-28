Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1E536C29
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:54:24 +0200 (CEST)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nut9L-0002On-JL
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx3-0007mJ-9g
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:42 -0400
Received: from mout.gmx.net ([212.227.15.19]:59965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx0-0006lL-HR
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653730895;
 bh=CCZCNtMZ/g+k0q/7DshiyhNU166le21EhfJOvKQoZPY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=iMh/JCggSIBNh/SQYX7FnmwBjM+6wUmcs+ao6kAD9KcAHte0dDh4zKYJZ8Oas03Y4
 jIBhyIxjM574sQJEekpicwAsEreO960TBzibUaSZSzx9KAqoAJ1J3kWGOjAmA8vkv9
 UwYCQKxXHUlx9mgMxgB8RPXvot7N/d3DFZq71YfM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1nsy4j46o7-007Use; Sat, 28
 May 2022 11:41:35 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 0/3] hppa: Fix serial port pass-through
Date: Sat, 28 May 2022 11:41:31 +0200
Message-Id: <20220528094134.16513-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wg3H5Waeax3eeH15exrW0vknYjJCX/kkPU1CF/hZqO+FKhLFWD7
 lCw0yViccoOyfEUbOauRQO9c9uxxjUojfHt0ttZAheBqN1BXxhRQuRiyUjYds5zIH7btl1S
 77vxcWGVI2Hzu+QerxrVonVH04spjqyHspnX3s6aBcI9iPrsJ7J4TRhK6IPK6AjwR3xRokN
 YdOG7NbOOfUrCjYeDfdTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+DvR4zbDu8=:TQkcpmQmrXrnOY18k/BbYY
 JwQLkKGPyywYvL0qwzbK9Q5Fmza++Wy7J+7LXPo2T1NVR+jpHquEkWgjoASBXeD/JR+KCeV94
 RJ+c1O1JeBedoyu3IMoSHCSzCy3OvO84BgZdCayOMtF0XH38ptYEnBq41pNngzgwLWWD52+kA
 gViPn6xiXhZ8GWpeCK3Up+CBjQ7a4cnnaHAODSZCcWEdNaz3hzCGu/MD1ArfGaUDY0Gb7lEOs
 PbAFrt34lOn4zyqnVYJH6jEsnrg9M97K3nD6fVDJEjJzNuPJduIECynpDwxae6e0hEHAuE8nN
 u0uJCbwR8PpA59mNMl8NwnOrtzLDPuLlBOlerHMJp0JXmtuJgDT+XOJiJG2igr3qvjEPVfirp
 dza++w3qReBkPxgIKTjnf2JTClxMFUUyO4VDwTn3R6H+zw0mh4yeT7EMw9T8eErpdl4vwSFz6
 L6QI00jPcgjYY8W3tvmv3VjJ6KuB1x9O0g3f9vjS/MHOrwHZExptHdiX9FT1hydOzvcTDsg6z
 Ei1XCk2RJV7JKPQgw7VgMGdhiK5rjvHAJQeXlfparUUBOqZTB95KeKiNpYlaYj5vGb7E1eoVL
 iIi7/76z1E9jqdmjUMBclI7HSNYgLq+2XuacUAUXyu91HfrNDzOJORDGUXauq/NX7WWxRJAXr
 Y121JkFm1VmRv34cA5nYPlUPC+H4dnZ/Yg8RMtvSADkIpu4yeKKduv3avST+PWD/eZ7lmotaC
 eQ2n4JESLd2mfJqOlyejgPoye/kRO1z7NSt9YGCAWUNFUAz9Hq/oGIiiiBMgvxtR1lZxZmY6J
 b9mH3LlYOM2C6r51nmP5V3WC9Ir8+0c2C3rk7+Sxq/wmJk3ENjuE7VNlWEX+8Uv3+1ASQaGVH
 5n/XXmWATP/rYZaOTUjuu8wnPaknvGM+qiuMRHN+2q/uMQ6pXVbT3lWn9sitqGEfvkQPHcbNU
 M9dY3PieMD+lNbTs+eGEGEfbLLCMuA6IbRpkxXWrbQ7n1zXL1tF4aHzfanRHrzhx1i+OkIRgi
 Ej5W5bVr8aNccPOVh3AmgeRM1H3TlOrt4oBcA9ydb2SFlFS5wMk9gSYqksbrXjkitXQNcNdm2
 9bOwCks1FyAdkPD+DU158K7DBTBkg8y/zCP
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series fixes the SeaBIOS-hppa firmware and the serial ports setup cod=
e in
qemu so that it reflects the real hardware and allows serial port pass-thr=
ough
from the host to guests.

Tested with Linux guests.

v2: Changes suggested by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
- Split out hppa_hardware.h restoration to an own patch
- Drop unneccesary checks for serial_hd(x)

Signed-off-by: Helge Deller <deller@gmx.de>

Helge Deller (3):
  New SeaBIOS-hppa version 6
  hppa: Sync contents of hppa_hardware.h header file with SeaBIOS-hppa
  hppa: Fix serial port assignments and pass-through

 hw/hppa/hppa_hardware.h   |  10 ++++++++--
 hw/hppa/machine.c         |  22 ++++++++--------------
 pc-bios/hppa-firmware.img | Bin 719040 -> 719368 bytes
 roms/seabios-hppa         |   2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

=2D-
2.35.3


