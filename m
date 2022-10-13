Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93205FDA2E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:17:41 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy5l-00017D-1o
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixbc-0002Ih-U3; Thu, 13 Oct 2022 08:46:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixbb-0006RC-C0; Thu, 13 Oct 2022 08:46:32 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DBuerB027987;
 Thu, 13 Oct 2022 12:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=z6Vk4PNkQQEL57IFqCLdf0qLrAIHkDsaBHaza6pE0BA=;
 b=CFcLzFvaSmZjKxjg2wkADVhre+pRwtaMRG1u9mw4C8HWeyII3on9Kxn/lV8piMqFyx1w
 hTlCy2apugYYFWrrg4x/ZXZ7kBulkPJp+68rTcjk1hr7Xh1A+iCYaOk2rUVP5cA3ldbN
 tcv3+dFulupE21dRHRrOPO6NHz8LGB31w2JcWu0/z/E9NhhSAokApDymdVD5ioOtSZGU
 Nwz7/eKpZ5l420QsChmfLvVt0OD/Z64t+SeX2Kwak2j2yC4WGwJvcdfpiY30ZloPUL3A
 RiWrlKzCNqLYcGazPuAcOMoz9LxBh/YJeusEG/TbWjmGgKv9wAh+M3QnaHVFb32VwaPo iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6j8bhj85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:19 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DBw3JB000959;
 Thu, 13 Oct 2022 12:46:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6j8bhj7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:18 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DCZCZ1011410;
 Thu, 13 Oct 2022 12:46:18 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3k30uafcrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:17 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29DCkG3639977320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:46:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E97358052;
 Thu, 13 Oct 2022 12:46:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEE45804C;
 Thu, 13 Oct 2022 12:46:15 +0000 (GMT)
Received: from localhost (unknown [9.160.174.55])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Oct 2022 12:46:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 08/29] target/ppc: remove unused interrupts from
 p9_deliver_interrupt
In-Reply-To: <20221011204829.1641124-9-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-9-matheus.ferst@eldorado.org.br>
Date: Thu, 13 Oct 2022 09:46:13 -0300
Message-ID: <877d13evsa.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LDzLVswh54SZwMAoHXhUf40eHs5c4eJS
X-Proofpoint-GUID: FgvRzAlgnU1QIl7XbvwdgAaPsz0jYoEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=763
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130074
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

> Remove the following unused interrupts from the POWER9 interrupt
> processing method:
> - PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
> - Debug Interrupt: removed in Power ISA v2.07;
> - Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
>   for embedded CPUs;
> - Critical Doorbell Interrupt: removed in Power ISA v3.0;
> - Programmable Interval Timer: 40x-only.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

