Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B201C4A9CDD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:22:54 +0100 (CET)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1ML-0002Lh-At
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:22:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG1DA-0004jR-1x; Fri, 04 Feb 2022 11:13:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG1D8-0004QE-1S; Fri, 04 Feb 2022 11:13:23 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214Dw2lY017343; 
 Fri, 4 Feb 2022 16:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=VHnnIX4kQ8YX30TX25eCVn5DQNsefEJG8ePbOsI0ftU=;
 b=dIGAte24LDw1RF38FmgHiQ8Ah2aDT7iLtWNMtJG1wCLG5hvqGsz3ZD82vi251vrfTRkE
 Y40hl5nKO+u3urG4YJQxV+2nfuef7PEesYGq95F60CI+tYZ+8bwx5qK6LhKqQ+rrMd7o
 dn47RU/ezfc4OCdVPCD/SbnxvSrR5WzKUEwu+feoWgqkr+zCNMsYoKY65oP03QpDNllg
 7/9mMs0pqamrOut9b/VaR8XepvKEVJd1a0QQcMIEqH/tDyK8MKlBsfPsRN3ZzXHN53NI
 RMWnur/HTMLqcBUcaXRXA86EcMxdQtgTf34YYRzpuSGFUV2WIOsSzx4ZO0A9QdcYu9My fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx994xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:13:15 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214G3bl2025865;
 Fri, 4 Feb 2022 16:13:15 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx994xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:13:14 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214GDDsC028745;
 Fri, 4 Feb 2022 16:13:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3e0r0v5ypy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:13:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214GDDrE35324236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 16:13:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2659378064;
 Fri,  4 Feb 2022 16:13:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 674CF7806B;
 Fri,  4 Feb 2022 16:13:12 +0000 (GMT)
Received: from localhost (unknown [9.211.79.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Feb 2022 16:13:12 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/10] target/ppc: powerpc_excp improvements [7xx] (8/n)
In-Reply-To: <35197e01-f2fd-0153-aede-ba06d12cb1ee@kaod.org>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
 <35197e01-f2fd-0153-aede-ba06d12cb1ee@kaod.org>
Date: Fri, 04 Feb 2022 13:13:10 -0300
Message-ID: <87leyq8vah.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CrYEREDCB6vSpoTrCmm6_e037yUjJvhr
X-Proofpoint-ORIG-GUID: lFjAVe6AV24lcdoNnDdNcjIE-8JaZCeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=862
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040092
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 2/3/22 23:42, Fabiano Rosas wrote:
>> This series handles the 7xx family: 740, 745, 750, 750cl, 750cx,
>> 750fx, 750gx and 755.
>
> What about powerpc_excp_legacy() ? Can we remove it now ?

Yes, I'm preparing one more series to wrap things up. There's the
removal of the function and some other adjustments like moving the
initial bounds check and message into powerpc_excp(). I also want to add
new flags for AIL support so we can remove 'excp_model' from the
powerpc_excp_books.

