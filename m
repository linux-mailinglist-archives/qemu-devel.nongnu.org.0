Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91A5FDBD0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:59:43 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiykQ-0001lY-H0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixZb-0008Kw-Q8; Thu, 13 Oct 2022 08:44:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixZa-0005aQ-8Y; Thu, 13 Oct 2022 08:44:27 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DC82bd027207;
 Thu, 13 Oct 2022 12:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=kmOvUCZ8D4KVQXI9mqipKzCiUg+ZNXaGlFh0Hm/uwlI=;
 b=kdgvLbSdFAvhjfV+rXdKwXH8ftdmZkVqa7x0ndN/cjPw9Vdz/9zEHTviWsXqseg8y+W1
 Fm42gYkU3YeWo6JTExQGDD+dthvoMvkEgPTQke5SKHrLpiLt6hYF0Pls896tjprwpNv0
 WjdvGSzX9rKPYQhjZwifRv1On/oyparKDgJoEklkGIQnaKztMYv32RTGEONW8vBVviR9
 zdT6CIcgh2ahdIpDP7i8R6Bwixtd/+xEkShaShsLkDDZQ8r5thao+xYuYge+pNGuL0T4
 3zsUCfmz6IjpEGjxRc7kegNW3x/vYuxN+8eBo4EDnGyQZB9EHKuQ1I5LUkbuxDGPoAJ6 wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6eqkr8dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:44:10 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DC8H8U028124;
 Thu, 13 Oct 2022 12:44:10 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6eqkr8cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:44:10 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DCZuvF004966;
 Thu, 13 Oct 2022 12:44:09 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3k30uayj9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:44:09 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29DCi8qX49676768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:44:08 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E49855805F;
 Thu, 13 Oct 2022 12:44:07 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A94358061;
 Thu, 13 Oct 2022 12:44:07 +0000 (GMT)
Received: from localhost (unknown [9.160.174.55])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Oct 2022 12:44:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 07/29] target/ppc: create an interrupt deliver method
 for POWER9/POWER10
In-Reply-To: <20221011204829.1641124-8-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-8-matheus.ferst@eldorado.org.br>
Date: Thu, 13 Oct 2022 09:44:04 -0300
Message-ID: <87a65zevvv.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ROSy9GdhtoYiFfyQW2LpFQlOe4t9eDIo
X-Proofpoint-ORIG-GUID: i046roioZt5xG5uwQxu-ndBvol1HHETF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 mlxlogscore=481 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210130074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> The new method is identical to ppc_deliver_interrupt, processor-specific
> code will be added/removed in the following patches.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

