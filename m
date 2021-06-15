Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F463A79C1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:04:10 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4zR-00078s-HB
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lt4xl-0005ht-Lh; Tue, 15 Jun 2021 05:02:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lt4xZ-0004W1-EV; Tue, 15 Jun 2021 05:02:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F8j2Dt172009; Tue, 15 Jun 2021 05:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wfQiVLbBnbU1l/H+dgZ0GOVRxt1Go4fSqa3k6Fn36EQ=;
 b=n7i2HMuvIrtq19Qei0LcRbdh93eUWYXIgOLFnS9TgXZCNZ3LZ9uqv2kfadGuW7BeuW3k
 ipxhvRqoElP33OdskXx8xhBNgUf7zfLc4m9VBOxY3B43Sq/W1ZMI1L68ytx+9qfdmh/J
 Bz7wBnMTjw0Z2BSBA+bymW+lMOxuqCpDBBYzVaj8WTwxCKs6F//m+RYvMQjvtmJFZeLy
 toRui0iN8yrONF1wSjc0yaajbrrmBXPXRcXWfjdMlGsA3wsTHm51dEy9o4Gm4CII8bXe
 Nkbx2FgfoF+UGM8WOiKMuilvMBm3s57H28HBVbRCJzpn6gYHYRDTAnmnIbdeedxVCGsu MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396ryc8g7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:02:09 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F8jsdA174608;
 Tue, 15 Jun 2021 05:02:09 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396ryc8g6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:02:09 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F8wKQJ025389;
 Tue, 15 Jun 2021 09:02:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 395c3t8h5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 09:02:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F9252Y14221736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 09:02:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0491E52054;
 Tue, 15 Jun 2021 09:02:05 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.85.205])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9691E52051;
 Tue, 15 Jun 2021 09:02:04 +0000 (GMT)
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e49eb5cc-de35-5792-261e-83fdcecde04f@de.ibm.com>
Date: Tue, 15 Jun 2021 11:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n_FAh4HnenoUQlAcWkkshQLJnV14nw3w
X-Proofpoint-ORIG-GUID: FKKCh9iUJHzoanjqKk-dKmYTk4uxB8zC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106150051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.06.21 05:07, Richard Henderson wrote:
> The PSW_MASK_CC component of psw.mask was not handled properly
> in the creation or restoration of signal frames.
> 


Maybe add a Reported-by: jonathan.albrecht@linux.vnet.ibm.com
in the right patches?

  
> Richard Henderson (5):
>    target/s390x: Expose load_psw and get_psw_mask to cpu.h
>    target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
>    target/s390x: Improve s390_cpu_dump_state vs cc_op
>    target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
>    linux-user/s390x: Save and restore psw.mask properly
> 
>   target/s390x/cpu.h         |   3 ++
>   target/s390x/internal.h    |   5 --
>   linux-user/s390x/signal.c  |  37 ++++++++++++--
>   target/s390x/cc_helper.c   |   2 +-
>   target/s390x/excp_helper.c |  28 +++++-----
>   target/s390x/gdbstub.c     |  15 +-----
>   target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
>   target/s390x/sigp.c        |   3 +-
>   8 files changed, 110 insertions(+), 84 deletions(-)
> 

