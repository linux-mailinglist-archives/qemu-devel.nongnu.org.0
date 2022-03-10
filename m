Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E84D556A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 00:31:09 +0100 (CET)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSSFP-0002bx-Gv
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 18:31:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSSDN-0001FP-HH; Thu, 10 Mar 2022 18:29:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nSSDL-0004z9-D9; Thu, 10 Mar 2022 18:29:01 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AMnm2j026876; 
 Thu, 10 Mar 2022 23:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : reply-to : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=TPTqGL+qMRol8rgZjg0os70OdhmtWsURA4zr1qVGIsE=;
 b=TiK8TQsy7F4tcFonNcVYYv8Sx8/yQyQBCWn12cwd36ob9EPyHFhYXP6Tdz7k1Mm1J43V
 /eiohjcmLPYHH3+Z7PpUvNB0sjvEopn74003Bh4vFRLxKIYPZr83dmHfySrDlL4uBV/u
 H/N2+081RtwrH39vqTbICbM0+Yd2PBZyIQ2zhUUTWFOqBpfVNFX1A+UoS9igs4UVZoAV
 JnpfIVYKq/icXo3ZjTBldz+EuvAadBRR1XCbuA8qJ/OSY0HNhv40PukQ+UXudDyshckB
 6JB1QyaE3IlXu3hr0ToWbvhany//2SVYjvhHzry0ebgA7y5VVyIvY3Dpi7b608NehBb2 Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqtfg0ny2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 23:28:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ANRZkW023294;
 Thu, 10 Mar 2022 23:28:46 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqtfg0nxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 23:28:46 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ANMijf032137;
 Thu, 10 Mar 2022 23:28:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3ekyg9xsd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 23:28:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ANShQs36897154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 23:28:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890BE78063;
 Thu, 10 Mar 2022 23:28:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAF4678067;
 Thu, 10 Mar 2022 23:28:41 +0000 (GMT)
Received: from [9.65.240.15] (unknown [9.65.240.15])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Mar 2022 23:28:41 +0000 (GMT)
Message-ID: <0b4f0ac2-42e8-daca-919b-b5153b8cd112@linux.ibm.com>
Date: Thu, 10 Mar 2022 20:28:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 0/9] --disable-tcg avocado fixes for ppc-softmmu
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220310183011.110391-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xQrbhsYlKWxHfhvRYX0emBKCApwV95af
X-Proofpoint-GUID: RiwnO4nTFeHH3lElojlegws71QTU9uqQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_09,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0
 mlxlogscore=911 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: muriloo@linux.ibm.com
Cc: muriloo@linux.ibm.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 15:30, Daniel Henrique Barboza wrote:
> Hi,
> 
> These are more test fixes that I missed from my first series [1]. Thanks
> Murilo Opsfelder and Fabiano for letting me know that we still had broken
> tests to deal with.
> 
> All these tests were either a case of 'this needs kvm_pr' or 'this needs
> kvm_hv'. Since avocado doesn't have yet a way of detecting if the host
> is running kvm_hv or kvm_pr, the workaround for now is to skip them if
> TCG isn't available.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg00866.html
> 
> 
> Daniel Henrique Barboza (9):
>    avocado/boot_linux_console.py: check TCG accel in test_ppc_g3beige()
>    avocado/boot_linux_console.py: check TCG accel in test_ppc_mac99()
>    avocado/ppc_405.py: remove test_ppc_taihu()
>    avocado/ppc_405.py: check TCG accel in test_ppc_ref405ep()
>    avocado/ppc_74xx.py: check TCG accel for all tests
>    avocado/ppc_bamboo.py: check TCG accel in test_ppc_bamboo()
>    avocado/ppc_mpc8544ds.py: check TCG accel in test_ppc_mpc8544ds()
>    avocado/ppc_prep_40p.py: check TCG accel in all tests
>    avocado/ppc_virtex_ml507.py: check TCG accel in
>      test_ppc_virtex_ml507()
> 
>   tests/avocado/boot_linux_console.py | 12 ++++++++++++
>   tests/avocado/ppc_405.py            | 10 ++--------
>   tests/avocado/ppc_74xx.py           | 13 +++++++++++++
>   tests/avocado/ppc_bamboo.py         |  2 ++
>   tests/avocado/ppc_mpc8544ds.py      |  2 ++
>   tests/avocado/ppc_prep_40p.py       |  6 ++++++
>   tests/avocado/ppc_virtex_ml507.py   |  2 ++
>   7 files changed, 39 insertions(+), 8 deletions(-)
> 

Hi, Daniel.

With this series and series "--disable-tcg qtest/avocado fixes for ppc64" [0]
applied, check-avocado passed for QEMU built with --disable-tcg --disable-linux-user.

[0] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg00866.html

So:

Tested-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

-- 
Murilo

