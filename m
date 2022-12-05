Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A36429DC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 14:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2BrP-000139-6q; Mon, 05 Dec 2022 08:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2Br4-000118-2Y; Mon, 05 Dec 2022 08:49:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2Br1-0005rD-W9; Mon, 05 Dec 2022 08:49:57 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5CDiaU024754; Mon, 5 Dec 2022 13:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uTv6IDXqRbkJ5fPAu7UdREVcnYyZHFvDgOUftR0FeIg=;
 b=B/i4MsaTRpDCAiK2G+Ps4iT+FRyOPossJtVPwCCUJNp6rlmC2iOzZ73XblovJTPmMqlP
 PcliUSZ5cD2QsVka87kW1aeOqGFeCndwq1JBC0yfJ1Anh8tOsH9+lp/5m2vYb8NM+pX2
 0796fXAHfLfa+i6kDITf8iOQmiybVHCi1QxobG5ADDBzzO2Xky9GVPI6x9WfuG03o5IR
 YO+DIw/5x9h+zkzZfSuSAsDFjhGLTy75/yQIfOEi8RXY8LoP6qprparUoqOa2DBKEnnR
 +ZaZt5qBftdg+NzOLB9gHCzzsD1I4DhP1XkE/DxLzWT3LMe0YGPd3fVZ1DoprkXHahfL Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8gbkbgte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 13:49:51 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B5CxHrU009133;
 Mon, 5 Dec 2022 13:49:51 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8gbkbgsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 13:49:51 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B5DaJqc009096;
 Mon, 5 Dec 2022 13:49:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3m7x38t3re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 13:49:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B5Dnkds66912542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Dec 2022 13:49:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E9842041;
 Mon,  5 Dec 2022 13:49:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E639C4203F;
 Mon,  5 Dec 2022 13:49:45 +0000 (GMT)
Received: from [9.171.50.85] (unknown [9.171.50.85])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Dec 2022 13:49:45 +0000 (GMT)
Message-ID: <028059df-eaf4-9e65-a195-4733b708a426@linux.ibm.com>
Date: Mon, 5 Dec 2022 14:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
 <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
 <54616427-1784-d12b-1a54-131796b56c07@linux.ibm.com>
 <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
 <2592efbf-ec8f-d6ef-2708-37958b514a02@linux.ibm.com>
 <a73fbe58-507e-fdae-a0ad-809de110ade6@linux.ibm.com>
In-Reply-To: <a73fbe58-507e-fdae-a0ad-809de110ade6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZHxT_pVsv5qofoBI_YgmZxesL0sQ4CDz
X-Proofpoint-ORIG-GUID: OfUPzMl7s2K39SRDQQDZ7smBYC18XiH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=766
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050110
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



Am 27.10.22 um 07:54 schrieb Christian Borntraeger:
[...]
> diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
> index 0f1fecc68e..01bdb05575 100644
> --- a/tests/qemu-iotests/common.qemu
> +++ b/tests/qemu-iotests/common.qemu
> @@ -388,7 +388,7 @@ _cleanup_qemu()
>                   kill -KILL ${QEMU_PID} 2>/dev/null
>               fi
>               if [ -n "${QEMU_PID}" ]; then
> -                wait ${QEMU_PID} 2>/dev/null # silent kill
> +                wait 2>/dev/null # silent kill
>               fi
>           fi
> 
> 
> And this also helps. Still trying to find out what clone/fork happens here.

As a new information, the problem only exists on Ubuntu,
I cannot reproduce it with Fedora or RHEL. I also changed
the kernel, its not the reason. As soon as I add tracing
the different timing also makes the problem go away.

