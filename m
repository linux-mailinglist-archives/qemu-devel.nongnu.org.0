Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB0686F03
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIu3-0002Mo-IM; Wed, 01 Feb 2023 14:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNItw-0002E7-ND
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:36:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNItu-0002Um-FJ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:36:12 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311JPGGr004167; Wed, 1 Feb 2023 19:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=sc8gwyIMe+21XcnW20bU0vImf9eJjm9oqeS0ScuwymY=;
 b=fWo0+YYPvhhjIOcjuD/xW9Quw18abNNh0mxIh/B1+VFn42jK4YigO2cx4TeWI1o5BKrV
 dT24iNiqFYhJv+noxkkL0G+HPpSkcM8IkxTlWk5upqcDOdwAn2t9mpUYJyjDbDFote2g
 TtlC6rnanSxEV3BmI5epUDRZE8v3y56i6ALJoT2fygZlhgzqlz0CfUNH1UwNHAsdRghF
 xIGfKSZRiE1qrD7weH12L3KSf93s6VvN//ZqnAov+Xzme8hmrN5zvLWRwCpZgEM0Uugg
 rbl2/Sn2eBJKpRI5fuMwNamnowHJZoHmNwKMH77jdkOmnq23FgrPigo8JFW2jSiSSr2f sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfx7gr8h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 19:36:06 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311JT2Mq018712;
 Wed, 1 Feb 2023 19:36:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfx7gr8gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 19:36:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311HKtbe028721;
 Wed, 1 Feb 2023 19:36:04 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ncvuyqfvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 19:36:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311Ja36M45744676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 19:36:03 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D32896E056;
 Wed,  1 Feb 2023 19:38:12 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE5C46E053;
 Wed,  1 Feb 2023 19:38:11 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 19:38:11 +0000 (GMT)
Message-ID: <b9d15b656ed91d594132029b8ac0cc61552e68bd.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, DOV MURIK
 <Dov.Murik1@il.ibm.com>
Date: Wed, 01 Feb 2023 14:35:31 -0500
In-Reply-To: <CAFEAcA8Qem0QWz5R79Djt-n8mPBf4o+Q1dJ41O4oyTU19XZ5Hw@mail.gmail.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAFEAcA8Qem0QWz5R79Djt-n8mPBf4o+Q1dJ41O4oyTU19XZ5Hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i1b2pGJxCSJCx5Q6U3WujxUPXzh9HtCO
X-Proofpoint-GUID: 8YCpIYt7ewPmPN67uQR3NrfetpqVQiEW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010166
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2023-02-01 at 16:50 +0000, Peter Maydell wrote:
> On Wed, 1 Feb 2023 at 15:25, James Bottomley <jejb@linux.ibm.com>
> wrote:
> > 
> > On Wed, 2023-02-01 at 10:10 -0500, Jason A. Donenfeld wrote:
> > > This is already fixed via the patch that MST just sent in his
> > > pull.
> > > So wait a few days for that to be merged and it'll be all set.
> > > 
> > > No need for this patch here. Do not merge.
> > 
> > If it's not a secret, would it be too much trouble to point to the
> > branch so we can actually test it?  It does seem that the biggest
> > problem this issue shows is that there wasn't wide enough
> > configuration
> > testing done on the prior commits before they were merged.
> 
> In general you shouldn't expect commits to be visible in
> a git branch before they get merged -- the QEMU process
> is not exactly identical to the kernel one.
> 
> For a particular patch on the mailing list, you can get a git branch
> with it applied by looking for the patch in https://patchew.org/QEMU/
> if that's more convenient than just applying it by hand.

The real issue is there have been so many patches flying around for
this, it's not clear exactly what combination needed to be tested.  Dov
found the branch in tags/for_upstream but it's still failing measured 
direct boot, although the failure has shifted from the hash check of
the kernel to the hash check of the command line.

All I really wanted was a link to the patch ... I don't need the tree
because inspection will tell me that it adds unexpected data at the end
of an integrity checked file.

> We also don't tend to want patches hanging around for testing
> before they get merged[*] -- we figure that "in upstream git"
> is the place that actually gets tested in practice; almost
> nobody will be working with or testing anything else.
> 
> [*] The fix Jason refers to here that's in MST's pullreq
> unfortunately hasn't made it upstream as quickly as I
> would like, due to a combination of things including us
> having to pause CI for a week when we ran out of minutes.

OK, so the problem is still the same as it was before: adding
unexpected data to an integrity checked file.

I don't get why there's all this dancing around trying to find space. 
Surely when the parameter was added, since it was a fixed size, the
kernel header was expanded and the boot protocol version bumped?  So we
can use that to identify kernels which can use this property and have
the space to insert it directly.

James


