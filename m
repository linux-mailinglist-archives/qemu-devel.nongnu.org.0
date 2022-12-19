Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281A650D1E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:17:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GxW-0005yB-TS; Mon, 19 Dec 2022 09:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7GxU-0005y3-Im
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:17:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7GxR-0006kY-TC
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:17:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJED1jI017280
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=ahvBN1uBqNXeTT4sg54wz4oKUFub5iXoi7WQkO1egw8=;
 b=HPE8UIlrTZxB4hraRXMiD6Ml67iZMNpwnfV4/VCabi40fmr/U0AOEXaC56FggSrr+9Nz
 pDiKSGERAmq0BzvMsXEyY/SOSfbX61n6YR/cqS+ieu/Sk0c2lBXCgnzWELc2LK8XGtBW
 kC1n6AY4skPElNOjDQzUOO0vF9Us+lKyaNNDm6HVFKKZ58rMb0oWyD9Rp2sWbu0TVyc5
 OUEKp1uyM2Rcfq+MVbomnUOEmBK9/oj3XfHbTm7nSqfIx22M6CCeu0in00FVCxheTXKN
 hIIdSxQnVWLU/1Ybv15udL4uGW9V6g38mI0lN91JWSl2Qp3rrh3fY2mzaDfYg8GH2mmR fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjsh7878v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:17:32 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJEDMMi019407
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:17:32 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjsh7878g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:17:32 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJCHcfu010143;
 Mon, 19 Dec 2022 14:17:31 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yuntk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:17:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJEHUQD11928068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 14:17:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 119437805E;
 Mon, 19 Dec 2022 15:39:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 480B77805C;
 Mon, 19 Dec 2022 15:39:16 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 15:39:16 +0000 (GMT)
Message-ID: <21dbb5fc3f859731f5928c33ec24ddcfd67a4a99.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] tpm: add mssim backend
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 19 Dec 2022 09:17:28 -0500
In-Reply-To: <61dbda4b-e32a-0f98-3990-27e8d9b904f4@linux.ibm.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
 <08142e4d-0210-627d-98ea-6f094979ebcc@linux.ibm.com>
 <a9f90a6d484e1de4e7a3f4d713631b2ada3c3379.camel@linux.ibm.com>
 <61dbda4b-e32a-0f98-3990-27e8d9b904f4@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mhv5_6q0IiVo9GFrSCgR6zBSFYMZ5W71
X-Proofpoint-ORIG-GUID: eokP3H41BC0HhQtARAPbXpnjBCLHOVDL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190125
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Mon, 2022-12-19 at 09:15 -0500, Stefan Berger wrote:
> 
> 
> On 12/19/22 08:55, James Bottomley wrote:
> > On Mon, 2022-12-19 at 08:51 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/19/22 08:13, James Bottomley wrote:
> > > > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > > > 
> > > > The requested feedback was to convert the tpmdev handler to
> > > > being json based, which requires rethreading all the backends. 
> > > > The good news is this reduced quite a bit of code (especially
> > > > as I converted it to error_fatal handling as well, which
> > > > removes the return status threading).  The bad news is I can't
> > > > test any of the conversions. swtpm still isn't building on
> > > > opensuse and, apparently, passthrough
> > > 
> > > The package seems to be available:
> > > https://software.opensuse.org/package/swtpm
> > 
> > It's not building for any of the platforms I currently have.
> 
> You would have to tell me what is failing. I have been building it
> for several platforms for a while and the build works, including
> OpenSuSE Tumbleweed:
> 
> 
> https://app.travis-ci.com/github/stefanberger/swtpm-distro-compile/builds/258769183
> 
> There have been issues with what seems to be seccomp policy on 2 of
> these platforms for a while but this is unrelated to SuSE and build
> issues -- obviously.

All I know is what the build service says, which is the URL I first
pointed you to:

https://build.opensuse.org/package/show/security/swtpm

I haven't dug into the problem.

James


