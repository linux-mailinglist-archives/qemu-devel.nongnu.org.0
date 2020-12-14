Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C72D9B58
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:46:01 +0100 (CET)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koq2y-0005bP-VK
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1koq1q-00057q-Ao
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:44:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1koq1o-00085T-9n
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:44:50 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BEFfAVR195754; Mon, 14 Dec 2020 10:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PTqTyuaajtddIPehTawg6EdWAslE5ZyJ1G7+EKUgzOM=;
 b=l8kw91GpuFvZCaz1TfqrT/lkFb1aTZTX4HEcmVQ2cPigVLh6M6k4ehYE9K9bawzViygy
 9GEwUoGwRonZxK0N02DWFje6Cygp6fGGCQCD8ENJ00QY6le4Rfl4yDsBN+u/J7BXkocQ
 lPxvOty5uIo5HWSLwYNnHRYunYKV8cmr7TvdIK6ZZb0toWAZzHSi/AmMtqGDopIE5QXY
 2XcOhOno8Gt5ZZx4Vg4rokr7d3UNj+gOFzM0hoE93TOIXWvDWPEDeGuI2UzVKpDQXmCM
 yQ1ScESA2gW/cQOt539NOAoaZ7XkRCmdGEvcRYW9DTdGsl3+cUlGAgdeE5ZBgtJpN6Cb ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35eawk0627-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 10:44:43 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BEFgoDB006533;
 Mon, 14 Dec 2020 10:44:42 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35eawk0617-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 10:44:42 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BEFYUPC018255;
 Mon, 14 Dec 2020 15:44:41 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 35cng8ruh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 15:44:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BEFiblZ25362816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 15:44:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FDF1BE051;
 Mon, 14 Dec 2020 15:44:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13615BE053;
 Mon, 14 Dec 2020 15:44:34 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.214.106])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 15:44:34 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] sev: enable secret injection to a self described area
 in OVMF
Date: Mon, 14 Dec 2020 07:44:27 -0800
Message-Id: <20201214154429.11023-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_06:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=922 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jejb@linux.ibm.com, jon.grimm@amd.com, tobin@ibm.com,
 frankeh@us.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 dovmurik@linux.vnet.ibm.com, Dov.Murik1@il.ibm.com, pbonzini@redhat.com,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: fix build issues and update comments.  Also drop the first patch
    which is now merged upstream

The two patches introduce a parser for the optional OVMF description
table which is placed just below the reset vector (the format of the
table is described in the patch itself) and also adds a hook to pull
out the description of the SEV secret area location and use it in
place of the sev-inject-launch-secret gpa.

James

---

James Bottomley (2):
  pc: add parser for OVMF reset block
  sev: update sev-inject-launch-secret to make gpa optional

 hw/i386/pc_sysfw.c    | 106 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h  |   4 ++
 qapi/misc-target.json |   2 +-
 target/i386/monitor.c |  27 ++++++++++-
 4 files changed, 137 insertions(+), 2 deletions(-)

-- 
2.26.2


