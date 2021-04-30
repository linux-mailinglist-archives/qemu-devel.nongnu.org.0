Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D735370201
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:21:40 +0200 (CEST)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZdq-0006PQ-Lm
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcZcF-0005mt-2I; Fri, 30 Apr 2021 16:19:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38396
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcZcD-0001ul-9W; Fri, 30 Apr 2021 16:19:58 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UK3Pth053728; Fri, 30 Apr 2021 16:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SO6FB44RvCjd24oifAwF8J2tngStVCxfCfQoK7qCvE8=;
 b=YgmG7NzXEk/aJU/3XGrZLkp0BnRk6O2M/JrQMn9dsl/ALCFM+iHlSTlai7WXVU9mf9hz
 YycPRBOfoL5cmSeFKja8QIi45KlYTzRz3JASNcHc8VIT6mERx+JSjVF8zScbcNzNrUlz
 eD4mOCA8lrSfrRrkJXwJS59MBFdFDTV6HFmMwRqe2/jCopU+MS5cY/mBcsqzmCldi3MD
 X1dSJ5axSETaTPWtvB0/uUCPFL/54deCg42NRDQQsqkaHHdr4gtfXvpuoPA3l2VN6AYu
 2E6vsufXXGkDnfNMYBNguqGXGgQTPBmJwaecHC1masibrkP0BgO9lRnGZ1w7Io9Nc3o8 tA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388rhn0ewj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:19:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UKHcjr008615;
 Fri, 30 Apr 2021 20:19:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3889kveqk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 20:19:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UKJi0d13894052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 20:19:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42744BE056;
 Fri, 30 Apr 2021 20:19:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867A6BE053;
 Fri, 30 Apr 2021 20:19:43 +0000 (GMT)
Received: from localhost (unknown [9.163.27.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Apr 2021 20:19:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Moved functions out of mmu-hash64
In-Reply-To: <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
Date: Fri, 30 Apr 2021 17:19:41 -0300
Message-ID: <87zgxf1q5e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DBvjEhDCrOEDoOBcp6rHxD69qOfvWauX
X-Proofpoint-ORIG-GUID: DBvjEhDCrOEDoOBcp6rHxD69qOfvWauX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_12:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300139
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:

> The functions ppc_store_lpcr, ppc_hash64_filter_pagesizes and
> ppc_hash64_unmap_hptes have been moved to mmu-misc.h since they are
> not needed in a !TCG context and mmu-hash64 should not be compiled
> in such situation.

What TCG code do the mmu-* files use? Could we move the TCG-only parts
out of them instead? It just occured to me that you cannot really
exclude mmu-hash64.c and mmu-radix64.c from the KVM build because they
are needed by GDB. At least I'm sure ppc64_v3_get_phys_page_debug is
needed and I suspect that function will end up pulling the whole file
in.

So we might need a different strategy for them.

