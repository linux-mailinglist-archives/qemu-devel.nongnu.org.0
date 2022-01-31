Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3696D4A4889
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:46:25 +0100 (CET)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEX0h-0004m1-VT
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEWUP-0007Mn-Or; Mon, 31 Jan 2022 08:13:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEWU6-0007jx-5F; Mon, 31 Jan 2022 08:12:59 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VCVnMQ019145; 
 Mon, 31 Jan 2022 13:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=WdAbMORFk92iQWEt60shD/ePrUcejj9HATWDDpWvDJ8=;
 b=GOHxzrfMaMyacq9szR/yFogvPe51uCYdNjFfRqZQmKn2LF6F5/jPEZIObZuwOW0qrcX/
 01+ZXXbwebDSRwbAFLtQZKJqX1X3AitmX+KzDQBtEffSuTsHJ0cZeoT8XB2kmFW1073i
 pbgNHkkKhQQmHIJN/EYtCgF5OPF5VpK/ZlI1YmN8g8e23kxkj2nbwHxbmDK6QKFPgiLD
 Oda8IrqfamIWLviMy7AgULkDZt5GQPaDV0lGFSc5Xe1+2x5yBYMGeBAEqLeYF21Iv8Oi
 m10R4acJQJjyJa/WhSkf+WGkoCCk4pXELU2qx+XJbfxCsk5+2PH7TpBWWJjsdWIKTmz0 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfuvrwvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:12:25 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VCXl6d000811;
 Mon, 31 Jan 2022 13:12:24 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfuvrwv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:12:24 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VDCHtC014842;
 Mon, 31 Jan 2022 13:12:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3dvw79u0cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:12:23 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VDCLoV18416024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 13:12:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBAC5112070;
 Mon, 31 Jan 2022 13:12:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B8E4112069;
 Mon, 31 Jan 2022 13:12:20 +0000 (GMT)
Received: from localhost (unknown [9.211.96.126])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 31 Jan 2022 13:12:20 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] target/ppc: Remove support for the PowerPC 602 CPU
In-Reply-To: <20220130172508.265144-1-clg@kaod.org>
References: <20220130172508.265144-1-clg@kaod.org>
Date: Mon, 31 Jan 2022 10:12:17 -0300
Message-ID: <871r0odp72.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vG8AP0tHguwlr91_VLgH1M9H51APMv6U
X-Proofpoint-ORIG-GUID: P0iiFGmWSGn9PWs0iLBx2sMWE3HvgGtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_05,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310088
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?utf-8?Q?V=C3=ADctor?= Colombo <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The 602 was derived from the PowerPC 603, for the gaming market it
> seems. It was hardly used and no firmware supporting the CPU could be
> found. Drop support.
>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Cc: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

