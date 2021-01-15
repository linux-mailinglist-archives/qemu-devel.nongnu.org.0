Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E602F84B6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:49:25 +0100 (CET)
Received: from localhost ([::1]:52442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UA0-0004Lk-NH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l0U24-0008PQ-W9; Fri, 15 Jan 2021 13:41:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1l0U21-0004LF-U5; Fri, 15 Jan 2021 13:41:12 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FIXKCs048119; Fri, 15 Jan 2021 13:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bMrQcCrLIXtuJSSVj8QohJU+r9HX6FyDacMU+mVBOG0=;
 b=lZOwkfcEHydpF9ltdpV43Po145bmRtv+V57uM87v95Y1pnxTWN5P+VxWXppzUApDDUxQ
 r9yWB92AC1eDJAki56cdaPj32jArUB6085VkF1cK+FfdpeWJS1uFNqpNU9VHTM0cclLc
 vdxB1LFs1KCudZTaCEfo4u0eDXmNKuPK7XDqIcxMryzjhWHQs/Z5w1s3wkM1C6+p703B
 HzhgOyuvNJUbMFjcQCkA/lFVR2TRVA4Me8II3FNLJLawKfrr63f/wtUi9k1JqSYTn+SM
 R0d6F29rX4xnnVq/EtgIX1KDn3nkX9T+yqT5ZsKnpBv57Z070P4fePKhIfHfJAA+pU+7 Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363gbmr9y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 13:41:01 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FIY6Sr050669;
 Fri, 15 Jan 2021 13:41:01 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363gbmr9tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 13:41:01 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FIXTJJ017693;
 Fri, 15 Jan 2021 18:40:56 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 35y449pq8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 18:40:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FIetVL20120050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 18:40:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B21D112063;
 Fri, 15 Jan 2021 18:40:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29389112062;
 Fri, 15 Jan 2021 18:40:55 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 18:40:55 +0000 (GMT)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
 <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
 <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <1969c0a9-d2a0-35cd-98c9-93ec8c810a25@linux.ibm.com>
Date: Fri, 15 Jan 2021 13:40:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_09:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 11:06 AM, Philippe Mathieu-Daudé wrote:
> On 1/15/21 4:53 PM, Stefan Berger wrote:
>> On 1/15/21 10:52 AM, Philippe Mathieu-Daudé wrote:
>>> Subject is incorrect, this is not a removal of the tests, but
>>> removal of their execution. The tests are still in the repository.
>>> This is more of a disablement.
>> How do you compile / run them to have the LeakSanitizer checks?
> I used:
>
> ../configure --cc=clang --enable-sanitizers && make check-qtest
>
> $ clang -v
> clang version 10.0.1 (Fedora 10.0.1-3.fc32)
>
> This was previously covered by patchew CI. I just figured
> patchew is running without the LeakSanitizer since commit
> 6f89ec7442e ("docker: test-debug: disable LeakSanitizer"):
>
>   docker: test-debug: disable LeakSanitizer
>
>   There are just too many leaks in device-introspect-test (especially for
>   the plethora of arm and aarch64 boards) to make LeakSanitizer useful;
>   disable it for now.
>
I only get short stack traces:


Indirect leak of 852840 byte(s) in 207 object(s) allocated from:
     #0 0x561a8c2f8b57 in calloc 
(/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
     #2 0x561a8c4c2508 in json_parser_parse 
/home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
     #3 0x561a8c4a99aa in json_message_process_token 
/home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
     #4 0x561a8c4b6cfb in json_lexer_feed_char 
/home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13

Indirect leak of 6624 byte(s) in 207 object(s) allocated from:
     #0 0x561a8c2f8b57 in calloc 
(/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)

Indirect leak of 1449 byte(s) in 207 object(s) allocated from:
     #0 0x561a8c2f899f in malloc 
(/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23f99f)
     #1 0x14f096306958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)

How can I see more of those?


    Stefan


