Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB4E466FBE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 03:27:42 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msyIW-0001sN-NE
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 21:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msyGr-00014T-NK; Thu, 02 Dec 2021 21:25:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msyGp-0007CK-Rx; Thu, 02 Dec 2021 21:25:57 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B31M6ct001164; 
 Fri, 3 Dec 2021 02:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L2ZlHfqLidy8qe8mH6qpGVSrlvYQVNzrM8RtMb0WdHs=;
 b=lO8Vqi8MN/LA2/jKyM3e5NZ0u6T9T8mhPkXd3V0RsbAH2DxTtlsaaOG5BnigkM2eAHUx
 0zruKrCmgsm1XfBmNZxpXni8rmSRKtRIcQwQf+l9Uzng3TW04q14vH1AqFWDAYcuYjAV
 iLzojpAW3bYDyW0pXSp0o1zJrkjujFOZiVxZbdv9vDZsvmcUnkZEPbT1MobP+qn+deZe
 0NJZiGpAhalU595zDwAgkszAvVC13RgiVC7ML0DMwYigb/x7K47ekuJpbPn//EAfXe/f
 M3ylMLAuBwLtTAs110J3U8wlkkSQ+jSA6sO58w+lHeq5Y2jCpAa/kXShionLPgMDW/uS tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq9gx0xca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:25:52 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B32Pqru020141;
 Fri, 3 Dec 2021 02:25:52 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq9gx0xc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:25:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B32HTCW018830;
 Fri, 3 Dec 2021 02:25:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3cnne3mjhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:25:51 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B32PnBW31130108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 02:25:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A93926A05A;
 Fri,  3 Dec 2021 02:25:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDC956A05D;
 Fri,  3 Dec 2021 02:25:48 +0000 (GMT)
Received: from [9.211.48.116] (unknown [9.211.48.116])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 02:25:48 +0000 (GMT)
Message-ID: <bd39e782-0348-cf93-0d4e-0b1c0fc8cb8b@linux.ibm.com>
Date: Thu, 2 Dec 2021 21:25:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
 <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
 <20211203000655.0c679c8c.pasic@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20211203000655.0c679c8c.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: joOIO0DZ-PGpaUp-Ojgg3C2lz5LhpQ2t
X-Proofpoint-ORIG-GUID: pS5EgKK9NgfYFcn0fqyQizXhHYhrcXgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_16,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030012
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 thuth@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 6:06 PM, Halil Pasic wrote:
> On Thu, 2 Dec 2021 12:11:38 -0500
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>>>
>>> What happens if we migrate a VM from old to new QEMU? Won't the guest be
>>> able to observe the change?
>>>    
>>
>> Yes, technically --  But # itself is not really all that important, it
>> is provided from CLP Q PCI FN to be subsequently used as input into Q
>> PCI FNGRP -- With the fundamental notion being that all functions that
>> share the same group # share the same group CLP info.  Whether the
>> number is, say, 1 or 5 doesn't matter so much.
>>
>> However..  0xF0 and greater are the only values reserved for hypervisor
>> use.  By using 0x20 we run the risk of accidentally conflating simulated
>> devices and real hardware, hence the desire to change it.
>>
>> Is your concern about a migrated guest with a virtio device trying to do
>> a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could
>> modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch
>> simulated devices trying to use something other than the default group,
>> e.g.:
>>
>> if ((pbdev->fh & FH_SHM_EMUL) &&
>>       (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
>>           /* Simulated device MUST have default group */
>> 	pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
>> 	group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
>> }
>>
>> What do you think?
> 
> Another option, and in my opinion the cleaner one would be to tie this
> change to a new machine version. That is if a post-change qemu is used
> in compatibility mode, we would still have the old behavior.
> 
> What do you think?
> 

The problem there is that the old behavior goes against the architecture 
(group 0x20 could belong to real hardware) and AFAIU assigning this new 
behavior only to a new machine version means we can't fix old stable 
QEMU versions.

Also, wait a minute -- migration isn't even an option right now, it's 
blocked for zpci devices, both passthrough and simulated (see 
aede5d5dfc5f 's390x/pci: mark zpci devices as unmigratable') so I say 
let's just move to a proper default group now before we potentially 
allow migration later.

