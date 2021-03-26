Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBE34B0B6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:42:52 +0100 (CET)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtIA-0006DM-MI
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsRU-0002vG-Tz; Fri, 26 Mar 2021 15:48:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsRS-0007R1-Lw; Fri, 26 Mar 2021 15:48:24 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QJXL31141359; Fri, 26 Mar 2021 15:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RejwTZfNJoVsnOKU1DgE3Z+Yt+x2iLHeDFR0zzH98xk=;
 b=VTiHrR1rPy+1Fhcu+3t4DY4w0l9VqVUTl27EcLAhfY78NsRQ7kNlNE1jPnu5yVNRJfNx
 NA4ZkbNuMF/eQKzIBHXXb+U1D35YQp+ny0z3qpdQlyDP+gcI/5jfsDxg0MB8TEav8frC
 9rkuDk1QA41t4LMspyOs9Fw3b161gb7ASmhthIMUIoTDyWPwvdl63nEni6kuNiHfSGdl
 7QxPNpd6tTju+hJUtmQ9MZFmom2HVFNyaJz7QZ789PpWQzBU2CSrZ/p4UtUb5AIwT71D
 ILy3USHTKIJN2BrnJ+JN01Qgkrzxmhu2oDpMilZSHLyCSJtlVxMmx/IcqTl0RMJgTytY rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hjtbd9ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:48:08 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QJa7cW157819;
 Fri, 26 Mar 2021 15:48:08 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hjtbd9jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:48:08 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QJlEal002157;
 Fri, 26 Mar 2021 19:48:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 37h14wqjvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 19:48:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QJm67C27590922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 19:48:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0275DBE04F;
 Fri, 26 Mar 2021 19:48:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB80ABE058;
 Fri, 26 Mar 2021 19:48:03 +0000 (GMT)
Received: from [9.85.195.191] (unknown [9.85.195.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 19:48:03 +0000 (GMT)
Subject: Re: [PATCH v3 2/2] tests: Aspeed HACE Scatter-Gather tests
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20210326193745.13558-1-klaus@linux.vnet.ibm.com>
 <20210326193745.13558-3-klaus@linux.vnet.ibm.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <77ed0e65-471c-abde-3e80-cc90a6d0a666@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 16:48:01 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326193745.13558-3-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JU_uUXS71aR9m2x9eLPpLaPRAkW41wht
X-Proofpoint-GUID: yTmP0Dkh0tM6yPEKDfgOGs1o4vorDMeY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_08:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260145
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
>   static const struct masks ast2600_masks = {
> -    .src  = 0x7fffffff,
> -    .dest = 0x7ffffff8,
> -    .len  = 0x0fffffff,
> +    .src         = 0x7fffffff,
> +    .dest        = 0x7ffffff8,
> +    .len         = 0x0fffffff,
>   };

Apologies for that - Need to proof-read my patches better,
even if it's Friday evening :-(

But I'm guessing this can be fixed on merge or if a (real)
next version is necessary. Let me know otherwise.

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

