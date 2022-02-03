Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771024A8892
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:30:03 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFezi-0006PO-9Y
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFewC-0004ag-PB; Thu, 03 Feb 2022 11:26:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFewA-0007it-He; Thu, 03 Feb 2022 11:26:24 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213G8Cqe003412; 
 Thu, 3 Feb 2022 16:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YvVGHuoHa196FH//jL86t4krPLWZgd0RbPN71QNAZqw=;
 b=PlYvI3aHDBx4TxlvswdwczZjYDamUcXuQYwF+IM9ToSQNYmXC92T7QdxzJblzgNLA4KT
 SYCplXbZjp8NyszLfs/mlgWR3hYtqBxLeKcbDDoK8bEqwC0T//0mUKhXjaIB68Xy4MSe
 O2kKENA0/N58nh1kN09aIbC5fe7kPOG5Eh1cForvQljnjE05Dd1/S+w/gXVepzeFXAaP
 sguBJVmxyKbrZKDbd7+bMIRqE87NYF4vHHCjCLqzZv8JXI3S3KgtUTvpMjyZdY2U/2QM
 UFR882HVeBXsKIOtNjM5oWmPQ487smVbw/TTZpimS1FrLLuA2DQLtEskVYggeByAUd8b fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyygreptq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:26:09 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213GClqn019138;
 Thu, 3 Feb 2022 16:26:09 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyygreptb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:26:09 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213GIsph020945;
 Thu, 3 Feb 2022 16:26:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3dvw7cqv5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:26:08 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213GQ7UG29360586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 16:26:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0156AAC064;
 Thu,  3 Feb 2022 16:26:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 047E9AC060;
 Thu,  3 Feb 2022 16:26:06 +0000 (GMT)
Received: from localhost (unknown [9.211.67.28])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Feb 2022 16:26:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Remove PowerPC 601 CPUs
In-Reply-To: <20220203142756.1302515-1-clg@kaod.org>
References: <20220203142756.1302515-1-clg@kaod.org>
Date: Thu, 03 Feb 2022 13:26:03 -0300
Message-ID: <87zgn79ask.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hDSuirLhUNm_JKNEv82hzlhh3-IALAlQ
X-Proofpoint-GUID: TjVjJVFuZR5-cyk9wsgzIc_HpA8A7dNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=824 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?utf-8?Q?Her?= =?utf-8?Q?v=C3=A9?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The PowerPC 601 processor is the first generation of processors to
> implement the PowerPC architecture. It was designed as a bridge
> processor and also could execute most of the instructions of the
> previous POWER architecture. It was found on the first Macs and IBM
> RS/6000 workstations.
>
> There is not much interest in keeping the CPU model of this
> POWER-PowerPC bridge processor. We have the 603 and 604 CPU models of
> the 60x family which implement the complete PowerPC instruction set.
>
> Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

