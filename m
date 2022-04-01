Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0F4EEA2B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:13:30 +0200 (CEST)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDLV-00019F-EQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:13:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1naD3R-0000oi-6x; Fri, 01 Apr 2022 04:54:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1naD3O-0003IA-9K; Fri, 01 Apr 2022 04:54:47 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2318lMmM005246; 
 Fri, 1 Apr 2022 08:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KGhHV1xis/31sh7z1HXUnvCntyRsulDMQubMDCZUAOw=;
 b=FynTK2h3GbcAHYV0X0VX21i3epZy0uov2jbRZYN1OPFUVedVFxyAhuWlpXvNKhXKMRcj
 dVtzg14fgyjZUmliZS76CzHUBrxzeyuIhpBPriZbe/kWpxK2BrYYvz6qHZGypos8FmO/
 A6svnpaI9/72XGGFlaoUWpV2lSIwpswTRRL1v5lvDBaomRMI5SIODhXrRwl7Z2VuLSTo
 qqrxN8gH+4cii0i1WTcs/pCEJCIion08+rTHLjOXeuYjgmoK4xfATzgJFOgfoZtn79Vb
 w1ybOSiesn/gyItDD6otxLuRAVSn5mP1apXjL3JWMsHCua9LaavUOwhsvt4gKLvfaMJv tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f5x6g8323-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 08:54:29 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2318plgD016485;
 Fri, 1 Apr 2022 08:54:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f5x6g831a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 08:54:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2318Sj7k028257;
 Fri, 1 Apr 2022 08:54:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3f1t3j2r31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 08:54:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2318sNl728442974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 08:54:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 768F452051;
 Fri,  1 Apr 2022 08:54:23 +0000 (GMT)
Received: from [9.145.170.142] (unknown [9.145.170.142])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 264CC52067;
 Fri,  1 Apr 2022 08:54:23 +0000 (GMT)
Message-ID: <5f56a7bc-c085-c2a6-0956-6fca44e34ed6@linux.ibm.com>
Date: Fri, 1 Apr 2022 10:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PULL 19/35] ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
 <20200203061123.59150-20-david@gibson.dropbear.id.au>
 <CAFEAcA-_KiR1ZVPu3auXkTE3CtayyfPwT+0sd2y+X_5xOdGk_w@mail.gmail.com>
 <5b581691e0063d831649b4a6e36f07ef00e42861.camel@kernel.crashing.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <5b581691e0063d831649b4a6e36f07ef00e42861.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V5QiCw1OSynVF6mntbEcWFBb2k3te96Y
X-Proofpoint-GUID: L4OgjSgh53Hb7nW3leMzS8NFw-2ov88a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_03,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1011 mlxlogscore=832
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 01/04/2022 03:59, Benjamin Herrenschmidt wrote:
> This one:
> 
> #define PHB4_PEC_PCI_REGS_COUNT     0x2
> 
> Should be
> 
> #define PHB4_PEC_PCI_REGS_COUNT     0x3
> 
> There is no register at 0x1 though.


Patch on the way....

   Fred

