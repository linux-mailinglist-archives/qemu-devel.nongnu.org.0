Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CF6EC451
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 06:21:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqnhB-0002YW-6Y; Mon, 24 Apr 2023 00:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqnh9-0002YO-3S
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 00:20:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqnh7-0007dD-DP
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 00:20:54 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O4Cqgp031564; Mon, 24 Apr 2023 04:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xHgbaqySsoicWvLo8X0Rdt9jWMz2HIR6pMmJx7A5tuw=;
 b=B/WCmj1RI8VF78nlo4OgZZjCXyRhto9bZlgScFdAoHpg7d5w+bm4Q6qal7g2/duptwHn
 RGKFebJa27syxIZY9f+6SELk36hE4tLVQdkcspzDmDQKiru7VSX5IWP3urwbiJ8/++8G
 UgqovGYR1ak1rav8f0GZ0KhC1EAjYc7A1ZZo8lh+//ShYDSeYN4zjyK4ynBPD6DSN4GE
 X2pIzNUzx1FTcqz5TJTk4MNalt7ycB/oUfMz7hZ2S3VlkOdZFkxZC0WI6dDJsezYRHjM
 XLehxuxNDSsdcPSJwKNr0PoxHqOL6oIPvZWIrt3plGGvFlaIX311NdZmUS4x40QdKQh8 rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q45103pcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:20:51 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33O4Ko65022411;
 Mon, 24 Apr 2023 04:20:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q45103pby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:20:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O2lRmb013286;
 Mon, 24 Apr 2023 04:20:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47770uuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 04:20:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33O4KkgH9700070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 04:20:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F15520043;
 Mon, 24 Apr 2023 04:20:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B496120040;
 Mon, 24 Apr 2023 04:20:44 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.109.216.99])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Apr 2023 04:20:44 +0000 (GMT)
Date: Mon, 24 Apr 2023 09:50:42 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/2] Improve code coverage for ppc64
Message-ID: <ZEYDmqPD+c7g3mjR@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <875y9pbbrk.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <875y9pbbrk.fsf@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rPZ0GmeCbLLMmR7tYUbBIiRPjt-LwL-t
X-Proofpoint-ORIG-GUID: e8KRpgw6Drhazmhr7KQPiflJVxRfQHVv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_01,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240037
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-04-21 14:29:38, Alex Bennée wrote:
> 
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> 
> > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> > boot_linux.py test-case due to which the code coverage for ppc
> > decreased by around 2%. As per the discussion on
> > https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> > was mentioned that the baseline test for ppc64 could be modified
> > to make up this 2% code coverage. This patchset attempts to achieve
> > this 2% code coverage by adding various device command line
> > arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> > test-case.
> 
> I've pulled the first patch into my testing/next, but the second
> conflicts with the inflight patch which adds checksums:
> 
>   Message-Id: <20230417134321.3627231-3-alex.bennee@linaro.org>
>   Date: Mon, 17 Apr 2023 14:43:17 +0100
>   Subject: [PATCH v4 2/6] tests/avocado: use the new snapshots for testing
>   From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
> 
> You can either wait and re-base once the PR goes in (I'll send a pre-PR
> Monday) or do you can re-base directly off my branch at:
> 
>   https://gitlab.com/stsquad/qemu/-/tree/testing/next
> 
> and send the tested patch mentioning its based off my testing/next and
> I'll include it in the pre-PR.
Sent a v5 for this rebased off
https://gitlab.com/stsquad/qemu/-/tree/testing/next.

Thanks.
> 
> >
> > Changes since v3:
> > - Create a common ppc64_common_tuxrun routine in tuxrun_baselines.py
> >   and call that from the ppc64 and ppc64le test case routines.
> >
> > Kautuk Consul (2):
> >   avocado_qemu/__init__.py: factor out the qemu-img finding
> >   tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64
> >
> >  tests/avocado/avocado_qemu/__init__.py | 27 +++++-----
> >  tests/avocado/tuxrun_baselines.py      | 68 ++++++++++++++++++++++++--
> >  2 files changed, 80 insertions(+), 15 deletions(-)
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

