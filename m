Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BE38C538
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:47:01 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2gG-0001Fy-LC
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk2ex-00008p-EX; Fri, 21 May 2021 06:45:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45186
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk2ev-00070b-MZ; Fri, 21 May 2021 06:45:39 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LAYW6Y140826; Fri, 21 May 2021 06:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V3wBYVUKmDu0QFblaY3t0LcY3HqMSOtN0cL8D+MsUhQ=;
 b=UC1GxzcMLK06hFLl0uvLUHjj0/KwDoTU4Z37Y+nrUrmPWBYn8H3EkwvDd5UKQF11+B3Q
 0wD1CsAjd0UbomB7u7BYSafAjM/GnojmhBY2uKLqXiMr7qJR5Yfp+FSetmzzKuAihiQz
 HSzq9Lsl48GKmORGYHmi7uhnNlNkKTP0ZqQ6TsGAzyLLvvIBQiM8smzqwlt1PFCZVRHn
 aUn+nOzEZqZfHO/p+faLoo0gDzysAchRjIcIG4/sv/AE+7i5BGt9KAZbRp9miWcHeM6y
 qXV2AnbS9nv8A3P8MzXZjnhubHdscEeEdwDH8Zz7UcXNfUDCmlleZosGkIY6o46Eghvz jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa2ka9ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:45:36 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LAaVE6150267;
 Fri, 21 May 2021 06:45:35 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa2ka9pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:45:35 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LAhrjC027058;
 Fri, 21 May 2021 10:45:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgu327-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 10:45:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14LAj23J30015798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 10:45:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A47C11C054;
 Fri, 21 May 2021 10:45:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A739911C05B;
 Fri, 21 May 2021 10:45:30 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 10:45:30 +0000 (GMT)
Message-ID: <1e96b30913e36c289c9a8fd9a3d2564aea8e56da.camel@linux.ibm.com>
Subject: Re: [PATCH 0/2] Fix SIGILL psw.addr reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Date: Fri, 21 May 2021 12:45:30 +0200
In-Reply-To: <e2eb83ba-6937-741c-ea67-1bbd2346f9d5@redhat.com>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
 <e2eb83ba-6937-741c-ea67-1bbd2346f9d5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OZr3x-lLhamkcTzNCKRNOyg6ib3pW1Gr
X-Proofpoint-ORIG-GUID: ClnlvI-vanMKuvfZmEP30ztvxzKLL6yk
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=850 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210065
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-05-21 at 09:42 +0200, David Hildenbrand wrote:
> On 21.05.21 05:01, Ilya Leoshkevich wrote:
> > qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr:
> > it
> > should be a pointer to the instruction following the illegal
> > instruction, but at the moment it is a pointer to the illegal
> > instruction itself. This breaks OpenJDK, which relies on this
> > value.
> > 
> > Patch 1 fixes the issue, patch 2 adds a test.
> 
> I assume that should fix
> 
> https://bugs.launchpad.net/qemu/+bug/1920913
> 
> right?

Yes, I have this Buglink in the fix commit message.
I have to admit I did not test Java more extensively - there might be
more things going on - but at least with this the SIGILL on startup is
gone, and very simple programs work.


