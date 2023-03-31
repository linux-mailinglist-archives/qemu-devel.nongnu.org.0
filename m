Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99F6D1E52
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piCIt-0008Pz-VK; Fri, 31 Mar 2023 06:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1piCIr-0008PV-57
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:48:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1piCIp-00077b-3r
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:48:16 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V9BsR9014147; Fri, 31 Mar 2023 10:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NYxU69UX+jK9p5qq1+4RXpV0F/vXl/9rY8iUtIOyJiI=;
 b=jf8JmQB6/3/jKIjtjlSwLgXxRinILQm1ebg55s8L70/3jR51icSVC0TgTazX1PS/+Q8c
 dRtsbHeM2sEKvJ3cWz/uyZcxwVYZjm1/kWnOSEuXHRIM38+cegGPzBzmeBk9OWSMQ3rI
 fc6WDbJ6Llh6oIm3d5EPtWFRtRaqbhRLazz+w5YZS9QRK/Q4zPNFwVzukgpSBvrv+Fee
 ZgV2JSZwCqQtXOvQVcSZUvGj9rnBoPMoORa1AwzssT+d4D3V2P8RLViyOKYUXSU1hgin
 QizleSKeDMJ7k0MbPyMrfjW4hL82B2BesUhm+H+LzH0jPmf5MuMm5mGJ6GgeIGVyM2Ad 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnvnya6fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 10:48:10 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VAlQaq017891;
 Fri, 31 Mar 2023 10:48:09 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnvnya6ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 10:48:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UJwVsB028881;
 Fri, 31 Mar 2023 10:48:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fppa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 10:48:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32VAm4Os25690706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 10:48:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 886CA2004B;
 Fri, 31 Mar 2023 10:48:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262B020040;
 Fri, 31 Mar 2023 10:48:01 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.73.38]) by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 31 Mar 2023 10:48:00 +0000 (GMT)
Date: Fri, 31 Mar 2023 16:17:57 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Message-ID: <ZCa6XXCfdBIKqN+c@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
 <ZCUoKZ7OrEVa4CEN@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87wn2xmdcr.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87wn2xmdcr.fsf@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sUUJK4DsveMXFvXMM-1Tik6K9lK7PMVM
X-Proofpoint-GUID: 9lFNPtlqPZypS63papnY86DTwk3GutAf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_06,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310084
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023-03-31 11:19:18, Alex Bennée wrote:
> 
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> 
> > Hi,
> > On 2023-03-27 07:50:29, Kautuk Consul wrote:
> >> Avocado version 101.0 has a fix to re-compute the checksum
> >> of an asset file if the algorithm used in the *-CHECKSUM
> >> file isn't the same as the one being passed to it by the
> >> avocado user (i.e. the avocado_qemu python module).
> >> In the earlier avocado versions this fix wasn't there due
> >> to which if the checksum wouldn't match the earlier
> >> checksum (calculated by a different algorithm), the avocado
> >> code would start downloading a fresh image from the internet
> >> URL thus making the test-cases take longer to execute.
> >> 
> >> Bump up the avocado-framework version to 101.0.
> > Any comments on this ? I have tested this patch and it seems to work
> > fine with the avocado test-cases.
> 
> I'm dropping this from the for-8.0 series as it causes a bunch of
> failures in tests. I'll keep it in testing/next for when the tree
> re-opens.
Sure, sounds good. Thanks.
> 
> >> 
> >> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> >> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> >> ---
> >>  tests/requirements.txt | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/tests/requirements.txt b/tests/requirements.txt
> >> index 0ba561b6bd..a6f73da681 100644
> >> --- a/tests/requirements.txt
> >> +++ b/tests/requirements.txt
> >> @@ -2,5 +2,5 @@
> >>  # in the tests/venv Python virtual environment. For more info,
> >>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> >>  # Note that qemu.git/python/ is always implicitly installed.
> >> -avocado-framework==88.1
> >> +avocado-framework==101.0
> >>  pycdlib==1.11.0
> >> -- 
> >> 2.39.2
> >> 
> >> 
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

