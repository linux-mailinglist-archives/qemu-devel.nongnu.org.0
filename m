Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F413FB4EA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 14:06:25 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKg3U-0000Rt-Rf
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 08:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mKg2N-00089h-TU; Mon, 30 Aug 2021 08:05:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mKg2M-0004df-2U; Mon, 30 Aug 2021 08:05:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UC42Lk169121; Mon, 30 Aug 2021 08:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y5H+fFogofucQYpVp4keglQZDmK0zcRTHtHkdIFs9RU=;
 b=SqKmKmNrLDdqSpzSTjzmyI1UNiZbmUnamNijkOT8kHM8LonnnTGPDBL1LNXQMeKTDs7A
 Jfc4wDBqNDS/jydK7Pyr12cjiOA6VZldhoi0afaa1tRnDNn1LtLBTF72Fns6j321H3CK
 advbLiCR2ba5w/7+MM6CrLsO0ZfAGaOCHJppV71ZvqEm6xXKNV7zC3ZHINvPcEMPEhfj
 50LWplla3BJaSvG2uTLd5IvEsCT14BmsmKHNNruCUL1K1oXqbBFm86l5Jtbs9ynJqQpA
 JDSnb3q5YfmTSlTe8V877AiiwkO2vL38xtOPf0cjggK8enKLWnYVPHt5xQ4jf+eTCKDK +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arwpxt3w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 08:05:10 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17UC5AY0178018;
 Mon, 30 Aug 2021 08:05:10 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arwpxt3v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 08:05:10 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UBucbk014529;
 Mon, 30 Aug 2021 12:05:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3aqcs8awgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 12:05:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UC53oj18940192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 12:05:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7917C4C075;
 Mon, 30 Aug 2021 12:05:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00D3F4C06D;
 Mon, 30 Aug 2021 12:05:03 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.33.184])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 12:05:02 +0000 (GMT)
Subject: Re: [PATCH 0/2] s390x: ccw: A simple test device for virtio CCW
To: Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
 Michael S Tsirkin <mst@redhat.com>
References: <1630061450-18744-1-git-send-email-pmorel@linux.ibm.com>
 <fe2c0cbd-24a6-0785-6a64-22c6b6c01e6d@de.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <cd2df86d-793e-48ca-7f67-9db8e9439b2b@linux.ibm.com>
Date: Mon, 30 Aug 2021 14:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fe2c0cbd-24a6-0785-6a64-22c6b6c01e6d@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AAKs2K-QVxX9SLHWyDJcCPziSYtvbHDx
X-Proofpoint-ORIG-GUID: 1mjDDIWDRh7Z02hEXHklvlEDxkAgBMIn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_04:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108300087
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/30/21 11:51 AM, Christian Borntraeger wrote:
> 
> 
> On 27.08.21 12:50, Pierre Morel wrote:
>> Hello All,
>>
>>
>> This series presents a VIRTIO test device which receives data on its
>> input channel and sends back a simple checksum for the data it received
>> on its output channel.
>> The goal is to allow a simple VIRTIO device driver to check the VIRTIO
>> initialization and various data transfer.
>>
>> For this I introduced a new device ID for the device and having no
>> Linux driver but a kvm-unit-test driver, I have the following
>> questions:
> 
> I think we should reserve an ID in the official virtio spec then for 
> such a device?

Yes, you are right, I think we should.

> Maybe also add mst for such things.

Yes, I did.

Thanks,
Pierre



-- 
Pierre Morel
IBM Lab Boeblingen

