Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE34AC63F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:45:06 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH78T-0006XD-Dl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:45:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH6AZ-0001a4-3T
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:43:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH6A8-0002xa-R3
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:42:58 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217DelDj024642; 
 Mon, 7 Feb 2022 15:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CHW5xLp469JImu8Jm+Pr7isTn5NPct/Q9nnPL7Tw0kE=;
 b=rqZ0TIJkTAUahVO2gchvCX9JKoKIR6lH9ZEzPbHZwc+AzllFFDzLlq2WeKex3quR7Q9g
 RBPabRfvRTJQD5xqS8JH8D8JMf3Z744tiS3mS40QcnFGgtI5b6fvkAtfjrXc15EmHriS
 5I1l0tz1eFvUdpkb8i3rknXnLscDPNEoi0X/HRbyUsRUuv3fq+Q7/3i+ZMlthU3FTFZS
 Ws3LseJM3zcirgqq2RAz7FFcuNUXncgA+QxFpbIaH2TJVnkDj4IP060CwYURpCLZnvfj
 G42+zrYe0D7sUJYOhzd69x8gp7tBtzcV7NTyoILqzUw2lhKQMQ7Qy/3hF5gqCh8wbmhy cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqqtd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:42:21 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217FUFYh020012;
 Mon, 7 Feb 2022 15:42:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqqtbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:42:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217FYOCB027046;
 Mon, 7 Feb 2022 15:42:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3e1gv95f2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:42:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FgGTC47841570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:42:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2362342042;
 Mon,  7 Feb 2022 15:42:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADAF74204D;
 Mon,  7 Feb 2022 15:42:15 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.169])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Feb 2022 15:42:15 +0000 (GMT)
Date: Mon, 7 Feb 2022 16:42:13 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Message-ID: <20220207164213.625206cf.pasic@linux.ibm.com>
In-Reply-To: <87v8xqvh1g.fsf@redhat.com>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <874k5ax07t.fsf@redhat.com>
 <20220207160516.2aead931.pasic@linux.ibm.com>
 <87v8xqvh1g.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RpwxzVW0GQwEI_LzMSZKZmSI0k39PMRK
X-Proofpoint-GUID: dgfflGegLWpViykxJl0Mg_D2sdPrxQ1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 07 Feb 2022 16:21:31 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Feb 07 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Mon, 07 Feb 2022 14:41:58 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:  
> 
> >> OTOH, the decision to make it mandatory is certainly sound, and covered
> >> by the spec. As the driver must be prepared for the device failing to
> >> accept FEATURES_OK, we can make it mandatory here -- we should just not
> >> say that it is considered mandatory from a spec standpoint. The spec
> >> allows to make it mandatory, and we make it mandatory in our
> >> implementation.  
> >
> > Right. Was never my intention to say that it is considered mandatory
> > by the spec. I guess the spec considers it less optional than the
> > run of the mill features.
> >
> > Should I change the first sentence to something like "Unlike most virtio
> > features ACCESS_PATFORM is considered mandatory by QEMU, i.e. the driver
> > must accept it if offered by the device."  
> 
> If you do s/PATFORM/PLATFORM/ :), yes. That's a much shorter way of
> expressing what I had been trying to argue in my reply :)
> 

Will do! I'm going to wait a little more before spinning a v1 to give
people a little more time to complain about the objective of this patch.

Regards,
Halil

