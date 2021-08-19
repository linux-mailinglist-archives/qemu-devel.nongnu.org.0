Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FAA3F1C62
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:13:01 +0200 (CEST)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjj2-00074T-A4
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGji6-0006P1-Me
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:12:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1138
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mGji5-0000M4-0D
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:12:02 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JF4SmJ166632; Thu, 19 Aug 2021 11:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=p9iPsu/XCtw77NFHv68NbUvGTS4l6fDgXO9q3FH3jHQ=;
 b=hZCijUjTB+ssfClL8Sc15tbdtp4VySSanZUZM0PbJKNQkg4RiR448dCyXtMUwgg+zdYW
 0FCXnuimHOZugA4tDp4kKQ+25a5ACxygBh1uebpmLlNOF5j8z3rp7L5CQU9go5t6574Z
 CQDgB9HBxCgaw24ba9NPkd3XiQxg3iKwsdAuAkBNLDozct2qduW8rYfD2rlK7Ts11HqT
 MMlQCEtqR9RhLq9bupNtOsZMP+AdN25cGiNjkFQQ+LOpK/Tv9I+9PyRHJ1QozEqRohrK
 mkdEuMPgu9k8wGdvD7eTobS6ueqI1OtQl1bjVeOuPTk3ydbpWJoM8b4kf0RSWyiCcfyf Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agp2d14pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 11:11:59 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17JF58Pi170214;
 Thu, 19 Aug 2021 11:11:58 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agp2d14nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 11:11:58 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JEam4F030733;
 Thu, 19 Aug 2021 15:11:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3ae5f8f9wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 15:11:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JFBsCT54395156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 15:11:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EFBA11C050;
 Thu, 19 Aug 2021 15:11:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0766A11C04C;
 Thu, 19 Aug 2021 15:11:54 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.161.250])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Aug 2021 15:11:53 +0000 (GMT)
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: pbonzini@redhat.com
References: <20210729124713.208422-7-pbonzini@redhat.com>
 <20210819084303.320682-1-borntraeger@de.ibm.com>
 <81b25fdd-fb8e-8781-bb93-42f0b42e59fc@de.ibm.com>
Message-ID: <ae36c7a5-e116-edcd-f96b-ac9acaeb43b3@de.ibm.com>
Date: Thu, 19 Aug 2021 17:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <81b25fdd-fb8e-8781-bb93-42f0b42e59fc@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zpKZQLl06kSrBXifvTB3T_utR73twRJk
X-Proofpoint-GUID: gDohSMvbGDDyfA_PFtvW5aE7qVRmckBg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=927 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190089
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19.08.21 16:51, Christian Borntraeger wrote:
> 
> 
> On 19.08.21 10:43, Christian Borntraeger wrote:
>> Interestingly enough this breaks my rpmbuild (both rpmbuild and mock).
>> (mostly with a modified f35 spec file):
>>
>> cc -Isubprojects/libvhost-user/libvhost-user.a.p -Isubprojects/libvhost-user -I../subprojects/libvhost-user -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -std=gnu11 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -O2 -fexceptions -g -grecord-gcc-switches -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -march=zEC12 -mtune=z13 -fasynchronous-unwind-tables -fstack-clash-protection -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value 
>> -Wno-psabi -fstack-protector-strong -DSTAP_SDT_V2 -fPIE -pthread -D_GNU_SOURCE -MD -MQ subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o.d -o subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c ../subprojects/libvhost-user/libvhost-user.c
>> ../subprojects/libvhost-user/libvhost-user.c:43:10: fatal error: include/atomic.h: No such file or directory
>>     43 | #include "include/atomic.h"
>>        |          ^~~~~~~~~~~~~~~~~~
>> compilation terminated.
>>
> 
> Looks like the link in the tar.xz file is broken. We do use scripts/archive-source.sh.
> Will look further.

OK,  the build pipeline used tar -xform to prepend a folder name for rpmbuild. adding flags=r solved my issue.

