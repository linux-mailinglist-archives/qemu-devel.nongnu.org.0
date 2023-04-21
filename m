Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDEB6EA29C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:06:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppi2X-0000yl-LZ; Fri, 21 Apr 2023 00:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppi2U-0000xZ-8n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:06:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppi2R-0004Rf-ON
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:06:25 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L3soO9002968; Fri, 21 Apr 2023 04:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=8kkQiWLs++Gcr2PH0AEdrtSZqwAsrqoeYAWAi3NuNzc=;
 b=H20vGehfSCi35E+vOshm8K8FUV3u3G6Z7QVuTFsz9UU9JUNCx56Axh/2IxxmNLR1NsP5
 kbEXtWPbr4oQ1MaKMXSELLit1zDw3d77fKLOOP9YsWOh0QdrcEBCjtm9wQx/sDkLHpup
 mssrYgqnAYUy6IWn9IneTieGelFPu8uUfwPn1tLlMnuov01icdYyAfgdUb2aFXzTwwrn
 wwFOOOTiTQEVq7mJjo2kWxMlG3jL4cUSODQpCT39BvgHNnu6QzgV3f1lSqpw2y/E+840
 7onJ2s6mmNPlw0EKzBwbcF308Z6FOtUwB9WpeZIyM3Nb8sQuEqHPznVapgGXhltFby/5 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3k05gahg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:06:21 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33L3ucff007286;
 Fri, 21 Apr 2023 04:06:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3k05gag3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:06:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KJYWrm002052;
 Fri, 21 Apr 2023 04:06:19 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pyk6fksq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 04:06:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33L46Ge332833914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 04:06:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDA4720040;
 Fri, 21 Apr 2023 04:06:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5E020043;
 Fri, 21 Apr 2023 04:06:13 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.121.215])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Apr 2023 04:06:13 +0000 (GMT)
Date: Fri, 21 Apr 2023 09:36:09 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/2] Improve avocado code coverage for ppc64
Message-ID: <ZEILsRKyIYhL9Kbw@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
 <87fs8ud2a7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fs8ud2a7.fsf@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hme0-wR_TP9ll9OK5tn2z1RX84uXIfEY
X-Proofpoint-ORIG-GUID: TNwNUoLCp_DvbkgyxlLXcp6jDkjeYqbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=866
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210033
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

On 2023-04-20 16:01:45, Alex Bennée wrote:
> 
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> 
> > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> > boot_linux.py test-case due to which the code coverage for
> > powerpc decreased by 2%. This patchset aims to make up this
> > 2% code coverage by modifying the tuxrun_baselines.py test-case.
> 
> BTW did you see we have a basic tool to compare runs now in
> scripts/coverage/compare_gcov_json.py if you want to see exactly what
> the differences between a boot_linux and tuxrun_baseline test is.
I focused on just getting the lines' and functions' coverage equal to the
boot_linux.py test-case. I just added devices to meet the coverage
percentage and didn't really focus on imitating the code coverage that
boot_linux.py does.
> 
> Currently its only file granularity but it could be fixed up to do a
> more detailed line by line breakdown.
I am currently getting the following error while trying to execute this script:
root@melvil:/home/kautuk/qemu/build_without# python3 ../scripts/coverage/compare_gcov_json.py 
Traceback (most recent call last):
  File "../scripts/coverage/compare_gcov_json.py", line 39, in <module>
    def load_json(json_file_path: Path, verbose = False) -> dict[str, set[int]]:
TypeError: 'type' object is not subscriptable
root@melvil:/home/kautuk/qemu/build_without#
> 
> >
> > Changes since v1 and v2:
> > - Modified the way and code that creates the temporary qcow2
> >   image that the tuxrun_baselines.py is now using.
> > - Factored out code in avocado_qemu/__init__.py to create
> >   the get_qemu_img() function that will now get called from
> >   tuxrun_baselines.py.
> >
> > Kautuk Consul (2):
> >   avocado_qemu/__init__.py: factor out the qemu-img finding
> >   tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64
> >
> >  tests/avocado/avocado_qemu/__init__.py |  27 +++---
> >  tests/avocado/tuxrun_baselines.py      | 120 ++++++++++++++++++++++++-
> >  2 files changed, 132 insertions(+), 15 deletions(-)
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

