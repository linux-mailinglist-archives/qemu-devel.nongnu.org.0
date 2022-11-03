Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAB617E50
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaYV-0001ez-CU; Thu, 03 Nov 2022 09:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqaYF-0001Lz-0m; Thu, 03 Nov 2022 09:46:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqaYD-0002v9-KK; Thu, 03 Nov 2022 09:46:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3DBlv6005045;
 Thu, 3 Nov 2022 13:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dCqkPlOX9jVAECDxN78wOi3cwZMrBEYU8vEa/pj/5VM=;
 b=PDf7uNtqIMUiUxFh+csS9L52lTakJ1QI4lMZPtGWfNU6U687QRcj4kuEDwSztYdzarEB
 UcgxFWkLPMCEvDOoOrahWbFUGJJQUt79Sbt3n7zxFi2PCvLmMIn/sI6p74UQgUf6MQv+
 E+4OrXZfg5RQ/KNUXpZ1/SN9Quy1/dB6TXcq1J8srQv3L5Ro86U44rDWb6az46hicqsk
 zah1ml28FtcVcgXYtq0QaR33on+gF+5FzYT+pr1RsMbarSVFWzskGcAfH/p4rZJOg72n
 ZVO+IlEBbGmcYv19SCvS4JSOtSnSCR83+ZxbRHrjEYS8R+CpVpDF87QL3M8/C1L4OYIH EA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmayvfkm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:46:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3DZjZJ015927;
 Thu, 3 Nov 2022 13:46:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3kgut8pmaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:46:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A3DesrM48890194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 13:40:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C115204F;
 Thu,  3 Nov 2022 13:46:26 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id F24355204E;
 Thu,  3 Nov 2022 13:46:25 +0000 (GMT)
Date: Thu, 3 Nov 2022 14:46:24 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 14/26] target/s390x: Don't set gbea for user-only
Message-ID: <20221103134624.l3n7laebrk6v2x4r@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-15-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-15-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C3QXxXMQv8-aAcyqZVY0_jSDnPPjPsL7
X-Proofpoint-GUID: C3QXxXMQv8-aAcyqZVY0_jSDnPPjPsL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 mlxlogscore=674 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Wed, Oct 05, 2022 at 08:44:09PM -0700, Richard Henderson wrote:
> The rest of the per_* functions have this ifdef;
> this one seemed to be missing.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

