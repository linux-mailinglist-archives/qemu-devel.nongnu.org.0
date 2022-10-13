Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7895FDBEF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:04:07 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyog-0005zu-0y
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixc6-0002uQ-Nt; Thu, 13 Oct 2022 08:47:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58958
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oixc5-0006TZ-C1; Thu, 13 Oct 2022 08:47:02 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DCdxP9005163;
 Thu, 13 Oct 2022 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=9qFncEseyFDdyThy1Q2SPAH2lTvvd5qFLLR1AiZcI6Y=;
 b=Lq1Y+CiCHJ3m1DET7j1bif8mH+ZZ/MpLcI4P/jKnGWo8GAkdQjPly+kPWvmRlgur8XoS
 Emel1dvLDE+vErZwtPR+1DmhqV1A5eOy8Kmks7puzcHAn3tVF6TAZryXX7D0TlcwKChs
 TLVvmKZ3AVEQTYMZkz/J1XX8SxFGqyXMGCvamZkpSD82N6IQIWd7Dzmyuel/dBZRwvMv
 rvTCwG0K2UPgSXZUE4oGlf9sMUtmMvlh8fL2Ew7PBmSZPH4JOP0/96cRoorX4XnXzJMT
 JtLAEx2y2YYEBVTBE16vQGFXdqU0SO+I3C0ciAIK8iEw9OdsmcyGv0dltHT0BuYYMG6a eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gw0uq0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DCeG4a006802;
 Thu, 13 Oct 2022 12:46:46 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gw0uq02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:45 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DCZVhA014678;
 Thu, 13 Oct 2022 12:46:45 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3k30uafkq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 12:46:45 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29DCki8c13828524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:46:44 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2431858054;
 Thu, 13 Oct 2022 12:46:44 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DD1F5804E;
 Thu, 13 Oct 2022 12:46:43 +0000 (GMT)
Received: from localhost (unknown [9.160.174.55])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Oct 2022 12:46:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 09/29] target/ppc: remove generic architecture checks
 from p9_deliver_interrupt
In-Reply-To: <20221011204829.1641124-10-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-10-matheus.ferst@eldorado.org.br>
Date: Thu, 13 Oct 2022 09:46:41 -0300
Message-ID: <874jw7evri.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uSVfPRw-dSDjlUBOn1JIxgjzkW9tzTHz
X-Proofpoint-GUID: eRdZfZQOCRZ9_UlTQMxjwWm_ygNgE9g4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=696 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210130074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

