Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D93189D5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:54:30 +0100 (CET)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAYH-0006PA-Om
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1lAAXE-0005bH-1a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:53:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1lAAXC-0005qX-9C
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:53:23 -0500
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MD9nd-1l186i2zsf-0094kp; Thu, 11 Feb 2021 12:53:13 +0100
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] tricore: fixed faulty conditions for extr and imask
Date: Thu, 11 Feb 2021 12:53:28 +0100
Message-Id: <20210211115329.8984-1-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
X-Provags-ID: V03:K1:PJiGNrtMWiH2qDwQ6OGq5YYQdKwJr0GY9EkGSEqMS1xr665xlwp
 sQYOzKwWNlaZlC+AReYn67Mg7wJAwz4SUsdeDKbEf1HS3Uxmp5e74SHbK0HHjnpUHmCsZgB
 kpdERViVaFpadnQ2DpoqqzUNyrOTLPKL0KarqmK5U5swdvovg3n09m1AE9iiv2pI94JnaJf
 2Rmyw2XDENVsQOmD21XFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hJ2PQdLVzpE=:TqHXJRq14CdklxdgdYVXMv
 JK80+uhfjBV+3pqgXmmG0Za0zD0Qe7VIFrnmhWiM/v/LDHbx26KV4AQWpOfecs0v4NSy3cw/9
 IpWmohAmhnraKsKl2Ehvu5U57W/oy7RE8oI7va3/Kg4NvS6wBBurl0smEPseHM0rKhyeki7e0
 LiytCYcPZPhZvXQzn3nJxQLsDPfm3e2kA7so8vTa504+hWjYHgHDPQjgkOxmuw5u3HtCOjna7
 mqhiU8ld9JQlt27PZHzxQE2icqRvn2aAZQtSDrCuXWG4Yn5AlexZDib+UUBCDCLdNGciSi029
 qQ0Y1WTmbn469FH5CY3eSTPM0fWFbcvrmdnn+Gg7TV2pygHJmtQD26XchqUG1Dvrr8uOG6I3o
 aYad4iiOaxKuwglfSpJSU/zRonacjpnN93iII55YzjdMHQeEdMkhxCv61+mWiQlmubN3ndC9r
 LjbpvMHW0Q==
Received-SPF: none client-ip=212.227.126.187;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

Hello together,

we have fixed a few conditions leading to incorrect intermediate code
generation.

Andreas Konopik (1):
  tricore: fixed faulty conditions for extr and imask

 target/tricore/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.30.0


