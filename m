Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE66E7334
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 08:27:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp1HZ-0004Zc-2w; Wed, 19 Apr 2023 02:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pp1HW-0004ZS-NJ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 02:27:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pp1HU-0008A7-Ic
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 02:27:06 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J630wM014584; Wed, 19 Apr 2023 06:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CNX4TZ8+aYm/o/csIqoVFC5hYXXdEgCUAWRsZUpnYGQ=;
 b=tNMJbkjNzk3hFU2mqdnyKmOdIUDWdYbHFJB9MdRMS712mi2QUeiESd8gN45DSL32KVAP
 EEb6XTvzkL+/9Zkl7C198tPx7rIKQVh2TYQ2Qi2rhFvzgF7XlTwY2y3tE+Kv/JzgBgxm
 pcNnlBNFpxm+7Og6OXSDlfNLjyXQK876pWfdND4gLCQDTaCmwOwLV0IAUsDQHEtXAPoI
 DLRTMRxToTMu7r32bHR+LO8yHVTiu0b0oM682eQzEK9uMeSNFUouuoD4IYtafvAjD6c4
 H/N5X7KxBiK5VJ5Uzt2+r6tfNFbZvPHrYiiAEkeTfzjVFpTTyISZAaF8Pr9rzitrpP5Z LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q2apmgkss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 06:27:00 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J6GrpC028991;
 Wed, 19 Apr 2023 06:27:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q2apmgks4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 06:27:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33J5wY0e009299;
 Wed, 19 Apr 2023 06:26:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6jgnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 06:26:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33J6QthX9831150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 06:26:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EAAD20043;
 Wed, 19 Apr 2023 06:26:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6BCB2004B;
 Wed, 19 Apr 2023 06:26:52 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.42.198]) by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Apr 2023 06:26:52 +0000 (GMT)
Date: Wed, 19 Apr 2023 11:56:48 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/avocado/tuxrun_baselines.py: improve code coverage
 for ppc64
Message-ID: <ZD+JqOg5q6MGytcB@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230418055333.126623-1-kconsul@linux.vnet.ibm.com>
 <78ed2ee0-8e80-c73c-1d4d-81215d8c3e6a@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <78ed2ee0-8e80-c73c-1d4d-81215d8c3e6a@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QqQkhhvbQe0hmPn53AGB5xeYRcio3X1a
X-Proofpoint-GUID: eSFOhRF3LmDUAGu7c4EccK5WatKupRjE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=833 adultscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190055
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On 2023-04-18 09:07:53, Thomas Huth wrote:
> On 18/04/2023 07.53, Kautuk Consul wrote:
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
> > 
> > With boot_linux.py
> > ------------------
> >    lines......: 13.8% (58006 of 420997 lines)
> >    functions..: 20.7% (7675 of 36993 functions)
> >    branches...: 9.2% (22146 of 240611 branches)
> > Without boot_linux.py (without this patch changes)
> > --------------------------------------------------
> >    lines......: 11.9% (50174 of 420997 lines)
> >    functions..: 18.8% (6947 of 36993 functions)
> >    branches...: 7.4% (17580 of 239017 branches)
> > Without boot_linux.py (with this patch changes)
> > -----------------------------------------------
> >    lines......: 13.8% (58287 of 420997 lines)
> >    functions..: 20.7% (7640 of 36993 functions)
> >    branches...: 8.4% (20223 of 240611 branches)
> > 
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > Reported-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/avocado/tuxrun_baselines.py | 98 ++++++++++++++++++++++++++++++-
> >   1 file changed, 96 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> > index d343376faa..cb17602c94 100644
> > --- a/tests/avocado/tuxrun_baselines.py
> > +++ b/tests/avocado/tuxrun_baselines.py
> > @@ -308,7 +308,7 @@ def test_ppc64(self):
> >           """
> >           :avocado: tags=arch:ppc64
> >           :avocado: tags=machine:pseries
> > -        :avocado: tags=cpu:POWER8
> > +        :avocado: tags=cpu:POWER10
> >           :avocado: tags=endian:big
> >           :avocado: tags=console:hvc0
> >           :avocado: tags=tuxboot:ppc64
> > @@ -316,19 +316,113 @@ def test_ppc64(self):
> >           :avocado: tags=extradev:driver=spapr-vscsi
> >           :avocado: tags=root:sda
> >           """
> > +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> > +                         '-device', 'virtio-net,netdev=vnet')
> > +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> > +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> > +                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> 
> The patch looks already fine to me as it is, but in case you'd want to
> increase test coverage even a little bit more, you could add some lines that
> reads out the MAC address again from the /sys fs in the guest to check that
> it matches the one that has been specified here. See
> tests/avocado/machine_s390_ccw_virtio.py as an example, we're doing it for
> the s390x machine there already.
The goal was to achieve the same level of code coverage as what we had
before skipping the boot_linux.py. So I'll let this be for now. Of
course we can improve the code coverage further if required later.
> 
> > +        process.run('./qemu-img create -f qcow2'
> > +                    '/tmp/tuxrun_baselines_ppc64le.qcow2 1G')
> 
> Please clean up temporary files after the test has finished.
> Also it might be necessary to randomize the file name to make it possible
> that multiple instances of the test can be run in parallel.
Will make these changes and post a v2.

Thanks!
> 
>  Thomas
> 

