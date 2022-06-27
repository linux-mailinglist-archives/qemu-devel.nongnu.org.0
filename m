Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D055BBAA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 20:56:41 +0200 (CEST)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5tua-0007Ya-Vs
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 14:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7177cd4fe2=irischenlj@fb.com>)
 id 1o5tqz-0005N2-3P; Mon, 27 Jun 2022 14:52:57 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:31530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7177cd4fe2=irischenlj@fb.com>)
 id 1o5tqw-000864-L6; Mon, 27 Jun 2022 14:52:56 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RGLFUl017428;
 Mon, 27 Jun 2022 11:52:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=VHv6YEyj62SAF8L5IukS4HCN6T5BiSHsEC7rHqnLzwY=;
 b=kraT3qitTf+RDrPHFOWoFBlldzrQzjkIlF6ImtsH+bz1jJwYyevN4XyUJGD5CBgF1fUU
 V9sG2LddO+UXeK7N0ofdQVlrE5cgjNMr4LtaUTjafr4zQKQ8YDL6WAGFxcQSTlBiQdql
 H5oUeLy0KxB6IMVBS3Z/wOjSrwDDWIh2Zls= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gyg0a9arw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 11:52:39 -0700
Received: from localhost (2620:10d:c0a8:1b::d) by mail.thefacebook.com
 (2620:10d:c0a8:83::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 11:52:38 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [PATCH 0/2] Add Block Protect (BP) and Top Bottom (TB) bits for write
 protect
Date: Mon, 27 Jun 2022 11:52:32 -0700
Message-ID: <20220627185234.1911337-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::d]
X-Proofpoint-GUID: HlRQM7ArlUdq3MIfP-yyU6K2MdJBUuwq
X-Proofpoint-ORIG-GUID: HlRQM7ArlUdq3MIfP-yyU6K2MdJBUuwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7177cd4fe2=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hey everyone,

Adding the 3 block protection bits and top bottom bits which configure which parts
of the flash are writable and read-only.

These patches are based on previous patches I just submitted:
hw: m25p80: fixing individual test failure when tests are running in isolation
hw: m25p80: add WP# pin and SRWD bit for write protection
hw: m25p80: add tests for write protect (WP# and SRWD bit)

The tests that were added iterates through every different memory protection
case so it takes a little longer to run. Let me know what you think about that
and if that's okay or not.

Thanks,
Iris

Iris Chen (2):
  hw: m25p80: Add Block Protect and Top Bottom bits for write protect
  hw: m25p80: add tests for BP and TB bit write protect

 hw/block/m25p80.c             |  74 +++++++++++++++++++----
 tests/qtest/aspeed_smc-test.c | 111 ++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+), 12 deletions(-)

--
2.30.2


