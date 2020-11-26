Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6252C55CE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:38:02 +0100 (CET)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiHTF-00071C-6j
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiHSD-0006SC-DF
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:36:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiHSA-00066c-Tq
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606397813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UezNt4AGfc68oFctSl8QMqWNpgO5Qv9puyz+jTHtBZ4=;
 b=JNJx3vMSujOfONeeWDrmdNeWi7QUr9C+PKLHn94VAJTJhKJrQisrJeg/EgwXuV8EGTUux4
 NbkjqqJ0oqk3OTyCQL+Bf/fRi6GejuodYUyFjlp6bXl0ogf6nIYMAL/ScOz9t+CmxslRYy
 gYgGSVUDO1DFMkz7QvKy46dfuRbYD8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-Lh3dueHVO5Wty5kRk1nkMg-1; Thu, 26 Nov 2020 08:36:51 -0500
X-MC-Unique: Lh3dueHVO5Wty5kRk1nkMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EFDE803F69;
 Thu, 26 Nov 2020 13:36:50 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C36D31C934;
 Thu, 26 Nov 2020 13:36:46 +0000 (UTC)
Date: Thu, 26 Nov 2020 08:36:45 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
Message-ID: <20201126133645.GG2271382@habkost.net>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
MIME-Version: 1.0
In-Reply-To: <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:14:31AM +0100, Claudio Fontana wrote:
> Hi Eduardo,
> 
> On 11/25/20 9:56 PM, Eduardo Habkost wrote:
> > This function will be used to replace the xen_available() and
> > kvm_available() functions from arch_init.c.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Claudio Fontana <cfontana@suse.de>
> > Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  include/sysemu/accel.h | 1 +
> >  accel/accel.c          | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> > index e08b8ab8fa..a4a00c75c8 100644
> > --- a/include/sysemu/accel.h
> > +++ b/include/sysemu/accel.h
> > @@ -67,6 +67,7 @@ typedef struct AccelClass {
> >      OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
> >  
> >  AccelClass *accel_find(const char *opt_name);
> > +bool accel_available(const char *name);
> >  int accel_init_machine(AccelState *accel, MachineState *ms);
> >  
> >  /* Called just before os_setup_post (ie just before drop OS privs) */
> > diff --git a/accel/accel.c b/accel/accel.c
> > index cb555e3b06..4a64a2b38a 100644
> > --- a/accel/accel.c
> > +++ b/accel/accel.c
> > @@ -46,6 +46,11 @@ AccelClass *accel_find(const char *opt_name)
> >      return ac;
> >  }
> >  
> > +bool accel_available(const char *name)
> > +{
> > +    return accel_find(name) != NULL;
> 
> 
> accel_find() in its implementation allocates and then frees memory to generate the string,
> the user of accel_available() might be unaware and overuse leading to fragmentation/performance issues?

Is that a real issue?  We had only 3 users of kvm_available() and
xen_available() since those functions were added 10 years ago.

Do you have any suggestions on what we should do?

-- 
Eduardo


