Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17AE6EA3EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:38:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkP3-0002HA-Pm; Fri, 21 Apr 2023 02:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppkOq-0002Gn-4Q
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:37:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppkOo-0005l0-HM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:37:39 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L6IWSf006952; Fri, 21 Apr 2023 06:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=AbEg2QZ/YGjYPDbrZCmRDojmSgGTuEU5BrLoqLfVFK8=;
 b=FLNBlodkvOfseTZjPhQq0/TiuvVZHMW/6fotNj7nxfmQ0REFnCeqcwq1CI+8mo+ovK/q
 tADMbX6438tmXs7hBsjbg5PQNDgZo8mPZG1lr64iUapQZtzFp26rXuAEezsk2TkgDkqJ
 H9hAlWMzZIavl6ktJYF9Bewx6c5KwaD7yGojUVury4VlW2ellrbu2iBpGu3p9E3jJUjo
 2CmtGyWNBrmDulggRTL6fB6UtrEXjTxr+5YNWBUN4ZZP3ENY8d+c3ZFtEyG2ZOrzCr54
 OdXHL59ktgP5XMdyqRDK/Hfg1s7VPfUpptQsc11pnBDNCHzmF2BKI2PDUnNyYn6NT3uP bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3n3n8jqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:37:35 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33L6N0Vw019530;
 Fri, 21 Apr 2023 06:37:34 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3n3n8jmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:37:34 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K1b5kK002460;
 Fri, 21 Apr 2023 06:37:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6bumm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:37:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33L6bTT341353616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 06:37:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FE882004D;
 Fri, 21 Apr 2023 06:37:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D5CA20040;
 Fri, 21 Apr 2023 06:37:26 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.121.215])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Apr 2023 06:37:26 +0000 (GMT)
Date: Fri, 21 Apr 2023 12:07:23 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/2] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Message-ID: <ZEIvI/eSTdEKJLmL@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vp8DZuzD0DMCK-fmlrs7Iqd6TMEaDvMg
X-Proofpoint-ORIG-GUID: N9-BmZT9heAkjdI-dwRVtx_k1SqROCsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210051
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

Adding Harsh Prateel Bora.

On 2023-04-20 23:23:21, Kautuk Consul wrote:
> Factor out the code that finds the qemu-img binary in the
> QemuSystemTest class and create a new get_qemu_img() function
> with it. This function will get called also from the new code
> in tuxrun_baselines.py avocado test-case.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index cb71f50db9..d8f390e27a 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -330,6 +330,19 @@ def _new_vm(self, name, *args):
>              vm.add_args(*args)
>          return vm
>  
> +    def get_qemu_img(self):
> +        self.log.debug('Looking for and selecting a qemu-img binary')
> +
> +        # If qemu-img has been built, use it, otherwise the system wide one
> +        # will be used.
> +        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> +        if not os.path.exists(qemu_img):
> +            qemu_img = find_command('qemu-img', False)
> +        if qemu_img is False:
> +            self.cancel('Could not find "qemu-img"')
> +
> +        return qemu_img
> +
>      @property
>      def vm(self):
>          return self.get_vm(name='default')
> @@ -594,17 +607,9 @@ def set_up_existing_ssh_keys(self):
>          return (ssh_public_key, ssh_private_key)
>  
>      def download_boot(self):
> -        self.log.debug('Looking for and selecting a qemu-img binary to be '
> -                       'used to create the bootable snapshot image')
> -        # If qemu-img has been built, use it, otherwise the system wide one
> -        # will be used.  If none is available, the test will cancel.
> -        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> -        if not os.path.exists(qemu_img):
> -            qemu_img = find_command('qemu-img', False)
> -        if qemu_img is False:
> -            self.cancel('Could not find "qemu-img", which is required to '
> -                        'create the bootable image')
> -        vmimage.QEMU_IMG = qemu_img
> +        # Set the qemu-img binary.
> +        # If none is available, the test will cancel.
> +        vmimage.QEMU_IMG = super().get_qemu_img()
>  
>          self.log.info('Downloading/preparing boot image')
>          # Fedora 31 only provides ppc64le images
> -- 
> 2.25.1
> 
> 

