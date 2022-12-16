Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664564EE2B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CxJ-0006z0-3E; Fri, 16 Dec 2022 10:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p6Cwz-0006qs-EH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:48:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p6Cwv-0007LW-Uu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:48:40 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGFlXNx015792
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=EisE5eE+dZ+9j2lsXOGXmPqQ4meU0VXCGLmBioIpCPI=;
 b=CUsF0XRdVpKZcKtOuiUxLB0K7eAfEQuDC1T4/GBAoq7c6tK64/5eFpXni9TnKO9oised
 DTBWYgOy5r2VdjhKK0kSv52MHD6y24BT3jzCX5TBNNj248Ev7TIvEIb9FZhNuHnn8DbC
 ThfCN1XNTuwp4RewEoe69fVBs6/sxuWUxs90kFyv1gvZBJBiil4JsNlmm/dAQN3Sna5G
 8ZfCxPUrwV7ca7CnXiEMLwnTKlsB8YvqaW1CZf3ekhBzQlRwGOponEZ6NXT6YOksvZwG
 EMXymTNGOLMcKVoFG1lzmMvXeTwHTSknixClsZ2gOUc6ix/18gABybEM9GjLBN4vKvJQ yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgumh00jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:48:36 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGFmZFu019335
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:48:35 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgumh00jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 15:48:35 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGF1qFW027646;
 Fri, 16 Dec 2022 15:48:35 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mf00x2un3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 15:48:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BGFmYtR44630542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 15:48:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA2497805E;
 Fri, 16 Dec 2022 17:08:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E9097805C;
 Fri, 16 Dec 2022 17:08:16 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Dec 2022 17:08:16 +0000 (GMT)
Message-ID: <c4203617f5a017c30175ebccde80bdc3d680b615.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Fri, 16 Dec 2022 10:48:31 -0500
In-Reply-To: <1ee8a9cb-ba2c-60d0-a150-9710270020b7@linux.ibm.com>
References: <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com>
 <1ee8a9cb-ba2c-60d0-a150-9710270020b7@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OfuyNrvywvzsa58A9w-UEX57bQbEPG2W
X-Proofpoint-GUID: B6Me9DGtKGXaBUHEumGHQLUMCv5fHswp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_09,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 2022-12-16 at 09:55 -0500, Stefan Berger wrote:
> 
> 
> On 12/16/22 09:29, Daniel P. Berrangé wrote:
> 
> > 
> > All the objections you're raising are related to the current
> > specifics of the implementation of the mssim remote server.
> > While valid, this is of no concern to QEMU when deciding whether
> > to require a migration blocker on the client side. This is 3rd
> > party remote service that should be considered a black box from
> > QEMU's POV. It is possible to write a remote server that supports
> > the mssim network protocol, and has the ability to serialize
> > its state. Whether such an impl exists today or not is separate.
> 
> Then let's document the scenarios so someone can repeat them, I think
> this is just fair. James said he tested state migration scenarios and
> it works, so let's enable others to do it as well. I am open to
> someone maintaining just this driver and the dynamics that may
> develop around it.

Well, OK, this is what I think would be appropriate ... I'll fold it in
to the second patch.

James

---

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 535912a92b..985d0775a0 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -270,6 +270,38 @@ available as a module (assuming a TPM 2 is passed through):
   /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
   ...
 
+The QEMU TPM Microsoft Simulator Device
+---------------------------------------
+
+The TCG provides a reference implementation for TPM 2.0 written by
+Microsoft (See `ms-tpm-20-ref`_ on github).  The reference implementation
+starts a network server and listens for TPM commands on port 2321 and
+TPM Platform control commands on port 2322, although these can be
+altered.  The QEMU mssim TPM backend talks to this implementation.  By
+default it connects to the default ports on localhost:
+
+.. code-block:: console
+
+  qemu-system-x86_64 <qemu-options> \
+    -tpmdev mssim,id=tpm0 \
+    -device tpm-crb,tpmdev=tpm0
+
+
+Although it can also communicate with a remote host, which must be
+specified as a SocketAddress via json on the command line for each of
+the command and control ports:
+
+.. code-block:: console
+
+  qemu-system-x86_64 <qemu-options> \
+    -tpmdev "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'remote','port':'2321'},'control':{'type':'inet','host':'remote','port':'2322'}}" \
+    -device tpm-crb,tpmdev=tpm0
+
+
+The mssim backend supports snapshotting and migration, but the state
+of the Microsoft Simulator server must be preserved (or the server
+kept running) outside of QEMU for restore to be successful.
+
 The QEMU TPM emulator device
 ----------------------------
 
@@ -526,3 +558,6 @@ the following:
 
 .. _SWTPM protocol:
    https://github.com/stefanberger/swtpm/blob/master/man/man3/swtpm_ioctls.pod
+
+.. _ms-tpm-20-ref:
+   https://github.com/microsoft/ms-tpm-20-ref


