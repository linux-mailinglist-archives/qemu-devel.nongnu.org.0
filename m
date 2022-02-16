Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CD4B89BE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 14:23:34 +0100 (CET)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKKHN-0004dD-At
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 08:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKKDw-0002vL-Lo; Wed, 16 Feb 2022 08:20:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKKDu-0000Xj-SE; Wed, 16 Feb 2022 08:20:00 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GDEfQ7024662; 
 Wed, 16 Feb 2022 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=pYuADN7Tk6yqZU4kKEIBv+Oxw7Rr29GxR6uqFdFInKI=;
 b=F5Jqnn1DEE11QMeAHLecKo0GEn2eaCpw9Jqbuyn2lZ4Z1Mc2CfmsH1XMQS6UHJQzM0Lq
 85x1Zfd84sjV41xxW/zY68l+HrctVV3aDwj5+vzZaTUJivisat/taVivBe+kFzhbJfJf
 NF5PWWDiER4GhJzhPv2gIOSWCBKm++WcStn//Gr6vsAlvGaS66VydkNUs3eDKLAMNpgY
 gsoqWVyzBKU2K1MP5ZvpqbidYRgYKigPeG+pguhKZEypHn9awmREUOXHr4eSZFDC+Az0
 p3MCfFLVd8zno2sJ02EDJL8T4EPsusDMCIue/Q2ulxM2aHkIX6cYMBISFOipK/+hVtse 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e91ysr3v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:19:46 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GDEjSt024836;
 Wed, 16 Feb 2022 13:19:45 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e91ysr3uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:19:45 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GDCCJm020061;
 Wed, 16 Feb 2022 13:19:44 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3e64hbfytx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:19:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GDJhIF36766096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 13:19:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24F5978074;
 Wed, 16 Feb 2022 13:19:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72C9178068;
 Wed, 16 Feb 2022 13:19:42 +0000 (GMT)
Received: from localhost (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Feb 2022 13:19:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 22/27] target/ppc: cpu_init: Rename register_ne_601_sprs
In-Reply-To: <Ygxog9Ngz0bvn8gO@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-23-farosas@linux.ibm.com> <Ygxog9Ngz0bvn8gO@yekko>
Date: Wed, 16 Feb 2022 10:19:40 -0300
Message-ID: <87a6erx82b.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2a70dwPRWu-X-fKqtfCrC6OhJr1JAXxg
X-Proofpoint-ORIG-GUID: gadd7YKMLY5qDhx6FkVR8KeYVkQHY62X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_06,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160076
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Feb 15, 2022 at 06:41:43PM -0300, Fabiano Rosas wrote:
>> The important part of this function is that it applies to non-embedded
>> CPUs, not that it also applies to the 601. We removed support for the
>> 601 anyway, so rename this function.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>
> Although, I wonder if "books_common" or something might be a better
> name, though.  Admittedly, I don't think the "BookS" terminology
> existed at the time of most of these earlier CPUs.  However, these
> days the majority of 7xx chips are probably in embedded applications,
> even if they weren't designed for an embedded chip line.

The 'ne' in the original name was probably meant to signify
not-BookE. So non_booke perhaps would work? The thing with calling it
books_common is that we're using BookS only for the 970 and upwards and
this function applies to 6xx, 7xx, 74xx as well.

