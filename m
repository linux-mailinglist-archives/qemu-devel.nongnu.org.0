Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47566A8899
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXno2-0007Va-RD; Thu, 02 Mar 2023 13:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnnz-0007JZ-D9; Thu, 02 Mar 2023 13:37:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pXnnw-000306-RY; Thu, 02 Mar 2023 13:37:26 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322HkvOb022903; Thu, 2 Mar 2023 18:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=25CfS7lwWYvDDvKtRhRbaLVpcIZswQ42QYIQzZX/dvw=;
 b=OaWfU1u1mnt+ryNLCDdaenx8uWTRLgK8PPecB+OB6pQKC2lpV6CTQaLoF1nF3h6r84Rp
 eT6ygIHiWuK7bt4N8qaMUO4EDy4k15EjZBDBzY7RRzLRolJKBLip2G9P168p7Ev1Xn00
 JfuGirj1Wb3G4zT7FlecW3gkNkzNqaZvFSQVYtflXiT1zVlw8UborQ3Pt5AXvpjmP7cF
 D91GGLODvfs/JcWHeSk6vR2B6IJ5LBoHBoKOI/SKwXb+kTkaZOhh5z/gauBMPkPUkOlt
 b8czXyPPzQS+KW6mOJIVTxf51Ap0gTepYo2VBP4C+AIyW04Roo3iU9Iu7of3hmSC3J3R CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p30ge9dgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:37:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322IL6tK002882;
 Thu, 2 Mar 2023 18:37:13 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p30ge9dfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:37:13 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322HnUfE029693;
 Thu, 2 Mar 2023 18:37:11 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3nybcmx0ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:37:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322IbA8416908828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 18:37:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B47258056;
 Thu,  2 Mar 2023 18:37:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84335803F;
 Thu,  2 Mar 2023 18:37:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 18:37:08 +0000 (GMT)
Message-ID: <6f26e0b8-0f11-8161-6f16-e96443e0696c@linux.ibm.com>
Date: Thu, 2 Mar 2023 13:37:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 09/16] aio/win32: aio_set_fd_handler() only supports
 SOCKET
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-10-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7jY893kxwK8v6-pFl7_Mb-haOzi3MbIY
X-Proofpoint-ORIG-GUID: YCFizhgKWLe7S87AJdHp3Q7bwojkuAEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_12,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020160
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's check if the argument is actually a SOCKET, else report an error
> and return.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

