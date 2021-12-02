Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1220466D7B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 00:10:31 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msvDi-0005YA-IV
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 18:10:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1msvBW-0004eq-16; Thu, 02 Dec 2021 18:08:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48518
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1msvBQ-0000fu-7h; Thu, 02 Dec 2021 18:08:13 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2MGtsX029483; 
 Thu, 2 Dec 2021 23:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=eY5wc0caIrO+ltO8X0UpOb2UmnYSGPzpsTnUxXxWdDU=;
 b=O5YTJXvu6uYjMn1nVsgJcHS/4K662RMOq5H4mf/nAwfN77gF6UJSJqnNbFOoi9i4/tUY
 KGZAMJD+lBRnP3WRdeAlTFjmIaZ3s5T2ByKEGV4+WI4CEAXVJ+ZiftqGMm+EFmy6IObE
 32+a8cp2/CgaLj0GdgFamU/ROYIvsyNURDGat5MQ+fviHcHID6xSv3+GMDju5Mrhtn56
 2RLKnkixXLY377MgQHuoErBRHL9YMW12BKoouts0YwS8PPfyw1FHbhWIfN/rbedwdBq6
 7UEKq4At86xXpv3WGjfCBMyqzzA6RH2tFrAYBDnBB4KyTIP6jLcwV9XJDbozItIZ7dRK Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq6t5hb9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 23:07:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2MJXK8008117;
 Thu, 2 Dec 2021 23:07:03 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq6t5hb8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 23:07:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2MwDNd030050;
 Thu, 2 Dec 2021 23:07:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxkrse3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 23:07:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B2MxSPv27197816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 22:59:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C10411C086;
 Thu,  2 Dec 2021 23:06:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1756211C07D;
 Thu,  2 Dec 2021 23:06:58 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.5.173])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  2 Dec 2021 23:06:58 +0000 (GMT)
Date: Fri, 3 Dec 2021 00:06:55 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Message-ID: <20211203000655.0c679c8c.pasic@linux.ibm.com>
In-Reply-To: <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
 <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: emYlwH3E7oRAw9WKQGtl6Eopgh0Upqoh
X-Proofpoint-GUID: 5wZqtt5FH_UlIW_b5sCsZSWFSzkf3x1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_15,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020138
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org, thuth@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Dec 2021 12:11:38 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> > 
> > What happens if we migrate a VM from old to new QEMU? Won't the guest be
> > able to observe the change?
> >   
> 
> Yes, technically --  But # itself is not really all that important, it 
> is provided from CLP Q PCI FN to be subsequently used as input into Q 
> PCI FNGRP -- With the fundamental notion being that all functions that 
> share the same group # share the same group CLP info.  Whether the 
> number is, say, 1 or 5 doesn't matter so much.
> 
> However..  0xF0 and greater are the only values reserved for hypervisor 
> use.  By using 0x20 we run the risk of accidentally conflating simulated 
> devices and real hardware, hence the desire to change it.
> 
> Is your concern about a migrated guest with a virtio device trying to do 
> a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could 
> modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch 
> simulated devices trying to use something other than the default group, 
> e.g.:
> 
> if ((pbdev->fh & FH_SHM_EMUL) &&
>      (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
>          /* Simulated device MUST have default group */
> 	pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
> 	group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
> }
> 
> What do you think?

Another option, and in my opinion the cleaner one would be to tie this
change to a new machine version. That is if a post-change qemu is used
in compatibility mode, we would still have the old behavior.

What do you think?

Regards,
Halil

