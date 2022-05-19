Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D152C946
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 03:38:42 +0200 (CEST)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrV7h-0004cp-AC
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 21:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrV5Q-0003Os-Rl
 for qemu-devel@nongnu.org; Wed, 18 May 2022 21:36:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22588
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrV5O-0000JC-Rk
 for qemu-devel@nongnu.org; Wed, 18 May 2022 21:36:20 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J0pvSo026845
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jwTYS7RG9iNKw2mWs36HO9YBNhsstXj2+d8azdjagng=;
 b=igU+3IABh26swVtvUHv4pUVaCvqAVNqanNkd0eJ1Oc1J2FdCJWGoCYupAmzA2ervLeuy
 RwUv0y2F6dscBcIM1gKOy4VCJpO3YZBxBIFgmcGQbCkEPqsR2x74z4Yg/Bu9o9T8BPdh
 JWztoxPOJeqbtHNwDNDlsEtiWeGdmxtc2AKOPezzF00gwXBGwl90d48oYp5q0wrq9CgI
 gP8gH/5mDK9CWGO0TY4u3cgTa9xH19uGf5Vo8mYnpQdPGBWPVKTEuH+X8KF0n1xy/tBl
 m7UQ26vadt47djypx+ldZHFuHvX0DvFjVepkkeul2+XLyFKSmyPDXjVq9pZ2jY84s11S eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5bqtgs7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:36:16 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24J1RwBT022260
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:36:16 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5bqtgs79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 01:36:16 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24J1MbfV005584;
 Thu, 19 May 2022 01:31:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3g242bgcch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 01:31:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24J1VEp624576280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 01:31:14 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A409D2805C;
 Thu, 19 May 2022 01:31:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8114A2805A;
 Thu, 19 May 2022 01:31:14 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 01:31:14 +0000 (GMT)
Message-ID: <df5bd9a2-cda3-17df-d83d-7e8bcc3a903d@linux.ibm.com>
Date: Wed, 18 May 2022 21:31:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 07/11] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
 <165187011323.4166595.4846048800121434051.stgit@omen>
 <4735be0f-d7da-eb1d-5857-d6c38b2d1e16@linux.ibm.com>
 <20220518191707.63b52b6b.alex.williamson@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220518191707.63b52b6b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eWhiGqZn7g88DPSMWjLUwUCxOjgG8rn6
X-Proofpoint-GUID: 7jqhz91vawctWu05KD6jgUrN5CHmYIKI
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190009
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 5/18/22 21:17, Alex Williamson wrote:
> On Wed, 18 May 2022 20:46:02 -0400
> Stefan Berger <stefanb@linux.ibm.com> wrote:
> 
>> On 5/6/22 16:48, Alex Williamson wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> In a subsequent patch, VFIO will need to recognize if
>>> a memory region owner is a TPM CRB device. Hence VFIO
>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
>>> let's add a stub function.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
>>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
>>
>> Oops, a typo here: linnux -> linux
> 
> Yup, sorry, didn't notice until it was too late, but that was as
> provided by you:

I know...

> 
> https://lore.kernel.org/all/96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com/
> 
> Thanks,
> 
> Alex
> 

