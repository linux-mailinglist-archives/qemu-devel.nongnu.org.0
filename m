Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3156E9526
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:59:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTrp-00009I-6s; Thu, 20 Apr 2023 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTrl-000089-I3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:58:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTrj-0004zp-Gk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:58:25 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KCNT5N015059; Thu, 20 Apr 2023 12:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KJ+uwC9mcb1BB0g1AUpKo+yXOYIf/IsXjb0FtGrmAgY=;
 b=WsxUs7fZ5TTwYit/oGb0CTJCXdGGcQ9g2Mv/TguO+B/FS7LjdjyxPoJay9c87ZRAKbnP
 kHUkYnnkQoYJ66+h42711u8+2MVFqWOLS9+eJ9l6pTOMP73dSTudljh6adloyMymFMoC
 Fx1acUW1w1IivNZKOTee90VwBYUKaohcz2AlENo/F4KANnFlCsn91O/CDdCxen6yPQn6
 /mik+KWmHldAK9B1rI4vz5SdM8NfJdVcDqEdXXQge30opfdNxTZnwRscaMOXDhOUD3z8
 1nyDtre0n9RVtTRa+T8tiLyW9KleuTpFS5q4f+cvPTfHNjIeXdwO5t8x8OCDV27ISXDI 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q345wc36j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:58:20 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33KCaSkP015297;
 Thu, 20 Apr 2023 12:58:20 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q345wc34n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:58:19 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K43SwG007847;
 Thu, 20 Apr 2023 12:58:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pykj6atwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:58:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KCw25T43319686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 12:58:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE0320040;
 Thu, 20 Apr 2023 12:58:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 663E12004B;
 Thu, 20 Apr 2023 12:57:58 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.109.216.99])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 20 Apr 2023 12:57:58 +0000 (GMT)
Date: Thu, 20 Apr 2023 18:27:55 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Message-ID: <ZEE200cYQ+9QjgF7@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
 <eced17f9-387c-ce07-233f-6c398840c936@linaro.org>
 <0fdd760a-6415-2e7c-349e-300ab239170a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0fdd760a-6415-2e7c-349e-300ab239170a@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Eb-522O6FrSeC7Jsm4426CnQNq1X2R8s
X-Proofpoint-ORIG-GUID: 1zI7DsDXhJMn5hKeqzCtq2BKp6hStjLN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
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

On 2023-04-20 10:12:37, Thomas Huth wrote:
> On 20/04/2023 09.57, Philippe Mathieu-Daud޸ wrote:
> > Hi Kautuk,
> > 
> > On 19/4/23 11:22, Kautuk Consul wrote:
> > > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> > > boot_linux.py test-case due to which the code coverage for ppc
> > > decreased by around 2%. As per the discussion on
> > > https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> > > was mentioned that the baseline test for ppc64 could be modified
> > > to make up this 2% code coverage. This patch attempts to achieve
> > > this 2% code coverage by adding various device command line
> > > arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> > > test-case.
> > > 
> > > The code coverage report with boot_linux.py, without it and finally
> > > with these tuxrun_baselines.py changes is as follows:
> > > 
> > > With boot_linux.py
> > > ------------------
> > > ߦߦ lines......: 13.8% (58006 of 420997 lines)
> > > ߦߦ functions..: 20.7% (7675 of 36993 functions)
> > > ߦߦ branches...: 9.2% (22146 of 240611 branches)
> > > Without boot_linux.py (without this patch changes)
> > > --------------------------------------------------
> > > ߦߦ lines......: 11.9% (50174 of 420997 lines)
> > > ߦߦ functions..: 18.8% (6947 of 36993 functions)
> > > ߦߦ branches...: 7.4% (17580 of 239017 branches)
> > > Without boot_linux.py (with this patch changes)
> > > -----------------------------------------------
> > > ߦߦ lines......: 13.8% (58287 of 420997 lines)
> > > ߦߦ functions..: 20.7% (7640 of 36993 functions)
> > > ߦߦ branches...: 8.4% (20223 of 240611 branches)
> > > 
> > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > Reported-by: Alex Benn޸e <alex.bennee@linaro.org>
> > > ---
> > > ߦ tests/avocado/tuxrun_baselines.py | 124 +++++++++++++++++++++++++++++-
> > > ߦ 1 file changed, 122 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tests/avocado/tuxrun_baselines.py
> > > b/tests/avocado/tuxrun_baselines.py
> > > index d343376faa..f763ee5d50 100644
> > > --- a/tests/avocado/tuxrun_baselines.py
> > > +++ b/tests/avocado/tuxrun_baselines.py
> > > @@ -11,6 +11,8 @@
> > > ߦ import os
> > > ߦ import time
> > > +import string
> > > +import random
> > > ߦ from avocado import skip, skipIf
> > > ߦ from avocado_qemu import QemuSystemTest
> > > @@ -308,7 +310,7 @@ def test_ppc64(self):
> > > ߦߦߦߦߦߦߦߦߦ """
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=arch:ppc64
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=machine:pseries
> > > -ߦߦߦߦߦߦߦ :avocado: tags=cpu:POWER8
> > > +ߦߦߦߦߦߦߦ :avocado: tags=cpu:POWER10
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=endian:big
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=console:hvc0
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=tuxboot:ppc64
> > > @@ -316,21 +318,139 @@ def test_ppc64(self):
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=extradev:driver=spapr-vscsi
> > > ߦߦߦߦߦߦߦߦߦ :avocado: tags=root:sda
> > > ߦߦߦߦߦߦߦߦߦ """
> > > +ߦߦߦߦߦߦߦ # Generate a random string
> > > +ߦߦߦߦߦߦߦ res = ''.join(random.choices(string.ascii_lowercase +
> > > +ߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦߦ string.digits, k=8))
> > > +
> > > +ߦߦߦߦߦߦߦ # create qcow2 image to be used later.
> > > +ߦߦߦߦߦߦߦ process.run('./qemu-img create -f qcow2 '
> > 
> > Please take qemu-img from $PATH.
> 
> I think it would even be better to provide a function in the base class to
> call qemu-img ... we already have some code in
> tests/avocado/avocado_qemu/__init__.py to find a usable qemu-img binary, I
> think that could be extended?

Thanks everybody for the comments.
I have extended the __init__.py source code to introduce a new function
that finds the qemu-img binary. This function is now getting called from
tuxrun_baselines.py in the v3 patchset I just sent.
I haven't created a function that actually executes qemu-img as there
didn't seem adequate reason to do so.
> 
>  Thomas
> 

