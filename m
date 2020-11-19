Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75622B98C8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:00:44 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnIZ-0001Jn-EL
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFe-0008ID-PY; Thu, 19 Nov 2020 11:57:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40036
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFc-0004eD-VF; Thu, 19 Nov 2020 11:57:42 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJGXbTL181894; Thu, 19 Nov 2020 11:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=E0GTTVgyXhj12pa0mJauQFYiR/f4GUZbXKslJM7vJic=;
 b=ZhhafVprA33uF4R3oW5Ig+OOdBrRQXkK0aYHbMvuFRt835stlu50oWlNr/ToA7NP75u4
 4c7lEcrYIJymn9m7L3s9mdKfFMc4P3g77VMJmPscXAyqe5YDLmG+/iVfHEjqh76Y+KSQ
 DgkDHN+9Qj5bg/kxMzwyhzVMoO5/BllwkYRLywQmloiR9TMMWwCKvtbYYzjkNJIa0OQL
 7OIJmWroUb82yw6q/4lJCP2aSvuaqr8WghWD6g7mSSePa1FfpLS72/oFzD6xX8s9jcK9
 A7M4m/WeTA3jNOEQv8KSNChtgGb3PZq7DlP0CaPHZJygySiT5BNJPPah/fn6/fNQHlBg VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wumaancs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:39 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJGY8EP185672;
 Thu, 19 Nov 2020 11:57:39 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wumaanas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:39 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJGr7EP027956;
 Thu, 19 Nov 2020 16:57:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 34t6v8atv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:57:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AJGvVPo59900314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 16:57:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5293B4C05C;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496D94C058;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 05DF8E23AD; Thu, 19 Nov 2020 17:57:31 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 1/2] pc-bios: s390x: Ensure Read IPL memory is clean
Date: Thu, 19 Nov 2020 17:57:28 +0100
Message-Id: <20201119165729.63351-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119165729.63351-1-farman@linux.ibm.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=845 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If, for example, we boot off a virtio device and chreipl to a vfio-ccw
device, the space at lowcore will be non-zero. We build a Read IPL CCW
at address zero, but it will have leftover PSW data that will conflict
with the Format-0 CCW being generated:

0x0: 00080000 80010000
       ------ Ccw0.cda
              -- Ccw0.chainData
                -- Reserved bits

The data address will be overwritten with the correct value (0x0), but
the apparent data chain bit will cause subsequent memory to be used as
the target of the data store, which may not be where we expect (0x0).

Clear out this space when we boot from DASD, so that we know it exists
exactly as we expect.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 pc-bios/s390-ccw/dasd-ipl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
index 0fc879bb8e..71cbae2f16 100644
--- a/pc-bios/s390-ccw/dasd-ipl.c
+++ b/pc-bios/s390-ccw/dasd-ipl.c
@@ -100,6 +100,9 @@ static void make_readipl(void)
 {
     Ccw0 *ccwIplRead = (Ccw0 *)0x00;
 
+    /* Clear out any existing data */
+    memset(ccwIplRead, 0, sizeof(Ccw0));
+
     /* Create Read IPL ccw at address 0 */
     ccwIplRead->cmd_code = CCW_CMD_READ_IPL;
     ccwIplRead->cda = 0x00; /* Read into address 0x00 in main memory */
-- 
2.17.1


