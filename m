Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DD4E276A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:22:02 +0100 (CET)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHyz-0003hQ-Aj
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:22:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWE8s-0005Rc-Os; Mon, 21 Mar 2022 05:16:00 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWE8m-0004Ow-T8; Mon, 21 Mar 2022 05:15:57 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22L94Urd075169;
 Mon, 21 Mar 2022 17:04:30 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Mar
 2022 17:14:55 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/1] hw/gpio Add ASPEED GPIO model for AST1030
Date: Mon, 21 Mar 2022 17:14:52 +0800
Message-ID: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22L94Urd075169
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:18:18 -0400
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Add GPIO read/write trace event.
2. Support GPIO index mode for write operation.
It did not support GPIO index mode for read operation.
3. AST1030 integrates one set of Parallel GPIO Controller
with maximum 151 control pins, which are 21 groups
(A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
S5 S6 S7 ) and the group T and U are input only.

Test Steps:
1. Download image from
https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
2. Extract the zip file to obtain zephyr.elf
3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
4. Test GPIO D6 Pin
uart:~$ gpio conf GPIO0_A_D 30 out
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 0
uart:~$ gpio set GPIO0_A_D 30 1
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 1
uart:~$ gpio set GPIO0_A_D 30 0
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 0

Jamin Lin (1):
  hw/gpio: Add ASPEED GPIO model for AST1030

 hw/gpio/aspeed_gpio.c         | 250 ++++++++++++++++++++++++++++++++--
 hw/gpio/trace-events          |   5 +
 include/hw/gpio/aspeed_gpio.h |  16 ++-
 3 files changed, 255 insertions(+), 16 deletions(-)

-- 
2.17.1


