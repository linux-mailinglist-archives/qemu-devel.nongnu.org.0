Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFED3FBD89
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 22:44:03 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKo8K-0001X0-VW
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 16:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mKo6n-0000ml-By; Mon, 30 Aug 2021 16:42:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mKo6l-0006cS-Cw; Mon, 30 Aug 2021 16:42:21 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UKZEQ9119911; Mon, 30 Aug 2021 16:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5T4IcvUMo6krt9eJAR6gsnnYEzne+oHN4gTwfz5Uaok=;
 b=BIIbHiyC2CqkVN7dj9sfS10/qrfHUVUUVGX7RXR5ObobUCp6HYQugZQ//FJMy6aMEUoo
 bIMTgGwIzTBm/Qj5i4tE0Sz4FhnxykQ0srUVEyOewx6CcjCedFp8Kxg5FWOajjxLuOCl
 C7zk+Ffp+d4RWWDphxISaaacZAlAwJ3j9I3OK6NN5OV71Fh0k4ccl9NW4KKVOYqB+JkN
 yHakFIwAFRXXrAh4+kox5tnJycfZD6p5/DBgKnt3rUN7E1E876/fgGhxy0fYCV8TTSEC
 LwnKihSwKmhuIpHHd6f+AiSe+extJGaowYbpLX8XU06Z8d4zOYFybqLcGW6ia3nJjlQi iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3as6fu868g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 16:42:14 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17UKZfuW122706;
 Mon, 30 Aug 2021 16:42:14 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3as6fu867d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 16:42:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UKcsk4020663;
 Mon, 30 Aug 2021 20:42:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3aqcs8f2hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 20:42:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UKg8r454788554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 20:42:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42109A4040;
 Mon, 30 Aug 2021 20:42:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11546A4051;
 Mon, 30 Aug 2021 20:42:07 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.76.20])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 30 Aug 2021 20:42:06 +0000 (GMT)
Date: Mon, 30 Aug 2021 22:42:04 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 0/2] s390x: ccw: A simple test device for virtio CCW
Message-ID: <20210830224204.49a7965a.pasic@linux.ibm.com>
In-Reply-To: <fe2c0cbd-24a6-0785-6a64-22c6b6c01e6d@de.ibm.com>
References: <1630061450-18744-1-git-send-email-pmorel@linux.ibm.com>
 <fe2c0cbd-24a6-0785-6a64-22c6b6c01e6d@de.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yQIQWXsqticGPoxq_G2goUHaURo4o6UZ
X-Proofpoint-GUID: bEM8T2DTlB3AZYRQ4IHYYD3JRKgky6Cn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_06:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, david@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 Michael S Tsirkin <mst@redhat.com>, richard.henderson@linaro.org,
 drjones@redhat.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 11:51:51 +0200
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 27.08.21 12:50, Pierre Morel wrote:
> > Hello All,
> > 
> > 
> > This series presents a VIRTIO test device which receives data on its
> > input channel and sends back a simple checksum for the data it received
> > on its output channel.
> >   
> > The goal is to allow a simple VIRTIO device driver to check the VIRTIO
> > initialization and various data transfer.

Can you please elaborate a little on the objectives.

> > 
> > For this I introduced a new device ID for the device and having no
> > Linux driver but a kvm-unit-test driver, I have the following
> > questions:  
> 
> I think we should reserve an ID in the official virtio spec then for such a device?
> Maybe also add mst for such things.

I agree having ID reserved is a good idea. But then if we are going to
introduce an official test device, I believe we should write a
specification for it as well. Yes having the guarantee that test devices
and real devices won't mix is a value in itself, but if we had a
standardized test device, whoever does work with it would not have to
ask themselves is this test device compatible with this test device
driver.

>   
> 
> > Is there another way to advertise new VIRTIO IDs but Linux?
> > If this QEMU test meet interest, should I write a Linux test program?
> > 

You may not simply claim and advertise a VIRTIO ID. The virtio ids
are allocated by the virtio standardisation body, and the list of the
IDs reserved in the v1.1-cs01 incarnation of the spec can be found here:
https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-1930005

For how to contribute to the virtio specification please take look at
this:
https://github.com/oasis-tcs/virtio-admin/blob/master/README.md

> > Regards,
> > Pierre
> > 
> > 
> > Pierre Morel (2):
> >    virtio: Linux: Update of virtio_ids
> >    s390x: ccw: A simple test device for virtio CCW
> > 
> >   hw/s390x/meson.build                        |   1 +
> >   hw/s390x/virtio-ccw-pong.c                  |  66 ++++++++
> >   hw/s390x/virtio-ccw.h                       |  13 ++
> >   hw/virtio/Kconfig                           |   5 +
> >   hw/virtio/meson.build                       |   1 +
> >   hw/virtio/virtio-pong.c                     | 161 ++++++++++++++++++++
> >   include/hw/virtio/virtio-pong.h             |  34 +++++
> >   include/standard-headers/linux/virtio_ids.h |   1 +
> >   8 files changed, 282 insertions(+)
> >   create mode 100644 hw/s390x/virtio-ccw-pong.c
> >   create mode 100644 hw/virtio/virtio-pong.c
> >   create mode 100644 include/hw/virtio/virtio-pong.h
> >   


