Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78A6EC86B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsAE-0006Gg-7P; Mon, 24 Apr 2023 05:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqsAA-0006F8-5O
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pqsA4-0001Di-Qj
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:07 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O96S5q010907; Mon, 24 Apr 2023 09:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BlH676GZzlwxRHcgL2Ma7jRu8mu1LSAnAthvLap8G3E=;
 b=nPoQKqwitWqInK9On44C+KxyfThiP7s8BePunueBJrJcXLM8HtYXok9uAsz0yQRdXN0W
 XuYh1lS/trSUwbQ/4H6zMIkMhIln2sb6PtdrmlO1/dDhiF/9tjZRxwvBjnW9Fne3v2w/
 rKsvkJstVFznswTn6Wkao/O0Mu7x8ZqQlaxGwaAD82cic7ATQA4h2pMf9bhREbZh6a4I
 ZfSTLLuwMi/g4ixnwGT+6WpFY6cnJSsUNfN530lKEdYW9b3D9cBiB3mtXUfwU436hMyp
 VsNxYRnhmGiRENntqs9/UeXilclu21Te2wV/2hb+9JTTbRblaj3jbYm5KqwKR7lF9d+P Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m5pr6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 09:06:45 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33O96iaf012528;
 Mon, 24 Apr 2023 09:06:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m5ppv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 09:06:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33NLj6vt006299;
 Mon, 24 Apr 2023 09:01:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q477710dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 09:01:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33O91T6Y50659796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 09:01:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C0FC20043;
 Mon, 24 Apr 2023 09:01:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D44E920040;
 Mon, 24 Apr 2023 09:01:27 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.109.216.99])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Apr 2023 09:01:27 +0000 (GMT)
Date: Mon, 24 Apr 2023 14:31:25 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Message-ID: <ZEZFZY+fbnfgnHv8@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230424041830.1275636-1-kconsul@linux.vnet.ibm.com>
 <87wn21acfp.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87wn21acfp.fsf@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pHnFjE5swllxwgPhKBcq6x2YGRDb3AAF
X-Proofpoint-GUID: s3jY7xAnGDR6oOjgEZQdp9eQVETndwZD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=766
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240080
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

On 2023-04-24 09:53:23, Alex Bennée wrote:
> 
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> 
> > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> > boot_linux.py test-case due to which the code coverage for ppc
> > decreased by around 2%. As per the discussion on
> > https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> > was mentioned that the baseline test for ppc64 could be modified
> > to make up this 2% code coverage. This patch attempts to achieve
> > this 2% code coverage by adding various device command line
> > arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> > test-case.
> >
> > The code coverage report with boot_linux.py, without it and finally
> > with these tuxrun_baselines.py changes is as follows:
> 
> Queued to testing/next, thanks.
Thanks, Alex!
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

