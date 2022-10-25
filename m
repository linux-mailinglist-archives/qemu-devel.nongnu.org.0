Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D060D5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:49:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQq6-0003AJ-TS; Tue, 25 Oct 2022 16:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1onQph-00019Q-AT; Tue, 25 Oct 2022 16:47:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1onQpb-0008SX-4n; Tue, 25 Oct 2022 16:47:32 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PKHlYo032159;
 Tue, 25 Oct 2022 20:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=SbYSwcvqneH1GAGuKfRjasqOBg/+87J2CsyNRAY2GUo=;
 b=RtpsVIOH0f12g7USV4vEIDbnkEQhYam6IUmZ/iCykRimPP+CaWgZc0jeSozgPu9vHP0G
 O05S95hOfU8e91ydDm+Yl+2qz+nBCfHJYQwhoDh6V9OsxX/CWoHZuHuZsVQhDJpyOOEj
 6F+Di1tIRzKfrBWcOv+H53qU3wpd6Jk+6zMd0zect71la+SDJeSMi+oToYR8zq+p6ntS
 Gz637LLOvc2BI6pI8CBg/gsxmBz5AB0QJiQ7a+khF5TJMWSAHE0Dp7mOzPoRS7Za6t8S
 WiUEnldT1wlA+J6G4lKMRZcscAkF5DswSupOQrBb85T1aqRN/AEwldljpSxnsM5cYmF4 +A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee03cjnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:47:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PKZAqL029495;
 Tue, 25 Oct 2022 20:47:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3kc8594gj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:47:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29PKlJTd50659638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 20:47:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C6424C046;
 Tue, 25 Oct 2022 20:47:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 039404C040;
 Tue, 25 Oct 2022 20:47:19 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Oct 2022 20:47:18 +0000 (GMT)
Date: Tue, 25 Oct 2022 22:47:15 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 2/9] target/s390x: Use a single return for
 helper_divs64/u64
Message-ID: <20221025204715.gnp63hxykl2w5cfw@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-3-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jXRjWfn-0tVZ9NrP6faMNLaugA2fWXuF
X-Proofpoint-ORIG-GUID: jXRjWfn-0tVZ9NrP6faMNLaugA2fWXuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_13,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=430 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250115
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 05:29:59PM +1000, Richard Henderson wrote:
> Pack the quotient and remainder into a single Int128.
> Use the divu128 primitive to remove the cpu_abort on
> 32-bit hosts.
> 
> This is the first use of Int128 as a return value.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

