Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A5473670
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:13:02 +0100 (CET)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsd3-000439-DQ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mwsZi-0002EF-PG; Mon, 13 Dec 2021 16:09:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mwsZg-00072d-HL; Mon, 13 Dec 2021 16:09:34 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDKEXhw007434; 
 Mon, 13 Dec 2021 21:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wHdd3khv0Fb/wfaES9ABglSt9N/YAlJGERYJSuAsOTg=;
 b=le3U6kpe/z0Fb3YvXUfzTl+JidOq7Wg42oxROVtWIM78vipEse1Dsmf1F/QoSAdRQnkq
 yqmFH4MdQ3dN697ru8+R2LEv99dM+XrH0Z6dzefWrXNND1In/DjtKIP7pPS4gvUlnW6Y
 f74Zm9UjSemOOU0xDEjhM1eLWVk952KYSvkhRdX4D0IzkVvnRLFcoJvB3hC+x1iNGMbf
 d6fWwNckJL2q1rUBFSHtnYjGgibTTHJwoT51KaZV8s9wP4qPcSuuyLlO1ilHpn3Nfhg8
 xjjK7L4M9VtORepF7acieZ1dgFwZ78SxXcRRMm4/QqcZ7QwUj8hiw4tFy/EeCVJkLEkM Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9r8xu6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BDKoBGu012932;
 Mon, 13 Dec 2021 21:09:26 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9r8xu5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:26 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BDL8L1O000630;
 Mon, 13 Dec 2021 21:09:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cvkm97uhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BDL9Kl136503850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:09:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A180911C052;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB0711C04A;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 3D136E03A3; Mon, 13 Dec 2021 22:09:20 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v5 0/1] s390x: Improvements to SIGP handling [QEMU]
Date: Mon, 13 Dec 2021 22:09:18 +0100
Message-Id: <20211213210919.856693-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rBPwN3Ccq6Qng1zPGRxNIp-Df_1CYrY7
X-Proofpoint-GUID: 60Uhn26VDRw2V4sxsBDRM-cuuKECCvDD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_10,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=894 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is an update to the SIGP handling series, to correspond to
version 5 of the KVM series [1].

Unlike earlier versions, there is no new interface to exploit.
So this simply rearranges processing to mirror expectations
on the kernel side.

[1] https://lore.kernel.org/r/20211213210550.856213-1-farman@linux.ibm.com/

Previous RFCs:
v1: https://lore.kernel.org/r/20211008203811.1980478-1-farman@linux.ibm.com/
v2: https://lore.kernel.org/r/20211102201122.3188108-1-farman@linux.ibm.com/
v3: https://lore.kernel.org/r/20211110204528.1378524-1-farman@linux.ibm.com/
v4: https://lore.kernel.org/r/20211119214327.2367026-1-farman@linux.ibm.com/

Eric Farman (1):
  s390x: sigp: Reorder the SIGP STOP code

 target/s390x/sigp.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.32.0


