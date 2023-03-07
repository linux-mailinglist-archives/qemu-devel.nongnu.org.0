Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC0E6AE17B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXmh-0001f4-77; Tue, 07 Mar 2023 08:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pZXme-0001dw-JQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:55:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pZXmb-0000DP-Uw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:55:16 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327CN7Gu005220; Tue, 7 Mar 2023 13:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HSvs/Yy0hdjUiehrA7oS3xN/Ud8eigzPvFicBa5ykA0=;
 b=hZAfydhkmYY8qaQapLEigEO1ksmtkNHZmDwOy5/0c6imfJgsdfIJzZdplEfSDL1VsMvV
 /9dFkgteaEs+CiF7/RKbzvBdMoHKEEMghEfYl1qzPfg7KQRR2wZOgXRG/LelBzEUkq3c
 i2XcORicvW+vr2rhnQO1+rsIHynBmuuPzgP8OKoWvsDEpxeZ2lza6aJ6jdclBh0xviJ4
 2DVkA3mj3XpbO7aIrgA27QD3g9mjhA0ZzhfMYvpub4oBXrV10Ei4uZ2nXoW87mwCY76R
 bk9qwlinf1l5sef9R4XcuRX3XDEeY4sCzb9+wJiPFiTVkSAv4CiZoMNTUeiT8OP1zI2R bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p657mjn9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 13:55:06 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327D9Vpw014759;
 Tue, 7 Mar 2023 13:55:06 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p657mjn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 13:55:06 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 327DbWu0020316;
 Tue, 7 Mar 2023 13:55:05 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3p419kbcwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 13:55:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 327Dt3s37733860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Mar 2023 13:55:03 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81DDC58060;
 Tue,  7 Mar 2023 13:55:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5977B58063;
 Tue,  7 Mar 2023 13:55:03 +0000 (GMT)
Received: from [9.211.135.25] (unknown [9.211.135.25])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 Mar 2023 13:55:03 +0000 (GMT)
Message-ID: <8d816fcf-f518-4b2d-6eb4-62ca565fdd23@linux.vnet.ibm.com>
Date: Tue, 7 Mar 2023 07:55:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/9] accel/tcg: Fix page_set_flags and related [#1528]
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ninad@linux.ibm.com,
 Andrew Geissler <geissonator@gmail.com>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <CACPK8XdHr4ws=0aZJvkgaF0U231MJRuyHx7i35gF4uHKCtOkbw@mail.gmail.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <CACPK8XdHr4ws=0aZJvkgaF0U231MJRuyHx7i35gF4uHKCtOkbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c1SDLZVspkICvI2PRCH7nQ3ejoFR6dyP
X-Proofpoint-GUID: 7mfIWPwmVWNZMiV0cFi8vUfylhcmdOV1
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_07,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070122
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 3/6/23 9:19 PM, Joel Stanley wrote:
> On Mon, 6 Mar 2023 at 02:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> The primary issue is that of overflow, where "end" for the last
>> page of the 32-bit address space overflows to 0.  The fix is to
>> use "last" instead, which can always be represented.
>>
>> This requires that we adjust reserved_va as well, because of
>>
>> -/*
>> - * There are a number of places where we assign reserved_va to a variable
>> - * of type abi_ulong and expect it to fit.  Avoid the last page.
>> - */
>> -#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
>>
>> and the related
>>
>> -        /*
>> -         * reserved_va must be aligned with the host page size
>> -         * as it is used with mmap()
>> -         */
>> -        reserved_va = local_max_va & qemu_host_page_mask;
>>
>> whereby we avoided the final (host | guest) page of the address space
>> because of said overflow.  With the change in representation, we can
>> always use UINT32_MAX as the end of the 32-bit address space.
>>
>> This was observable on ppc64le (or any other 64k page host) not being
>> able to load any arm32 binary, because the COMMPAGE goes at 0xffff0000,
>> which violated that last host page problem above.
>>
>> The issue is resolved in patch 4, but the rest clean up other interfaces
>> with the same issue.  I'm not touching any interfaces that use start+len
>> instead of start+end.

Richard, I tested it on ppc64le host and it fix is working.

Tested-by:NinadPalsule <ninad@linux.ibm.com<mailto:ninad@linux.ibm.com>>

Thx,

Ninad Palsule


