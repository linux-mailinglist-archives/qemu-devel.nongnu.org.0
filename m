Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E754ACFD4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:39:40 +0100 (CET)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHLu-0000YX-Pq
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:39:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHK8-0007kt-JK
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHK6-0003Dz-Cs
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644291460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8PNgm6F8JAUNyldJJuPxi35EI2Kdp5tmxEQNXEZLO+E=;
 b=Foa2YDTehILxb8CII/gGrnbw3FZDrYh6AKxCvLqf+yoGWPHaawC8EshOWVPbQ2aFqdfGk4
 0Kete5jzdx/SlWZn2kVSRE3/QsVaTP03gMDOHJ4mqM/2G3tBewb660A+o+ZvF0gFOXt8Os
 GCoKCWEdN1P7MVUez8pIJI6DZC78gCs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-aj1wlr7qObKtYoTynMR65A-1; Mon, 07 Feb 2022 22:37:38 -0500
X-MC-Unique: aj1wlr7qObKtYoTynMR65A-1
Received: by mail-pf1-f197.google.com with SMTP id
 188-20020a6219c5000000b004ce24bef61fso8702698pfz.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8PNgm6F8JAUNyldJJuPxi35EI2Kdp5tmxEQNXEZLO+E=;
 b=8L0OzA7Q1wAwZ6LfxqnAhvFpzRYrvFU+qrsLAVG2z8DNXB5WFVtzvv5bHc9sk2Qa8G
 ak796OcXIJaWRvZ/UaAavRq3BEYuhLpZBss9hwsm6ywUPM15aZG3/0bbfRiS7clekCbw
 VVH73cws3GF5Z5I1rcNIROnRgMdA3PgHcP2W6h6CxN5hMBkHHJuaClztHAS/KebtKO8u
 sNkdGhLW+vX3p0bf7j/ruPLLo4279eysfGhhhK2GtF61O2tnyvAQPN2yTLBehsvFxt5+
 UxzybQifFd8WJPNTcAciaoUd4OgAvr8vv1VIiS68bNpyC6xOp3Qs8Ok/u/VhBvfPEKy2
 zCzg==
X-Gm-Message-State: AOAM5303FtGlT+MogdPS5/SYB5dgaebhjIvyXEjwXua8PN7TeGRyfH11
 Dd32XSDqaLrsEXWqiDHc4aUTiDvsMHGFPgV4i57ZquWacgcB+zgz1a1BsVdgRrAEnJbGP/avoMy
 cNR6put2TeaiDLKk=
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20mr2694533pls.97.1644291457566; 
 Mon, 07 Feb 2022 19:37:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRmqnqpfEsmh3qNV3WKK/wrG+knJHX4sJOn4FpB5tKEtUw3X6q7dXN9SA3MwgiAUJzqMjORQ==
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20mr2694520pls.97.1644291457225; 
 Mon, 07 Feb 2022 19:37:37 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id 76sm9528416pge.93.2022.02.07.19.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 19:37:36 -0800 (PST)
Date: Tue, 8 Feb 2022 11:37:32 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 09/15] migration: Add postcopy_thread_create()
Message-ID: <YgHlfMEKC+feQgPU@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-10-peterx@redhat.com>
 <YfvylA6QEl1YQnKU@work-vm>
MIME-Version: 1.0
In-Reply-To: <YfvylA6QEl1YQnKU@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 03:19:48PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Postcopy create threads. A common manner is we init a sem and use it to sync
> > with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
> > they're only used for this.
> > 
> > Make it a shared infrastructure so it's easier to create yet another thread.
> > 
> 
> It might be worth a note saying you now share that sem, so you can't
> start two threads in parallel.

I'll squash this into the patch:

---8<---
diff --git a/migration/migration.h b/migration/migration.h
index 845be3463c..2a311fd8d6 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -72,7 +72,10 @@ struct MigrationIncomingState {
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
-    /* Used to sync thread creations */
+    /*
+     * Used to sync thread creations.  Note that we can't create threads in
+     * parallel with this sem.
+     */
     QemuSemaphore  thread_sync_sem;
     /*
      * Free at the start of the main state load, set as the main thread finishes
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 099d8ed478..1a3ba1db84 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -79,6 +79,10 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
                                             &pnd);
 }
 
+/*
+ * NOTE: this routine is not thread safe, we can't call it concurrently. But it
+ * should be good enough for migration's purposes.
+ */
 void postcopy_thread_create(MigrationIncomingState *mis,
                             QemuThread *thread, const char *name,
                             void *(*fn)(void *), int joinable)
---8<---

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


