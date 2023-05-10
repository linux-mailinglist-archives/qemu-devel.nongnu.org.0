Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B86FD706
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:32:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdMJ-0005Yg-Js; Wed, 10 May 2023 02:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwdMB-0005YO-56
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwdM9-0001RY-GN
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683700278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TsMLHSDiB2cGqT8TT6YANptWfni52U64TGKWa3d+SHA=;
 b=ijeaG5jz+rvpE+IkUI0YSdmrazNXY09wxmql8df/d9n75BMZr5NAXhqTXAdi9QTqqOVBKP
 2bW2BMr9czatq0YV+DDgvgU4wretL1fAZnt0Ye9ryVTm1ShzRIffn6yrB/CP00qoHJORON
 rPlvC0nO0XKcFT6a03A92B1iUMOXhnQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-kyUaVunHOgaAOA0OGUIpCA-1; Wed, 10 May 2023 02:31:17 -0400
X-MC-Unique: kyUaVunHOgaAOA0OGUIpCA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3063a78f8a4so2348074f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683700275; x=1686292275;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsMLHSDiB2cGqT8TT6YANptWfni52U64TGKWa3d+SHA=;
 b=IkX88C0ZuwSvPgdRZ7SKsyLe24xlgXag0/RD3Gcn2mndsm0XWYr9JAccsumZwGOSTd
 W/nG4kyAHI/t6d8CLfLbiPeCa7v3snIO4NwVQBRMdCWecxLsbjXFWgBxEXtgtvrg8phS
 cvGJTMIeqD/zkOaadf2X2zCKpjW6iLRU1leTcr1LZ35BbCk35TVcXHVKhM9ngYD8wVVP
 Sm93Q4kGlCfsGYBmgwJjo6mNVLHLaWb66Df6vT1J26Hr3JJm3tDwNNxk6xRIgRRqQx73
 W5asQbINlSq8birBnuFQsQh0J/TZS0Ze8X1/aOQJNNrYuAvasF9eDbu0mc45Bd44W2aH
 kgaQ==
X-Gm-Message-State: AC+VfDzrQpJcttpQ574n76uGUlgn4XTrLrLgOeon1zJsWCGW6XyKvjt4
 hnwYTVJUEhmEr4LlRqswS+TuVBKKRezkFNSm9Jl21rIZMFKINq0KJzzWGYKlUav5ov3vvmqoQDO
 KSjfnkx4YYQzOAVo=
X-Received: by 2002:adf:f452:0:b0:306:8477:85d0 with SMTP id
 f18-20020adff452000000b00306847785d0mr11421823wrp.33.1683700275512; 
 Tue, 09 May 2023 23:31:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5XoSTloUc2wo7LbvbiLo8xO4Wy3iQz8eWQ3qkStHksCQANcHVbhfNHHMgzi0GBCcijGftgaw==
X-Received: by 2002:adf:f452:0:b0:306:8477:85d0 with SMTP id
 f18-20020adff452000000b00306847785d0mr11421803wrp.33.1683700275186; 
 Tue, 09 May 2023 23:31:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b003012030a0c6sm16174156wrm.18.2023.05.09.23.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 23:31:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>,  qemu-devel@nongnu.org,
 leobras@redhat.com,  eblake@redhat.com,  vsementsov@yandex-team.ru,
 jsnow@redhat.com,  stefanha@redhat.com,  fam@euphon.net,
 qemu-block@nongnu.org,  pbonzini@redhat.com,  t.lamprecht@proxmox.com,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] migration: for snapshots, hold the BQL during setup
 callbacks
In-Reply-To: <ZFUZuiubiReBGucl@x1n> (Peter Xu's message of "Fri, 5 May 2023
 10:59:06 -0400")
References: <20230505134652.140884-1-f.ebner@proxmox.com>
 <ZFUZuiubiReBGucl@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 08:31:13 +0200
Message-ID: <87v8h0aea6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Peter Xu <peterx@redhat.com> wrote:

Hi

[Adding Kevin to the party]

> On Fri, May 05, 2023 at 03:46:52PM +0200, Fiona Ebner wrote:
>> To fix it, ensure that the BQL is held during setup. To avoid changing
>> the behavior for migration too, introduce conditionals for the setup
>> callbacks that need the BQL and only take the lock if it's not already
>> held.
>
> The major complexity of this patch is the "conditionally taking" part.

Yeap.

I don't want that bit.

This is another case of:
- I have a problem
- I will use recursive mutexes to solve it

Now you have two problems O:-)

> Pure question: what is the benefit of not holding BQL always during
> save_setup(), if after all we have this coroutine issue to be solved?

Dunno.

I would like that paolo commented on this.  I "reviewed the code" 10
years ago.  I don't remember at all why we wanted to change that.

> I can understand that it helps us to avoid taking BQL too long, but we'll
> need to take it anyway during ramblock dirty track initializations, and so
> far IIUC it's the major time to be consumed during setup().
>
> Commit message of 9b0950375277467 says, "Only the migration_bitmap_sync()
> call needs the iothread lock". Firstly I think it's also covering
> enablement of dirty tracking:
>
> +    qemu_mutex_lock_iothread();
> +    qemu_mutex_lock_ramlist();
> +    bytes_transferred = 0;
> +    reset_ram_globals();
> +
>      memory_global_dirty_log_start();
>      migration_bitmap_sync();
> +    qemu_mutex_unlock_iothread();
>
> And I think enablement itself can be slow too, maybe even slower than
> migration_bitmap_sync() especially with KVM_DIRTY_LOG_INITIALLY_SET
> supported in the kernel.
>
> Meanwhile I always got confused on why we need to sync dirty bitmap when
> setup at all.  Say, what if we drop migration_bitmap_sync() here?  After
> all, shouldn't all pages be dirty from start (ram_list_init_bitmaps())?

How do you convince KVM (or the other lists) to start doing dirty
tracking?  Doing a bitmap sync.

And yeap, probably there is a better way of doing it.

> This is slightly off-topic, but I'd like to know if someone can help
> answer.
>
> My whole point is still questioning whether we can unconditionally take bql
> during save_setup().

I agree with you.

> I could have missed something, though, where we want to do in setup() but
> avoid holding BQL.  Help needed on figuring this out (and if there is, IMHO
> it'll be worthwhile to put that into comment of save_setup() hook).

I am more towards revert completely
9b0950375277467fd74a9075624477ae43b9bb22

and call it a day.  On migration we don't use coroutines on the sending
side (I mean the migration code, the block layer uses coroutines for
everything/anything).

Paolo, Stefan any clues for not run setup with the BKL?

Later, Juan.


