Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99806CBD87
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:26:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7S2-00010z-8C; Tue, 28 Mar 2023 07:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ph7S0-00010g-06
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:25:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ph7Rx-000175-W3
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:25:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SAsX50031870; Tue, 28 Mar 2023 11:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=P1sO/Xzbpf/RnuXS0P9zgf/XIn+0g/1sIY6VR3+E5Lo=;
 b=hD2OXA4yvIbG5ymPilTkhWqla8jKdzS9mNfTZklalMxkCQnq7bht9otJQ2KX/mcrA/TT
 tak81t92EAt4yTm5jl1TmPE7dPHxfAdpFJvnNe/zFcxbhUai5EeHIxxNmV/l0ry9b6zA
 Id5LZ1kJWrH4T3NAG08IVgz4BesUvnwYuP/1kZakM3X5RRGofgZM8hEUztM3RlHLPwky
 f6KL08D10cyqcZmRnl6uHBoJLlg8hlGmDMCsojXfMadEgX3gXEZLtisEajytVfaW5HeR
 ZZ9r8A+EJqoL/u9x3fAO5Z1LG3hVSiUoi4TGMIVJbk8UUqx7ojwuqfm8EGIYBB15qlJo 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkxw90nyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:25:11 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SAtF2s001398;
 Tue, 28 Mar 2023 11:25:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkxw90nxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:25:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32S4pcDM028948;
 Tue, 28 Mar 2023 11:25:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fkwmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 11:25:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SBP7CD55443874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 11:25:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07F0F20043;
 Tue, 28 Mar 2023 11:25:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8121D20040;
 Tue, 28 Mar 2023 11:25:03 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.75.27]) by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Mar 2023 11:25:03 +0000 (GMT)
Date: Tue, 28 Mar 2023 16:54:59 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] tests/avocado/boot_linux.py: re-enable test-case for
 ppc64
Message-ID: <ZCLOi5RKIMGfjWRj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
 <87r0tarx7u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0tarx7u.fsf@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z_mGt8pfK7x_hKYSGX1mWID8N-Ql86fl
X-Proofpoint-GUID: 4qIMgeXuQCEww7IiOOZ782oCLUgWzPUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303280091
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023-03-27 17:07:30, Alex Bennée wrote:
> 
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> 
> > Fixes c0c8687ef0("tests/avocado: disable BootLinuxPPC64 test in CI").
> >
> > Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the test-case
> > for PPC64. On investigation, this turns out to be an issue with the
> > time taken for downloading the Fedora 31 qcow2 image being included
> > within the test-case timeout.
> > Re-enable this test-case by setting the timeout to 360 seconds just
> > before launching the downloaded VM image.
> >
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > Reported-by: Alex Bennée <alex.bennee@linaro.org>
> > Tested-by: Hariharan T S hariharan.ts@linux.vnet.ibm.com
> 
> It doesn't really address the principle problem that the
> boot_linux.py:BootLinuxPPC64.test_pseries_tcg is super heavyweight for
> only 2% extra coverage of the executed lines.
By re-enabling this test-case we will ensure that PPC64 part of qemu
works okay in terms of basic linux boot. Without this we will have
a regression in the sense that there won't be any way to test out
basic linux boot for PPC64.
> 
> What we really need is a script so we can compare the output between the
> two jsons:
> 
>   gcovr --json --exclude-unreachable-branches --print-summary -o coverage.json --root ../../ . *.p
> 
> because I suspect we could make up that missing few % noodling the
> baseline test a bit more.
Can you tell me how you check code coverage with and without this
test-case ? I am kind of new to qemu so it would be nice to know how you
do this. And I am trying to increase the code coverage by improving
the baseline test by including more devices in the qemu-system-ppc64
command line so I would appreciate any tips on how to do that also.
> 
> > ---
> >  tests/avocado/boot_linux.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> > index be30dcbd58..c3869a987c 100644
> > --- a/tests/avocado/boot_linux.py
> > +++ b/tests/avocado/boot_linux.py
> > @@ -91,9 +91,9 @@ class BootLinuxPPC64(LinuxTest):
> >      :avocado: tags=arch:ppc64
> >      """
> >  
> > +    # timeout for downloading new VM image.
> >      timeout = 360
> >  
> > -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> >      def test_pseries_tcg(self):
> >          """
> >          :avocado: tags=machine:pseries
> > @@ -101,6 +101,10 @@ def test_pseries_tcg(self):
> >          """
> >          self.require_accelerator("tcg")
> >          self.vm.add_args("-accel", "tcg")
> > +
> > +        # timeout for actual Linux PPC boot test
> > +        self.timeout = 360
> > +
> >          self.launch_and_wait(set_up_ssh_connection=False)
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

