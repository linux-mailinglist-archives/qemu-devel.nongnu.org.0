Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0F2B6F57
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:52:23 +0100 (CET)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf71a-0006KN-Bo
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf6zM-0004uP-6q; Tue, 17 Nov 2020 14:50:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf6zK-0003Wo-BA; Tue, 17 Nov 2020 14:50:03 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJnQhp110970; Tue, 17 Nov 2020 14:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dKf0GJGt74eeeZPyrifrZu4OMDRxaudXfoMSvRWnD1g=;
 b=Xt+AkQI80NJaBwVnKMdPhTmMlEKSxIEbtuvJJIb91Ln4DgAjHiSmpJfVKyvFebhP8wF9
 vhfK3ME4a4INrwP+RuVFYXVTkIeNjpmoyKTu/OOgHI6SAtwoX2icufqD6jJYCYOQI98E
 DB+SSMiOTb6D7/E3YSdiN4WbHrWuYa6qMEKIF/b89ay+2YJCmh9BNZZjmKCW13bidxMS
 haBPlCGpfISpMFzLAKga0BBwwGju0+pprrvBRoQVCFEiEUiaGauG5lmEpTQqznQ/KqMz
 F6etqLtYjZ/fqodVuLBhtPhC1ZnKuMUH2NE62WlweKaTxT5lAV8mG9by/Bx4HNF35xCi 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vd6j0fm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:49:59 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AHJnPqj110906;
 Tue, 17 Nov 2020 14:49:59 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vd6j0fkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:49:59 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJkaIf019660;
 Tue, 17 Nov 2020 19:49:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 34vgjma76w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:49:58 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJnv0e17891910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:49:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A000112065;
 Tue, 17 Nov 2020 19:49:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3FA5112063;
 Tue, 17 Nov 2020 19:49:54 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:49:54 +0000 (GMT)
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
 <6a1b2ba1-642a-9cee-4d7d-2c1e4ea826ed@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <f4f665ad-c499-7824-bfd7-78b75b6216c4@linux.ibm.com>
Date: Tue, 17 Nov 2020 14:49:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <6a1b2ba1-642a-9cee-4d7d-2c1e4ea826ed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170137
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 14:50:00
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 2:21 PM, Thomas Huth wrote:
> On 17/11/2020 18.13, Cornelia Huck wrote:
>> zPCI control blocks are big endian, we need to take care that we
>> do proper accesses in order not to break tcg guests on little endian
>> hosts.
>>
>> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
>> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
>> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> 
> This fixes the problem with my old Fedora 28 under TCG, too, but... do we
> really want to store this information in big endian on the QEMU side (e.g.
> in the QTAILQ lists)? ... that smells like trouble again in the future...
> 
> I think it would be better if we rather replace all those memcpy() functions
> in the patches that you cited in the "Fixes:" lines above with code that
> changes the endianess when we copy the date from QEMU space to guest space
> and vice versa. What do you think?

Hmm, that's actually a fair point...  Such an approach would have the 
advantage of avoiding weird lines like the following:

      memory_region_add_subregion(&pbdev->iommu->mr,
-                                pbdev->pci_group->zpci_group.msia,
+                                ldq_p(&pbdev->pci_group->zpci_group.msia),
                                  &pbdev->msix_notify_mr);


And would keep messing with endianness largely contained to the code 
that handles CLPs.  It does take away the niceness of being able to 
gather the CLP response in one fell memcpy but...  It's not like these 
are done very often (device init).

