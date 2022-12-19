Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B9650CE5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:56:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GcH-0005H4-6K; Mon, 19 Dec 2022 08:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7GcE-0005Ga-Kn
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:55:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7GcC-0001v2-Qt
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:55:38 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDh3xa033726
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=0wt0ggN+t7AeUT2aQMhFhHDUcvCOyHfbNWOfRJ4HEdc=;
 b=F+um2mJG6hVEZvoWbbOr+EEd+0bZI8+imVom47IlJlGtjMuhsNCgMXqQviRQf/fjjaWf
 y80HCaPun/BUP3zPxQnmbcatf/Yr1soHRH96MrI8IF0Rd+tEh2u3HRIR89CTeimre99Y
 oAvQ6LZNVb9bIWkgH9hehvuTo0Vj+DN+Rz3VXOjj8kL44wLzHDX7XlaNkEFSlPAjmiuQ
 HHUmdRH8GFvXw2pXBO8CjbF31l02202wfN3HduZUkxVFwJQLE4pPieWFU7CIw3AfIa+/
 VbVC3id7yEtutgpu+nwiG+ROlWlozIN3kdr2enRVzcO0Mr5bM52OmGPGFJ+L75SpaTTP 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs370bga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:55:34 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJDi0i1037573
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:55:34 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs370bg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:55:34 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJCcX1v032663;
 Mon, 19 Dec 2022 13:55:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mh6yyh45r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:55:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJDtWvm46203594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:55:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6977A7805E;
 Mon, 19 Dec 2022 15:17:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0C8B7805C;
 Mon, 19 Dec 2022 15:17:17 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 15:17:17 +0000 (GMT)
Message-ID: <a9f90a6d484e1de4e7a3f4d713631b2ada3c3379.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] tpm: add mssim backend
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 19 Dec 2022 08:55:30 -0500
In-Reply-To: <08142e4d-0210-627d-98ea-6f094979ebcc@linux.ibm.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
 <08142e4d-0210-627d-98ea-6f094979ebcc@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nvJAjVLw2qfCokAZV-uJ42OHabJ6Agdf
X-Proofpoint-GUID: dSMVtek1OHShvVs5EMhHOslIAUgJKHt7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2022-12-19 at 08:51 -0500, Stefan Berger wrote:
> 
> 
> On 12/19/22 08:13, James Bottomley wrote:
> > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > 
> > The requested feedback was to convert the tpmdev handler to being
> > json based, which requires rethreading all the backends.  The good
> > news is this reduced quite a bit of code (especially as I converted
> > it to error_fatal handling as well, which removes the return status
> > threading).  The bad news is I can't test any of the conversions.
> > swtpm still isn't building on opensuse and, apparently, passthrough
> 
> The package seems to be available:
> https://software.opensuse.org/package/swtpm

It's not building for any of the platforms I currently have.

I think I've tested most of the option processing, though, before it
tells me it can't connect.

> I'll get to looking at this in more depth once I am back in office.

That's great, thanks ... it would certainly be better to test option
processing on a working platform.

James


