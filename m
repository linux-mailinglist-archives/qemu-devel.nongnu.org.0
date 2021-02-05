Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414013105B3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:18:15 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vNd-0008VH-2J
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7vK2-0006u0-4H; Fri, 05 Feb 2021 02:14:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7vJv-0000F4-EV; Fri, 05 Feb 2021 02:14:29 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11575pfJ178321; Fri, 5 Feb 2021 02:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3F/8OvHLEguJQcfeNQwpGA6SXQ46j8kXd3DXraApU3k=;
 b=HGeUphiOPPZgkBZ4Ffp5xGO+OfKyQO8tE5bRu3Uf9lkZygC2cU/n9qShI/M+rcnEjpTV
 kp1oW1yN8DvZwuzj14JYaKzs6RzLygHxXi2czbaZzdLamLBq6x4RqP3FPbgKjKARz2b1
 LbRZDqauXcquVoWBF5aw7ri3bRHL1kdK8Rl2HCydK5ikV9+m9Pt79hRcBMiLgPKixXvQ
 gAoJue1qnC4ydaAPt0kLivgO6v7dauuUebOti3XbJFbuljDLZB8VzyTSTeJOMIkybPFN
 esn+E1ddkioJxaeQ077kEpE1EFnKPz54mx3T8kUpo/vLFHeCzCM1DHj1wzkKdxcPfVqJ vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gxxnb275-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 02:14:20 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11575qJx178337;
 Fri, 5 Feb 2021 02:14:20 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gxxnb265-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 02:14:20 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11572f8D024652;
 Fri, 5 Feb 2021 07:14:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 36cy38aygk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 07:14:16 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1157EE3v46268708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 07:14:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E26AC11C04A;
 Fri,  5 Feb 2021 07:14:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92E9F11C058;
 Fri,  5 Feb 2021 07:14:13 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.76.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 07:14:13 +0000 (GMT)
Subject: Re: [PATCH v2] target/s390x/arch_dump: Fixes for the name field in
 the PT_NOTE section
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210204164117.721110-1-thuth@redhat.com>
 <8674a570-93f7-24dc-10b8-0c3577c0841f@de.ibm.com>
 <1d54bafb-b995-0052-e9f9-2572e69dcc11@redhat.com>
 <f72a20f1-581b-b262-4546-acf167198aa4@de.ibm.com>
Message-ID: <896eb62a-19f6-997a-6f38-a10c4b62035a@de.ibm.com>
Date: Fri, 5 Feb 2021 08:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <f72a20f1-581b-b262-4546-acf167198aa4@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_04:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050045
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05.02.21 08:08, Christian Borntraeger wrote:
> 
> 
> On 05.02.21 07:12, Thomas Huth wrote:
>> On 04/02/2021 18.00, Christian Borntraeger wrote:
>>> On 04.02.21 17:41, Thomas Huth wrote:
>>>> According to the "ELF-64 Object File Format" specification:
>>>>
>>>> "The first word in the entry, namesz, identifies the length, in
>>>>   bytes, of a name identifying the entry’s owner or originator. The name field
>>>>   contains a null-terminated string, with padding as necessary to ensure 8-
>>>>   byte alignment for the descriptor field. The length does not include the
>>>>   terminating null or the padding."
>>>>
>>>> So we should not include the terminating NUL in the length field here.
>>>>
>>>> Also there is a compiler warning with GCC 9.3 when compiling with
>>>> the -fsanitize=thread compiler flag:
>>>>
>>>>   In function 'strncpy',
>>>>      inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
>>>>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>>>>    '__builtin_strncpy' specified bound 8 equals destination size
>>>>    [-Werror=stringop-truncation]
>>>>
>>>> Since the name should always be NUL-terminated, let's use g_strlcpy() to
>>>> silence this warning. And while we're at it, also add an assert() to make
>>>> sure that the provided names always fit the size field (which is fine for
>>>> the current callers, the function is called once with "CORE" and once with
>>>> "LINUX" as a name).
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   v2: Use g_strlcpy instead of strncpy
>>>
>>>
>>> With this patch I do get
>>>
>>> WARNING: possibly corrupt Elf64_Nhdr: n_namesz: 0 n_descsz: 4 n_type: 88
>>>
>>> when running crash on the elf file created by dump-guest-memory. Without the
>>> patch everything is fine.
>>
>> Drat! Looking at the crash sources:
>>
>>  https://github.com/crash-utility/crash/blob/master/s390x.c#L378
>>
>> ... it seems like crash is rather rounding up to the next 4 bytes boundary instead of the next 8 bytes boundary. Thus things go wrong now when QEMU writes writes the "CORE" notes section. In the old code we were using 4 + 1 as a lengths, so crash correctly rounded this up to 8. But now with 4 as a length, this does not work right anymore :-(
>>
>> Seems like I either misunderstood the "ELF-64 Object File Format" specification, or this is a bug in the crash utility (it should either add 1 to n_namesz for the trailing NUL or pad to 8 instead of 4)? Anyway, it's maybe better to keep the "+ 1" in QEMU for now to avoid breaking things, I guess?
> 
> I guess kdump and friends are also doing the +1 otherwise we would see the error with those ELF dumps.
> But yes, as long as crash does not work we must not apply this patch.

FWIW, readelf also complains:
Displaying notes found at file offset 0x000000b0 with length 0x000004d8:
  Owner                Data size 	Description
  CORE                 0x00000150	NT_PRSTATUS (prstatus structure)
  (NONE)               0x00000004	Unknown note type: (0x00000088)
   description data: 00 00 00 02 
readelf: dump.mem2: Warning: note with invalid namesz and/or descsz found at offset 0x170
readelf: dump.mem2: Warning:  type: 0x0, namesize: 0x434f5245, descsize: 0x00000000, alignment: 4


