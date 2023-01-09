Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE0662DBB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:56:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwN9-00062R-4R; Mon, 09 Jan 2023 12:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEwMy-0005wG-Eb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:55:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEwMw-0007Py-Fr
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:55:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309Fl6iR015694
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 17:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=/6DoJov/xOkJWaGNdp6k5vo06ispOPMQAnKDsu9/Joc=;
 b=YccG6XXjnWCunVTJlKAPNSI337yHYTAssax4NbrhEbr2I6evkJwEerIyEvBsVa54gRBV
 pCZniLpJAHJHwhPs9z1H3zRFVjIab+/fmK8+G9tStJSYQWa9p3ky/LrNKiJ9IVbvGVKI
 0tTg9sW23QAiQQGIej1oMB8Qj3Xef6Mj/nmV4Hkdns1oHn3ro1DYH1oBFnTGI2UC6+0J
 Ib9/4BfgN4uqf+upxw7LqoxFAwrkZDYKVMve9VQ2ULMtr+wTwcSUDTcMMb/UynmK7+qq
 4JM4l5Vpv6YJvpv7OjDJEn9UxxA2KQPZTA4yNHRWGFhXj3m5ZJNcGZuDrFSMd3Pw6xSL gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp24th7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 17:55:32 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309HksP3017670
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 17:55:32 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp24tgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:55:32 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309GraRG021932;
 Mon, 9 Jan 2023 17:55:31 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3my0c7r90f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:55:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309HtU2D65995106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 17:55:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 679C87805E;
 Mon,  9 Jan 2023 19:32:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 731447805C;
 Mon,  9 Jan 2023 19:32:01 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 19:32:01 +0000 (GMT)
Message-ID: <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Stefan
 Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org, Markus Armbruster
 <armbru@redhat.com>
Date: Mon, 09 Jan 2023 12:55:27 -0500
In-Reply-To: <Y7xUVq9PT9ohGfCj@work-vm>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cCJqEpJiO-CEwYIqL59aE9ucn7zl2ENG
X-Proofpoint-GUID: CFEeoTPT80Y0xjQXsiTk71nwFeIyHS9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_10,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=543 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090125
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

On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
[...]
> > external MSSIM TPM emulator has to be kept running to preserve the
> > state.  If you restart it, the migration will fail.
> 
> Document that and we're getting there.


The documentation in the current patch series says

----
The mssim backend supports snapshotting and migration, but the state
of the Microsoft Simulator server must be preserved (or the server
kept running) outside of QEMU for restore to be successful.
----

What, beyond this would you want to see?

James


