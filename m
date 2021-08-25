Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D23F7DC4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 23:33:50 +0200 (CEST)
Received: from localhost ([::1]:52170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ0Wq-00062R-Um
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 17:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ0W6-0005Mo-0v
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJ0W3-0007bo-GM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629927178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ed8p008cyMdWcpiUjZYJGYeA8qWUgjfoEQYhGE+IEz4=;
 b=Tq58bXP7c2fxE7OFfKet8sa4/5n/5JqTJ5l5WE2T26ienn0HqRbjRNsVhumq7R5eSNH/Z0
 eGu19l2Bzo2p/BQ+HjB/Okeo1UpL/POyGQQQteZuM3A0XE2UYeOc/VIwp3pEYEs7onvFp9
 wGQ6+wombo4XZVTtrpFMZ9dgd8Dxzuc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-z0zn8hWJOq6lDHweQgfUSQ-1; Wed, 25 Aug 2021 17:32:54 -0400
X-MC-Unique: z0zn8hWJOq6lDHweQgfUSQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 j23-20020ac86657000000b0029cb70967ebso533075qtp.14
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 14:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ed8p008cyMdWcpiUjZYJGYeA8qWUgjfoEQYhGE+IEz4=;
 b=OopXhVI1haRoiz90M7VzzA8+I4WDs8tM6WOi8Oq9LoSvp1DFlE/8MFA9cp53FwilVF
 3T97DzpwxaYHD59e1NQpsiMTjnKFSjRoB1C6XEU9mZvSQi79W1S/ExnG0cgbgiPS8yz2
 NGXEAORrLwVeQMAxUVtAGvGjf6r5Hz8sM7FHKJMBZaWjJtZZ7NQq96FCv7yGk/tMAxic
 qQKw7H09iQJ+eYF2fo+ZN/Lzb54T1miyAU3HfIw91M+YjhRT32gyTpwQCwm6zxRKFWoI
 h1cTP3jC3ceyAB/3BPB8W6RKnuWsEUqX2h9bGyTs1w76Dk4x2WBn7jG9hwwQ9lF2gmBg
 3OHQ==
X-Gm-Message-State: AOAM532ZXlUQEpocwG887g0Twq5nTLMZxwvC0/iggbcEV41rEoZzJ3pn
 GAQAF2T78rfXKSXxAxmEDjdcZggxk2IzHtb340jSlA6csHqDwIvzU/TF4XbUfFzYvAtToEkMLxZ
 4FmvTPGupdhbOjH8=
X-Received: by 2002:ac8:7118:: with SMTP id z24mr306016qto.281.1629927174360; 
 Wed, 25 Aug 2021 14:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRfZL7ArTaoK4MZihkFL2Ygl2EFQLIJ44E0k293vArWw9arY/2VoWxNf2Lu6SKM1O5zo2lJQ==
X-Received: by 2002:ac8:7118:: with SMTP id z24mr305990qto.281.1629927174025; 
 Wed, 25 Aug 2021 14:32:54 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id c27sm919590qkp.5.2021.08.25.14.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 14:32:53 -0700 (PDT)
Date: Wed, 25 Aug 2021 17:32:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/2] dump-guest-memory: Add blocker for migration
Message-ID: <YSa3BAyTZJ/L0Few@t490s>
References: <20210824152721.79747-1-peterx@redhat.com>
 <87zgt66jtn.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgt66jtn.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Gibson <dgibson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus,

On Wed, Aug 25, 2021 at 09:54:12AM +0200, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > Both dump-guest-memory and live migration have vm state cached internally.
> > Allowing them to happen together means the vm state can be messed up.  Simply
> > block live migration for dump-guest-memory.
> >
> > One trivial thing to mention is we should still allow dump-guest-memory even if
> > -only-migratable is specified, because that flag should majorly be used to
> > guarantee not adding devices that will block migration by accident.  Dump guest
> > memory is not like that - it'll only block for the seconds when it's dumping.
> 
> I recently ran into a similarly unusual use of migration blockers:
> 
>     Subject: -only-migrate and the two different uses of migration blockers
>      (was: spapr_events: Sure we may ignore migrate_add_blocker() failure?)
>     Date: Mon, 19 Jul 2021 13:00:20 +0200 (5 weeks, 1 day, 20 hours ago)
>     Message-ID: <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
> 
>     We appear to use migration blockers in two ways:
> 
>     (1) Prevent migration for an indefinite time, typically due to use of
>     some feature that isn't compatible with migration.
> 
>     (2) Delay migration for a short time.
> 
>     Option -only-migrate is designed for (1).  It interferes with (2).
> 
>     Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
>     adds a migration blocker on realize, and deletes it on unrealize.  With
>     -only-migrate, device realize fails.  Works as designed.
> 
>     Example for (2): spapr_mce_req_event() makes an effort to prevent
>     migration degrate the reporting of FWNMIs.  It adds a migration blocker
>     when it receives one, and deletes it when it's done handling it.  This
>     is a best effort; if migration is already in progress by the time FWNMI
>     is received, we simply carry on, and that's okay.  However, option
>     -only-migrate sabotages the best effort entirely.
> 
>     While this isn't exactly terrible, it may be a weakness in our thinking
>     and our infrastructure.  I'm bringing it up so the people in charge are
>     aware :)
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg04723.html
> 
> Downthread there, Dave Gilbert opined
> 
>     It almost feels like they need a way to temporarily hold off
>     'completion' of migratio - i.e. the phase where we stop the CPU and
>     write the device data;  mind you you'd also probably want it to stop
>     cold-migrates/snapshots?

Yeah, maybe spapr_mce_req_event() can be another candidate of the internal
version of migration_add_blocker().

I can add a patch to replace it if anyone likes me to.

Both cold and live snapshot should have checked migration blockers, I think.
E.g., cold snapshot has:

bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
                  bool has_devices, strList *devices, Error **errp)
{
    [...]
    if (migration_is_blocked(errp)) {
        return false;
    }
    [...]
}

While the live snapshot shares similar code in migrate_prepare().

So looks safe that nothing wrong should happen within add/del pair of blockers.

However I do see that it's possible we'll allow the add_blocker to succeed even
if during cold snapshot, because migration_is_idle() in migration_add_blocker()
only checks migration state, not RUN_STATE_SAVE_VM.  So I'm wondering whether
we'd like one more patch to cover that too, like:

---8<---
diff --git a/migration/migration.c b/migration/migration.c
index 41429680c2..9c602a4ac1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2055,15 +2055,16 @@ void migrate_init(MigrationState *s)
 
 int migrate_add_blocker_internal(Error *reason, Error **errp)
 {
-    if (migration_is_idle()) {
-        migration_blockers = g_slist_prepend(migration_blockers, reason);
-        return 0;
+    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
+    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(migration in progress) for: ");
+        return -EBUSY;
     }
 
-    error_propagate_prepend(errp, error_copy(reason),
-                            "disallowing migration blocker "
-                            "(migration in progress) for: ");
-    return -EBUSY;
+    migration_blockers = g_slist_prepend(migration_blockers, reason);
+    return 0;
 }
 
 int migrate_add_blocker(Error *reason, Error **errp)
---8<---

It'll by accident also cover guest dump which also sets RUN_STATE_SAVE_VM, but
I think that's ok.

Thanks,

-- 
Peter Xu


