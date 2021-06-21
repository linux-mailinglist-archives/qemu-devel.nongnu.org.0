Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83A3AE8BA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:05:53 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIga-0003vU-59
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvIc6-00086y-MO; Mon, 21 Jun 2021 08:01:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvIc4-00012y-JY; Mon, 21 Jun 2021 08:01:14 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LBXqB2096502; Mon, 21 Jun 2021 08:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aLUZY47o1qqfk/DWOWLqEra5yg3XJ1m2IdfXs9bwg9c=;
 b=WZEjPxruT9t2XI+n8mwvw4Ibpk1dJ4gCUfkIqqNIjHwAVUrU6v9v4bX5CPUfUpfJVKAE
 FG6KQENl/6E574Yzxz/lnlaEBLKxgWVkHtnHT9DZb4amyuCipac//0b+8Kiox75ddkBR
 waGpm7M8dEMEpQTFsD/zycNmsWve8AynjWQu8UPiyQFjO529a0K+Lp9uULUjoMQKeJh3
 yJctsoOvhXzYKrprWX97rFOMTQMA3nlmVIC0eFnKkhgY759fxZkNKGQodkgLIiJw0cmO
 Sdr/RsitWaO5RH3z0QoD4cIZvAT6zFSa5uv07AbN5mGVHORTlpZbxa9GQaYNzISstVcR Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39asqj1ejv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 08:01:08 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LBYLeh099126;
 Mon, 21 Jun 2021 08:01:08 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39asqj1ef5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 08:01:08 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LBvbQN003860;
 Mon, 21 Jun 2021 12:01:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3998788ftj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 12:01:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LC0x1H33882532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 12:01:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11BBA4062;
 Mon, 21 Jun 2021 12:00:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 799CFA405C;
 Mon, 21 Jun 2021 12:00:59 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 12:00:59 +0000 (GMT)
Message-ID: <095e6342f7f93b6d157f5a3cb99980a96990c290.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Date: Mon, 21 Jun 2021 14:00:59 +0200
In-Reply-To: <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3oYGcnzXp4QfzoUoBwbYZO9TDb8tJ7Jf
X-Proofpoint-GUID: pJ5I4Sj9sC72vrQ_CTdL8fGyhMkTmnDB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_05:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-06-10 at 11:49 +0200, David Hildenbrand wrote:
> On 02.06.21 02:22, Ilya Leoshkevich wrote:
> > qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr:
> > it
> > should be a pointer to the instruction following the illegal
> > instruction, but at the moment it is a pointer to the illegal
> > instruction itself. This breaks OpenJDK, which relies on this
> > value.
> > 
> > Patch 1 fixes the issue, patch 2 adds a test.
> > 
> > v1:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> > v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
> >            magic in the test and add an explanation (David).
> > 
> > v2:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
> > v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind
> > under
> >            qemu-user).
> > 
> 
> There might still be something wrong:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/319
> 
> At least it smells like some more signal (mis)handling.
> 
> 

I've taken another look, and it must be compare-and-trap SIGFPE/SIGILL
mixup. I think I will just fix it here in v4.

Best regards,
Ilya


