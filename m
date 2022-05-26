Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CAD5348A5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 04:14:40 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu31K-0003c6-L4
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 22:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2yw-0001yw-JJ; Wed, 25 May 2022 22:12:15 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2yt-0005Zw-O7; Wed, 25 May 2022 22:12:09 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PGtbrP029208;
 Wed, 25 May 2022 19:11:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=0tDtY0iho28AtwSUQp0oSDDM1KX4yoxs5pcq2ac9pyg=;
 b=BziqZQ+RBdvdZ4BiqcRnj5eEK+NfAXr5hsX9jzuLmFPYR/abDgks3gPugmHZYrXWgCfI
 3ireZjl9CWtpdycP9ujDwJsDXtKvIdHAgrO1sQhoErxehZ3nmXJQsu5RMg8hA1ZL54rK
 vai5RJYaPhxbEQ6TcryrasUkAu+RrcDRr94= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g9puakxvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 19:11:50 -0700
Received: from localhost (2620:10d:c085:208::11) by mail.thefacebook.com
 (2620:10d:c085:21d::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 25 May
 2022 19:11:49 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@gmail.com>
Subject: [PATCH 0/1] hw: m25p80: add W# pin and SRWD bit for write protection
Date: Wed, 25 May 2022 19:11:42 -0700
Message-ID: <20220526021142.1030127-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::11]
X-Proofpoint-GUID: 1qorHmWyrcktnYUOKxcdQgbDDb_Gn9G9
X-Proofpoint-ORIG-GUID: 1qorHmWyrcktnYUOKxcdQgbDDb_Gn9G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_07,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6145f87153=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Iris Chen <irischenlj@gmail.com>

Hey everyone, 

My patch adds the W# pin and SRWD bit which work together to control the
status register write ability. 

Accordingly, when W# is low and SRWD bit is high, hardware protection
mode (HPM) is initiated. All other cases result in software protection. 

Acceptance tests have been added to verify all four scenarios: it tests
the ability to write to SRWD depending on whether write protection is
set. 

Thanks, 
Iris

Iris Chen (1):
  hw: m25p80: add W# pin and SRWD bit for write protection

 hw/block/m25p80.c             | 72 +++++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 62 ++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

-- 
2.30.2


