Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E415D2D2F4E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:19:21 +0100 (CET)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfhv-0007wa-RK
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kmfcs-0005Xd-Pq; Tue, 08 Dec 2020 11:14:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kmfcn-0004af-6M; Tue, 08 Dec 2020 11:14:06 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8G3RBh022848; Tue, 8 Dec 2020 11:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f5vBUlq8OCVuqSGbc5ImmrysdvrPfcorDQ9DVcotC8k=;
 b=CmJnEjiTstsh8lu/m+LfA5/+4nReeSLwmdugVOwROegIH2T93LnISk+CkUfw3nXaTW4k
 HVK8EnUMg+zTGutoxPIhVz0zMH9k3AHjh4MoOSzmdiCQXO7i4N50rlouPxrzcj3iNtnZ
 IAN4HFyoxqIDHtj7miUnnlbai1YFRMyqo81dy2jjj5j9xpIjx97yKh0JrB9WQoztWWIO
 9DWw56nlrrdIwh6ZOWkh/v9oGl+FDgUVN4W/bB2Vpm9tBvfVF9GJYFPERz4lGNGWb0hv
 gGliAhz+vcIeBb4phKnweblSpVBsDrH1yxGOj/EmaCDjP9bPAz4PEGTANGZbhxUjGHqP 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufx3c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 11:13:58 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8G3S7a022891;
 Tue, 8 Dec 2020 11:13:58 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufx37y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 11:13:58 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8GBjfH010146;
 Tue, 8 Dec 2020 16:13:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8ngfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 16:13:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8GBNBb29753670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 16:11:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 855F2A405F;
 Tue,  8 Dec 2020 16:11:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB576A405C;
 Tue,  8 Dec 2020 16:11:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.37.89])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 16:11:22 +0000 (GMT)
Subject: Re: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
To: David Hildenbrand <david@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201204083655.27946-1-frankja@linux.ibm.com>
 <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
 <e2f69754-6b31-4854-b52a-e0e1c2676d67@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <66975842-fcf3-013d-9bba-fed5c2c69a67@de.ibm.com>
Date: Tue, 8 Dec 2020 17:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e2f69754-6b31-4854-b52a-e0e1c2676d67@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_11:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080097
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08.12.20 15:55, David Hildenbrand wrote:
> On 08.12.20 14:29, Christian Borntraeger wrote:
>>
>>
>> On 04.12.20 09:36, Janosch Frank wrote:
>>> There's no VSIE support for a protected guest, so let's better not
>>> advertise it and its support facilities.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>
>> Looks sane. Assuming that all features that depend on SIE are named S390_FEAT_SIE_*
>> this should take care of everything. (i compared to gen-facilities.c)
> 
> We could add dependency checks to
> target/s390x/cpu_models.c:check_consistency()

That could be an additional patch, right?

> 
> What about
> 
> DEF_FEAT(ESOP, "esop", SCLP_CONF_CHAR, 46,
> "Enhanced-suppression-on-protection facility")

ESOP does make sense independent from SIE see chapter 3-15 in the POP
in "Suppression on Protection"


> DEF_FEAT(HPMA2, "hpma2", SCLP_CONF_CHAR, 90, "Host page management
> assist 2 Facility")

Right. We should also fence of hpma2.



