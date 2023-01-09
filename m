Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE9662D4B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:47:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwBs-0002sv-Lo; Mon, 09 Jan 2023 12:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEwBn-0002q7-Pz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:44:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEwBm-0007s5-0J
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:44:03 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309HMocl032410
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 17:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=m9WdplFmEaZUK7cIEVbCAekEu7cqnhN4vctTHxT9IOE=;
 b=ERpn+M6CNgZprM8dV7g5Jubhr4+7BFfDrGRJNj8uSP/44pn5YJBAMRdxrT2fJjnDahGs
 PmyruUZKSfL4rtE/43rf4G5VlYfW5fgOravg2FJUWrUv3yHizGsPjvxRBRrInzZ5qOkX
 As4k6zyF6w1pqugpCh8lXAlDCtilc5B9A9CRU8DLjDgdJvNqsVGEz9epjXdUjdk7eJKJ
 fM1zX+qfbUgD7OpKC1mneuptL1CMEsHh3yj3uyu0wo0gOLuQkr1nxQTdEqsMKWa0SXga
 MJ/mHkjiasLeTjUHVhGwdoNj4o0NoMR2fDZCdFUVmufigl2Ph4GPEJjIHhCzsoztV+L7 IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmmnef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 17:44:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309HRD8h028864
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 17:44:00 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmmndw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:44:00 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309GnwIA008550;
 Mon, 9 Jan 2023 17:43:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3my0c7g6mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:43:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309Hhwlq25887140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 17:43:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 100357805E;
 Mon,  9 Jan 2023 19:20:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1840C7805C;
 Mon,  9 Jan 2023 19:20:28 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 19:20:28 +0000 (GMT)
Message-ID: <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 09 Jan 2023 12:43:54 -0500
In-Reply-To: <Y7xH1i0Uvbo0FUwG@work-vm>
References: <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -c4wj0ZIstS03W5W_90TZ4dTWJo2SrDE
X-Proofpoint-ORIG-GUID: -aC_PeAbtbXQx2lbs7z1FQyLrWGLuVZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_10,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=913 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090125
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

On Mon, 2023-01-09 at 16:59 +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Fri, Dec 16, 2022 at 08:32:44AM -0500, Stefan Berger wrote:
[...]
> > > I do see it because the *volatile state* cannot be extracted from
> > > this device. The state of the PCRs is going to be lost.
> > 
> > All the objections you're raising are related to the current
> > specifics of the implementation of the mssim remote server.
> > While valid, this is of no concern to QEMU when deciding whether
> > to require a migration blocker on the client side. This is 3rd
> > party remote service that should be considered a black box from
> > QEMU's POV. It is possible to write a remote server that supports
> > the mssim network protocol, and has the ability to serialize
> > its state. Whether such an impl exists today or not is separate.
> 
> We would normally want an example of a working implementation though
> wouldn't we?
> 
> So I think it's fair to at least want some documentation; if it can
> be documented and works, fine; if it doesn't work, then it needs a
> blocker.

It works under limited circumstances ... in fact similar circumstances
passthrough migration works under, which is also not documented.  The
external MSSIM TPM emulator has to be kept running to preserve the
state.  If you restart it, the migration will fail.

James


