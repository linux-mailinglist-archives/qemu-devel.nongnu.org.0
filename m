Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD16DFEA3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 21:19:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfza-0000ew-Cl; Wed, 12 Apr 2023 15:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmfzP-0000ei-MH
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmfzN-0001fT-EG
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681327120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LBVYMaqsG5ZnbMQIx849fa2We0muJLoORKO06uR3+iM=;
 b=AlIKlvVWwaxx03lg7rR94zRyg5dtLstUj8Da9P63RBM7ehY/mnU5aZMKaNW8Iza+FRZymK
 ir3YykVE0az+dVWsOLV2AcazVVXGu8Ym037qdo6e7Di1o8Mafm/rE7NvpIS7EZLmZyPF2G
 0P0FMmi3NgWq+iyVEuUg5SRVet1BXpY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-LjM7336OMCGU4p-qc3S-oQ-1; Wed, 12 Apr 2023 15:18:39 -0400
X-MC-Unique: LjM7336OMCGU4p-qc3S-oQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l4-20020adfc784000000b002f44a791472so804667wrg.17
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 12:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681327117; x=1683919117;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBVYMaqsG5ZnbMQIx849fa2We0muJLoORKO06uR3+iM=;
 b=i76D+pp//yNLptxaS6NF7+i+xsPp8DGxnvgK5Y5yIYhha+uq3lvoh9IWG23Nt+T3cY
 +LcfW5RAfYbziSmNEuM0aVIiBSq3MI2kuHGEpY2FIyHUDwL7A+N2qCnWiySrcMCmH00k
 db5iZEBl+hn9YhhWE6h4cxiytTl39PcOP2fLiV9dXzaPbtMLa393IssGzx5dNWbNKluj
 a53dhFPi4oIDjbrP5DcxIooNf1vX04fic9xNn/TSOli+QGd5g/G8eTL1+zemic7Zu4yb
 UrMAoZlTdTwfRx7Vie9M/D2AbR74zcAol9cozCCFXyfDk/osdJewer8MTRZYIFWn0y1X
 wlSg==
X-Gm-Message-State: AAQBX9d+j9+UNGwWAhV5FZEDyhsWF88H+JC7ZJJL1GYiW67zYfVBzK1w
 oqWhW7h/jcQvuYbmM/oNmIo9VcrnCANhV7aEiS9pPz5olywVNJcei5OI2llYwjBgWYQMmHpIrUM
 iYwfxefLE5eVXNvg=
X-Received: by 2002:a5d:4942:0:b0:2ef:b137:37fe with SMTP id
 r2-20020a5d4942000000b002efb13737femr10676102wrs.0.1681327116812; 
 Wed, 12 Apr 2023 12:18:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTzJ1yFRegMtmwi9sGvf7AZZ6Pqir93Kd8QLyPCKXmoE3q4JADYe/KagHmB2dFF9wqeEKhgg==
X-Received: by 2002:a5d:4942:0:b0:2ef:b137:37fe with SMTP id
 r2-20020a5d4942000000b002efb13737femr10676092wrs.0.1681327116513; 
 Wed, 12 Apr 2023 12:18:36 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b002c8476dde7asm17844727wrv.114.2023.04.12.12.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:18:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-8.0 2/3] migration: Fix potential race on
 postcopy_qemufile_src
In-Reply-To: <20230326172540.2571110-3-peterx@redhat.com> (Peter Xu's message
 of "Sun, 26 Mar 2023 13:25:39 -0400")
References: <20230326172540.2571110-1-peterx@redhat.com>
 <20230326172540.2571110-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 12 Apr 2023 21:18:34 +0200
Message-ID: <878rewoqnp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> postcopy_qemufile_src object should be owned by one thread, either the main
> thread (e.g. when at the beginning, or at the end of migration), or by the
> return path thread (when during a preempt enabled postcopy migration).  If
> that's not the case the access to the object might be racy.
>
> postcopy_preempt_shutdown_file() can be potentially racy, because it's
> called at the end phase of migration on the main thread, however during
> which the return path thread hasn't yet been recycled; the recycle happens
> in await_return_path_close_on_source() which is after this point.
>
> It means, logically it's posslbe the main thread and the return path thread
> are both operating on the same qemufile.  While I don't think qemufile is
> thread safe at all.
>
> postcopy_preempt_shutdown_file() used to be needed because that's where we
> send EOS to dest so that dest can safely shutdown the preempt thread.
>
> To avoid the possible race, remove this only place that a race can happen.
> Instead we figure out another way to safely close the preempt thread on
> dest.
>
> The core idea during postcopy on deciding "when to stop" is that dest will
> send a postcopy SHUT message to src, telling src that all data is there.
> Hence to shut the dest preempt thread maybe better to do it directly on
> dest node.
>
> This patch proposed such a way that we change postcopy_prio_thread_created
> into PreemptThreadStatus, so that we kick the preempt thread on dest qemu
> by a sequence of:
>
>   mis->preempt_thread_status = PREEMPT_THREAD_QUIT;
>   qemu_file_shutdown(mis->postcopy_qemufile_dst);
>
> While here shutdown() is probably so far the easiest way to kick preempt
> thread from a blocked qemu_get_be64().  Then it reads preempt_thread_status
> to make sure it's not a network failure but a willingness to quit the
> thread.
>
> We could have avoided that extra status but just rely on migration status.
> The problem is postcopy_ram_incoming_cleanup() is just called early enough
> so we're still during POSTCOPY_ACTIVE no matter what.. So just make it
> simple to have the status introduced.
>
> One flag x-preempt-pre-7-2 is added to keep old pre-7.2 behaviors of
> postcopy preempt.
>
> Fixes: 9358982744 ("migration: Send requested page directly in rp-return thread")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/core/machine.c        |  1 +
>  migration/migration.c    | 10 ++++++++--
>  migration/migration.h    | 34 +++++++++++++++++++++++++++++++++-
>  migration/postcopy-ram.c | 20 +++++++++++++++-----
>  4 files changed, 57 insertions(+), 8 deletions(-)
>

As preempt is pretty new I will ....

Reviewed-by: Juan Quintela <quintela@redhat.com>

But code is quite subtle.
queued.


