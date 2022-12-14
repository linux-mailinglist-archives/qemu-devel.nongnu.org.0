Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0E64C934
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 13:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5R6w-0001vh-Lq; Wed, 14 Dec 2022 07:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5R6p-0001tJ-MM
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:43:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5R6n-0006cL-3D
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:43:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BECg6tN006253
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=O9vCx5C1dtYoWE7geD15lFek64RgvFOZIeNlq8JPeWE=;
 b=NK6qfyfizXHtUiBtAs+3bGAo/3snByjGYvWUCeAdw3k3NQZgZDybRmEosPO1/BHGhH0h
 bLtEMVbrPaRPauJSl7f+PZoWK68UBh/It63tpOIgOv+sM+MEiFeHQiFUsrUujvtgSnUf
 KYQGwgesFDmBnHEJOVFc5oEufbRHcU8UQjG1nIe1InoaQNx4Axj8X1ZV/ikeOd8KSV+n
 MvUKgpN1i3i/OOA1NNbYcvn6xfOWmvZS68/00W0HVxF8RyEPnyfPv5YPzodNAhNPeH8u
 M8ysYyFS98f9ROWtG5xDmNMQ/CgHQC/B1k558vCsh39zNEv64L8JbJd7Hopo0kxFMGY2 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mfeqhg0s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:43:33 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BEChXrx015005
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 12:43:33 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mfeqhg0rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 12:43:33 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BECUTMH006713;
 Wed, 14 Dec 2022 12:43:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mf08emdem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 12:43:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BEChUTE32506312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Dec 2022 12:43:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1864F7805E;
 Wed, 14 Dec 2022 14:01:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B8F7805C;
 Wed, 14 Dec 2022 14:01:44 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Dec 2022 14:01:43 +0000 (GMT)
Message-ID: <c4d8937037a2f41b35e86498abfd23d2b0cd0030.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Stefan
 Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Wed, 14 Dec 2022 07:43:24 -0500
In-Reply-To: <Y5m48UP/E/RuvBHM@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
 <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
 <dc520ab2-04db-b8cb-15fd-871bb1da0d1b@linux.ibm.com>
 <d2262d8bd5a1d53cb1d4c32e0424dc8727372265.camel@linux.ibm.com>
 <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
 <Y5m48UP/E/RuvBHM@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iFXhMgBxQ4Vl8ngD3YcGpet6Rpjm5A_Z
X-Proofpoint-ORIG-GUID: CT2ebw7kIfjLvVukzCp-tEEkUbPi0yQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=570
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140094
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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

On Wed, 2022-12-14 at 11:52 +0000, Daniel P. Berrangé wrote:
> It is a shame there isn't a standardized protocol for software TPM
> communication, as that'd avoid the need for multiple backends.

Technically the mssim protocol is the standard, being part of the
reference implementation, but practically it's terrible:  Using two
ports per vTPM is hardly scalable in a cloud situation and, as you say,
it has no security.  Ideally someone with TCG connections would try to
standardize a more scalable network server protocol, something nicely
rest based that identified the vTPM by say its EK name.

James


