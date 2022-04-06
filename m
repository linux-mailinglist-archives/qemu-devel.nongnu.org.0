Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136484F5826
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:59:44 +0200 (CEST)
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1Vv-0000Lv-6w
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nc1Tm-0007Za-6W; Wed, 06 Apr 2022 04:57:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nc1Ti-0003tm-VT; Wed, 06 Apr 2022 04:57:29 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2368jq84027741; 
 Wed, 6 Apr 2022 08:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sbPGXyUgQkka8dAmjXJ7FhE7FOMOwP8R64SnYq8g068=;
 b=EoUFQuVH0BE6dpQPilByiBe99YP/lyfttfs9H3+SnrTq8O6pQ8uKmhPcF8S9gi+RYnMa
 A7nvAmcybjDdlLFEIPN81j9hcXevQ8gGeocgBqCxzd8ZOZzW5mi2Y2wzg2OfU3W/8r1Q
 lEFBgW/4+UYrNzhl4dtCb39xQ0W29Q5VVTzgFrrtsPUzWQdFpXMkTOE2CD4cYY1BxzZD
 8AQloLK2fAOWbL3rcEggd7Qc5DoyGnGjAWUJcR4FoHVEf8zIOFzFe3JfAp17scjSyzLt
 4a4mGfdiWVROmggAZiIvhTYWP0K8/ytCl3XRrIwiwF8T9KUHmI73WZ3OceJRP2TxyBOv ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f95143jhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 08:57:21 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2368u3T5028519;
 Wed, 6 Apr 2022 08:57:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f95143jh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 08:57:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2368hLDS013307;
 Wed, 6 Apr 2022 08:57:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3f6e48x4nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 08:57:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2368vGC129819160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 08:57:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D7804C046;
 Wed,  6 Apr 2022 08:57:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDFD34C040;
 Wed,  6 Apr 2022 08:57:15 +0000 (GMT)
Received: from [9.145.51.104] (unknown [9.145.51.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 08:57:15 +0000 (GMT)
Message-ID: <a169c389-b702-5f32-e642-4ac507142b34@linux.ibm.com>
Date: Wed, 6 Apr 2022 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] Remove PCIE root bridge LSI on powernv
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
 <20220406035156-mutt-send-email-mst@kernel.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220406035156-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KmSp0XJsE3aoyVVV9QKy4xbmsmOutLT0
X-Proofpoint-GUID: 5UvIuWq201wUohjLAJmErvEmlO_sk0FC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=793
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060040
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 06/04/2022 09:52, Michael S. Tsirkin wrote:
> On Mon, Mar 21, 2022 at 04:33:55PM +0100, Frederic Barrat wrote:
>> The powernv8/powernv9/powernv10 machines allocate a LSI for their root
>> port bridge, which is not the case on real hardware. The default root
>> port implementation in qemu requests a LSI. Since the powernv
>> implementation derives from it, that's where the LSI is coming
>> from. This series fixes it, so that the model matches the hardware.
>>
>> However, the code in hw/pci to handle AER and hotplug events assume a
>> LSI is defined. It tends to assert/deassert a LSI if MSI or MSIX is
>> not enabled. Since we have hardware where that is not true, this patch
>> also fixes a few code paths to check if a LSI is configured before
>> trying to trigger it.
> 
> 
> Hi Frederic, thanks for the patch!
> I assume you will address Daniel's comments and post a new version,
> right?


Yes, I will. I'm obviously only targeting 7.1

   Fred

> 
>>
>> Frederic Barrat (2):
>>    pcie: Don't try triggering a LSI when not defined
>>    ppc/pnv: Remove LSI on the PCIE host bridge
>>
>>   hw/pci-host/pnv_phb3.c | 1 +
>>   hw/pci-host/pnv_phb4.c | 1 +
>>   hw/pci/pcie.c          | 8 ++++++--
>>   hw/pci/pcie_aer.c      | 4 +++-
>>   4 files changed, 11 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.35.1
> 

