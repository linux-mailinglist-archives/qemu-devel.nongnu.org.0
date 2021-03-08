Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E833194A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 22:21:14 +0100 (CET)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJNJQ-0004C2-MS
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 16:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lJNIH-0003c0-2F; Mon, 08 Mar 2021 16:20:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lJNIF-0005Z9-0p; Mon, 08 Mar 2021 16:20:00 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128L5SYe110051; Mon, 8 Mar 2021 16:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=lYYfRUqiSks4E8Js4g/jh8C8zYgVRPyBaftIAd/vGQE=;
 b=ESEfJSOm7jyjTbhaX5HuU4Y5PeF5XdgGzw4DprbpnuFpOhbj/drH3je//iY7iyreX7Ji
 Bpz4Yi1f6rb20M6sqVI41laU7vwCahYEBcFOYCVPDdnbJ5F1cqED5w8G2/nTj0wtozGN
 zQdz5y2+GlNqbj7CzhWYZK/RoDE+zYVkPr4SlQSgBmVCl0+UjqAN/yR5AEitmtlwG4Bv
 fLPQkziEyngA/ZbGZBSb9fIFyXpyjlD92B0ZOd40bIa0aEupneHCgR+3vbTtiMtWFfwu
 ClLR30r3wjm17u64fQwvAbzJx92hmdnIi80prrvbDOWiLW6FADGCEEd6aBZvk21QUqJr DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udprj1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 16:19:55 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128L5S4M110023;
 Mon, 8 Mar 2021 16:19:54 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udprj17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 16:19:54 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128LJPAv030528;
 Mon, 8 Mar 2021 21:19:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3741c8a5mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 21:19:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 128LJYOW24904026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 21:19:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C86AE053;
 Mon,  8 Mar 2021 21:19:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 408F3AE04D;
 Mon,  8 Mar 2021 21:19:48 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.56.228])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  8 Mar 2021 21:19:48 +0000 (GMT)
Date: Mon, 8 Mar 2021 22:19:46 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210308221946.4644ad4e.pasic@linux.ibm.com>
In-Reply-To: <20210305214603.GF3139005@habkost.net>
References: <20210302173544.3704179-1-pasic@linux.ibm.com>
 <20210305214603.GF3139005@habkost.net>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFy?= =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 16:46:03 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, Mar 02, 2021 at 06:35:44PM +0100, Halil Pasic wrote:
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
> 
> I don't understand what makes it necessary to make the
> type_register() call conditional.  Calling type_register() before
> the parent types are registered is perfectly valid.
> 

Registering a type that ain't going to become a complete type in time
is in my understanding invalid. Why? Because the unsuspecting
client code is about to trigger an abort when it attempts to use
the registered, thus advertised type. That is the state of the art
today. Of course we can morph that, adn make zombie TypeImpl's perfectly
valid.

> I don't think we should prevent type_register() from being
> called.  We just need to prevent type_initialize() from being
> called unless the type definition is complete.  

Yes, but for that we need to catch when type_initialize() is about to be
called, and preferably we should also know if we are dealing with a
modularized type, which is allowed to fail this way, or are we dealing
with a good old built in type, where trying to initialize an incomplete
type is still a result of a programming mistake.

So we would have to catch all the client code, which might be actually
manageable (contrary to my first intuition).

I did a little prototyping. I will post a patch on top of this
patch with the results.

I'm not confident about what I did in that prototype code since for
instance *object_class_by_name gets called about 80 places:
$ git grep -e object_class_by_name|wc -l
82

And to make things even harder to reason about type_initialize() can be 
called through following public interfaces:
object_class_by_name()
object_class_get_parent()
object_initialize()
object_class_foreach()
object_new_with_class()
object_new()
object_new_with_propv()
and here I stopped looking.

If we decide to sacrifice the assertions, and make incomplete types
first class citizens regardless their origin (registered form a module
or form core qemu), we would still have to take care of some 8
invocations of type_initialize(). (Sacrificing the assertions
may be a good idea if we have appropriate test coverage which
would complain about the functionality that we silently discarded.)

Another option to preserve the old behavior for the vast majority of
types would be to mark "special" TypeImpl's as 'have to be careful
before calling type_initialize()', but that doesn't sound very beutiful
either. 

I can try myself at any of these, but I don't mind if somebody who has
a better understanding of object.c takes over.

The reason why I choose to propose making virtio-gpu-ccw call
type_register() conditionally if built as a module, is because
it was easy to reason about the impact of that: it impacts
virtio-gpu-ccw and that is it. Yes, it smells like technical
debt.

> This way there
> won't be any tricky module loading order requirements.
> 

While I don't fully understand the situation when types are registered
from modules in an up and running qemu, I do see a significant
benefit in modules being able to register a type without having all
dependencies met with respect to loading order requirements. 

[..]
> I suggest splitting the QOM core changes and s390x-specific
> changes into separate patches, so they can be reviewed and
> included separately.

No problem, I can do that.

---------------------------8<------------------------------
From: Halil Pasic <pasic@linux.ibm.com>
Date: Mon, 8 Mar 2021 21:34:00 +0100
Subject: [PATCH 1/1] WIP: prevent type_initialize() with incomplete type

Eduardo suggested that instead of checking if the type is going to be a
complete one, before registering it form the virtio-gpu-ccw module we
should actually prevent a type_initialize() from being called unless
the type is complete.

Now if we do that for each and every type we may end up hiding bugs.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 hw/s390x/virtio-ccw-gpu.c |  5 -----
 qom/object.c              | 22 +++++++++++++++++++++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index ccdf6ac20f..c301e2586b 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -62,11 +62,6 @@ static const TypeInfo virtio_ccw_gpu = {
 
 static void virtio_ccw_gpu_register(void)
 {
-#ifdef CONFIG_MODULES
-    if (!type_ancestors_registered(&virtio_ccw_gpu)) {
-        return;
-    }
-#endif
     type_register_static(&virtio_ccw_gpu);
 }
 
diff --git a/qom/object.c b/qom/object.c
index 03bd9aa2ba..77c159f827 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1061,6 +1061,23 @@ const char *object_class_get_name(ObjectClass *klass)
     return klass->type->name;
 }
 
+static ObjectClass *__module_object_class_by_name(const char *typename)
+{
+    TypeImpl *type = type_get_by_name(typename);
+
+    if (!type) {
+        return NULL;
+    }
+
+    if (!__type_ancestors_registered(type)) {
+        return NULL;
+    }
+
+    type_initialize(type);
+
+    return type->class;
+}
+
 ObjectClass *object_class_by_name(const char *typename)
 {
     TypeImpl *type = type_get_by_name(typename);
@@ -1082,7 +1099,7 @@ ObjectClass *module_object_class_by_name(const char *typename)
 #ifdef CONFIG_MODULES
     if (!oc) {
         module_load_qom_one(typename);
-        oc = object_class_by_name(typename);
+        oc = __module_object_class_by_name(typename);
     }
 #endif
     return oc;
@@ -1116,6 +1133,9 @@ static void object_class_foreach_tramp(gpointer key, gpointer value,
     TypeImpl *type = value;
     ObjectClass *k;
 
+    if (!__type_ancestors_registered(type)) {
+        return;
+    }
     type_initialize(type);
     k = type->class;
 


