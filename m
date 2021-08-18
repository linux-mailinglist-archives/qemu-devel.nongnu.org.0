Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5423F0924
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:30:42 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOSf-0004jd-3O
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGOR2-0003x9-8E
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:29:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1mGOR0-0005uM-IF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:29:00 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IG3NkT184839; Wed, 18 Aug 2021 12:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=qpUkguJI2IHHjoUq21Nh2itgr+pixs+jbpaoqO+Oa7A=;
 b=NOGX6V8VYCKm1K9MmfleWk1fev52Xlpc5fjbtamkO9Hpgh50ecZbE9G647OAe6ZAkGzl
 f4IeTsD+EMJtxxHqUYe4hj/NEYuKylzYhgtP01ogGBJtZyGk49rBL89/GvGrrufC6cLy
 /wwwE2P9e0WvVOMjcQpWuNqAtdq77SDxa2o49/zFFW3tF2epqKCpQbvEZFwBF1y4/vVO
 YvrzJR2E7FSauXOJdQ64LlSr6em1m1/SJymbRlgFERq5mo8/GTonbDtGBLb314lCgQbg
 6wILApQ4LXAT7IQI9Nus6nofSp5w/c234fWpu9pXsbrflg5meso+t/qOQuLyn1i+pvkB Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcvsbaa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 12:28:54 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17IG3XCj186030;
 Wed, 18 Aug 2021 12:28:54 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcvsba9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 12:28:54 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IGIHNW023179;
 Wed, 18 Aug 2021 16:28:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3ae5fdd3xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 16:28:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IGSpu047317418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 16:28:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD1917805C;
 Wed, 18 Aug 2021 16:28:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4396878076;
 Wed, 18 Aug 2021 16:28:48 +0000 (GMT)
Received: from jarvis.lan (unknown [9.160.128.138])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 16:28:47 +0000 (GMT)
Message-ID: <8a94ce57b4aa28df1504dcf08aace88d594ffb32.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
From: James Bottomley <jejb@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Wed, 18 Aug 2021 12:28:46 -0400
In-Reply-To: <YR0qoV6tDuVxddL5@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
 <20210818103147.GB31834@ashkalra_ubuntu_server>
 <f0b5b725fc879d72c702f88a6ed90e956ec32865.camel@linux.ibm.com>
 <YR0nwVPKymrAeIzV@work-vm>
 <8ae11fca26e8d7f96ffc7ec6353c87353cadc63a.camel@linux.ibm.com>
 <YR0qoV6tDuVxddL5@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q0wVqsHPHARWCH8EB1T5FpLbLGo0iFMk
X-Proofpoint-GUID: o5li9DePPmUjO3hmzPHgsfOD_bAvPOaA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_05:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Cc: thomas.lendacky@amd.com, Ashish Kalra <ashish.kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-08-18 at 16:43 +0100, Dr. David Alan Gilbert wrote:
> * James Bottomley (jejb@linux.ibm.com) wrote:
[...]
> > Given the lack of SMI, we can't guarantee that with plain SEV and
> > -ES. Once we move to -SNP, we can use VMPLs to achieve this.
> 
> Doesn't the MH have access to different slots and running on separate
> vCPUs; so it's still got some separation?

Remember that the OVMF code is provided by the host, but its attested
to and run by the guest.  Once the guest takes control (i.e. after OVMF
boots the next thing), we can't guarantee that it wont overwrite the MH
code, so the host must treat the MH as untrusted.

> > But realistically, given the above API, even if the guest is
> > malicious, what can it do?  I think it's simply return bogus pages
> > that cause a crash on start after migration, which doesn't look
> > like a huge risk to the cloud to me (it's more a self destructive
> > act on behalf of the guest).
> 
> I'm a bit worried about the data structures that are shared between
> the migration code in qemu and the MH; the code in qemu is going to
> have to be paranoid about not trusting anything coming from the MH.

Given that we have to treat the host MH structure as untrusted, this is
definitely something we have to do.  Although the primary API is simply
"here's a buffer, please fill it", so there's not much checking to do,
we just have to be careful that we don't expose any more of the buffer
than the guest needs to write to ... and, obviously, clean it before
exposing it to the guest.

James



