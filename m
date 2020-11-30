Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44312C8E58
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 20:47:04 +0100 (CET)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjp8Y-000429-SC
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 14:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kjp7l-0003bT-5N
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:46:13 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kjp7j-0004HI-3X
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:46:12 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AUJcseZ036576;
 Mon, 30 Nov 2020 19:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=uw/jU6UKfX6i/81BIgVJvwEsDVxL5smjEql3MOrWKHU=;
 b=SgP4MAhQ9SkC8lHeDUtVCa2vc2OkOj6vzj6rYSVLrZJPVpf4+hCuUKmc4mK86eOlqToH
 I8VgnzHy49EKQNazoaOxK0QXuhpKiSmtZswSlVMZfIE9qilj1BeVY9/R04PDYY2fyUdE
 3EnnOrxFfcmOUYN9thVZ6pgP4IVN5ZoIrT6DHOgza0M7YEcasjz45VE8HQSGmWJnX39n
 ifvpB0wrjI9gU+pdmIqhG02yTFzyn1KRTKTIghwP796VEwVaUsp58+atdrEZFspEl3fI
 M2camN+NZZAauVfWIqRkZZ2quup9HtncZxmCPLFM0QADbc4cz/SvFR1mBbWQo2SIATpe Hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 353c2aq4s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 19:46:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AUJk2pp163239;
 Mon, 30 Nov 2020 19:46:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 3540ewyxm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 19:46:05 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AUJk3w5014859;
 Mon, 30 Nov 2020 19:46:04 GMT
Received: from [192.168.0.108] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 30 Nov 2020 11:46:03 -0800
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
 <a5bb1550-6253-87eb-87a0-0532725d5d42@redhat.com>
 <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
 <20201127123356.7b1349d8@redhat.com>
 <3bad9b8e-6de1-37d4-8ac4-a8432885eb14@redhat.com>
 <8cc8c873-5057-29af-5c6e-ee43e5fa035c@oracle.com>
 <caf7b59e-88e2-4153-1590-7a39e13346f1@redhat.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <930a2917-866c-fb28-5bf6-7b74b6c76869@oracle.com>
Date: Mon, 30 Nov 2020 11:45:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <caf7b59e-88e2-4153-1590-7a39e13346f1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300127
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=ankur.a.arora@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-30 8:58 a.m., Laszlo Ersek wrote:
> On 11/28/20 00:48, Ankur Arora wrote:
> 
>> It is possible that there are CPUs with bits for both is_inserting and
>> is_removing. In that case QemuCpuhpCollectApicIds() would put them in the
>> PluggedApicIds array and the unplug eventually happens in the next
>> firmware invocation.
>>
>> If a CPU has both is_inserting and fw_remove set, the firmware processes
>> the
>> hotplug in that invocation and the unplug happens whenever the OSPM
>> triggers
>> the firmware next.
> 
> If these corner cases will actually work (I'm somewhat doubtful), that
> will be really great.

Heh, yeah. That's a big if. I'll see if I can hit it in my testing.

Thanks
Ankur

