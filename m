Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1FE32E7A4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:06:55 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9EM-0004Y3-0g
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lI9D0-00041N-MN; Fri, 05 Mar 2021 07:05:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lI9Cw-0007QJ-Dn; Fri, 05 Mar 2021 07:05:30 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125C4f7t001442; Fri, 5 Mar 2021 07:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=OPB+/egpQQEmnsZZBJwTPgKfoLiwVHG5dTv2vjNShR0=;
 b=PQqCVVsrmepAN2E2yRekiN0syNAzUQkK/LHdZaMt6cvqXnMUsVrpBer75Wp5fSA9rfCA
 eDO+QpPP0KjMve54n4F2Ze/+ms3vJyj6yP4cYdBgoOoq3YKXR7jMyaLPkmmVS6E/8CZE
 I8Iaar24hWPtSlbjANZv3ul0dPPwlun3QA6bqxFNoI2nOgGQkt7jAQJUfMupkTIFnL8q
 NxLRbhlCWJCT2R/q851pkf5NGLFDFtMZPhDo2WvzfkQ+iZ1+XCONQKYugF379zKappOW
 Cz/rxXYeOm1Mso2bzGK8PH/rCzQWJwVrjm8u7y13qMGDivYAjvF8g4Hz82CHZ/tMkCTC cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373fn9gnac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 07:05:23 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125C5MuC005090;
 Fri, 5 Mar 2021 07:05:22 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373fn9gn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 07:05:22 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125BqbAQ006734;
 Fri, 5 Mar 2021 12:05:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3713s9swnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:05:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125C5HWl18285002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 12:05:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FB6D4204F;
 Fri,  5 Mar 2021 12:05:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 169EA42049;
 Fri,  5 Mar 2021 12:05:16 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.32.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  5 Mar 2021 12:05:15 +0000 (GMT)
Date: Fri, 5 Mar 2021 13:05:14 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210305130514.18589602.pasic@linux.ibm.com>
In-Reply-To: <20210305125442.6c582681.cohuck@redhat.com>
References: <20210302173544.3704179-1-pasic@linux.ibm.com>
 <20210305125442.6c582681.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_08:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFy?= =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 12:54:42 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue,  2 Mar 2021 18:35:44 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> > module, which provides the type virtio-gpu-device, packaging the
> > hw-display-virtio-gpu module as a separate package that may or may not
> > be installed along with the qemu package leads to problems. Namely if
> > the hw-display-virtio-gpu is absent, qemu continues to advertise
> > virtio-gpu-ccw, but it aborts not only when one attempts using
> > virtio-gpu-ccw, but also when libvirtd's capability probing tries
> > to instantiate the type to introspect it.
> > 
> > Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> > is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> > was chosen because it is not a portable device. Because registering
> > virtio-gpu-ccw would make non-s390x emulator fail due to a missing
> > parent type, if built as a module, before registering it, we check
> > if the ancestor types are already registered.
> > 
> > With virtio-gpu-ccw built as a module, the correct way to package a
> > modularized qemu is to require that hw-display-virtio-gpu must be
> > installed whenever the module hw-s390x-virtio-gpu-ccw.
> > 
> > The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
> > suggestion of Thomas Huth. From interface design perspective, IMHO, not
> > a good thing as it belongs to the public interface of
> > css_register_io_adapters(). We did this because CONFIG_KVM requeires
> > NEED_CPU_H and Thomas, and other commenters did not like the
> > consequences of that.
> > 
> > Moving the interrupt related declarations to s390_flic.h was suggested
> > by Cornelia Huck.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > ---
> > 
> > As explained in [1] the previous idea of type_register_mayfail() does
> > not work. The next best thing is to check if all types we need are
> > already registered before registering virtio-gpu-ccw from the module. It
> > is reasonable to assume that when the module is loaded, the ancestors
> > are already registered (which is not the case if the device is a
> > built in one).
> > 
> > The alternatives to this approch I could identify are:
> > * A poor mans version of this which checks for the parent
> > * Emulator specific modules:
> >   * An emulator specific directory within the modules directory which
> >     is ignored by the other emulators.
> >   * A way to tell the shared util library the name of this directory,
> >     and the code to check it if set.
> >   * Build hw-s390x-virtio-gpu-ccw so it lands in this special directory
> >     in the build tree, and install it there as well.
> >   I've spend some time with looking into this, but I came to the
> >   conclusion that the two latter points look hairy.
> > 
> > [1] https://lore.kernel.org/qemu-devel/20210222125548.346166-1-pasic@linux.ibm.com/T/#maf0608df5479f87b23606f01f732740d2617b458
> > ---
> >  hw/s390x/meson.build         |  7 ++++-
> >  hw/s390x/virtio-ccw-gpu.c    |  5 ++++
> >  include/hw/s390x/css.h       |  7 -----
> >  include/hw/s390x/s390_flic.h |  3 +++
> >  include/qom/object.h         | 10 ++++++++
> >  qom/object.c                 | 50 ++++++++++++++++++++++++++++++++++++
> >  target/s390x/cpu.h           |  9 ++++---
> >  util/module.c                |  1 +
> >  8 files changed, 81 insertions(+), 11 deletions(-)  
> 
> The s390x part looks fine, but I'm not that well versed in the object
> and module stuff...
> 

Thanks Conny! Gerd was so kind to provide review from that perspective.
I'm hoping on his continued feedback :)

Have a nice weekend!


