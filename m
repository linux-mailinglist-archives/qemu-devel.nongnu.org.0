Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C16D28CF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 21:47:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piKgy-0007Bs-4O; Fri, 31 Mar 2023 15:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1piKgd-0007BN-Ei
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 15:45:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1piKgb-0004EG-EC
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 15:45:23 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VJdYIl013551; Fri, 31 Mar 2023 19:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H9XYfxDJPOmQ60f9IwgAEVLZIF0qvf0SSa1an42xNQM=;
 b=Ww5YHfLuZq2LjwI60M+FcPBNGOfFwW/KkxI8tERhNHXaJWrD2Gaua4wv8DKdp5PkVMkQ
 Bp3thua9GEXNYWRdByy680CAv0oI4BE+heWv+jyEK2pKOXNFE74qGQQ/PeRZfApt9e3H
 PPeT/1Br/tHLj6yMIbA9EAGVXE58E3V3r3YpbK/oWaS+m5/PqTadc9rNMF6hIZ0bFg2u
 DzTIw20BM85goq6FWwBMf7Zi3gtfoMc7mEHQSbG6Nguh2daaIoShOtE5PQP8DGgs0TDY
 Px/MUBNWFgsB4eERFiCd9L+0zORtxTPdAuNLO6OIV/UZeOA7HiDGxPIS+uIXVtgYgy3P Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp3cvd6s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 19:45:01 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VIw4WV014252;
 Fri, 31 Mar 2023 19:45:00 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp3cvd6re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 19:45:00 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32VHgcOl028981;
 Fri, 31 Mar 2023 19:44:59 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk8bpcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 19:44:59 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32VJiuss55509436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 19:44:57 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A21A558069;
 Fri, 31 Mar 2023 19:44:56 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C9D58052;
 Fri, 31 Mar 2023 19:44:56 +0000 (GMT)
Received: from [9.211.144.73] (unknown [9.211.144.73])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 19:44:56 +0000 (GMT)
Message-ID: <c3e54a34-33d2-bbf9-e854-4fe37ce54b16@linux.vnet.ibm.com>
Date: Fri, 31 Mar 2023 14:44:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/3] qtest: Add a test case for TPM TIS I2C connected
 to Aspeed I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, thuth@redhat.com, clg@kaod.org,
 ninad@linux.ibm.com, joel@jms.id.au, andrew@aj.id.au
References: <20230331173051.3857801-1-stefanb@linux.ibm.com>
 <20230331173051.3857801-4-stefanb@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <20230331173051.3857801-4-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: umeYupiCR4ffEA0Mz9kB6digd1tB66nD
X-Proofpoint-ORIG-GUID: dhkiwgaZLo08lJcXQ6eQEuFbw-27JTGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


On 3/31/23 12:30 PM, Stefan Berger wrote:
> Add a test case for the TPM TIS I2C device exercising most of its
> functionality, including localities.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Tested-by: Cédric Le Goater <clg@kaod.org>
> ---

Tested-by: Ninad Palsule<ninad@linux.ibm.com>



