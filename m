Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86BD71A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 10:58:08 +0200 (CEST)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKIed-0007fK-Dg
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 04:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iKIdp-0007C5-Fr
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iKIdn-0005xX-GX
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:57:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38662)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iKIdn-0005xM-7x
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 04:57:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14EEB81DE0
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 08:57:14 +0000 (UTC)
Received: from work-vm (ovpn-117-145.ams2.redhat.com [10.36.117.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2181219C58;
 Tue, 15 Oct 2019 08:57:07 +0000 (UTC)
Date: Tue, 15 Oct 2019 09:57:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/2] migration: Boost SaveStateEntry.instance_id to 64 bits
Message-ID: <20191015085705.GB3073@work-vm>
References: <20191015075444.10955-1-peterx@redhat.com>
 <20191015075444.10955-2-peterx@redhat.com>
 <87lftmqtvi.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lftmqtvi.fsf@trasno.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 15 Oct 2019 08:57:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > It was "int" and used as 32bits fields (see save_section_header()).
> > It's unsafe already because sizeof(int) could be 2 on i386, I think.
> > So at least uint32_t would suite more.  While it also uses "-1" as a
> > placeholder of "we want to generate the instance ID automatically".
> > Hence a more proper value should be int64_t.
> >
> > This will start to be useful after next patch in which we can start to
> > convert a real uint32_t value as instance ID.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Hi
> 
> Being more helpful,  I think that it is better to just:
> 
> * change instance_id to be an uint32_t (notice that for all architectures
>   that we support, it is actually int32_t).
> 
> * export calculate_new_instance_id() and adjust callers that use -1.
> 
> or
> 
> * export a new function that just use the calculate_new_instance_id()

Do you mean that we end up with two functions, one that does it
automatically, and one that takes an ID?

Dave

> A fast search shows:
> 
> 10 callers of vmstate_register() with -1
> 1 caller of vmstate_register_with_alias_id with -1 (but it is the one
>   that sets all qdev devices).
> 1 caller of vmstate_register_with_alias_id in apic, where it can be -1.
> 1 caller of register_savevm_live() with -1 (spapr)
> 
> And call it a day?
> 
> What do you think, Juan.

> 
> > ---
> >  include/migration/register.h |  2 +-
> >  include/migration/vmstate.h  |  4 ++--
> >  migration/savevm.c           | 10 +++++-----
> >  stubs/vmstate.c              |  2 +-
> >  4 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/migration/register.h b/include/migration/register.h
> > index a13359a08d..54f42c7413 100644
> > --- a/include/migration/register.h
> > +++ b/include/migration/register.h
> > @@ -69,7 +69,7 @@ typedef struct SaveVMHandlers {
> >  } SaveVMHandlers;
> >  
> >  int register_savevm_live(const char *idstr,
> > -                         int instance_id,
> > +                         int64_t instance_id,
> >                           int version_id,
> >                           const SaveVMHandlers *ops,
> >                           void *opaque);
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index 1fbfd099dd..6a7498463c 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -1114,14 +1114,14 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
> >  bool vmstate_save_needed(const VMStateDescription *vmsd, void *opaque);
> >  
> >  /* Returns: 0 on success, -1 on failure */
> > -int vmstate_register_with_alias_id(DeviceState *dev, int instance_id,
> > +int vmstate_register_with_alias_id(DeviceState *dev, int64_t instance_id,
> >                                     const VMStateDescription *vmsd,
> >                                     void *base, int alias_id,
> >                                     int required_for_version,
> >                                     Error **errp);
> >  
> >  /* Returns: 0 on success, -1 on failure */
> > -static inline int vmstate_register(DeviceState *dev, int instance_id,
> > +static inline int vmstate_register(DeviceState *dev, int64_t instance_id,
> >                                     const VMStateDescription *vmsd,
> >                                     void *opaque)
> >  {
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index bb9462a54d..dc9281c897 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -233,7 +233,7 @@ typedef struct CompatEntry {
> >  typedef struct SaveStateEntry {
> >      QTAILQ_ENTRY(SaveStateEntry) entry;
> >      char idstr[256];
> > -    int instance_id;
> > +    int64_t instance_id;
> >      int alias_id;
> >      int version_id;
> >      /* version id read from the stream */
> > @@ -668,7 +668,7 @@ void dump_vmstate_json_to_file(FILE *out_file)
> >  static int calculate_new_instance_id(const char *idstr)
> >  {
> >      SaveStateEntry *se;
> > -    int instance_id = 0;
> > +    int64_t instance_id = 0;
> >  
> >      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> >          if (strcmp(idstr, se->idstr) == 0
> > @@ -730,7 +730,7 @@ static void savevm_state_handler_insert(SaveStateEntry *nse)
> >     Meanwhile pass -1 as instance_id if you do not already have a clearly
> >     distinguishing id for all instances of your device class. */
> >  int register_savevm_live(const char *idstr,
> > -                         int instance_id,
> > +                         int64_t instance_id,
> >                           int version_id,
> >                           const SaveVMHandlers *ops,
> >                           void *opaque)
> > @@ -784,7 +784,7 @@ void unregister_savevm(DeviceState *dev, const char *idstr, void *opaque)
> >      }
> >  }
> >  
> > -int vmstate_register_with_alias_id(DeviceState *dev, int instance_id,
> > +int vmstate_register_with_alias_id(DeviceState *dev, int64_t instance_id,
> >                                     const VMStateDescription *vmsd,
> >                                     void *opaque, int alias_id,
> >                                     int required_for_version,
> > @@ -1566,7 +1566,7 @@ int qemu_save_device_state(QEMUFile *f)
> >      return qemu_file_get_error(f);
> >  }
> >  
> > -static SaveStateEntry *find_se(const char *idstr, int instance_id)
> > +static SaveStateEntry *find_se(const char *idstr, int64_t instance_id)
> >  {
> >      SaveStateEntry *se;
> >  
> > diff --git a/stubs/vmstate.c b/stubs/vmstate.c
> > index e1e89b87f0..699003f3b0 100644
> > --- a/stubs/vmstate.c
> > +++ b/stubs/vmstate.c
> > @@ -4,7 +4,7 @@
> >  const VMStateDescription vmstate_dummy = {};
> >  
> >  int vmstate_register_with_alias_id(DeviceState *dev,
> > -                                   int instance_id,
> > +                                   int64_t instance_id,
> >                                     const VMStateDescription *vmsd,
> >                                     void *base, int alias_id,
> >                                     int required_for_version,
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

