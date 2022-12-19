Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A70650C65
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:05:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FnG-0004ni-SS; Mon, 19 Dec 2022 08:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7FnE-0004nG-Ll
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7FnB-0007KN-Eb
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:56 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJCkfvb011955
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=YxcHRudgswhNKjpLycR3Ci8k0+q0x5cL1l3dcxBqAuE=;
 b=knxXNateu1ii6yYECp4XPEsPBFYblKvRae6Po6nYlhyDxQs1JMTXnxbAl/jfwGm6y74s
 2HJsBW5CEdy+bOz1I7njlzFC1xSGuxo5E6KLdUFhOxJw0PcFX1d136ZpEW/hnEusjmg8
 nvc+87GIhJLk/IWEvwqSETJGW7hEH5w/e3yFGf91x7nkxxL6HdCARRGO738jFoab+aKN
 9nIjY4YlhagG85fwRjAsvn2Dc7uS0zcrpm+tr44KTHBokCRngBN2CJjbUd48YR4315wE
 P+xHTWwOfwHFmWCXvp348uZ1B2Pwdz2/rBWnmG+zvW9umAYAXSpq9PYRhZtq8O88uA5t IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjr8u8b2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:02:45 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJCuYOm014196
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:02:45 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjr8u8b21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:02:45 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJC3WM1008294;
 Mon, 19 Dec 2022 13:02:44 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3mh6ywwf68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:02:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJD2gH438666598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:02:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B4C78060;
 Mon, 19 Dec 2022 14:24:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E2617805C;
 Mon, 19 Dec 2022 14:24:26 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 14:24:25 +0000 (GMT)
Message-ID: <3c1a78f396ebe32fddbe30ad7166717a493b2758.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Mon, 19 Dec 2022 08:02:39 -0500
In-Reply-To: <9b808690-2f7a-cbd8-497a-fca63c7fc91d@linux.ibm.com>
References: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <158a33b6850db9ef18b240834e06665d7f9e4825.camel@linux.ibm.com>
 <9b808690-2f7a-cbd8-497a-fca63c7fc91d@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wKCUyqG1ORZGn5okwZKZiHq0tOzfi-ST
X-Proofpoint-GUID: Ti4XXruwkOVZm3YPLd3dV5qDZqtDpMWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190115
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

On Mon, 2022-12-19 at 06:49 -0500, Stefan Berger wrote:
> 
> 
> On 12/16/22 08:53, James Bottomley wrote:
> 
> > 
> > I could do a blog post, but I really don't think you want this in
> > official documentation because that creates support expectations.
> 
> We get support expectations if we don't mention it as not being
> supported. So, since this driver is not supported the documentation
> for QEMU should state something along the lines of 'this driver is
> for experimental or testing purposes and is otherwise unsupported.'
> That's fair to the user and maintainer.

Open source project don't provide support.  I already added a
Maintainer entry for it, so I'll maintain it.

>  Nevertheless, if the documentation (or as a matter of fact the code)
> was to claim that VM / TPM state migration scenarios, such as VM
> snapshotting, are working then users should be able to ask someone
> 'how' this can be done with the mssim protocol **today**. Since I
> cannot answer that question you may need to find a way for how to
> address this concern.

I already proposed all of this ... you were the one wanting to document
migration.  The current wording is:

   The mssim backend supports snapshotting and migration, but the state
   of the Microsoft Simulator server must be preserved (or the server
   kept running) outside of QEMU for restore to be successful.

James



