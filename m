Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06B52C8DE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 02:47:38 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrUKH-0008FV-Aw
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 20:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrUIq-0007PA-25
 for qemu-devel@nongnu.org; Wed, 18 May 2022 20:46:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nrUIo-00026R-Bd
 for qemu-devel@nongnu.org; Wed, 18 May 2022 20:46:07 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J0PwXL023226
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8WLpCbAetjS5EdCWlKOLsbH4Ix2/wjsig2ojwcif0Ss=;
 b=HK43v+8vmh2/enNHRuQmD9TSGuFwE/JuznEvt+HKCebrGpqxPPav7MfdP2TEOosDl62s
 QLZjT9k1fLBcotqr21EZjaJ8uimQWQT7lmBm9aHm4uTBGa+pBwX67xQIAyLmEFp+eFXJ
 hEWlEcjruKbQLjcgBSrPX+a7rG9dygKNFSEStfI/mhPhlRpO/7yFLhbh9pP/z9dZnTx8
 Q0CS9q72s6LOB3WpAsBpKUSXSABDLEUZxIHwgkHJobRjcxshcSS2DPN4XIYIEdhJzEkd
 uj3AOE4ziNq0MaaWrfqjTHlQdu1T7byik6ZZYs0me7ciBtDnuwVRHZi/LLUYxKhabpa1 Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5bbmraf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:46:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24J0UH1F007594
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:46:04 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5bbmraf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 00:46:04 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24J0gtS6028775;
 Thu, 19 May 2022 00:46:03 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3g4wp5cu0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 00:46:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24J0k38O7209560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 00:46:03 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 264FE12405A;
 Thu, 19 May 2022 00:46:03 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0616112405B;
 Thu, 19 May 2022 00:46:03 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 00:46:02 +0000 (GMT)
Message-ID: <4735be0f-d7da-eb1d-5857-d6c38b2d1e16@linux.ibm.com>
Date: Wed, 18 May 2022 20:46:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 07/11] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Berger <stefanb@linnux.ibm.com>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
 <165187011323.4166595.4846048800121434051.stgit@omen>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <165187011323.4166595.4846048800121434051.stgit@omen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pCyBFTO_-xUsBCjiGXMAfKNWJCpEycye
X-Proofpoint-GUID: rlgc6eH0s6whqVj925iGDFivnnnh97Iy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205190002
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 5/6/22 16:48, Alex Williamson wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> In a subsequent patch, VFIO will need to recognize if
> a memory region owner is a TPM CRB device. Hence VFIO
> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> let's add a stub function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>

Oops, a typo here: linnux -> linux

