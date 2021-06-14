Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668E3A6920
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:37:46 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnij-0001R8-66
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lsnhF-0008RW-H6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:36:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35402
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lsnhD-0000Qe-Ss
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:36:13 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EEYLag117176; Mon, 14 Jun 2021 10:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VML3KIWwI53llCVsUa/wg/SIq75eTV2SxIJQkm41fV4=;
 b=C/TaR41+B1xfZPxwvZZtfAe31gI1FBvbvbBfJLIi7HTPIFdoKfkiEgNO0W7V/moLs3U6
 qFKFCNIoQl4FPZujD2XLvCa6UQKmBrVXJpBtqKA/wtnV04bpbPdmTRAP6/tztEZZFdSO
 Y+BxWc+q+GZgx1mx7MbPDT76HmXe53RLbXPmZrtyMOigZopgWgc3sS/NLNzsFJP8pbQQ
 tCGiIKBB45khm1npt/pthDa0LCGRTwsgglCKAqkznlBYCNm5bwEcf+tvofms3hIg+lfd
 zq+SKwSnqANhAX+DBZsjlWvXjmgpck8lmzDNWGKN9GlZRhHoidqUCTS/gp7AJB33cvOc hw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39663kp82c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 10:36:05 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EEa3mE012449;
 Mon, 14 Jun 2021 14:36:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 394mj90hv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 14:36:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EEa1e332506220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 14:36:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37D5AA4057;
 Mon, 14 Jun 2021 14:36:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3CF7A404D;
 Mon, 14 Jun 2021 14:36:00 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.76.123])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 14:36:00 +0000 (GMT)
Subject: Re: [PULL 03/34] tcg: Re-order tcg_region_init vs tcg_prologue_init
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <20210611234144.653682-4-richard.henderson@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <8fccf36b-b766-1a32-9f23-724e494dc311@de.ibm.com>
Date: Mon, 14 Jun 2021 16:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611234144.653682-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ENDY8fyM-b7YrZ9zPYChRTk8tWqcCjKP
X-Proofpoint-ORIG-GUID: ENDY8fyM-b7YrZ9zPYChRTk8tWqcCjKP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_09:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140095
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.06.21 01:41, Richard Henderson wrote:
> Instead of delaying tcg_region_init until after tcg_prologue_init
> is complete, do tcg_region_init first and let tcg_prologue_init
> shrink the first region by the size of the generated prologue.
> 
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The patch ordering seems non-ideal. This patch alone results in the following error
on an s390 CI.
     Running test QAPI schema regression tests
     **
     ERROR:../tcg/tcg.c:970:tcg_register_thread: assertion failed: (!err)
     ERROR qtest-x86_64/bios-tables-test - Bail out! ERROR:../tcg/tcg.c:970:tcg_register_thread: assertion failed: (!err)
     Broken pipe
     make: *** [Makefile.mtest:96: run-test-10] Error 1
     make: *** Waiting for unfinished jobs....
     **
     ERROR:../tcg/tcg.c:970:tcg_register_thread: assertion failed: (!err)
     ERROR qtest-i386/bios-tables-test - Bail out! ERROR:../tcg/tcg.c:970:tcg_register_thread: assertion failed: (!err)
     Broken pipe
     make: *** [Makefile.mtest:80: run-test-8] Error 1

