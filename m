Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A165A299
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 04:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBSjM-00071p-QN; Fri, 30 Dec 2022 22:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pBSjJ-00071P-4A
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 22:40:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pBSjH-00010Z-2g
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 22:40:16 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BUMBlvR010677
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 03:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=zUu8mXnCFRsZA2BA66O3mg1cGSmDVQXGiVIlgNqgxhk=;
 b=YQdPcHhj28oKaqFbnHe4RE1hd4sBKqpp15VTUMdKH5O9t/6IztuRaVPucwrD/zhvzQaq
 lIVYDqaPHp1ztrS6RQrkJrTRlAgRoAdrg1e5FdCi84xMkENoBm+rLpOVz571QSfzuaWH
 86NQk2/uKSE6kUuekIBtY54x0LdzNLru77dld30UBFs8zRHJKdCq/AIaKt5rmnYfGjeA
 x+y3G0ZhCYn79QtR2yGGcao7mptzdqZngjk0RVYLac/yqnW8nyXC+i6hTl0N7vok0CG1
 h8DK7F3IlGdztocROR5p6B90SoYEvkO2JbsRnOad/lXDHmscxPLYwjQ/KEbGKLPdk7rA JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mt8jm3sqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 03:40:12 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BV3eBq5000980
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 03:40:11 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mt8jm3sqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Dec 2022 03:40:11 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BV2sjqX025691;
 Sat, 31 Dec 2022 03:40:10 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq6r54h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 31 Dec 2022 03:40:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BV3e8dk9306724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 31 Dec 2022 03:40:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A9C87805E;
 Sat, 31 Dec 2022 05:09:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 924537805C;
 Sat, 31 Dec 2022 05:09:58 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.136.248])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 31 Dec 2022 05:09:58 +0000 (GMT)
Message-ID: <d64f8077dbe7ecddc225df62d746883ebc54928e.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] tpm: convert tpmdev options processing to new
 visitor format
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Fri, 30 Dec 2022 22:40:05 -0500
In-Reply-To: <a36be6a2-38c0-4b65-20a8-5a9cacca7d71@linux.ibm.com>
References: <20221230152415.27375-1-jejb@linux.ibm.com>
 <20221230152415.27375-2-jejb@linux.ibm.com>
 <a36be6a2-38c0-4b65-20a8-5a9cacca7d71@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: T1yBxQ10F-wKNgmQDwRbeacX7uLtiMp7
X-Proofpoint-GUID: BsEodXkuMhBHduS-wfpNAHNsnSdHQDwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_01,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212310031
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

On Fri, 2022-12-30 at 12:01 -0500, Stefan Berger wrote:
> On 12/30/22 10:24, James Bottomley wrote:
[...]
> > @@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
> >                   break;
> >   #ifdef CONFIG_TPM
> >               case QEMU_OPTION_tpmdev:
> > -                if (tpm_config_parse(qemu_find_opts("tpmdev"),
> > optarg) < 0) {
> > -                    exit(1);
> > -                }
> > +                tpm_config_parse(optarg);
> 
> The patches don't apply to upstream's master.

I think it depends how you apply them.  If you use git, they do except
a minor merge conflict in tpm_passthrough.c

More seriously there's now a compile failure in tpm_mssim.c because of
the lost has_X for X pointer options, but it's also easily fixable.

> This used to exit() on failure but doesn't do this anymore, though it
> probably should.

Actually it still does.  I converted it to the standard &error_fatal
way of doing this, which will cause an exit(1) if we get an error.  The
error_fatal construct seems to have been done precisely to cure this
type of return value threading.

James


