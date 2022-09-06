Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F05AE33E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:43:29 +0200 (CEST)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUB6-0008Lo-FT
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1oVTwJ-0005DC-6E; Tue, 06 Sep 2022 04:28:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1oVTw3-0003iV-LC; Tue, 06 Sep 2022 04:28:10 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2868CmY6020304;
 Tue, 6 Sep 2022 08:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : content-transfer-encoding : in-reply-to : references : cc :
 from : subject : to : message-id : date; s=pp1;
 bh=X14S1t8iOyLE3wWBeBqZLQ9sLfznSv1wQi96oOHVnIw=;
 b=NGIu0MhK5UTdnlLbfacecHmXOTzn45PfJ/Hlr+67rsX6bCfV6s+kdcgySlgkPFGNrJqK
 +BXRQBd6HO827y1hPiYzWzV5TYSU4qnEFH75IoU2uW3bO9K0rXx7PVWpMJzXyZLqrlDx
 WEbueYdDss9lVxVYDcUTuw5I+0zklS+XpTmBOwVgnNIGcbPHx6K7KjscKNboJCitglh/
 xEWs+4/fMA5MGGkmWYmhpjJCzS7fyeptw4HEw+bKGsiD2o02P+l68lqrEU8pIoIiosrh
 AESMsjXOUWvPGbgMxivOJSn9Gco1Qyw2fzT4C4fZ+v7yUP6RU5haASV1/VK6VlJni7Cm 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je2gc0gmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:27:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2868D2mr020981;
 Tue, 6 Sep 2022 08:27:52 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je2gc0gkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:27:52 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2868Lxbk007595;
 Tue, 6 Sep 2022 08:27:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3jbxj8thx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:27:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2868RjLs39256392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 08:27:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE6C11C04C;
 Tue,  6 Sep 2022 08:27:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E68D11C04A;
 Tue,  6 Sep 2022 08:27:45 +0000 (GMT)
Received: from t14-nrb (unknown [9.171.15.101])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 08:27:45 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220902075531.188916-7-pmorel@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-7-pmorel@linux.ibm.com>
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com
From: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [PATCH v9 06/10] s390x/cpu_topology: resetting the
 Topology-Change-Report
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Message-ID: <166245286528.5995.1915366030580373557@t14-nrb>
User-Agent: alot/0.8.1
Date: Tue, 06 Sep 2022 10:27:45 +0200
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ekYQNY6kL4HH4emiPseFOAds7pVzGOnb
X-Proofpoint-ORIG-GUID: wksvxoRE0R37mCA3YQWUAyEAOF5hNGEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=872 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060038
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nrb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Quoting Pierre Morel (2022-09-02 09:55:27)
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>  bit of the SCA in the case of a subsystem reset.
>=20
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>

Reviewed-by: Nico Boehr <nrb@linux.ibm.com>

