Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC853F91B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:09:03 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVCw-0001Re-52
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nyUxo-0001nV-5Q; Tue, 07 Jun 2022 04:53:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nyUxm-0004Bq-66; Tue, 07 Jun 2022 04:53:23 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2578o46W006873;
 Tue, 7 Jun 2022 08:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9r6cPafSUMPBu58Uj3KaSB+u4cvSJxNLfB8SyureBVU=;
 b=QfEVKQG+xsVE7PyaP0XR1wluNsT8mHijD6+ZY3HhXeBB80bVrRS0VwvQ6MkNatpwfBGf
 lDsGORbDpBQELAr2M/levgxzSpQAhzHgLdHn5qHE25mjFRvCFX+W/pWirFKPoZzRZcjJ
 YoBgApKziq4zVCOBCo7QheZd45IkNo6HgXXi4c7l7BjBEt3aLy0H0QwqLA6WrwC1Y/1Q
 a2LeRntcaGkZ+GlR5ziitaMuUlNlxKHmFKJ7aFwkD/J7EPcr5k+HuB6LyJk1vY5MVqpY
 3TqCMeM7XHL5k7uStmT1botuXMSC58AHfea/6rI7OnpY9c1CHRi3H7XZ21TDQILfdYbh xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj3gw811w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:53:02 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2578pT9A015643;
 Tue, 7 Jun 2022 08:53:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj3gw811a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:53:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2578q5AB003529;
 Tue, 7 Jun 2022 08:52:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3gfy19bg0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jun 2022 08:52:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2578qvE621758208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jun 2022 08:52:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A8F311C058;
 Tue,  7 Jun 2022 08:52:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E598D11C052;
 Tue,  7 Jun 2022 08:52:56 +0000 (GMT)
Received: from [9.171.53.11] (unknown [9.171.53.11])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jun 2022 08:52:56 +0000 (GMT)
Message-ID: <655a8025-1bbe-dd08-6150-9462a65b925d@linux.ibm.com>
Date: Tue, 7 Jun 2022 10:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
 <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
 <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
 <bbbb71c0-c4bd-0c87-5d44-f6398d64cf36@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <bbbb71c0-c4bd-0c87-5d44-f6398d64cf36@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x_3CWnc-V0qXCsFRL_aQs4xl6JG72Xcd
X-Proofpoint-ORIG-GUID: bTNrQ-sLtaP0BOALpK7rKzqEZip7Oxiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_03,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxlogscore=791 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206070035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 07/06/2022 08:35, Cédric Le Goater wrote:
>>
>>> Also, the comment seems wrong to me. The qom parenting doesn't matter 
>>> when building the device tree. 
> 
> it does. See pnv_dt_xscom()


Yeah, what I meant is that on P9, there's no "dt_scom" method for the 
PHB. The PHBs are added by the dt_scom() of the PEC. So the parenting of 
the PHB doesn't really matter.

I was actually wondering why it was done that way. If we have a clean 
qom tree (again, only on P9/P10 because P8 is wrong), then the PEC could 
add the "pbcq@xxxxxx" layer in the device tree, then call the qom 
children, i.e. the PHBs, and they would each add themselves (each phb 
adds the 'stack@xxxxxx' entry in the device tree).

But then I see your comment about giving headaches for user-created 
devices. So something else to discuss...

   Fred

