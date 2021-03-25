Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82723349A8B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:41:01 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVqm-0007Bb-1J
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPVnu-0006I3-DW
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPVnr-0006bW-2m
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616701077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNoUVBjk3Q+B6eRSv5ouyTzahQ0ia2diWuMdD04UnGA=;
 b=IuXQU10AILqrGWwMDYiDFXJh2XPC6siXBztoYSddx3+0M8pjWYNQv4BeuTeCKA43gy7Zly
 LOKPb1KCvVSd269HZ2YRupG5oYYZS90aupwUD0XxKIo4bDG67SQnkgsTtnOAxoqOJ9ouIm
 67Ss00LnwEVaZy/oV7JblnvrOspcTTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Sh3rCa0BMz66oRJR_aP95Q-1; Thu, 25 Mar 2021 15:37:55 -0400
X-MC-Unique: Sh3rCa0BMz66oRJR_aP95Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6B09801817;
 Thu, 25 Mar 2021 19:37:52 +0000 (UTC)
Received: from work-vm (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED207189BB;
 Thu, 25 Mar 2021 19:37:50 +0000 (UTC)
Date: Thu, 25 Mar 2021 19:37:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
Message-ID: <YFzmjCAtz3WwbOmt@work-vm>
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
 <YFJiZSW0OjdQdOXZ@work-vm>
 <CAJc+Z1FVwgVHGP6b0cbFaeWOqTGe9WJDV7UQgf6TP1Qthu2O4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1FVwgVHGP6b0cbFaeWOqTGe9WJDV7UQgf6TP1Qthu2O4w@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Haibo Xu (haibo.xu@linaro.org) wrote:
> On Thu, 18 Mar 2021 at 04:11, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Haibo Xu (haibo.xu@linaro.org) wrote:
> > > To make it easier to keep the page tags sync with
> > > the page data, tags for one page are appended to
> > > the data during ram save iteration.
> > >
> > > This patch only add the pre-copy migration support.
> > > Post-copy and compress as well as zero page saving
> > > are not supported yet.
> > >
> > > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> >
> > My guess is that this doesn't work with a lot of other options; e.g.
> > postcopy and probably compression and a bunch of other things.
> > Postcopy I can see you'll need some interesting kernel changes for -
> > you'd need to be able to atomically place a  page with it's tag data.
> >
> > You probably need to add stuff to migrate_caps_check  to disable
> > features that you don't support.
> >
> 
> Hi David,
> 
> Thanks so much for the comments!
> 
> You are right, this RFC patch only supports pre-copy mode, no
> postcopy, no compression.
> As a RFC, here just want to finalize the tag migration process, that is:
> 1. let the tag go with the page data(the current choice) which may be
> a little complex to put
>     them into the current migration process.

I think it's probably the easiest.

> 2. migrate them separately which is easy to implement with the current
> migration(treat the tags
>     as device status), but it would be hard to keep the page data and
> tag to sync with each other.
> 3. Any other ways?
> 
> Once the tag migration process is finalized, a new formal patch series
> with postcopy as well as
> compression should be reworked.

It's probably best to look what you would have to do to fit it in with
those before finalising the basic version; not necessary implement them
- just get an idea.

> What's more, you mentioned that "some interesting kernel changes are
> needed to atomically
> place a  page with it's tag data". You mean a single kernel API to
> store page data and tag in
> the migration load process?

Yes;  see migration/postcopy-ram.c postcopy_place_page  - it has the
problem of placing the whole page in memory before the guest starts
usign it; I think for MTE you're going to have to put the MTE data in at
the same time.

Dave

> 
> Regards,
> Haibo
> 
> > > ---
> > >  include/hw/arm/virt.h    |  2 +
> > >  include/migration/misc.h |  1 +
> > >  migration/ram.c          | 86 +++++++++++++++++++++++++++++++++++++++-
> > >  3 files changed, 88 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index 921416f918..8b28cde8bf 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -166,6 +166,8 @@ struct VirtMachineState {
> > >      PCIBus *bus;
> > >      char *oem_id;
> > >      char *oem_table_id;
> > > +    /* migrate memory tags */
> > > +    NotifierWithReturn precopy_notifier;
> > >  };
> > >
> > >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> > > diff --git a/include/migration/misc.h b/include/migration/misc.h
> > > index bccc1b6b44..005133f471 100644
> > > --- a/include/migration/misc.h
> > > +++ b/include/migration/misc.h
> > > @@ -38,6 +38,7 @@ void precopy_add_notifier(NotifierWithReturn *n);
> > >  void precopy_remove_notifier(NotifierWithReturn *n);
> > >  int precopy_notify(PrecopyNotifyReason reason, Error **errp);
> > >  void precopy_enable_free_page_optimization(void);
> > > +void precopy_enable_metadata_migration(void);
> > >
> > >  void ram_mig_init(void);
> > >  void qemu_guest_free_page_hint(void *addr, size_t len);
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 72143da0ac..e67b798c3b 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -53,10 +53,12 @@
> > >  #include "block.h"
> > >  #include "sysemu/sysemu.h"
> > >  #include "sysemu/cpu-throttle.h"
> > > +#include "sysemu/kvm.h"
> > >  #include "savevm.h"
> > >  #include "qemu/iov.h"
> > >  #include "multifd.h"
> > >  #include "sysemu/runstate.h"
> > > +#include "kvm_arm.h"
> > >
> > >  #if defined(__linux__)
> > >  #include "qemu/userfaultfd.h"
> > > @@ -80,6 +82,9 @@
> > >  #define RAM_SAVE_FLAG_XBZRLE   0x40
> > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > > +#define RAM_SAVE_FLAG_MTE              0x200
> >
> > I think that's using the last free bit in the flags field, which is a
> > bit painful.
> >
> 
> Yes, only 0x80(reserved) and 0x200 are available.
> 
> > > +#define MTE_GRANULE_SIZE   (16)
> > >
> > >  static inline bool is_zero_range(uint8_t *p, uint64_t size)
> > >  {
> > > @@ -317,6 +322,8 @@ struct RAMState {
> > >      bool ram_bulk_stage;
> > >      /* The free page optimization is enabled */
> > >      bool fpo_enabled;
> > > +    /* The RAM meta data(e.t memory tag) is enabled */
> > > +    bool metadata_enabled;
> > >      /* How many times we have dirty too many pages */
> > >      int dirty_rate_high_cnt;
> > >      /* these variables are used for bitmap sync */
> > > @@ -394,6 +401,15 @@ void precopy_enable_free_page_optimization(void)
> > >      ram_state->fpo_enabled = true;
> > >  }
> > >
> > > +void precopy_enable_metadata_migration(void)
> > > +{
> > > +    if (!ram_state) {
> > > +        return;
> > > +    }
> > > +
> > > +    ram_state->metadata_enabled = true;
> > > +}
> > > +
> > >  uint64_t ram_bytes_remaining(void)
> > >  {
> > >      return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
> > > @@ -1134,6 +1150,61 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > >      return true;
> > >  }
> > >
> > > +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> > > +{
> > > +    uint8_t *tag_buf = NULL;
> > > +    uint64_t ipa;
> > > +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> >
> > This function needs to be mostly somewhere aarch specific; or somehow
> > made more generic.
> > We shouldn't have RAM_SAVE_FLAG_MTE as well - we should be something
> > like RAM_SAVE_FLAG_ARCH_METADATA and that way other architectures with
> > something else glued onto pages can do something similar.
> > Try and keep migration/ architecture independent.
> 
> Yes, it should be arch independent and handled with a more abstract way.
> 
> >
> > > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > > +        /* Buffer for the page tags(one byte per tag) */
> > > +        tag_buf = g_try_malloc0(size);
> >
> > It feels like you want to allocate tag_buf in setup and free it at the
> > end rather than doing this in every page.
> 
> Yes, the tag buffer allocation could be moved to migration save/load
> setup and cleanup function.
> 
> >
> > > +        if (!tag_buf) {
> > > +            error_report("%s: Error allocating MTE tag_buf", __func__);
> > > +            return 0;
> > > +        }
> > > +
> > > +        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> > > +            error_report("%s: Can't get MTE tags from guest", __func__);
> >
> > For any error like this you probably want to say the addresses to make
> > it easier to debug when it fails.
> >
> 
> Good suggestion! Will add the "address" info to the log.
> 
> > > +            g_free(tag_buf);
> > > +            return 0;
> > > +        }
> > > +
> > > +        qemu_put_buffer(f, tag_buf, size);
> > > +
> > > +        g_free(tag_buf);
> > > +
> > > +        return size;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static void load_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> > > +{
> > > +    uint8_t *tag_buf = NULL;
> > > +    uint64_t ipa;
> > > +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> > > +
> > > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > > +        /* Buffer for the page tags(one byte per tag) */
> > > +        tag_buf = g_try_malloc0(size);
> > > +        if (!tag_buf) {
> > > +            error_report("%s: Error allocating MTE tag_buf", __func__);
> > > +            return;
> > > +        }
> > > +
> > > +        qemu_get_buffer(f, tag_buf, size);
> > > +        if (kvm_arm_mte_set_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> >
> > what protections are there here to stop you setting the mte on something
> > useful, like part of the host kernel or qemu?
> 
> Kernel would do some parameter check(e.t ipa within a valid slot)
> before setting the tag data.
> 
> >
> > > +            error_report("%s: Can't set MTE tags to guest", __func__);
> > > +        }
> > > +
> > > +        g_free(tag_buf);
> > > +    }
> > > +
> > > +    return;
> > > +}
> > > +
> > >  /*
> > >   * directly send the page to the stream
> > >   *
> > > @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > >  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > >                              uint8_t *buf, bool async)
> > >  {
> > > +    if (rs->metadata_enabled) {
> > > +        offset |= RAM_SAVE_FLAG_MTE;
> > > +    }
> > > +
> > >      ram_counters.transferred += save_page_header(rs, rs->f, block,
> > >                                                   offset | RAM_SAVE_FLAG_PAGE);
> > >      if (async) {
> > > @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > >      }
> > >      ram_counters.transferred += TARGET_PAGE_SIZE;
> > >      ram_counters.normal++;
> > > +
> > > +    if (rs->metadata_enabled) {
> > > +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> > > +    }
> > > +
> > >      return 1;
> > >  }
> > >
> > > @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
> > >      rs->last_version = ram_list.version;
> > >      rs->ram_bulk_stage = true;
> > >      rs->fpo_enabled = false;
> > > +    rs->metadata_enabled = false;
> > >  }
> > >
> > >  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> > > @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
> > >              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
> > >          }
> > >
> > > -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> > > +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
> > >          case RAM_SAVE_FLAG_MEM_SIZE:
> > >              /* Synchronize RAM block list */
> > >              total_ram_bytes = addr;
> > > @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
> > >
> > >          case RAM_SAVE_FLAG_PAGE:
> > >              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> > > +            if (flags & RAM_SAVE_FLAG_MTE) {
> > > +                load_normal_page_mte_tags(f, host);
> > > +            }
> > >              break;
> > >
> > >          case RAM_SAVE_FLAG_COMPRESS_PAGE:
> > > --
> > > 2.17.1
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


