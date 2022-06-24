Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11A55A0EC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 20:48:25 +0200 (CEST)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4oLw-0006Kp-4v
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 14:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4o9s-00005Z-GP; Fri, 24 Jun 2022 14:35:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4o9q-0002q8-Tl; Fri, 24 Jun 2022 14:35:56 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OHvgba026463;
 Fri, 24 Jun 2022 18:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=1kn7/W4yV2cm5+zP8yPpS2X/MFZ86cI2IM7IyCq+rS0=;
 b=TvLxAWKMhGF+A29SRoN+4FZbcHyP92sCMP2sK+V6+fXc45rGKC3X7dtSN2ok7WENliWI
 Rtp8vRpHPWwMLqZyGzmgsBy/u4Ri7OKurYuIl2FMZX9/rj6tCmcO+6MrAOjDXG0xdySJ
 9SMD6SS2nftaaj5aHQ1TcjMZUDOfA39lCbPt3GiqAF9S7sWnKiY9bFy2lwtZaSaXSNcT
 TqXTRq3XVw0a/NY6Pm+IxmgzabQd9/a8Q0k/HdqLDA6nEghw163ksYSXJrquCL2i6bAw
 CziWo34wFunphjtbwpshfhvs5hsdjI4FncRh27m6Z48eRrQRJMIAPVa2ijzCuJ9uCwIz ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwj4jh036-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:35:37 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OIKRNE027031;
 Fri, 24 Jun 2022 18:35:37 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwj4jh02p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:35:37 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OIKffe008035;
 Fri, 24 Jun 2022 18:35:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3guk92s7hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:35:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25OIZY1T64880980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jun 2022 18:35:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3855AC05B;
 Fri, 24 Jun 2022 18:35:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C67FAC05E;
 Fri, 24 Jun 2022 18:35:34 +0000 (GMT)
Received: from localhost (unknown [9.160.103.235])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jun 2022 18:35:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v2 1/3] ppc: Check partition and process table alignment
In-Reply-To: <20220624171653.143740-2-leandro.lupori@eldorado.org.br>
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
 <20220624171653.143740-2-leandro.lupori@eldorado.org.br>
Date: Fri, 24 Jun 2022 15:35:32 -0300
Message-ID: <87a6a1c3kb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rrHenQgEheLePuVjs5q8zqj09xpeJHC8
X-Proofpoint-ORIG-GUID: Qff3r9ob3nkG_jljbWNu0il6SARGTkRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_08,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=821
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240072
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> Check if partition and process tables are properly aligned, in
> their size, according to PowerISA 3.1B, Book III 6.7.6 programming
> note. Hardware and KVM also raise an exception in these cases.
>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


