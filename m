Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A65F0DBC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:40:47 +0200 (CEST)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHC1-0001HO-2m
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeH5y-0005dA-OH; Fri, 30 Sep 2022 10:34:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeH5w-0008MR-5N; Fri, 30 Sep 2022 10:34:30 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UENoKO036193;
 Fri, 30 Sep 2022 14:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=izNMAZuQS+XeeGo92VA3Gdlo7NtRZ+Kjird7PUMPyKY=;
 b=IOPq3fFZRudgWt2SPUUVaoLfrE1XRATn01FdHP+dtGiIFi//TdkLytYO6XhHOgRNSGmE
 0fz5M8zrMz0JWUG+Xo6/OlpJwsDM0s26O1ZCwvKvi2k5naPXr0yr8qN3e7fvPOx8PS2N
 JQQIuH1jRoUsnwrd3O5Y6LuUPUsCfuTpDb7Mf9ilegA2S/TQJ/ytyUDzpBWpZvFiEwSs
 hLbA+09VGDX46qL4uzcb6NtlP548kko4IOwIwzJoPqObCEchuv76KRH/QuqHcszTqnHG
 GSzSQDRxZHtqIFEeVAuwlYUDvhMxq7+cEfNC8LoSOlidQ3liGZScrALtIRp7Df1tB0NU Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx261g7ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 14:33:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UEOjPJ040765;
 Fri, 30 Sep 2022 14:33:07 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx261g7gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 14:33:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UEKoQB020858;
 Fri, 30 Sep 2022 14:32:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3jssha0vh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 14:32:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28UEWhLS20448170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 14:32:43 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D00CE58050;
 Fri, 30 Sep 2022 14:32:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E0515805E;
 Fri, 30 Sep 2022 14:32:42 +0000 (GMT)
Received: from localhost (unknown [9.160.76.206])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Sep 2022 14:32:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 02/29] target/ppc: always use ppc_set_irq to set
 env->pending_interrupts
In-Reply-To: <20220927201544.4088567-3-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-3-matheus.ferst@eldorado.org.br>
Date: Fri, 30 Sep 2022 11:32:39 -0300
Message-ID: <87wn9l53w8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PJV-h_8Z8hyO4Qh0WkhCQa9CCvyWW4iB
X-Proofpoint-GUID: bnzT_6joygm-Q4eORL7JHN3r7LTUGTjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=424 impostorscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300092
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

> Use ppc_set_irq to raise/clear interrupts to ensure CPU_INTERRUPT_HARD
> will be set/reset accordingly.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

