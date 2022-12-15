Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA264E25E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5usT-0000Xp-8S; Thu, 15 Dec 2022 15:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5usO-0000XM-BX
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:30:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5usM-0004f0-Nq
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:30:44 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFIflAn022086
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=v/Czbj+RWMxDHKA1l0IWwEzHqix90YuxOEg2UTY/BXc=;
 b=bH2+Tzv9Hwxpnz0d8AqKpT4j1sqthNkfxTZSwhNhF+KZ0SAgQDLkh62K/sZCU2LHP/hv
 /Kbo5ldTkpdyuchAJcf4NN2uy3ZZRUMFaZ4dyVrTFN0EEmuuODsuQhe2CW5XQeC8nGuj
 JQhSkHYUgS7YP6OFClZ/IQmY5AC1bm9kKnro1vCxPa3WmLjSgrDySIcHbg12yqZWnzI3
 bbQw5k4gT2qaIfE5+luG9sTTGHmBTQ6iyg6tpt6p2/Puysr9j8c9EiiUuJQklO0gPhI8
 UZDp7hiRJ95YRb/651yu73twDqmC1k5d7uY9MJ0+2TlJtoIaot7PjhVOmKGWZ/q6u0gU YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg938jfab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:30:40 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFKPOsG030827
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:30:40 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg938jf9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:30:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFJIcuC018047;
 Thu, 15 Dec 2022 20:30:38 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3meyqknhyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:30:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFKUbaj12059382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 20:30:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD5A07805E;
 Thu, 15 Dec 2022 21:49:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C530C7805C;
 Thu, 15 Dec 2022 21:49:46 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 21:49:46 +0000 (GMT)
Message-ID: <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 15 Dec 2022 15:30:34 -0500
In-Reply-To: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FvzTun6Qzhpkq7IvLLF7oblE7rowWvGD
X-Proofpoint-ORIG-GUID: OubkbmZK9GmB8od1rPP0KxbDW6Sdb7PH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=549 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150168
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

On Thu, 2022-12-15 at 15:22 -0500, Stefan Berger wrote:
> On 12/15/22 15:07, James Bottomley wrote:
[...]
> > don't really have much interest in the migration use case, but I
> > knew it should work like the passthrough case, so that's what I
> > tested.
> 
> I think your device needs to block migrations since it doesn't handle
> all migration scenarios correctly.

Passthrough doesn't block migrations either, presumably because it can
also be made to work if you know what you're doing.  I might not be
particularly interested in migrations, but that's not really a good
reason to prevent anyone from ever using them, particularly when the
experiment says they do work.

James


