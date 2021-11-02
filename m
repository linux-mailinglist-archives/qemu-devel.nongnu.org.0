Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2914443077
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:33:37 +0100 (CET)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhur2-0002JJ-G4
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mhuFg-0006F9-A9; Tue, 02 Nov 2021 09:55:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mhuFe-0000He-0O; Tue, 02 Nov 2021 09:54:59 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2C4gre019025; 
 Tue, 2 Nov 2021 13:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Yw5dUWSQl31miEbMUQUr/Hp/nRioSP5MgMGrqdPz4jE=;
 b=D9xkk4T4Jd9bzmiOk7W9tH3x0Prd9k+LfuJ4ZNI4TjhLPrHY+y5yFiLNqlkYVZg9V6GN
 FgmxCwUhxmTaftb9t3SvoMjjFy7osrrG+nn1lhbEjPL5rRIRcNGwerN7UkrngALize7t
 cc9w5vubNiMgQIaecE6aYzFnJiCL1LY8V70Q8OGeRlh+BS6cxFn/tgZWsVSZ41y3fKt7
 BmG5lBuqhc0GAm3IzbWYz1jBP9gL/qvXCKf8xKZ+kyVBpZM+i+sMHPYyFEp2kqFIfKxu
 m6XVHfB3cKaJirZoYxqOgYJTSkh1YSmrPugOOWykyVtrUkKWwZqljuwUV+11yYkBGvFp /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2p6t45hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:54:36 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2DhPHh004340;
 Tue, 2 Nov 2021 13:54:35 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2p6t45hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:54:35 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2DrChd016043;
 Tue, 2 Nov 2021 13:54:34 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3c0wpb3fk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:54:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2DsXr141156886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 13:54:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA61B206A;
 Tue,  2 Nov 2021 13:54:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8AFDB2070;
 Tue,  2 Nov 2021 13:54:28 +0000 (GMT)
Received: from [9.163.21.235] (unknown [9.163.21.235])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Nov 2021 13:54:28 +0000 (GMT)
Message-ID: <99e30a41-37e1-2229-d654-d2fb9b0b0a72@linux.ibm.com>
Date: Tue, 2 Nov 2021 09:54:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 8/9] pci: Export pci_for_each_device_under_bus*()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211101234358.582487-1-mst@redhat.com>
 <20211101234358.582487-9-mst@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20211101234358.582487-9-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9FzBbIhAdmazPO9km77fMbpBS7P5FRho
X-Proofpoint-ORIG-GUID: _UWLZZhZObbZT9nvCl654-bwifCH103V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020080
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 7:44 PM, Michael S. Tsirkin wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> They're actually more commonly used than the helper without _under_bus, because
> most callers do have the pci bus on hand.  After exporting we can switch a lot
> of the call sites to use these two helpers.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> Message-Id: <20211028043129.38871-3-peterx@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>   include/hw/pci/pci.h       |  5 +++++
>   hw/i386/acpi-build.c       |  5 ++---
>   hw/pci/pci.c               | 10 +++++-----
>   hw/pci/pcie.c              |  4 +---
>   hw/ppc/spapr_pci.c         | 12 +++++-------
>   hw/ppc/spapr_pci_nvlink2.c |  7 +++----
>   hw/ppc/spapr_pci_vfio.c    |  4 ++--
>   hw/s390x/s390-pci-bus.c    |  5 ++---

Looks like I wasn't on CC for the initial patches so I missed it (oops) 
but I did just verify the s390x changes now, LGTM.  Thanks!

If needed, for s390 changes:
Acked-by: Matthew Rosato <mjrosato@linux.ibm.com>


