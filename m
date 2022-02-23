Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D34C0D9D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 08:50:09 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMmPY-0003v8-5X
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 02:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMmLN-0002iz-3c
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMmLJ-0005yu-5h
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645602344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I4KiNka5M5fHhg+OWlXSqgAXizLzx0IQ7ZHDK2ZPfok=;
 b=Jj950PMaZ1ar3eV3OPGcbDrFnmoeNICnIFxyDRqSo0cUQczS+p1MA6Dq22kBzydceGyZGQ
 zLD4XBwsEYsBa7Pr3wKnIB5vza/4MMVWfn1FBSrTYWIqfaq7g3iO5iKE61j0Ml7izAqB+U
 mv6ofoEZ2SLKE0hOgnbBRAcizN95Fpk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-80sckhEbMxuodypqSRybkA-1; Wed, 23 Feb 2022 02:45:43 -0500
X-MC-Unique: 80sckhEbMxuodypqSRybkA-1
Received: by mail-pf1-f199.google.com with SMTP id
 f24-20020aa782d8000000b004bc00caa4c0so8590099pfn.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 23:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I4KiNka5M5fHhg+OWlXSqgAXizLzx0IQ7ZHDK2ZPfok=;
 b=dru/M8UfGYHvSYPww81cBBfccJHVujg1Ybannf0prTO56PBSabGq5ed+62Hte2NWED
 LHXGcyLkTouq+Om41yCtQhY9A2El3UslrsLW9vQ/ccM4QN/ptwVOP882JbFFoNLN99GE
 6w+PBdDHO5qneLIF3fXquTlog+m/dTPpLYRDo6pVEQ4HeukqapNw0bRrcK8qzluRaOZ0
 VBJjZq0JZ8xaMJptlUWep16dGFzGBG3zOXKcLggbxb0l48Qejgb5ZH9wvfweHch8hGA8
 Q+jZ4wElk9qEkEifQpS3vrV7cDxWWlNtfjoQB4Kad0oMmWHPdkGCVwjeyXG47XaKrsqU
 Igpw==
X-Gm-Message-State: AOAM533eZK1zQ284GSwR6XOgz2UskvidMIig/fIAebqdzy77uUZffCPv
 n8asnFP9TX3uNDnlcOejb9XZOcP5yOFQql6uRXmI5Zlw3QoMKwGOa3ynJY7FDMutNV8UfV51CxY
 8IlDqdc0mnaDSkjE=
X-Received: by 2002:a63:f912:0:b0:372:bac6:b92d with SMTP id
 h18-20020a63f912000000b00372bac6b92dmr22279537pgi.265.1645602341733; 
 Tue, 22 Feb 2022 23:45:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6wkqGjncMSMJJ8A7RRDyK/gAYq2acjdekAIuHZ7llFMiIMTL9WHwk8+QhX9n44krdsefqKg==
X-Received: by 2002:a63:f912:0:b0:372:bac6:b92d with SMTP id
 h18-20020a63f912000000b00372bac6b92dmr22279518pgi.265.1645602341351; 
 Tue, 22 Feb 2022 23:45:41 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100])
 by smtp.gmail.com with ESMTPSA id b11sm23337869pgs.55.2022.02.22.23.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:45:41 -0800 (PST)
Date: Wed, 23 Feb 2022 15:45:36 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 19/20] migration: Postcopy recover with preempt enabled
Message-ID: <YhXmIBwbZoTErHSR@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-20-peterx@redhat.com>
 <YhTJuvhEvdxnINPu@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhTJuvhEvdxnINPu@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 11:32:10AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > To allow postcopy recovery, the ram fast load (preempt-only) dest QEMU thread
> > needs similar handling on fault tolerance.  When ram_load_postcopy() fails,
> > instead of stopping the thread it halts with a semaphore, preparing to be
> > kicked again when recovery is detected.
> > 
> > A mutex is introduced to make sure there's no concurrent operation upon the
> > socket.  To make it simple, the fast ram load thread will take the mutex during
> > its whole procedure, and only release it if it's paused.  The fast-path socket
> > will be properly released by the main loading thread safely when there's
> > network failures during postcopy with that mutex held.
> 
> I *think* this is mostly OK; but I worry I don't understand all the
> cases; e.g.
>   a) If the postcopy channel errors first
>   b) If the main channel errors first

Ah right, I don't think I handled all the cases.  Sorry.

We always check the main channel, but if the postcopy channel got faulted,
we may not fall into paused mode as expected.

I'll fix that up.

> 
> Can you add some docs to walk through those and explain the locking ?

Sure.

The sem is mentioned in the last sentence of paragraph 1, where it's purely
used for a way to yield the fast ram load thread so that when something
wrong happens it can sleep on that semaphore.  Then when we recover we'll
post to the semaphore to kick it up.  We used it like that in many places,
e.g. postcopy_pause_sem_dst to yield the main load thread.

The 2nd paragraph above was for explaining why we need the mutex; it's
basically the same as rp_mutex protecting to_src_file, so that we won't
accidentally close() the qemufile during some other thread using it.  So
the fast ram load thread needs to take that new mutex for mostly the whole
lifecycle of itself (because it's loading from that qemufile), meanwhile
only drop the mutex when it prepares to sleep.  Then the main load thread
can recycle the postcopy channel using qemu_fclose() safely.

[...]

> > @@ -3466,6 +3468,17 @@ static MigThrError postcopy_pause(MigrationState *s)
> >          qemu_file_shutdown(file);
> >          qemu_fclose(file);
> >  
> > +        /*
> > +         * Do the same to postcopy fast path socket too if there is.  No
> > +         * locking needed because no racer as long as we do this before setting
> > +         * status to paused.
> > +         */
> > +        if (s->postcopy_qemufile_src) {
> > +            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> 
> Shouldn't this do a qemu_file_shutdown on here first?

Yes I probably should.

With all above, I plan to squash below changes into this patch:

---8<---
diff --git a/migration/migration.c b/migration/migration.c
index c68a281406..69778cab23 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3475,6 +3475,7 @@ static MigThrError postcopy_pause(MigrationState *s)
          */
         if (s->postcopy_qemufile_src) {
             migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
+            qemu_file_shutdown(s->postcopy_qemufile_src);
             qemu_fclose(s->postcopy_qemufile_src);
             s->postcopy_qemufile_src = NULL;
         }
@@ -3534,8 +3535,13 @@ static MigThrError migration_detect_error(MigrationState *s)
         return MIG_THR_ERR_FATAL;
     }

-    /* Try to detect any file errors */
-    ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
+    /*
+     * Try to detect any file errors.  Note that postcopy_qemufile_src will
+     * be NULL when postcopy preempt is not enabled.
+     */
+    ret = qemu_file_get_error_obj_any(s->to_dst_file,
+                                      s->postcopy_qemufile_src,
+                                      &local_error);
     if (!ret) {
         /* Everything is fine */
         assert(!local_error);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..397652f0ba 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -139,6 +139,33 @@ int qemu_file_get_error_obj(QEMUFile *f, Error **errp)
     return f->last_error;
 }

+/*
+ * Get last error for either stream f1 or f2 with optional Error*.
+ * The error returned (non-zero) can be either from f1 or f2.
+ *
+ * If any of the qemufile* is NULL, then skip the check on that file.
+ *
+ * When there is no error on both qemufile, zero is returned.
+ */
+int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp)
+{
+    int ret = 0;
+
+    if (f1) {
+        ret = qemu_file_get_error_obj(f1, errp);
+        /* If there's already error detected, return */
+        if (ret) {
+            return ret;
+        }
+    }
+
+    if (f2) {
+        ret = qemu_file_get_error_obj(f2, errp);
+    }
+
+    return ret;
+}
+
 /*
  * Set the last error for stream f with optional Error*
  */
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3f36d4dc8c..2564e5e1c7 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -156,6 +156,7 @@ void qemu_file_update_transfer(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
 int64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
+int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
 void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
 void qemu_file_set_error(QEMUFile *f, int ret);
 int qemu_file_shutdown(QEMUFile *f);
diff --git a/migration/savevm.c b/migration/savevm.c
index 2d32340d28..24b69a1008 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2651,8 +2651,8 @@ retry:
     while (true) {
         section_type = qemu_get_byte(f);

-        if (qemu_file_get_error(f)) {
-            ret = qemu_file_get_error(f);
+        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, NULL);
+        if (ret) {
             break;
         }
---8<---

Does it look sane?  Let me know if there's still things missing.

Thanks!

-- 
Peter Xu


