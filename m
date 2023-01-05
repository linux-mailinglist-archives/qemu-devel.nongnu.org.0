Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEB65F65B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:02:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYJq-0002N6-T7; Thu, 05 Jan 2023 17:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDYJo-0002Mr-9Z
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:02:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDYJl-0003tD-Qb
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:02:35 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305Lw3pB018811
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 22:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=0qDSRofno+6AbcOmLl+ARnibhYPpzQ2nOviKbaXJrOw=;
 b=Y28qwr84bJBFyW0NdaLwfkYHbi4uxlxmMB4MOk0n0wbDSTRfWnqntoi09f5eVlnZtw9X
 6j5aDd2n+LoBCBFJnjBJ9oSxlV6zq3zcizKdaiPVwWSAdu0qbPbD9ts2yybAP/6SbL1D
 J52onuuhPrAZlacz2+naqoaZQZMf43kymSXxe0IX3IgjO0LpyVnn0Fk2ygEAUwqSYsgK
 GYOhqDplIYPutOK5lURoiSIQ5pvxU02iZVrF/8vib1avwFt9aghF7o1NpAs6bbk3Csti
 CcRmryYmdh4R0L6pXMX9rFX2dgwuAoYALyO2Qccp/fx6uZVMo/DvW3benzmjoziX9Fwe MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx4aukx7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 22:02:31 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305Lv2tx008420
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 22:02:31 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx4aukx6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:02:31 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305KKm4E006610;
 Thu, 5 Jan 2023 22:02:30 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mtcq8r3tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:02:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305M2SAS5898872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 22:02:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A932E7805E;
 Thu,  5 Jan 2023 23:36:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E27517805C;
 Thu,  5 Jan 2023 23:36:19 +0000 (GMT)
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [9.211.64.53])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 23:36:19 +0000 (GMT)
Message-ID: <387334f6a4d2cf54f2fbfbebe7a06b931adf797a.camel@linux.ibm.com>
Subject: Re: [PATCH v5 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 05 Jan 2023 17:02:26 -0500
In-Reply-To: <789bd0bd-05ed-c413-272e-0204472f3e3b@linux.ibm.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-3-jejb@linux.ibm.com>
 <789bd0bd-05ed-c413-272e-0204472f3e3b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UFMR_C3uB_0PCSer2VVa-sHXokUwV84K
X-Proofpoint-GUID: qNYOsiTZJfxQLe3RXrXrH36AiTl0mgqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=894 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050173
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-01-05 at 11:20 -0500, Stefan Berger wrote:
> 
> 
> On 1/5/23 08:00, James Bottomley wrote:
[...]
> > +The mssim backend supports snapshotting and migration, but the
> > state
> > +of the Microsoft Simulator server must be preserved (or the server
> > +kept running) outside of QEMU for restore to be successful.
> 
> My comments to v3 still apply here.

You didn't make any v3 comments on migration.

> I also just tried migration and on the -incoming side it did not work
> anymore. Did you test this?

Well, yes, as I said.  However, I seem to have left one change in my
local tree which I forgot to sync to the patch:

diff --git a/backends/tpm/tpm_mssim.c b/backends/tpm/tpm_mssim.c
index 75dce165b8..125c8d0b15 100644
--- a/backends/tpm/tpm_mssim.c
+++ b/backends/tpm/tpm_mssim.c
@@ -66,7 +66,7 @@ static void tpm_mssim_instance_finalize(Object *obj)
 {
     TPMmssim *t = TPM_MSSIM(obj);
 
-    if (t->ctrl_qc && !runstate_check(RUN_STATE_INMIGRATE))
+    if (t->cmd_qc && !runstate_check(RUN_STATE_POSTMIGRATE))
         tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, NULL);
 
     object_unref(OBJECT(t->ctrl_qc));

James


