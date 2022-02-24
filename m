Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CA44C356E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:12:51 +0100 (CET)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJXm-0008Mc-3Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJK2-0005Zr-E2; Thu, 24 Feb 2022 13:58:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48874
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJK0-0006Pv-4s; Thu, 24 Feb 2022 13:58:38 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OIBiRx002103; 
 Thu, 24 Feb 2022 18:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+wjPKc7e40UCxNx2BOJVLdu/uQpjDDNWeu5guvmQlBI=;
 b=NlGLS5a59TS1C+wqhBUcWUNrPx76zKdU6nLKcTQRzhyqwZMgys4s/q563osv5HpbNNuE
 E2n0t7qveIeY0xFD8Kgrm0swT+izhvHYwdn0Ynd3z3mYiF7Y8K0lY58Vex6PXWc3vioj
 NudVm3Rn3TP5KzFGRMIa0daQnT/MwDUXcBUq9PZz7Gj5YToWLvwhH8wYlzwcHghJ2xgr
 Iz/31JX5DtGLSGHawO8YkwlKiH7mmuRt3SLt0JvIBgpAsq08RXM33hEurkXp7T/5NMvY
 9AN2wPzuEyFkQN1AYCmFkvttgJghqRFakv4d6S9xXy8QfAjRy5UmidYE8onwrMYrg6Uk YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edsjtnc0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:27 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21OHk5av026394;
 Thu, 24 Feb 2022 18:58:26 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edsjtnc0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:26 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21OIc6eP007962;
 Thu, 24 Feb 2022 18:58:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3eeb06csv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21OIwPNS30998942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 18:58:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352D6C605D;
 Thu, 24 Feb 2022 18:58:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AD7BC6059;
 Thu, 24 Feb 2022 18:58:23 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.135.43])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 18:58:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] ppc: nested TCG migration (KVM-on-TCG)
Date: Thu, 24 Feb 2022 15:58:13 -0300
Message-Id: <20220224185817.2207228-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z29JQKqm08tgAf0LXhll-6YV0EsfeZyX
X-Proofpoint-GUID: TiMlzdCy7y7KzZG--_rTWHQq8ZYzDIW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=885 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements the migration for a TCG pseries guest running a
nested KVM guest. This is just like migrating a pseries TCG guest, but
with some extra state to allow a nested guest to continue to run on
the destination.

Unfortunately the regular TCG migration scenario (not nested) is not
fully working so I cannot be entirely sure the nested migration is
correct. I have included a couple of patches for the general migration
case that (I think?) improve the situation a bit, but I'm still seeing
hard lockups and other issues with more than 1 vcpu.

This is more of an early RFC to see if anyone spots something right
away. I haven't made much progress in debugging the general TCG
migration case so if anyone has any input there as well I'd appreciate
it.

Thanks

Fabiano Rosas (4):
  target/ppc: TCG: Migrate tb_offset and decr
  spapr: TCG: Migrate spapr_cpu->prod
  hw/ppc: Take nested guest into account when saving timebase
  spapr: Add KVM-on-TCG migration support

 hw/ppc/ppc.c                    | 17 +++++++-
 hw/ppc/spapr.c                  | 19 ++++++++
 hw/ppc/spapr_cpu_core.c         | 77 +++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_cpu_core.h |  2 +-
 target/ppc/machine.c            | 61 ++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 2 deletions(-)

-- 
2.34.1


