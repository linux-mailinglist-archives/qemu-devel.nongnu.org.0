Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09674525A85
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 06:08:22 +0200 (CEST)
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npMbE-0002JI-RT
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 00:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY6-0007jy-UI
 for qemu-devel@nongnu.org; Fri, 13 May 2022 00:05:06 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:59482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY4-0006NY-U1
 for qemu-devel@nongnu.org; Fri, 13 May 2022 00:05:06 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CNMOIC030543
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 21:05:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=NZJrEIBE8B7jzc/WPV/Nzy31asqaWQJvgsI15JDNbfo=;
 b=hhYP088i5yOS1VOO0YF8KE5rrpwQX+80pxIJfC2ICct41OHQw4A6l6SCnfbYxX/g+DfQ
 6UtAMKjfGxnBI45G/a2Lh9W48uD7/NS/t8Y57aKWBvNT3q0j0ABTsH9y1AEmrbDW+HmQ
 kPit3xmpKMqeCd7/krSCY5iMJrvz5k7BfKo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g12mtnyv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 21:05:03 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 21:05:01 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id B722162D785F; Thu, 12 May 2022 21:02:20 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <patrick@stwcx.xyz>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <clg@kaod.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Date: Thu, 12 May 2022 21:02:18 -0700
Message-ID: <20220513040220.3657135-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: C3Q9cnTLXAh6Tg6tU7NcjZRRB57RDagv
X-Proofpoint-ORIG-GUID: C3Q9cnTLXAh6Tg6tU7NcjZRRB57RDagv
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=613212e35b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:

https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/

This series adds all the missing UART's in the Aspeed chips, and initializes
them all with serial devices (even if there is no peer character device pro=
vided
by the QEMU user).

This allows users to quickly test UART output without any code changes. In =
fact,
you could even connect all the UART's to separate sockets and check which o=
ne is
emitting data.

The first commit is just focusing on adding the missing hardware #define's.

The second commit has more info on the state of the whole Aspeed BMC UART c=
li
interface, and adds the additional initialization code.

By the way, could I put this code into aspeed_soc.h or something? If not,
maybe after this I'll add a file for common code, so that we can move
towards unifying everything.

Peter Delevoryas (2):
  hw: aspeed: Add missing UART's
  hw: aspeed: Init all UART's with serial devices

 hw/arm/aspeed_ast10x0.c     | 38 ++++++++++++++++++++++++++++++++++---
 hw/arm/aspeed_ast2600.c     | 29 +++++++++++++++++++++++++++-
 hw/arm/aspeed_soc.c         | 16 +++++++++++++++-
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)

--=20
2.30.2


