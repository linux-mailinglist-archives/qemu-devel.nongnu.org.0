Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA73D0BC0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:11:23 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69CE-000800-TF
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m68zB-0004rk-35
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m68z9-0005BS-G9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626861470;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=V9vZmbuNHuJmuDViGXSp8ui9ZiDrfzbEqfEYG0u/jpE=;
 b=PjQQldz0Gvn6SyQa9hjoYbpcTNDYr6Jv3bOewguDO/fdZU8FPd9uUcX+KIFTZwqbMt47mT
 u01qpbNVJTFse4Tnk0F01YffUHh6lK4O22OML9qdg+Q1iWQ96ejlPVlKjZOqSBRMt3CaeQ
 dEX/MEJMJUSRrANLnoFW9x1OrN0MPK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-XKJyegVRNJG06bZFUJ4YlQ-1; Wed, 21 Jul 2021 05:57:46 -0400
X-MC-Unique: XKJyegVRNJG06bZFUJ4YlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771068026AC;
 Wed, 21 Jul 2021 09:57:45 +0000 (UTC)
Received: from redhat.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 711EC5D740;
 Wed, 21 Jul 2021 09:57:40 +0000 (UTC)
Date: Wed, 21 Jul 2021 10:57:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC 3/3] qom: Improve error message in
 module_object_class_by_name()
Message-ID: <YPfvkWhq2iaXGadM@redhat.com>
References: <20210630232749.21873-1-jziviani@suse.de>
 <20210630232749.21873-4-jziviani@suse.de>
 <20210721095445.be2ftvxygi6utoj4@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210721095445.be2ftvxygi6utoj4@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, cfontana@suse.de, qemu-devel@nongnu.org,
 ehabkost@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 11:54:45AM +0200, Gerd Hoffmann wrote:
> >  ObjectClass *module_object_class_by_name(const char *typename)
> >  {
> >      ObjectClass *oc;
> > @@ -1031,8 +1049,20 @@ ObjectClass *module_object_class_by_name(const char *typename)
> >      oc = object_class_by_name(typename);
> >  #ifdef CONFIG_MODULES
> >      if (!oc) {
> > +        char *module_name;
> >          module_load_qom_one(typename);
> >          oc = object_class_by_name(typename);
> > +        module_name = get_accel_module_name(typename);
> > +        if (module_name) {
> > +            if (!module_is_loaded(module_name)) {
> > +                fprintf(stderr, "%s module is missing, install the "
> > +                                "package or config the library path "
> > +                                "correctly.\n", module_name);
> > +                g_free(module_name);
> > +                exit(1);
> > +            }
> > +            g_free(module_name);
> > +        }
> 
> This error logging should IMHO be moved to util/module.c.  Either have a
> helper function to print the error message, or have
> module_load_qom_one() print it.
> 
> There is also no need to hard-code the module names.  We have the module
> database and module_load_qom_one() uses it to figure which module must
> be loaded for a specific qom object.  We can likewise use the database
> for printing the error message.

IIUC, module loading can be triggered from hotplug of backends/devices,
If so, we really shouldn't be printing to stderr, but using Error *errp
throughout, so that QMP can give back useful error messages


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


