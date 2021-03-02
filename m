Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68F32A05A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:20:59 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4xO-0007Ro-9f
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lH4uh-0006Pk-HQ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:18:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lH4uf-0000Hz-BM
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:18:11 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122D9RXq123814
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 08:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FaNYNgJNUMl7u/eTLNXlkRF99SrBGSlJCSZbu+LA7+c=;
 b=kKNlXTR5TtV3Yc2v1qPsYM8+EmGVDkMlIqC+dW6GY8yerbjE8C7HpXzp1Gaeo3V5ULOC
 +L+R8w7JIObCzpEnyz6BLUnv0mhObSuzO/je0JejRG3Red3MVS9LQvjjD0cxm1eyweqZ
 KeQYsDLKiNKmUofqHc2Exmekti/I4wtRvUdAJ0KgkN5qzUx7bpYFzGBRsMyxoH8KIrjZ
 fHbSSCSRklP8GpE9J8XdAkMvsRlrXa0pnKz8OhfHg4zPGIlGkCpfkj+shKt3qqGE8+ld
 l/gCksJPKChKv4HFb+5/W7/A2+JFJbTBWeoRCuYk8IZEZy5j9ROPcO4KaalB942VB6uk hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371n8v1je6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:18:07 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122D9YkW124324
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 08:18:07 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371n8v1jdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 08:18:06 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122DGXgA021183;
 Tue, 2 Mar 2021 13:18:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3710sqj4ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 13:18:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122DI4Su26542560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 13:18:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D24BF6A04D;
 Tue,  2 Mar 2021 13:18:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A1C66A04F;
 Tue,  2 Mar 2021 13:18:04 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 13:18:04 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
Date: Tue, 2 Mar 2021 08:18:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD4T1nVIEdL7/IoG@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020107
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/2021 5:30 AM, Daniel P. Berrangé wrote:
> On Mon, Mar 01, 2021 at 03:39:42PM -0500, Daniele Buono wrote:
>> Hi Daniel,
>>
>> On 3/1/2021 10:08 AM, Daniel P. Berrangé wrote:
>>> What are the unique failure scenarios for CFI that these jobs are
>>> likely to expose ? Is it likely that we'll have cases where
>>> CFI succeeds in say, x86_64 target, but fails in aarch64 target ?
>> For CFI to fail (even if it shouldn't) you'll need code that is calling a
>> function pointer that was not well defined at compile time. Although
>> unlikely, that could happen everywhere in the code.
> What does "was not well defined" mean here ?
> 

At high level, the compiler creates metadata for every function. Before
jumping to a function pointer, it makes sure that the pointer and the
pointee have matching types.
Not well defined means one of these two cases:
1. The function has a different type than the pointer -> Most likely an
error
2. The function was not available at compile time so the compiler could
not create the related metadata -> Most likely a false positive.

Thanks,
Daniele

