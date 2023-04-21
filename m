Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E56EB48B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:16:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppz2f-00048l-JF; Fri, 21 Apr 2023 18:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppz2d-00047V-KX
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppz2b-00031L-QM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682115341;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQ21rUsrli879HjhqHv6PUcU6A0eUwM52l08XtEHko0=;
 b=Rfssq0W02eeaXh9hcybCcIY2A/UaZvDepln8SGd8etaorPKdT8ANnEDduxtLQwN9mbPe/w
 058Q7TUa6V2mDFp94amHPAYI8qwxgBUH/DTx1bGvDrwkL7TCJDHotufmf7Fjs+IWxd1EGw
 jCgFr0YldLZydZrZNRM5GAAtIoTtKcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-au5mDENOMH-6PuC-vCdiUg-1; Fri, 21 Apr 2023 18:15:39 -0400
X-MC-Unique: au5mDENOMH-6PuC-vCdiUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so12770155e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115338; x=1684707338;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ21rUsrli879HjhqHv6PUcU6A0eUwM52l08XtEHko0=;
 b=TdJKJYrKvrDhs55Kb1KbYPu5LJf9qrvmHwlPQ8JRRkAsOPD0/bqauc9OvOcetbXbkx
 spY2Y+Yr/4uo9doKPk5XTg2Q5gkWMM1M5Z5jB1Yt6RjfrhN4uztb9uslr7ZIp/sWXN8m
 kiLKi5rpdmcfFyntdmBx+kCSzaqzn3GHuSxRMXwvqSIg1PkX9KC9Zyd9aeW3modk+bUg
 43dXzbdgUysK1Oyw4pUjgdWvfdzPKYOlNM2dFN7yMZgahhjUV35l0mTNKH2T3RtkQWth
 q68bGwTsszVSJVlhmv33vIL0ixsahiqFYJd7a3LjDOmCslwx3p1Z6z9/tD7/In//ywTS
 uk4A==
X-Gm-Message-State: AAQBX9fWg8hxVzqrtnLdetc1kvhQTj38pWXcmf8O0uXpzYz71gUFE/T2
 iu90Bd2gI7S80seZ7cd8A9yXyhlDyVfrPxVr6gAxF/JZyxFK53szLIiU8CvAVmUyoVKRUIktQQP
 fK6e/34XeVR2xW0Y=
X-Received: by 2002:a1c:e901:0:b0:3f1:7bac:d411 with SMTP id
 q1-20020a1ce901000000b003f17bacd411mr2857732wmc.39.1682115338694; 
 Fri, 21 Apr 2023 15:15:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zk2sT1a9RbP8sBgIL0GvB7/TMfovYPlmxVfzXvU+6mrfmUqB2/V4gSlVbYbZsD1umhWGZmIQ==
X-Received: by 2002:a1c:e901:0:b0:3f1:7bac:d411 with SMTP id
 q1-20020a1ce901000000b003f17bacd411mr2857719wmc.39.1682115338371; 
 Fri, 21 Apr 2023 15:15:38 -0700 (PDT)
Received: from redhat.com ([31.4.212.142]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003f173419e7asm5808715wmf.43.2023.04.21.15.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 15:15:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 5/6] tests/qtest: massively speed up migration-tet
In-Reply-To: <20230421171411.566300-6-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Fri, 21 Apr 2023 18:14:10
 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-6-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 22 Apr 2023 00:15:34 +0200
Message-ID: <87bkjgg9vd.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The migration test cases that actually exercise live migration want to
> ensure there is a minimum of two iterations of pre-copy, in order to
> exercise the dirty tracking code.
>
> Historically we've queried the migration status, looking for the
> 'dirty-sync-count' value to increment to track iterations. This was
> not entirely reliable because often all the data would get transferred
> quickly enough that the migration would finish before we wanted it
> to. So we massively dropped the bandwidth and max downtime to
> guarantee non-convergance. This had the unfortunate side effect
> that every migration took at least 30 seconds to run (100 MB of
> dirty pages / 3 MB/sec).
>
> This optimization takes a different approach to ensuring that a
> mimimum of two iterations. Rather than waiting for dirty-sync-count
> to increment, directly look for an indication that the source VM
> has dirtied RAM that has already been transferred.
>
> On the source VM a magic marker is written just after the 3 MB
> offset. The destination VM is now montiored to detect when the
> magic marker is transferred. This gives a guarantee that the
> first 3 MB of memory have been transferred. Now the source VM
> memory is monitored at exactly the 3MB offset until we observe
> a flip in its value. This gives us a guaranteed that the guest
> workload has dirtied a byte that has already been transferred.
>
> Since we're looking at a place that is only 3 MB from the start
> of memory, with the 3 MB/sec bandwidth, this test should complete
> in 1 second, instead of 30 seconds.
>
> Once we've proved there is some dirty memory, migration can be
> set back to full speed for the remainder of the 1st iteration,
> and the entire of the second iteration at which point migration
> should be complete.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Hi

I think this is not enough.  As said before:
- xbzrle needs 3 iterations
- auto converge needs around 12 iterations (forgot) the exact number,
  but it is a lot.
- for (almost) all the rest of the tests, we don't really care, we just
  need the migration to finish.

One easy way to "test" it is: Change the "meaning" of ZERO downtime to
mean that we don't want to enter the completion stage, just continue
sending data.

Changig this in qemu:

modified   migration/migration.c
@@ -2726,6 +2726,9 @@ static MigIterateState migration_iteration_run(Migrat=
ionState *s)
=20
     trace_migrate_pending_estimate(pending_size, must_precopy, can_postcop=
y);
=20
+    if (s->threshold_size =3D=3D 0) {
+        return MIG_ITERATE_RESUME;
+    }
     if (must_precopy <=3D s->threshold_size) {
         qemu_savevm_state_pending_exact(&must_precopy, &can_postcopy);
         pending_size =3D must_precopy + can_postcopy;

And just setting the downtime to zero should be enough.

It is too late, so before I start with this, what do you think?

Later, Juan.


