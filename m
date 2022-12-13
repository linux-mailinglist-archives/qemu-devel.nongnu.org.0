Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16D64BAE5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58wc-0005VR-Aq; Tue, 13 Dec 2022 12:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p58wZ-0005P0-Eu
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:19:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p58wX-0003iD-IR
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:19:51 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDHDjSR023329; Tue, 13 Dec 2022 17:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=0AHYBf4+Vfkbwodv88JoZWuSAMDwLNBXXy1Wry8nv+Q=;
 b=M/DreEQtPORQWt1BLIKfjg88ammFJZ6HXVxuQRmEHmDovkAACpMhxoRv8IxZICU+HT+A
 4f5DYZOwbBAED7g2oGlpK9sLBLMNRVU7eqO3gXAtrksJiV3RzUWewRh/8QY5vwPrXd/D
 YKcowRV6TuR9wpd/gyDA/SPmzDRwpepU/0I05fryGcho8ptuodc5HKJwqXPbJC1yFfou
 /3SElQb94gUigXhp81e5l0YJZAzKLNEoxTMZFDk21srb2NOwETnyffEpNB6wlfL0XCrw
 PpB5r7NQMG0rd7cRIeVDZdyutniUUDQP+vTYf+F02a7SBs7ZDh9t0G8hVmxpVHmD+2aS ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mewkyr5qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:19:47 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BDHICZJ015905;
 Tue, 13 Dec 2022 17:19:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mewkyr5q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:19:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDH62qR007839;
 Tue, 13 Dec 2022 17:19:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mchcf4h0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:19:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDHJhIA47448378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 17:19:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 285CB20049;
 Tue, 13 Dec 2022 17:19:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF86C20043;
 Tue, 13 Dec 2022 17:19:42 +0000 (GMT)
Received: from heavy (unknown [9.179.23.216])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Dec 2022 17:19:42 +0000 (GMT)
Date: Tue, 13 Dec 2022 18:19:41 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Vitaly Buka <vitalybuka@google.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Message-ID: <20221213171941.k45gejmxks6cu4xb@heavy>
References: <Y5iwTaydU7i66K/i@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5iwTaydU7i66K/i@p100>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-cW3VrUH-XqC2BQEn6h2LBgzou9zVlM
X-Proofpoint-ORIG-GUID: aqIk6BjD9AwBt3aT9joynfXHPIfr84-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=770 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130151
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Dec 13, 2022 at 06:03:09PM +0100, Helge Deller wrote:
> Both parameters have a different value on the parisc platform, so first
> translate the target value into a host value for usage in the native
> madvise() syscall.
> 
> Those parameters are often used by security sensitive applications (e.g.
> tor browser, boringssl, ...) which expect the call to return a proper
> return code on failure, so return -EINVAL if qemu fails to forward the
> syscall to the host OS.
> 
> While touching this code, enhance the comments about MADV_DONTNEED.
> 
> Tested with testcase of tor browser when running hppa-linux guest on
> x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> v2: based on feedback from Ilya Leoshkevich <iii@linux.ibm.com>
> - rename can_passthrough_madv_dontneed() to can_passthrough_madvise()
> - rephrase the comment about MADV_DONTNEED

Thanks!

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

