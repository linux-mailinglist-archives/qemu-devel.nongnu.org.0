Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782E644060
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 10:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2UbJ-0000x6-Q1; Tue, 06 Dec 2022 04:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1p2UbH-0000wG-HK; Tue, 06 Dec 2022 04:50:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1p2UbF-0004lh-9S; Tue, 06 Dec 2022 04:50:55 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B68d8ce038574; Tue, 6 Dec 2022 09:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HEnBc0a7dLtzERrjqLKWlUgLPb5IXcrZyBfKND3uQyQ=;
 b=jqZHiKFEUFO40CTzsQesVPBT/DN344GuYEMt2Vl1SxgyzISypP0IFQas8U7wz5IhLAMj
 MQ7nU0h5YeG/6mIupEL1ooSBOy2ZwN0IAa5hvB6JbJWacsMjDpYcoaL5tkhGW+h5TJh6
 1OhAtdQ9RI6bi9KDv/ilfifxNRUjDDfzTQKLsF5OfO4GYB/goxkLXgB7J0org5V896Ge
 x9Hj0si6RN2DwUFm/677wQ/vd/MrAqFA/Xj6P2fJS0pW0bpyICDPN/ioPdCGPkyR4ee4
 Tm7YSvtm+wlGJOAEMK5ttKfwilwxbhw8vH73M1idutp9RDiRpVHiI4KDVu0Vrdi5W07r sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ma2dtspvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:50:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B690Rav002670;
 Tue, 6 Dec 2022 09:50:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ma2dtspuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:50:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B5K5Mho016476;
 Tue, 6 Dec 2022 09:50:41 GMT
Received: from smtprelay08.fra02v.mail.ibm.com ([9.218.2.231])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3m9m6y0um3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:50:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com ([9.149.105.160])
 by smtprelay08.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B69ob9H15205046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 09:50:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C127A4054;
 Tue,  6 Dec 2022 09:50:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F89AA405B;
 Tue,  6 Dec 2022 09:50:36 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.52.73])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Dec 2022 09:50:36 +0000 (GMT)
Message-ID: <ec301c79fde5190754374b6c66fd373a71659053.camel@linux.ibm.com>
Subject: Re: [PATCH v12 3/7] s390x/cpu_topology: resetting the
 Topology-Change-Report
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Tue, 06 Dec 2022 10:50:36 +0100
In-Reply-To: <20221129174206.84882-4-pmorel@linux.ibm.com>
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _K-NBiLWW7F6OsTINPOvf73cgpczG-n8
X-Proofpoint-ORIG-GUID: jMX6YV8fP2Aan8Q0iy_3rjH336t7SYzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=919 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060078
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2022-11-29 at 18:42 +0100, Pierre Morel wrote:
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>  bit of the SCA in the case of a subsystem reset.
  ^ weird space

[...]

