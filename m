Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374B4DDFB2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:15:55 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGCg-0000cq-FU
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:15:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVGAa-00086Z-9q
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVGAX-0007Ej-Nn
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647623620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkBRYSr0+epw2U5Se9UbL/6++DmjeMercZlVYeqyLMU=;
 b=RZ1ElV+Loljou/LIs8rn5Qmwx3k0cRkE4WKOUT1CNtZa22ZuNyeZ/0+5FZOfGQiPGzxmz5
 TvVjHeccy2FBbD37vETkpfyAvC6e5YlKCGhHaiGDMDap2/ZebKrnoxFQ0EHpOEPoi0hxY+
 dtrWcMX6j9IiPEIEapFk9ErKO+Z31Dg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-9Wtuf71uOBeW6Trhd9VbJw-1; Fri, 18 Mar 2022 13:13:39 -0400
X-MC-Unique: 9Wtuf71uOBeW6Trhd9VbJw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u13-20020a50a40d000000b00419028f7f96so2383068edb.21
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YkBRYSr0+epw2U5Se9UbL/6++DmjeMercZlVYeqyLMU=;
 b=4pdBRHMfqP/93hJ2YEBzc6/Fw9wGp24oEq1CznM1JVZvAPOX+ln+Pm8yXJPHn49rOy
 LhpqQh7N4Mbrr2cc8OiZQYxIo/NnPvZRw8pTX+vKHwGDZuP0quKiqCq6GE50OJ2xhsbC
 0eQh9fKEUPuvYPVnyV3IpPiUkpVtwSEgrLjyV89SzsuR0FGvB/Bv4NQ2tXla8nLg2o6b
 52V1RYFLWNGTfe9lM6B0tOUfTW27McyyBNrq7W5grY3KyvRflKPjmMkrGu9MaClpxf7G
 9ImVZwg1qxnSSi66Rv1HeC8niE/4WeSH4bQsGgQh/KY98Pc4PIw2nF5iehSBr8P5s92U
 3+HQ==
X-Gm-Message-State: AOAM5306b/q0J8axfqfmjWL92Z5fFTM+7sq7k9yiiIw2+MFL2L2GRg1f
 uxS4u6ZdUcUeg+l49h/y/qW2y339VFO1yQe3jz8Mcl07unPltwsSPNUwG8KOqyoILUYsfdmyKuG
 xrumgMDoctPPCDp8=
X-Received: by 2002:a17:907:3e12:b0:6da:f8d9:efeb with SMTP id
 hp18-20020a1709073e1200b006daf8d9efebmr9839721ejc.634.1647623618299; 
 Fri, 18 Mar 2022 10:13:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHlsnIh8kIIPvU1udQyPw1Cl+r4GgfJPLD59nsjI3BamK/QPq9Q17p6SxkoaOoxTknjKaNhA==
X-Received: by 2002:a17:907:3e12:b0:6da:f8d9:efeb with SMTP id
 hp18-20020a1709073e1200b006daf8d9efebmr9839697ejc.634.1647623618015; 
 Fri, 18 Mar 2022 10:13:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a1709062a0700b006bc28a6b8f1sm3892512eje.222.2022.03.18.10.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:13:36 -0700 (PDT)
Date: Fri, 18 Mar 2022 18:13:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU device refcounting when device creates a container MR
Message-ID: <20220318181335.018cdf17@redhat.com>
In-Reply-To: <CAFEAcA_-VhULZ5v4VeA-NYgSgCdk3HgvfQQg8UzCbCvEY4433g@mail.gmail.com>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
 <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
 <20220310163610.7f782922@redhat.com>
 <CAFEAcA8Nvr-7QYHv2-K+zN37i=ZXa8_Skb53PaTJzSdhXaBq3g@mail.gmail.com>
 <20220310173053.5eb97f20@redhat.com>
 <CAFEAcA_-VhULZ5v4VeA-NYgSgCdk3HgvfQQg8UzCbCvEY4433g@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 17:11:14 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 10 Mar 2022 at 16:30, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > Do On Thu, 10 Mar 2022 16:05:24 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  
> > > On Thu, 10 Mar 2022 at 15:36, Igor Mammedov <imammedo@redhat.com> wrote:  
> > > >
> > > > On Wed, 9 Mar 2022 16:56:21 +0000
> > > > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > > > ...also, in the device-introspect-test where I see this problem,
> > > > > unrealize is never going to be called anyway, because the device
> > > > > is only put through "instance_init" and then dereffed (which
> > > > > does not result in instance_finalize being called, because the
> > > > > refcount is still non-zero).  
> > > >
> > > > question is why introspected device is deferred instead of being
> > > > destroyed if it's no longer needed?  
> > >
> > > ...because the reference count is not zero.
> > >
> > > What is supposed to happen is:
> > >  * device is created (inited), and has refcount of 1
> > >  * introspection code does its thing
> > >  * introspection code derefs the device, and it gets deinited
> > >
> > > This bug means that when the device is inited it has a refcount
> > > that is too high, and so despite the code that creates it
> > > correctly dereffing it, it's still lying around.  
> >
> > looks like ref count leak somewhere, instance_finalize() take care
> > of cleaning up instance_init() actions.  
> 
> If you read the rest of the thread, we know why the refcount
> is too high. And instance_finalize *is never called*, so it
> cannot clean up what instance_init has done.
> 
> > Do you have an example/reproducer?  
> 
> Yes, see the thread -- device-introspect-test shows it.
> (You can put printfs in ehci_sysbus_init and ehci_sysbus_finalize
> and see that for some devices we don't ever call finalize.)

something like following might work.

basic idea is avoid cyclic references when subregion and container
have the same owner.
And properly handle references of subregion itsef when it's added to container,
this is necessary to prevent subregion being freed (when it's removed as a child property)
since container might still exist and 'referencing' subregion.
So that later when container is finalized it would call del_region()
on still alive subregion.


diff --git a/softmmu/memory.c b/softmmu/memory.c
index 8060c6de78..499c20fcef 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2527,8 +2527,11 @@ static void memory_region_update_container_subregions(MemoryRegion *subregion)
     MemoryRegion *other;
 
     memory_region_transaction_begin();
+    object_ref(subregion);
 
-    memory_region_ref(subregion);
+    if (subregion->container->owner != subregion->owner) {
+        memory_region_ref(subregion);
+    }
     QTAILQ_FOREACH(other, &mr->subregions, subregions_link) {
         if (subregion->priority >= other->priority) {
             QTAILQ_INSERT_BEFORE(other, subregion, subregions_link);
@@ -2580,14 +2583,17 @@ void memory_region_del_subregion(MemoryRegion *mr,
 
     memory_region_transaction_begin();
     assert(subregion->container == mr);
-    subregion->container = NULL;
     for (alias = subregion->alias; alias; alias = alias->alias) {
         alias->mapped_via_alias--;
         assert(alias->mapped_via_alias >= 0);
     }
     QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
-    memory_region_unref(subregion);
+    if (subregion->container->owner != subregion->owner) {
+        memory_region_unref(subregion);
+    }
+    subregion->container = NULL;
     memory_region_update_pending |= mr->enabled && subregion->enabled;
+    object_unref(subregion);
     memory_region_transaction_commit();
 }

> 
> -- PMM
> 


