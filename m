Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C606D325876
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:16:57 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFO0G-0004OS-AT
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lFNyU-0003ok-T3; Thu, 25 Feb 2021 16:15:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lFNyS-0000zC-SR; Thu, 25 Feb 2021 16:15:06 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PL9Dlt163877; Thu, 25 Feb 2021 16:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ewOHdXtAsr25a2HYTQgRCFhyYt00GJ98euL0KC7Gi+c=;
 b=Ut9CXmC9qP3wtl7917e/xUUcHu6MfI6MVN4Nnav68zIB/0toF8R6GCmnD85dzmpxqlcg
 S6w3TEYKebB3n8oAZ89+8EScMEblXPtN6FuYR85cNnEailP2L1n1pRBZc5BhbHjWRbCj
 NoOOvXg0bIb9YkxVLQAOJKOOek8sJelJcB0hqliytHVEG7CvNK2erBV4SWJr+ZiNVc8b
 UB3PITi5iSS2x6EFGRreh7UZ0yfmuyquAsNZWZ+NQV2u+yxwqEXfdwLp5L9rw6kpq9do
 AnNTWAGHpAoyvQS9VHSGT4ndLKZjLg6CJW0NUIyVUbEnqmkMmePa+RtYHY2cnRdSOEZG Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xk6dgrkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:15:00 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11PL9MPe166759;
 Thu, 25 Feb 2021 16:15:00 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xk6dgrjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:14:59 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PL8Utf010902;
 Thu, 25 Feb 2021 21:14:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 36tt28agcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 21:14:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PLEsCQ2753160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 21:14:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A669CA4051;
 Thu, 25 Feb 2021 21:14:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAA5CA4040;
 Thu, 25 Feb 2021 21:14:53 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.33.39])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 25 Feb 2021 21:14:53 +0000 (GMT)
Date: Thu, 25 Feb 2021 22:14:51 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210225221451.5c20c42d.pasic@linux.ibm.com>
In-Reply-To: <20210224174634.58a1ecda.pasic@linux.ibm.com>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
 <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
 <20210224174634.58a1ecda.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_14:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102250161
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 17:46:34 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Wed, 24 Feb 2021 12:36:17 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
[..]
> >   
> > > -static TypeImpl *type_register_internal(const TypeInfo *info)
> > > +static TypeImpl *type_register_internal(const TypeInfo *info, bool mayfail)
> > >  {
> > >      TypeImpl *ti;
> > >      ti = type_new(info);    
> > 
> > Hmm, type_register_internal seems to not look at the new mayfail flag.
> > Patch looks incomplete ...  
> 
> It definitely is. I messed up my smoke test (used the wrong executable)
> so I did not notice.
> 

I'm pretty confident the whole approach with type_register_mayfail()
is not a good one, because of how the type-system in QEMU works. Let me
try to explain.

First the situation before/without modules. QEMU runtime type-system is
built in two non-overlapping phases. First all types are registered using
type_register() and co. which take a TypeInfo as an argument. At this stage,
the references to other types are name strings, and dependencies do not
matter. Types can be registered in an arbitrary order. The second phase
is a lazy and full instantiaton of the types which involves a call to
type_initialize(). This can be triggered at various point, but here we
need types we depend on registered.

In other words the problem is not that type_register() fails with an
abort. The abort comes much later. E.g. from qdev_get_device_class().

$ gdb -q -ex r --args ./qemu-system-x86_64 -device virtio-gpu-ccw
[..]
Type 'virtio-gpu-ccw' is missing its parent 'virtio-ccw-device'

Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
[..]
(gdb) bt -frame-info short-location -no-filters -frame-arguments none
#0  0x000003fffd34a9e6 in raise ()
#1  0x000003fffd32b848 in abort ()
#2  0x000002aa009133f2 in type_get_parent (type=..., type=..., mayfail=...)
#3  type_get_parent (mayfail=..., type=...)
#4  type_class_get_size (ti=...)
#5  type_initialize (ti=..., mayfail=...)
#6  0x000002aa00914b10 in object_class_by_name (typename=...)
#7  0x000002aa005ec7e0 in qdev_get_device_class (errp=..., driver=...)
#8  qdev_device_add (opts=..., errp=...)
#9  0x000002aa007f73ce in device_init_func (opaque=..., opts=..., errp=...)
#10 0x000002aa00aa084e in qemu_opts_foreach (list=..., func=..., opaque=..., errp=...)
#11 0x000002aa007fa538 in qemu_create_cli_devices ()
#12 qmp_x_exit_preconfig (errp=...)
#13 0x000002aa007fdb88 in qemu_init (argc=..., argv=..., envp=...)
#14 0x000002aa00416b72 in main (argc=..., argv=..., envp=...)
(gdb)

The only approaches I can think of to make type_register_mayfail()
"work" involve adding a dependency check in type_register_internal()
before the call to type_table_add() is made. This can "work" for modules,
because for types loaded from we can hope, that all dependencies are
already, as modules are loaded relatively late.  I have experimented,
with achieving this via type_initialize(ti, mayfail) because my
incomplete patch has done some work in that direction. It "works" but
it turned out *very ugly*. I can send it to you if you like, but I don't
think there is a point in burdening the list with it. A somewhat better
approach would be to introduce a dedicated function for
dependency-checking a TypeInfo. But the more I'm thinking about this, the
more I'm in favor of inventing the target specific modules (despite the
fact, that I'm not very confident about the doing part).

How do you think we should proceed?

Many thanks for your help up till now.

Regards,
Halil

