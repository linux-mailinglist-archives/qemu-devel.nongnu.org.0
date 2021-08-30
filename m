Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF83FB4E6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 14:01:26 +0200 (CEST)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfyf-0006Wv-53
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 08:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mKfwr-0005Rz-1J; Mon, 30 Aug 2021 07:59:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mKfwp-0001dH-66; Mon, 30 Aug 2021 07:59:32 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UBXHpD031335; Mon, 30 Aug 2021 07:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aiQBT8dOJsea8hCKIXnoSWodlyxOeqsVxdFFNSAamjY=;
 b=TcHyAkJb6I2Y5vbScTGM1hyHg0zyDzygAYPEi+nBH4DI6O9zH2JnOwaRQRNtss+ninhE
 WE7z2ESSNbQJDWTjWp0WOQhP70RXcNbLk0JoxrH/UhE+e9dnehOniY/m0u3bSB8kUR4A
 wZrlDCQjuzYaAOb8xHL+zv90gOb7+l7nGvDGgZFe+jQxUh7vdaJvjSJzOcKsnieLlW65
 3vugLcFWj9QHNWeFpR/FBB1wtre1+/8lDQsjI/6OSU9re1cQcxd8+m4hjEaHX+fxYvfH
 QqDsjsios9TWiOkxudmioXC0rcDFcnFf5kU/t6y351i7z2h06ji4rnawt/vcARF680b1 cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arvagbr2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 07:59:25 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17UBXRtL032024;
 Mon, 30 Aug 2021 07:59:25 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arvagbr1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 07:59:24 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UBuYRR014504;
 Mon, 30 Aug 2021 11:59:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3aqcs8avwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 11:59:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UBxJh529294926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 11:59:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF0F44C050;
 Mon, 30 Aug 2021 11:59:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A62624C071;
 Mon, 30 Aug 2021 11:59:18 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.33.184])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 11:59:18 +0000 (GMT)
Subject: Re: [PATCH v2 0/5] s390x: CPU Topology
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <bfd70d97-b6be-6514-4966-7f110bb89334@linux.ibm.com>
 <142ebaed-8f5a-6f2e-7cc7-d51ca23ebc68@de.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <8193fc21-6cd5-c6fa-aedc-2631829b91bc@linux.ibm.com>
Date: Mon, 30 Aug 2021 13:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <142ebaed-8f5a-6f2e-7cc7-d51ca23ebc68@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VCNmIEuoShUUZ0ReZCEaTRARZGZyu8LM
X-Proofpoint-GUID: 4S-H0eZT-SzuvjQUb61kVhZCAl12WOqw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_04:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300083
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/30/21 11:54 AM, Christian Borntraeger wrote:
> 
> 
> On 26.08.21 11:22, Pierre Morel wrote:
>>
>> a gentle ping :)
>>
>> I would like if you have time, comments on the architecture I propose,
>> if the handling is done at the right level, KVM vs QEMU.
> 
> Do we expect changes in this series due to the discussed changes of PTF 
> interpretion?

No we do not expect any change.
The configuration topology feature is enabled in QEMU if KVM provides 
the KVM_CAP_S390_CPU_TOPOLOGY.

Interpretation is set in KVM if QEMU activated the feature and if the 
host supports the configuration topology feature.

If the host does not support the feature, interception is done and QEMU 
emulates the PTF instruction.

The feature can be fenced with qemu -cpu XX,ctop=off for CPU already 
having the feature activated as default in QEMU (newer GEN10_GA1)


Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

