Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD83C5ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:08:43 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xY2-0003JV-Qp
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m2xPB-0006Xn-Tm; Mon, 12 Jul 2021 10:59:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m2xPA-0004Lw-0E; Mon, 12 Jul 2021 10:59:33 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CEwuSN026907; Mon, 12 Jul 2021 10:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jwP9++89WzXNjc2xOdFWXtZfQNn/FHMhv3w/T7drTiY=;
 b=AFtvM4P9S6Iqy93B+L3BHS1WHoQ++WfzA+h4p1ZWMrDeeyvV4J7ukmUXQYrswWCXFmRL
 +25F6vav/rwYgJHlsclvxMA5auQ/PYcUOSxdSzp7Z2iFj5L/6RFa4Zwo6UmFhzxvN8bE
 9FZ3gqhqD2Po6KF+Z7kocE5mWaAEg/iqf9B4m8phIuH5cdv45r6FNqGKp5QuHCkH20m1
 ZcOk9lhvcHSExKx9+aFhNWbt79cQbKP7wvBceHiJ0vs/tpz5aCsk/YNIDaOWRwrPs6xp
 ZaDmKugOSXdCqf+VEKScfkRAXogeFOPLaXDqEYPE7uYSHF9La3Twecun/ejyo3kpAR6w /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgkd43g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 10:59:27 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CEx4JW027781;
 Mon, 12 Jul 2021 10:59:27 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrgkd42n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 10:59:27 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CEvR8h015827;
 Mon, 12 Jul 2021 14:59:25 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 39q36aev59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 14:59:25 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CExOk335193288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 14:59:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173BB112071;
 Mon, 12 Jul 2021 14:59:24 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A295A112070;
 Mon, 12 Jul 2021 14:59:23 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 14:59:23 +0000 (GMT)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 12 Jul 2021 10:59:23 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
Organization: IBM
In-Reply-To: <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <87a6n5j976.fsf@redhat.com> <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
Message-ID: <f3f012abaaacfb68dea99547e4fae5c0@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vAk9fORi-zbcqZhhQuoujhsolH-2Gdw7
X-Proofpoint-GUID: PmQbBL05gJToQMTnFbUgkG7bJG65tLYZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=978 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120111
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-07-02 8:01 am, Laurent Vivier wrote:
> Le 02/07/2021 à 12:34, Cornelia Huck a écrit :
>> On Wed, Jun 23 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>> 
>> 
>> What's the status of this and
>> <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>? 
>> linux-user
>> is not really my turf, but it would be sad if this fell through the
>> cracks.
>> 
> 
> If from the S390x point of view they are correct, I can collect them
> via linux-user.
> 

IIUC, the latest versions of these two series should be ready now:

https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
https://lore.kernel.org/qemu-devel/20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com/

Can they still get into 6.1?

Thanks,

Jon

