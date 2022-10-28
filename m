Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE9610C62
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:41:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKuq-0004KX-Hs; Fri, 28 Oct 2022 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ooKuS-0004J6-75
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:40:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ooKuO-0000vM-7H
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:40:11 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S81sPx018547;
 Fri, 28 Oct 2022 08:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kXAN8EJHJgOmwm4n+eDsiNshqoAkO4y5hYQdi56gIfs=;
 b=h43BdBGXI9KMQSAKQIrT2vscc0AzxDAwiP8XVg0l3Hx5P9XdllI0p6x+VBsKgHtmEE/v
 h5HIjv6x5/as5npWPRK0vDOqqZrDk/fjSlTizb+vinlsPn+p2x4Y8SbwbtRsCu0sFm+G
 abWVC0Pr6QD8YqNUdR0ySjwaqpkzQ5lRrpgjLpJNYwhx1Km5xBIGRPlkGOPWPHKne0Rb
 2GlQA2s7TmS0UUEOsBtxgBX2M8g6/c3909fxyNE+p9+MPb17LtjPsZVRK3e79/PoAoci
 ajFUavND9vV1P8+Bg+ODyhEUw0/kKQfvwRce6Elxn2Ck7l3GzdBFcYe7VfybkUeNpIiT og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgb79sg59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 08:40:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29S84ooO029686;
 Fri, 28 Oct 2022 08:40:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgb79sg0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 08:40:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29S8aMba004347;
 Fri, 28 Oct 2022 08:40:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3kftf1scsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 08:40:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29S8dvEk34275938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 08:39:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE24C42041;
 Fri, 28 Oct 2022 08:39:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88AF74203F;
 Fri, 28 Oct 2022 08:39:57 +0000 (GMT)
Received: from [9.171.5.208] (unknown [9.171.5.208])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 08:39:57 +0000 (GMT)
Message-ID: <e9ef8994-672f-65c4-8b93-d163a8b90cae@linux.ibm.com>
Date: Fri, 28 Oct 2022 10:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/1] tcg: add perfmap and jitdump
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20221012051846.1432050-1-iii@linux.ibm.com>
 <20221012051846.1432050-2-iii@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221012051846.1432050-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hG6FUlkLLJ_tbsrRVML8Rk_8T2jayvLt
X-Proofpoint-ORIG-GUID: LXbIOHltidS5E55qwsgm_IsU3Uf_P_2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_04,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280054
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.10.22 um 07:18 schrieb Ilya Leoshkevich:
> Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
> The first one allows the perf tool to map samples to each individual
> translation block. The second one adds the ability to resolve symbol
> names, line numbers and inspect JITed code.
> 
> Example of use:
> 
>      perf record qemu-x86_64 -perfmap ./a.out
>      perf report
> 
> or
> 
>      perf record -k 1 qemu-x86_64 -jitdump ./a.out
>      perf inject -j -i perf.data -o perf.data.jitted
>      perf report -i perf.data.jitted
> 
> Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Co-developed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

I think this would be awesome to have. I know our performance people do use this for Java a lot.

