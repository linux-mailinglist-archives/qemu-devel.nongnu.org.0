Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF83C6569
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:23:37 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33Op-0005fn-M5
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m33Nz-00042Y-2W; Mon, 12 Jul 2021 17:22:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29518
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m33Nx-00082G-8g; Mon, 12 Jul 2021 17:22:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CL40Gn128855; Mon, 12 Jul 2021 17:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7zi+9oIk7fpLJtPW1uGVz1/GNSWnK2mc64slVM8Rn+I=;
 b=Ze3uw1A1H6FOWNaHSBw6vJPs8O7ulVL3zQNGQ0WOcse1IOPn3FuA+5T5rpJWHDkN6Fbn
 8vKuxG9NnE/O9p8leoiEsgquYGifKVS57Q4nUzS+72eMZcdO9wOm5RvXWisLC64kUr2V
 rp1SPEC0q7YtMvPSq95Any7XKAYMQisH2pWJMlB5rdI0x6/eac/um3ZhBTlfyKPw2izk
 nsrPd7cbsaNFUA1qJRi+FxKxbKpvQju6QGRvuEzqf0xFphRn1FKmZSJ0YeTKjsViiwjV
 7AbKdLoRsLQwQyeUdkK8Fd+5GMzOfqoScPnE+nBC0wkCsxUXEpurezMnGwGxnQuec0YZ hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3bewy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:22:37 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CL47wM129274;
 Mon, 12 Jul 2021 17:22:37 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3bewxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:22:37 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CLDTXG032142;
 Mon, 12 Jul 2021 21:22:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 39q368ggkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 21:22:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CLMUgV26018232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 21:22:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1CE111C050;
 Mon, 12 Jul 2021 21:22:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7014B11C058;
 Mon, 12 Jul 2021 21:22:30 +0000 (GMT)
Received: from sig-9-145-173-31.de.ibm.com (unknown [9.145.173.31])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 21:22:30 +0000 (GMT)
Message-ID: <77fc7f4a9e90eff3fd7deaf3255a1e4ae1266808.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>, Laurent
 Vivier <laurent@vivier.eu>
Date: Mon, 12 Jul 2021 23:22:30 +0200
In-Reply-To: <f3f012abaaacfb68dea99547e4fae5c0@imap.linux.ibm.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <87a6n5j976.fsf@redhat.com>
 <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
 <f3f012abaaacfb68dea99547e4fae5c0@imap.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EjhsJH26LLWdbemYn8_o1oFLsYudZ7tH
X-Proofpoint-ORIG-GUID: 8Rc1oESz110DD7PY24qAs4oiWiwAVBxq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_11:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=849 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120146
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
Cc: David Hildenbrand <david@redhat.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-07-12 at 10:59 -0400, jonathan.albrecht wrote:
> On 2021-07-02 8:01 am, Laurent Vivier wrote:
> > Le 02/07/2021 à 12:34, Cornelia Huck a écrit :
> > > On Wed, Jun 23 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > > 
> > > 
> > > What's the status of this and
> > > <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>? 
> > > linux-user
> > > is not really my turf, but it would be sad if this fell through the
> > > cracks.
> > > 
> > 
> > If from the S390x point of view they are correct, I can collect them
> > via linux-user.
> > 
> 
> IIUC, the latest versions of these two series should be ready now:
> 
> https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
> https://lore.kernel.org/qemu-devel/20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com/
> 
> Can they still get into 6.1?
> 
> Thanks,
> 
> Jon

The test patch from my v6 series hasn't been reviewed yet:

https://lore.kernel.org/qemu-devel/20210705210434.45824-3-iii@linux.ibm.com/

Could anyone have a look, please?

Best regards,
Ilya


