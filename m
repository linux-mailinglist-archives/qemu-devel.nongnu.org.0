Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E66E4B09
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPaV-0008D2-Gp; Mon, 17 Apr 2023 10:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poPaR-0008CP-EK
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:12:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poPaN-0005TY-QS
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:12:06 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HCqknY010414; Mon, 17 Apr 2023 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=H3Asrtl6qJgG4YKTtrGsn0roOjnkJ8VNROLxN4nxob4=;
 b=mNcBSYULsDsIq282dZHhzZKT01TUBtmFYFTyKdhFdYqEbxhTVLCYbFA4KrUZsHLpdMx5
 2ZWh58cgu0UbmAmZZnay6iOs6EXl6XbXYaaiM7nByESz1mgQGEzduXGAW1eDbQDXWTwr
 Zy2LaMEvwfkHg33eMo9U8PdPKz8v/rKxSjTiVaZEm4lGkuenxCXm1ezUBy+0I4/EHclK
 r2vhugvBsDcQlAhAY2IM6xg5V6nAhz/ziRbUb8foJzxAoU+zKBPHYLAItNbyDPm1TY3Z
 lY77q/6nLlXaFqPSvyypiWYqH5peJ1diPdls4ajOFHC3n/jSgFAnIupy84Cgp5BXDFmF 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q166uau4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:11:58 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33HCqxNg011956;
 Mon, 17 Apr 2023 14:11:58 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q166uau3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:11:58 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H2c5vh016542;
 Mon, 17 Apr 2023 14:11:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pykj6h4sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:11:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33HEBqB828443202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 14:11:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06B3220049;
 Mon, 17 Apr 2023 14:11:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39FCB20040;
 Mon, 17 Apr 2023 14:11:49 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.20.139])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
 Mon, 17 Apr 2023 14:11:48 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 19:41:47 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 1/2] travis.yml: Add missing clang-10 package to the
 'Clang (disable-tcg)' job
In-Reply-To: <2be2ca90-15bd-9ac8-5dba-68740386e1b5@redhat.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
 <2be2ca90-15bd-9ac8-5dba-68740386e1b5@redhat.com>
Date: Mon, 17 Apr 2023 19:41:47 +0530
Message-ID: <87a5z6egyk.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q_2zMfXetEQoMQaXzoT8oKrQHAnxHoBU
X-Proofpoint-ORIG-GUID: gddj-yVXErEtpFCOtKturdFroLgBTZL7
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_08,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Thomas,
Thanks for reviewing this patch. My responses inline below:


Thomas Huth <thuth@redhat.com> writes:

> On 14/04/2023 23.06, Vaibhav Jain wrote:
>> Since commit 74a1b256d775("configure: Bump minimum Clang version to 10.0") qemu
>> needs Clang version 10.0 as the minimum version to build qemu with
>> Clang. However 'focal' ships by default with Clang version 7.0.0 which causes an
>> error while executing the 'Clang (disable-tcg)' travis job of the form below:
>> 
>> <snip>
>> $clang --version
>> 
>> clang version 7.0.0 (tags/RELEASE_700/final)
>> 
>> <snip>
>>   ERROR: You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)
>> 
>>   # QEMU configure log Fri 14 Apr 2023 03:48:22 PM UTC
>> 
>>   # Configured with: '../configure' '--disable-docs' '--disable-tools'
>>   '--disable-containers' '--disable-tcg' '--enable-kvm' '--disable-tools'
>>   '--enable-fdt=system' '--host-cc=clang' '--cxx=clang++'
>> 
>> Fix this by adding 'clang-10' to the 'apt_packages' section of the "[s390x]
>> Clang (disable-tcg)" job and updating the compiler to 'clang-10'.
>> 
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>   .travis.yml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/.travis.yml b/.travis.yml
>> index cf088ba4cf..11894eb810 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -243,7 +243,7 @@ jobs:
>>       - name: "[s390x] Clang (disable-tcg)"
>>         arch: s390x
>>         dist: focal
>> -      compiler: clang
>> +      compiler: clang-10
>>         addons:
>>           apt_packages:
>>             - libaio-dev
>> @@ -269,6 +269,7 @@ jobs:
>>             - libvdeplug-dev
>>             - libvte-2.91-dev
>>             - ninja-build
>> +          - clang-10
>
> Are you sure about this one? It works for me:
>
>   https://app.travis-ci.com/github/huth/qemu/jobs/600292740
>
> Also, Clang v10 seems to be the default version in Focal:
>
>   https://packages.ubuntu.com/focal/clang

Travis documentation at [1] mentions clang 7.0.0 to be the default
compiler for Ubuntu 20.04 (Focal and Jammy). That is what I see in my travis
environment also with Focal.

[1] -
https://docs.travis-ci.com/user/reference/focal/#environment-common-to-all-ubuntu-2004-images

>
> So how did you end up with Clang v7.0 in your run?
Running this job on an internal Travis CI Enterprise instance.

I see the build info reported by app.travis-ci.com for focal is
different from what I am seeing for "focal" distro indicating different
builder images being used.

app.travis-ci.com
=================
Build system information
Build language: c
Build dist: focal
<snip>
Runtime kernel version: 5.4.0-139-generic
travis-build version: cb95e04b
Thu Nov 24 13:57:30 UTC 2022

Operating System Details
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.5 LTS
Release:	20.04
Codename:	focal


Travis Enterprise 
==================
Build system information
Build language: c
Build group: stable
Build dist: focal
<snip>
Runtime kernel version: 4.19.86
Build image provisioning date and time
Tue 14 Feb 2023 01:48:02 PM UTC

Operating System Details
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.5 LTS
Release:	20.04
Codename:	focal

>
>   Thomas
>
>
> PS: We should maybe rather update the Travis jobs to Jammy nowadays instead.
Yes, that can be another way to address this. However depends on
availablity of Jammy image on the Travis Enterprise instance. Right now
we dont have support for it in our Travis Enterprise instance.

IMHO if workaround exists for 'Focal' then it should be used
unless it becomes too much of an effort to keep using 'Focal'.

-- 
Cheers
~ Vaibhav

