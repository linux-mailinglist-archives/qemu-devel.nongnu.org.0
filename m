Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9D3C2686
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:01:40 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s0V-0005NM-7P
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1ro0-0006TC-44; Fri, 09 Jul 2021 10:48:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1rnu-0004lI-Hr; Fri, 09 Jul 2021 10:48:39 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169EWshK118209; Fri, 9 Jul 2021 10:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=S1G6q+uMVKGblVUOHIUxe0f3FLws6KZ77t1eCbFr8Z4=;
 b=Rs7/E5ApoOqdCK2Gicti3hKGPdnxV2Mm8HfTkMXfQeHKGmzxhZpA08p2fGXQq4NaWhmT
 TVl+sItTwGQ/xM3lgBcqd5W5Bgi2xOKdmXu6twV9KkoYkZDeX0Jf+TnpgG05BxUngFhw
 /KQnDQgxZJXg/UrfCQ+p2CDBbFsQ1Fcs+45pmoLT+6aHyaj81t3spRiW8DAegc63+40P
 PT+E90bBURPyOrApK8lgvolLtb3zwwdh64PXVXxrXLLMOZnUNXlIV275HWBfrNOdpvYQ
 U6I3jYRNEN0WplRODt9LjuBz8YFiVlGKQRbItoQu7pepTJhDKNd10J2M41n//tVmMYoT wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxxwahk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 10:48:31 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 169EXva4123345;
 Fri, 9 Jul 2021 10:48:31 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxxwagu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 10:48:31 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 169EgDUO030700;
 Fri, 9 Jul 2021 14:48:30 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 39jfhdtkk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:48:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 169EmTu139649560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 14:48:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 596E12805E;
 Fri,  9 Jul 2021 14:48:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDCDA28058;
 Fri,  9 Jul 2021 14:48:28 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jul 2021 14:48:28 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 09 Jul 2021 10:48:28 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Organization: IBM
In-Reply-To: <40211134-9406-4270-49ff-a6a4f9e1d22a@linaro.org>
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
 <8e6af279-6cb8-33af-8bf5-042dcb99f671@linaro.org>
 <bd35b4ccf4d0f972ab454652b4ed2e60@imap.linux.ibm.com>
 <40211134-9406-4270-49ff-a6a4f9e1d22a@linaro.org>
Message-ID: <c6e73d5317b218134a1e714890c4bedd@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mMvAoDscl3HS58c2vtM7zP_hHt-Mc3wI
X-Proofpoint-GUID: D0dvMHPSk7BrCM4dw_RDppEk7oyxMneP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_09:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=872
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090072
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-07-09 10:37 am, Richard Henderson wrote:
> On 7/9/21 7:23 AM, jonathan.albrecht wrote:
>>> As a general comment, I think a single switch over DXC would be
>>> cleaner for both kernel and qemu.  It seems like giving different
>>> si_code for e.g. "0x40 IEEE division by zero" and "0x43 Simulated 
>>> IEEE
>>> division by zero" is actively incorrect.
>>> 
>> I went over the DXC section and I see what you mean about the si_codes
>> for simulated IEEE exceptions. I'll plan on handling those the same as
>> non-simulated IEEE if no objections.
> 
> Only if you plan on submitting a similar patch for the kernel.
> Otherwise, qemu would not match the kernel abi.
> 
Thanks for clarifying. In that case, I'll handle simulated IEEE the same
as the current kernel.

