Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7D6E4B3A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:17:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPdn-0001t6-6l; Mon, 17 Apr 2023 10:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poPdk-0001s4-VJ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:15:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poPdj-0006A6-54
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:15:32 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HCqkDc010348; Mon, 17 Apr 2023 14:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=B7YURjsOq5sxzZa8qlduZVuPFrMG3tNPWSh6riiF0v8=;
 b=gt0ESlhCDnQFzjGG1qQfCLOs09Q0moFozJwz84tszOIOn+dThDOHvjcd4TZcDhIXMJmn
 K4qMMZKG0dch/DgKEN/JIGpE34vs63QUUaoR4+Sw2KW1DDOMJNVH/1MM4ABCJPDR6M9z
 n+H5xA1XCAc/xBh4Q9l2YWkk2i7JZIO3IT4TBfskhmdG0LZT556cZbDcrNPyGQS0y/3C
 dsW8g7hW8ZvnQ4qG+J/4bedOjh7TfW2HxKNDJDw0RmVrtRiii3bzFn7rTHzkCfqjFiz+
 u8Bb8FC0uoG6Sb33DMTmC2MBkaB6TQXaLzRplpCR9cgwbwYB1o6T9ArIv4Agx1JUKnV5 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q166uaxeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:15:27 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33HCqkZv010327;
 Mon, 17 Apr 2023 14:15:27 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q166uaxd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:15:27 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H2DbL4019632;
 Mon, 17 Apr 2023 14:15:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3pyk6fh55m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 14:15:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33HEFL9t30409314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 14:15:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E81E520040;
 Mon, 17 Apr 2023 14:15:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24A3D20043;
 Mon, 17 Apr 2023 14:15:18 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.20.139])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Mon, 17 Apr 2023 14:15:17 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 19:45:16 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 2/2] travis.yml: Add missing 'flex' package to 'GCC
 (user)' job
In-Reply-To: <9ac8a8d1-fd78-e8bc-e4e1-92645738f34d@redhat.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
 <20230414210645.820204-2-vaibhav@linux.ibm.com>
 <9ac8a8d1-fd78-e8bc-e4e1-92645738f34d@redhat.com>
Date: Mon, 17 Apr 2023 19:45:16 +0530
Message-ID: <877cuaegsr.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KWDIlvhp5CDnle6WX74UXFvk32BBaLSd
X-Proofpoint-ORIG-GUID: iJ4BqIARbwYIw_ZJb7sANWXZc9_LRvlM
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

Thanks for looking into this patch. My responses inline below:

Thomas Huth <thuth@redhat.com> writes:

> On 14/04/2023 23.06, Vaibhav Jain wrote:
>> Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
>> hexagon target uses 'flex' to generate idef-parser. However 'focal' may not have
>> 'flex' pre-installed, consequently following error is seen with travis when
>> trying to execute the 'GCC (user)' job that also tries to build hexagon user
>> binary:
>> 
>> <snip>
>> export CONFIG="--disable-containers --disable-system"
>> <snip>
>>   Program flex found: NO
>> 
>> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
>> executable
>> <snip>
>
> This works for me also without adding the package:
>
>   https://app.travis-ci.com/github/huth/qemu/jobs/600292739
>
> Weird. Are you using a different Travis instance than I do?
>
Yes, I am using a Enterprise Travis Instance with 'focal' distro which
apparantly has a different focal image not containing Flex available by
default.

>> Fix this by explicitly add 'flex' to the list of addon apt-packages for the
>> 'GCC (user)' job.
>> 
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>   .travis.yml | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/.travis.yml b/.travis.yml
>> index 11894eb810..8dc71c294d 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -237,6 +237,7 @@ jobs:
>>             - libglib2.0-dev
>>             - libgnutls28-dev
>>             - ninja-build
>> +          - flex
>
> I agree that adding this explicitely makes sense, but I think we should then 
> also add "bison" here as well, since that's used by the hexagon target, too?
Yes, agree. Will spinoff another version which explicitly adds this dep.

>   Thomas
>
>

-- 
Cheers
~ Vaibhav

