Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9934431F3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:42:46 +0100 (CET)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvvx-0001rV-S0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhvi4-00062h-4y
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:28:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhvhy-0000qZ-Lm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635866897;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0k968UGRNVBDzk5JTC5MQQJBN6rP6Xm5d8f5lamORjM=;
 b=JrHx/g7br4514cCm57V/hdy+1Ju/opLeHKeMA7OsH/BaRe1gM2IMGwHOI8GrC7vqL15Wng
 5p3RL7SUEcJVpSQiVhjDxU+dPlIz73L3ZjXb0857Ip9OVdTwtCDl5lvtQKW1cOKl7CO6ZJ
 TWzTUWUuu4IQGEzvYLwwxM/MZIRCMZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-poglFL_nOMmT80KJ4lzwdw-1; Tue, 02 Nov 2021 11:28:16 -0400
X-MC-Unique: poglFL_nOMmT80KJ4lzwdw-1
Received: by mail-wr1-f72.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso7590921wru.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=0k968UGRNVBDzk5JTC5MQQJBN6rP6Xm5d8f5lamORjM=;
 b=IfGLQpKv+LrG1vtI9mPbJTeZJrRDIdY4mC56kScM53qFH4DKd7+00gHUAZ3jBt6px0
 jy1T8Ql7SUXwrbVRqHvLKjMz0ELKMrIJgXmTR4TPWU/oRYSL9hVZTxHu2VfJWorWnj+c
 a+zKGHxncTuEXk9QMBJ9vlbjmxFwGgh24H2dzj9ABBN2YZBDXzdYKHfPYFYdgRz2Bdk5
 i+ucA5LM7/toY7dB9Mn4yAwMaYTLSnSJgGetagOvwHqqmW8llDdzJbvTJ6LGGSXAOiZo
 Q293YVkqMkmWca38n34MK9bvf5KWaMinx4zbbgZC+A/2HLGAdjqPEjZY08AC8gTk4/11
 EKTg==
X-Gm-Message-State: AOAM530MfwhvzFiDPhIM6GVnnsqpdl2OtnLbYZpiPSAadPTGIbhHM+sc
 CzaaOThkWbbfTfnlRMQS7HKltRHF61LFqpVZzbtnpZqP5gRbK67n2/Uu0BM6Rb3iWI/3m4j0yqz
 D8Lb8lwuso60iknk=
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr7814260wml.0.1635866894994; 
 Tue, 02 Nov 2021 08:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Lzv5Ey7MgwgKo/XAy1gLtK7wxTYSYO4hBLFlHwuSMMZrjRuon57I04JTRVbB7sDIjzoaOw==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr7814235wml.0.1635866894791; 
 Tue, 02 Nov 2021 08:28:14 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id l18sm3641209wrt.81.2021.11.02.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 08:28:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
In-Reply-To: <20211102110043-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 2 Nov 2021 11:04:55 -0400")
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 16:28:13 +0100
Message-ID: <87lf26inle.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
>> As the guest OS is paused, we will never receive the unplug event
>> from the kernel and the migration cannot continue.
>> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>
> Well ... what if user previously did
>
> pause
> start migration
> unpause
>
> we are breaking it now for no good reason.

No.  we are canceling the migration.  Migration can not finish on that
state.  We are inside the test:

      if (migration_in_setup(s) && !should_be_hidden) {

If you don't have any really weird setup[1], migration setup just takes
milliseconds (low units for small guest, and 200-300ms for really huge
ones).

So I still think this is right.


1: Weird here means things like RDMA, locking all the memory of one
   guest can take forever.  To get an idea about this, until we
   introduce RDMA, we didn't meassured the setup stage time, because it
   was so small that it didn't matter at all.

Unplug from guest is other operation that can take quite a long time,
because it depends on guest cooperation.

> Further, how about
>
> start migration
> pause
>
> are we going to break this too? by failing pause?

I haven't thougth about this one, but it shouldn't matter (famous last
words), beacuse there are to cases:

- migration has started and unplug has already finished, no problem.

- migration has started but we haven't yet arrived to
  virtio_net_handle_migration_primary().  We are paused, and we give the
  guest a good error message about why are we failing.  notice that
  migration can't finish anyways, it would stuck there forever waiting
  for the (stopped guest to unplug the device).

So the only case that I can see that *could* matter is:

- start migration
- pause the guest
   this implies pausing the migration
- unpause
   at this point we can continue the migration

do we really care about this scenary?

I think not, because the migration has advanced so few, that starting
from zero would be the best option anyways.

Later, Juan.

PD1: No, I am not sure what happens if you run "pause" after the event
     to guest is sent, but before that the guest finish the unplug (I
     guess it would stall).  But in this case, we are doing something at
     least fishy.  On the other hand, we know that "pause; migration"
     will never really work.

PD2: Perhaps we could "invet" another state that means:
IN_SETUP_AND_WE_CANT_BE_PAUSED, and change it between we ask for the
device to unplug, and that it unplugs.  But it looks really complicated.


