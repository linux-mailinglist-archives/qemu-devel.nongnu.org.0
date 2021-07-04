Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55A3BABAA
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 08:18:15 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzvSH-0002De-Lf
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 02:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lzvRS-0001Xq-6x
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 02:17:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lzvRN-0007Hj-Rt
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 02:17:21 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16463784063634; Sun, 4 Jul 2021 02:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KijzfLfn+Zj+wGj09ulpmr3BAhpV2Jj6yZInR+S68h8=;
 b=dfHbZmlkcWnILy3GBxQHf9F3HAY5wweJBelsxpRqB/zpXE1OktNkc/Ma+seN2y91cL1X
 q1k6w/NUp1he/yb6Uw4IIG24PnhPZyuNN2xx9hSPn3XFSY/So/cKuvT19o2bKq/w9Dwi
 gLUbXS3GNf5K0WjEaNT/EhRKmuD4QnPs6MwPGnimkXZ8A5ba0Dw/tYdmWXzPMQzQF9VK
 7lq99E8X9pQ9qX+yPYt3cMfo30a/qa3UKTT+VqQecJYKADCC1yrsAMaxC5p9YE2AIiZy
 789UFRdYSHCaffKnLXVvQzha8A4Kga8OSPO5zzS8H8Z6gqcC/6euwTWvuQll6/AE7ZH3 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39k4yatdkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jul 2021 02:17:11 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16464gAB067306;
 Sun, 4 Jul 2021 02:17:11 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39k4yatdkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jul 2021 02:17:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1646H95D021634;
 Sun, 4 Jul 2021 06:17:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 39jfh8r9ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jul 2021 06:17:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1646H5JY27001144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 4 Jul 2021 06:17:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1095A4055;
 Sun,  4 Jul 2021 06:17:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE8B8A404D;
 Sun,  4 Jul 2021 06:17:00 +0000 (GMT)
Received: from [9.65.220.2] (unknown [9.65.220.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  4 Jul 2021 06:17:00 +0000 (GMT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210703123406-mutt-send-email-mst@kernel.org>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <0f36d5a0-c063-4ba7-ceca-f09d8f37fb3e@linux.ibm.com>
Date: Sun, 4 Jul 2021 09:16:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703123406-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kLHFeZPAkDu0QnpYkNwa8CAvXpyO-xfI
X-Proofpoint-ORIG-GUID: wo1p3lczb0D6Q7pXthJb4xKCBMlcn_KT
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-04_05:2021-07-02,
 2021-07-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107040036
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

[+cc Connor, Dave]

On 03/07/2021 19:42, Michael S. Tsirkin wrote:
> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
>> From: James Bottomley <jejb@linux.ibm.com>
>>
>> If the VM is using memory encryption and also specifies a kernel/initrd
>> or appended command line, calculate the hashes and add them to the
>> encrypted data.  For this to work, OVMF must support an encrypted area
>> to place the data which is advertised via a special GUID in the OVMF
>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
>> in the kernel/initrd/cmdline via the fw_cfg interface).
> 
> Sorry about asking basic questions so late in the game.

No worries. Please noice there's a newer version:

https://lore.kernel.org/qemu-devel/20210624102040.2015280-1-dovmurik@linux.ibm.com/


> I'm a bit curious why this feature makes sense. If someone can play
> with a Linux kernel command line isn't it pretty much game over security
> wise? What protections does Linux have against malicious actors
> manipulating the command line?
> 

You're right -- if the host can modify the kernel command-line it's a game over.

This is why this patch (together with the corresponding OVMF patches; still
under review) measures and verifies the content of the kernel blob and
the initrd blob *and* the command-line blob.

Any modification/omission of any of them by the host will make the expected
SEV PSP measurement invalid, which should then indicate to the Guest Owner that
something is wrong with this guest.  At that point the Guest Owner should
refuse to inject secrets into the guest (and also complain to the Cloud
Service Provider).

-Dov


