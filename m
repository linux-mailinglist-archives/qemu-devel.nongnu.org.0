Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88823A7AC1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:36:03 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5UI-00057o-Rh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lt5Sv-0004Ch-IZ; Tue, 15 Jun 2021 05:34:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51022
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1lt5Sq-0003EU-Lh; Tue, 15 Jun 2021 05:34:37 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F94D5V009658; Tue, 15 Jun 2021 05:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5A0VFaKZGpu7PrWZofzZKExZ6b67YGppTHqzodaPHBw=;
 b=LqBsWJ06/Z4ht7nJrzsbLHkzZBznixs04vZFKTDbsbtAhzmIYVJsDbvuu+TVHwnLsXnz
 DLaOZO+o6LkBLOlU9JWTSJ5Z174nkCSu94H0PkPZbBbfgbk/jdatoRaTtWRUNVEsRge+
 1ILpBhKE+B3Ik1MF6Y9+g3jycy6mfuSrXrCqMNpMHqywTtuvqysJDw3F81NaBMYYgYpa
 CsZp0nNog85M8K9e7q8U42OA4FlGh6wEilxJS+I16FOqU9e471/LWywbrmdWwjpTseSl
 Bpn1+Pv9vDmiJuUtZlFdye2676+9Drx0g1/iP8loHahVrlTKqhoMGRhvBLiVnzs61+Pp UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396qn4byjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:33:25 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F94FPb010014;
 Tue, 15 Jun 2021 05:33:24 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396qn4byjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:33:24 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F9VR7H012815;
 Tue, 15 Jun 2021 09:33:24 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj96khn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 09:33:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F9XNe728836224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 09:33:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC8257805C;
 Tue, 15 Jun 2021 09:33:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 995C978063;
 Tue, 15 Jun 2021 09:33:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.54.82])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 09:33:20 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 6/8] nvdimm: add PPC64 'device-node' property
In-Reply-To: <20210615013309.2833323-7-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
 <20210615013309.2833323-7-danielhb413@gmail.com>
Date: Tue, 15 Jun 2021 15:03:18 +0530
Message-ID: <874kdzo4kh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8JoS1usi2STsFec5HEr00h9AvGD0NwKq
X-Proofpoint-ORIG-GUID: 70OC6X1HICb3T9SdHd37g7FRBPZfr0qK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=672 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150054
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> The spapr-nvdimm driver is able to operate in two ways. The first
> one is as a regular memory in which the NUMA node of the parent
> pc-dimm class is used. The second mode, as persistent memory, allows for
> a different NUMA node to be used based on the locality of the device.
>
> At this moment we don't have a way to express this second NUMA node for
> the persistent memory mode. This patch introduces a new 'device-node'
> property that will be used by the PPC64 spapr-nvdimm driver to set a
> second NUMA node for the nvdimm.

if device-node is not specified on the commandline, we should default to
the same value of node= attribute? Right now I am finding this default
to 0.

-aneesh

