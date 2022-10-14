Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD05FF0B0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:54:56 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojM5P-0003Ya-5e
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojM1M-0006vY-7p; Fri, 14 Oct 2022 10:50:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojM1K-0003iM-NO; Fri, 14 Oct 2022 10:50:44 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EDg8O3031341;
 Fri, 14 Oct 2022 14:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=109oB/XSg7IcHwq96j5DysXqaG5iCNHA4zTla1HC3vE=;
 b=MRVoKGIGUUzrj/d3wHcYQp91Z+PJFkddxPXYCn3yqx+Hqsa31db+8HNM77dzT3JbOTev
 qBBNMsqwAbsfw86UW6ST479p+LiCX2hOmYXSE4JMvuM+wjqbu0Ea6KZZGGmqUyTD9vlY
 2R9in9val5GvEIOsKEckXIcmRyzKlV2gXn69pZ5enD4/pUgoOba+doWsmiVb6h13ucfh
 K0ySt9NnvV0q8hPU7gZgBnOqhI19aXxOcwmcWmtc121AV330BKCkjtbXYIPDa29nO/y/
 YqsP+kbImnZVvftdXZPQNsT5ZTxkR1QNIPZ55EF+3O5CkVmEDihePwvoVane87jw4HqM YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78vk2r9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:50:27 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EDgaLV000648;
 Fri, 14 Oct 2022 14:50:27 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78vk2r8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:50:26 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EEo3mu020954;
 Fri, 14 Oct 2022 14:50:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3k30uat784-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:50:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EEoPND5243402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 14:50:25 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A5EF5805D;
 Fri, 14 Oct 2022 14:50:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA26358059;
 Fri, 14 Oct 2022 14:50:23 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 14:50:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 18/29] target/ppc: add power-saving interrupt masking
 logic to p8_next_unmasked_interrupt
In-Reply-To: <20221011204829.1641124-19-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-19-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 11:50:21 -0300
Message-ID: <87bkqe4fyq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ySY9xii2iWEPHBGz0D7t5nXxVpyR7imV
X-Proofpoint-GUID: Na4_H7KMkEz0S2MZ-6xGpNAKCF6DYSD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=599
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Export p8_interrupt_powersave and use it in p8_next_unmasked_interrupt.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

