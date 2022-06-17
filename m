Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25A550061
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 01:10:09 +0200 (CEST)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2L6N-0001oT-T4
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 19:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2L4m-0000kB-UZ; Fri, 17 Jun 2022 19:08:29 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:32202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2L4f-0006Ts-GS; Fri, 17 Jun 2022 19:08:25 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HLivEc009021;
 Fri, 17 Jun 2022 16:08:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=fS6VuFJj66muA7HMqzKNwdx+8I7PrrdbKOjx3o00nv8=;
 b=OrqieDySLnJ8KbixVkuCxc/s+qBym/KFg2OVd3rN+cEqWV/09UfXke4QukK0IyoPHKwf
 6fKvb07BIyyO5DoTRgFBD+NaXA5/dh4eZN+n2Vf6BlNhyUK8fZHM/+qtAOUMFhJSf+Ms
 89xMdCM+2LhxLkGFxV0fK1UMOdf7wIY0S3U= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3grf2g6cn6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jun 2022 16:08:06 -0700
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c085:21d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 17 Jun
 2022 16:08:04 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [PATCH 0/1] hw: m25p80: fix aspeed_smc tests failure when run in
 isolation
Date: Fri, 17 Jun 2022 16:07:58 -0700
Message-ID: <20220617230758.2537544-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-GUID: dxWgSUN6iC7U9_8wqKj9hkEWRAGR9R6u
X-Proofpoint-ORIG-GUID: dxWgSUN6iC7U9_8wqKj9hkEWRAGR9R6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_15,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71671d6567=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
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

Hey everyone,

I discovered that some of the tests in tests/qtest/aspeed_smc-test.c were
failing when run in isolation due to dependencies between the tests. For
example, one test would test the reading of a block of memory written
in the test before it.

I think it would make sense to add flash_reset() between running the
tests and make sure the tests do not rely on each other. Thus, I have
made changes to the tests so that they now pass individually with
no dependencies on each other.

Thanks,
Iris

Iris Chen (1):
  hw: m25p80: fixing individual test failure when tests are running in
    isolation

 tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 11 deletions(-)

--
2.30.2

