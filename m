Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF141A60D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 05:27:17 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV3m0-0002pr-B7
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 23:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8905f295c3=pdel@fb.com>)
 id 1mV3ju-0001TV-2T
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 23:25:06 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:15134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8905f295c3=pdel@fb.com>)
 id 1mV3js-0000T6-4V
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 23:25:05 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RKsWru021388
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 20:25:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=IDzwezcqc/k8Z0AVHGYS0kIK4lzk5tYaKvuyBCD7JaM=;
 b=l+K+Dz5oQr1RyHvnpsEyWgzNsP6moJC57Nc5VlTMDd3+BZmlsXHVh8NI21HszvAN4Kpu
 wbHO6PUtSaXS5ZyX4CL/Ap7MFRaZa/Aib45GXAwSxdnZdQoStMIhoBgsJWqxx6rSUGeP
 5DJrcxAqBOcQbq+nKX9NXpemHN22/+x8Rcs= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bbe8swkce-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 20:25:00 -0700
Received: from intmgw002.48.prn1.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 27 Sep 2021 20:24:59 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id EB2CA43602F9; Mon, 27 Sep 2021 20:24:57 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <rashmica.g@gmail.com>,
 <patrick@stwcx.xyz>, <qemu-devel@nongnu.org>, <f4bug@amsat.org>, Peter
 Delevoryas <pdel@fb.com>
Subject: [PATCH 0/1] hw: aspeed_gpio: Fix pin I/O type declarations
Date: Mon, 27 Sep 2021 20:24:55 -0700
Message-ID: <20210928032456.3192603-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: acOT3loIfnLMq72D6RvMNZzmU1mj04Os
X-Proofpoint-ORIG-GUID: acOT3loIfnLMq72D6RvMNZzmU1mj04Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=456
 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280023
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8905f295c3=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

In the Aspeed chips, the GPIO pins are mostly labeled in groups of 8,
but some of the groups only have 4 elements. Also, most pins have input
and output capabilities, but some are strictly input or strictly output
pins. We have some arrays that describe the I/O capabilities of each pin
for each chip.

A few of the declarations for the AST2500 and AST2600 in aspeed_gpio.c
don't seem to match the datasheet, probably because of confusion over
the association between big-endian uint32 literals (right-to-left) and
the array of group labels (left-to-right). I checked the AST2400 too,
but it was correct and didn't need any changes.

We might want to consider replacing the u32's with u8's and putting them
together into a u32 programmatically, or perhaps implicitly performing a
big-endian to little-endian conversion, something to make it easier to
read.

Peter Delevoryas (1):
  hw: aspeed_gpio: Fix pin I/O type declarations

 hw/gpio/aspeed_gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--=20
2.30.2


