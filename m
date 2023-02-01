Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7783686A3B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEyf-00008A-20; Wed, 01 Feb 2023 10:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNEyc-00007b-2R
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:24:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNEyZ-0006PT-Sy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:24:45 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311FBbLP031366; Wed, 1 Feb 2023 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=FKXFwt55704uW2Lm8el2L+GdaBye7F0XkpOc0uEp+gg=;
 b=QgMM1z6CPZwEw2O7rnDDWlFOTTUFVuh4mIRw3yYU1bjnBc7pKBOgoLE9EGywewGzf9HC
 dGpZGGOFV9+9IsyjDlq9UoSunnhULjAH0ggT3xxfEi1DO7fJWGRf8G2S04xjvEyA9pLg
 oqmScF3Q8P7cFCUIujh12EIA788yUtx2W3e5qlmGLNo94ExbvuvuRSay/rUDgsl9eZFr
 nfsb31FS7r1wKWimQb2PQChiaULJ1dlxT+QSwBl6iOsxIo0b45lj+2kPriJ+K+kPEAOs
 Gxu/15P7bvILW1wXj0l6LUisNU8+3D0ptktgaqza7PWxjAAzQtNMKEgpr77SweKgOQil QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfsp61qe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 15:24:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311FBumW000400;
 Wed, 1 Feb 2023 15:24:41 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfsp61qdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 15:24:41 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DO6jk006475;
 Wed, 1 Feb 2023 15:24:40 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtmkwhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 15:24:40 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311FOcLo10552000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 15:24:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51C3E6E04E;
 Wed,  1 Feb 2023 15:26:47 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D37C6E050;
 Wed,  1 Feb 2023 15:26:46 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 15:26:46 +0000 (GMT)
Message-ID: <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>
Date: Wed, 01 Feb 2023 10:24:06 -0500
In-Reply-To: <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rWFE4lgO0PAVfPftd5L4rZhv7eSCw_2D
X-Proofpoint-ORIG-GUID: OwJ64WURdYolpqxIN1Ri054NwRCizvfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=885
 mlxscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010130
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

On Wed, 2023-02-01 at 10:10 -0500, Jason A. Donenfeld wrote:
> This is already fixed via the patch that MST just sent in his pull.
> So wait a few days for that to be merged and it'll be all set.
> 
> No need for this patch here. Do not merge.

If it's not a secret, would it be too much trouble to point to the
branch so we can actually test it?  It does seem that the biggest
problem this issue shows is that there wasn't wide enough configuration
testing done on the prior commits before they were merged.

James


