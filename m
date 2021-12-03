Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F74673B7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:11:57 +0100 (CET)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4bj-0006bm-Rt
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4WP-0000T0-57; Fri, 03 Dec 2021 04:06:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4WL-0000U6-QU; Fri, 03 Dec 2021 04:06:24 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38mWd7022828; 
 Fri, 3 Dec 2021 09:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8tYLVzy6Tyq53yqMwavOfpFZgME6RIwj32yBJ0RLags=;
 b=KlnkFNirguPGffnqx76JQBBKUwXdxbeqCBG2tCmiK4Dk0Qd66MNnlfUgUCMh0x02wFjx
 4GIWhq6JM579wAiZbIlBrjOT5nFNtcgSqeooPhspljDHThKYJ01CsscgQ0ja2v6Chceb
 ECFPtzvVSF+9OKzMCVi9yYC84KIsytFYPkDI1/w9neCM0psgtjySoW4ggly2APupI5b3
 Y5Wde3oNVxg87W18iPDQz6YLUJ4JTuiyALqym393cZbMoxLtdWUji9ObroxhYXOHrNep
 JNaaRo/+YLpSYadjOaTAGBfBH+mORffC80tHOJShevkCsJLeBtofhEDFRD8BAGj2uQzG Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqg25893w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:06:17 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B38mTj8022769;
 Fri, 3 Dec 2021 09:06:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqg25893a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:06:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B394RUo025098;
 Fri, 3 Dec 2021 09:06:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxkv54g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:06:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B396Bjb26018164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 09:06:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1ADB4C044;
 Fri,  3 Dec 2021 09:06:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AEFA4C052;
 Fri,  3 Dec 2021 09:06:11 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 09:06:11 +0000 (GMT)
Message-ID: <bd95495c-a950-5812-22bb-5509db537f54@linux.ibm.com>
Date: Fri, 3 Dec 2021 10:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
 <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
 <20211203000655.0c679c8c.pasic@linux.ibm.com>
 <bd39e782-0348-cf93-0d4e-0b1c0fc8cb8b@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <bd39e782-0348-cf93-0d4e-0b1c0fc8cb8b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e3xsYp4yJd-YUvTpLCSO4Pjg0sLNgYvE
X-Proofpoint-ORIG-GUID: JoijkeNcBhRXNMs5Co0AbPf5Mk8ok4fH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030057
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, thuth@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/3/21 03:25, Matthew Rosato wrote:
> On 12/2/21 6:06 PM, Halil Pasic wrote:
>> On Thu, 2 Dec 2021 12:11:38 -0500
>> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
>>
>>>>
>>>> What happens if we migrate a VM from old to new QEMU? Won't the 
>>>> guest be
>>>> able to observe the change?
>>>
>>> Yes, technically --  But # itself is not really all that important, it
>>> is provided from CLP Q PCI FN to be subsequently used as input into Q
>>> PCI FNGRP -- With the fundamental notion being that all functions that
>>> share the same group # share the same group CLP info.  Whether the
>>> number is, say, 1 or 5 doesn't matter so much.
>>>
>>> However..  0xF0 and greater are the only values reserved for hypervisor
>>> use.  By using 0x20 we run the risk of accidentally conflating simulated
>>> devices and real hardware, hence the desire to change it.
>>>
>>> Is your concern about a migrated guest with a virtio device trying to do
>>> a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could
>>> modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch
>>> simulated devices trying to use something other than the default group,
>>> e.g.:
>>>
>>> if ((pbdev->fh & FH_SHM_EMUL) &&
>>>       (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
>>>           /* Simulated device MUST have default group */
>>>     pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
>>>     group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
>>> }
>>>
>>> What do you think?
>>
>> Another option, and in my opinion the cleaner one would be to tie this
>> change to a new machine version. That is if a post-change qemu is used
>> in compatibility mode, we would still have the old behavior.
>>
>> What do you think?
>>
> 
> The problem there is that the old behavior goes against the architecture 
> (group 0x20 could belong to real hardware) and AFAIU assigning this new 
> behavior only to a new machine version means we can't fix old stable 
> QEMU versions.
> 
> Also, wait a minute -- migration isn't even an option right now, it's 
> blocked for zpci devices, both passthrough and simulated (see 
> aede5d5dfc5f 's390x/pci: mark zpci devices as unmigratable') so I say 
> let's just move to a proper default group now before we potentially 
> allow migration later.

Looks right to me.

-- 
Pierre Morel
IBM Lab Boeblingen

