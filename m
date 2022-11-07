Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E601B61FA79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Jk-0001g5-SY; Mon, 07 Nov 2022 11:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1os5Jf-0001cI-RF; Mon, 07 Nov 2022 11:49:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1os5Jd-0003HC-Rq; Mon, 07 Nov 2022 11:49:43 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7GRRIl001431;
 Mon, 7 Nov 2022 16:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=e6eg73z2o299ffwHAJDUwGVZ9YRzsiFGsHi/dXGQHFY=;
 b=LCdrB80upWVrCscOPheQHVr2FlJHtPyI0X3cb/Hg2ylHwcD2kzomDoXau1av3PpdpNVh
 aCEmOcnPY1OxzARmI0pi4f0VvNP9x/N5NzjKiR1Hls7/3O2UkFW7Fm0E/TgxWLvpTlbi
 X5xZTMJyZhW4tt4Fj/mymQ1E+sG8hfs5P+IibJK0xMclINFupfa5gvAt9SjWVDbMu4mS
 86pDL/p/ARqXFYodEKh29aFUBPNPsYZJbLCGaSYDTo3JBq8/e9AaMfDI/yKWLrpIAkmh
 1TsGlE+G7hHmNFs1Ooj1HNEHfrpd+9TS5kI/kNej86OExBAuZLLTE7HRAeNnZGsAI4WV Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1msu76q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:49:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7Ewsso002867;
 Mon, 7 Nov 2022 16:49:35 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1msu767-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:49:35 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7Ga0TI009072;
 Mon, 7 Nov 2022 16:49:34 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3kngsxw42u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:49:34 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A7GnWHS4326114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Nov 2022 16:49:33 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD23358059;
 Mon,  7 Nov 2022 16:49:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C11B15805D;
 Mon,  7 Nov 2022 16:49:31 +0000 (GMT)
Received: from [9.160.191.98] (unknown [9.160.191.98])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  7 Nov 2022 16:49:31 +0000 (GMT)
Message-ID: <bb2b3509-cd22-be00-a78e-c18f324e4b3f@linux.ibm.com>
Date: Mon, 7 Nov 2022 11:49:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for 7.2 0/2] s390x/s390-virtio-ccw:
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20221107161349.1032730-1-clg@kaod.org>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <20221107161349.1032730-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -0PTbmpv7Rj4uvlupCTEXFaeXm3E-Tkt
X-Proofpoint-ORIG-GUID: 5muJYbQFjZsEufNVJEuEIpVXaRQ4ffS5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070132
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/7/22 11:13 AM, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> Hello,
> 
> This series removes the redundant "zpcii-disable" machine property and
> and introduces a GlobalProperty compat array to maintain the same
> behaviour on older machines.
> 
> Thanks,
> 
> C.

Thanks Cedric.

For the series:
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

Also did a quick test on top of
https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-06

to verify that zPCI interpretation/forwarding is available as expected with machine 7.2 and off by default in 7.1 and older.

> 
> Cédric Le Goater (2):
>   Revert "s390x/s390-virtio-ccw: add zpcii-disable machine property"
>   s390x/s390-virtio-ccw: Switch off zPCI enhancements on older machines
> 
>  include/hw/s390x/s390-virtio-ccw.h |  1 -
>  hw/s390x/s390-pci-kvm.c            |  4 +---
>  hw/s390x/s390-virtio-ccw.c         | 29 +++++------------------------
>  util/qemu-config.c                 |  4 ----
>  qemu-options.hx                    |  8 +-------
>  5 files changed, 7 insertions(+), 39 deletions(-)
> 


