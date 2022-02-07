Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA94AC468
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:54:15 +0100 (CET)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6LF-0003W8-BX
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH5bD-0004l1-Th
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:06:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH5aS-0004zR-4E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:05:56 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217EhnCG026217; 
 Mon, 7 Feb 2022 15:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=AGdybD3GyaJSQsPoJC0rA/fcd1xmJZR4GnBbNKQacL4=;
 b=ClnrV8KXSzxyFXlqF/zOMQ+AnvdVxxWfEUTS9vj3HJuIb0rcWDj/+aZJiRp+j1TIDtJh
 prukjNpKZ8P51rT+MBlTbh0Vj5aZ5Veosv5CUCPIzZVmekHNaFdmD11HQsglTpNk8RuP
 E3LCLTYm0mxIwg4Cgj/omaFrJexrcwwmEUIACt75sdTG4/0+yP0sdXdDUUVlI0IlHZRy
 N3C8h1q4S09igDg3uVbjTF/qHKbE4nsmO32OFzb8tLSujCrh83Ye5IgiEiJnCYWL18oS
 zsGxBHXapOByyjcMXNVMpC5AVvqzewugdOM88erxdlXVSBixeRhl1Ee4RciOxnebT2h+ rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st6ukq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:05:24 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217EjJF5031119;
 Mon, 7 Feb 2022 15:05:24 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st6uhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:05:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217F2Stx019647;
 Mon, 7 Feb 2022 15:05:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e1gv95yxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:05:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 217F5JqX47317270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:05:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6757A11C06E;
 Mon,  7 Feb 2022 15:05:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB6911C04A;
 Mon,  7 Feb 2022 15:05:18 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.169])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Feb 2022 15:05:18 +0000 (GMT)
Date: Mon, 7 Feb 2022 16:05:16 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Message-ID: <20220207160516.2aead931.pasic@linux.ibm.com>
In-Reply-To: <874k5ax07t.fsf@redhat.com>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <874k5ax07t.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7ZDWdlmIOfOBreYiCuc5b0z9zrhdeftW
X-Proofpoint-ORIG-GUID: DuPNFkKaOvWrGmY-W2nBjijFm739Rz2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 07 Feb 2022 14:41:58 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Feb 07 2022, Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
> > On 2/3/22 13:45, Halil Pasic wrote:  
> >> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.  
> 
> s/ACCESS_PATFORM/ACCESS_PLATFORM/

Will fix.

> 
> >> the driver must accept it if offered by the device. The virtio
> >> specification says that the driver SHOULD accept the ACCESS_PLATFORM
> >> feature if offered, and that the device MAY fail to operate if
> >> ACCESS_PLATFORM was offered but not negotiated.
> >> 
> >> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> >> the device when the driver fences ACCESS_PLATFORM. With commit  
> >
> >
> > I believe a link to the virtio specification where this is being mentioned would
> > be good to have in the commit message.  
> 
> It's in section 6.1 "Driver Requirements: Reserved Feature Bits": "A
> driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered" and
> section 6.2 "Device Requirements: Reserved Feature Bits": "A device MAY
> fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not accepted."
> 
> That said, I'm not sure the wording in the spec translates to
> "mandatory"... if the driver fails to accept the bit, the device can
> choose to not work with the driver, but it's not forced to.

I didn't mean to claim that the spec makes this feature "mandatory", and
this is why I paraphrased the spec. IMHO it is QEMU that considers it
mandatory.

> There are
> other instances where the device may reject FEATURES_OK (e.g. when the
> driver does not accept a feature that is a pre-req for another feature),
> I'd say it is up to the device whether something is mandatory or not. If
> the device/setup cannot work without it, it certainly is mandatory, but
> the driver only knows when FEATURES_OK is rejected without the feature.

Right but for the guys that write the drivers it is of interest to know
what level of interoperability can  one can keep if certain
	features are
not implemented. Usually it is safe to fence delay implementing
features, as long as the support for the features is implemented in the
order mandated by the spec.

> 
> OTOH, the decision to make it mandatory is certainly sound, and covered
> by the spec. As the driver must be prepared for the device failing to
> accept FEATURES_OK, we can make it mandatory here -- we should just not
> say that it is considered mandatory from a spec standpoint. The spec
> allows to make it mandatory, and we make it mandatory in our
> implementation.

Right. Was never my intention to say that it is considered mandatory
by the spec. I guess the spec considers it less optional than the
run of the mill features.

Should I change the first sentence to something like "Unlike most virtio
features ACCESS_PATFORM is considered mandatory by QEMU, i.e. the driver
must accept it if offered by the device."

[..]

Regards,
Halil

