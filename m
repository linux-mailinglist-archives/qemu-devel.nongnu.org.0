Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03455FF181
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 17:37:30 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojMkb-0003EL-LM
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 11:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMTN-0003ZV-2o; Fri, 14 Oct 2022 11:19:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMTI-0008RD-Sr; Fri, 14 Oct 2022 11:19:40 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EF9Rgo031455;
 Fri, 14 Oct 2022 15:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+5BuR9D/k5u1lGVkXOVFQkX379FT/lWDfSH495eZVjY=;
 b=TwTejw4KkJ7DcVbguZfx2q7VTGuKKwoQH+yZdmZNmIPPsAkrJqRmstI72MA5AXw28jKQ
 oIz9lmTwKtm7hiG26vSDSYaO6A1vVxDOqSTIAZ2HNOdTVm3pjOWSSxLyA/dyoqbIMa5s
 KTG2o3+aaEZ58xPy5w/m+5qkNs7LBLpCQxli0E3iceVaxcn+WRjghjsdCX2Ls4tmxCdg
 f1VJ9O+XYK8m/JkWZSNt1z9UAsp8XVfg7BLwlIdKZzUyuD59cA9pGkX0CFI8whsgcU/9
 QUbUv5cNBH504qL+ZGy8VT/SzrRcprMYen+2GYcvOI3ww7eZaWUF5jDXX2prXEmSismr Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78vk3rsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:19:27 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EDhdO5009379;
 Fri, 14 Oct 2022 15:19:27 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k78vk3rsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:19:27 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EF5Bqo029815;
 Fri, 14 Oct 2022 15:19:26 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3k30uatcjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:19:26 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EFJPCV20841292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 15:19:25 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC47458043;
 Fri, 14 Oct 2022 15:19:24 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10DEC58053;
 Fri, 14 Oct 2022 15:19:24 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 15:19:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 27/29] target/ppc: introduce ppc_maybe_interrupt
In-Reply-To: <20221011204829.1641124-28-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-28-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 12:19:21 -0300
Message-ID: <87lepi301y.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DKBBDSh7-WJtijOk4WiBF1fA3ik6VGkI
X-Proofpoint-GUID: Cfus4a7-YEviEqgf9taWuvzYT98Ra0fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=491
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140083
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

> This new method will check if any pending interrupt was unmasked and
> then call cpu_interrupt/cpu_reset_interrupt accordingly. Code that
> raises/lowers or masks/unmasks interrupts should call this method to
> keep CPU_INTERRUPT_HARD coherent with env->pending_interrupts.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

