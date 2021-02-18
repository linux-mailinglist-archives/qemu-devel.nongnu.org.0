Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9331EDFB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:07:28 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCni3-00076z-Vd
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lCnIk-0000Bo-64; Thu, 18 Feb 2021 12:41:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lCnIc-0006v7-Vr; Thu, 18 Feb 2021 12:41:16 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IHXmjb083744; Thu, 18 Feb 2021 12:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=fDmQsUKDrixNuqYATDnYtFrn46IuoVoX+WWxwtWfPJw=;
 b=fshDZrNfCcxyX5ujxAFWFeh55puN9JbomECpT72ovUSR7yTOPY4RSDHLg7iuQV/p/Ruy
 pc6Y9i4m50AqYYjnC1cHYpBzGIPRwG3oX0RG0CFwry+BGuXzthCkQat4J9feDyczNRP2
 Vqn4NGwEXahHV4ETyvyo9Dp3OYd8wt1qnUbvdltslB85uKhj6ufwxDcILtLrJAM14t9U
 PErKYNAejjP/K6BQuF3PekLIhwNl555wRbD8ntFvEGG9PP2/FxlD4Y9JkUmOTXC/U04K
 mW0BC/KszsQSufFA5gc6MKpUKPMU1Nwr3hNGf0eqo2WNWeLyUNMhYL3Bbgfri5hRR7UV OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36stphwbyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 12:41:06 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IHXt3X084185;
 Thu, 18 Feb 2021 12:41:06 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36stphwbxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 12:41:06 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IHbm82028032;
 Thu, 18 Feb 2021 17:41:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 36rw3u9g9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 17:41:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11IHf1DU23003402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 17:41:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E69BA11C054;
 Thu, 18 Feb 2021 17:41:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 704A011C04C;
 Thu, 18 Feb 2021 17:41:00 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.94.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 17:41:00 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: cohuck@redhat.com
Subject: [PATCH 0/1] css: SCHIB measurement block origin must be aligned
Date: Thu, 18 Feb 2021 18:40:58 +0100
Message-Id: <1613670059-8406-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180146
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, imbrenda@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

By testing Measurement with KVM unit tests I fall on this:
we forgot to test the alignment of the MBO for measurement format 1.

The MB must be aligned on 128bits otherwise an operand exception
is recognized.

Regards,
Pierre

Pierre Morel (1):
  css: SCHIB measurement block origin must be aligned

 target/s390x/ioinst.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.25.1


