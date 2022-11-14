Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91CD628E34
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik5-0004sK-LL; Mon, 14 Nov 2022 18:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif7-0004Of-Ot
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oub31-0005qd-7o
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438413;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Eb7YwcynS8lmhm2qsqDjRg2GArC3AfMOF2YpLPJGvI4=;
 b=Q1nWik/WxwknZ4UN30cx3CrbIeCWSCB1g6j0YQdLnGg/gZXcPGk3vPpPGwd1seTbSS5Fr5
 QNNVruet8gl3VybgLEG62UWeXUeruSG0vpIPHeQYqvs2sntUuPTstEFbGHpgDbB4w1VL0M
 pOCVNIhpkzwnSl+r3vA5OB5ylBbqa6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-OT7G6qBSM9yvBtlqboeZcA-1; Mon, 14 Nov 2022 10:06:52 -0500
X-MC-Unique: OT7G6qBSM9yvBtlqboeZcA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso2097615wrb.18
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eb7YwcynS8lmhm2qsqDjRg2GArC3AfMOF2YpLPJGvI4=;
 b=X7nS+0y1SYl3fFcW8oWT4bLvvRj10cFhjyhSER783T2R5MnM5K27FhurJOgecCbcs0
 5hKZj9ghXT7O4HTZdlPZMtu/erU7z1ATbbZb8Z5PRHcwVJzTVrUQ9/jIk+rMH4JuPhhc
 y4IcBePk9S5Uo5G2FiJiY64RBxljP63LBn/bR68crJSeCdjKR0eUzMTp/HcZRvLcsiNZ
 +VG2FJLu3h502YGjAD2Uwjz8PJ7nWLUgsGhwdW6sZj3oudoZRKUokR56nuW7EuLqzzON
 z80/FtQFpsWX3bI2V0NnxyCBNyG3l9fI5v7hiIi2ORHa3BRG0wVXvBrhdnRM/RIucoGo
 1+NQ==
X-Gm-Message-State: ANoB5pmvVwCneBLL0HyBkXnJvJ+xsksUZe8zZzaFd6KHynnvytlL/Rzl
 J3RRm0Z9za1vAC51hLn9S16R5ud9g3sqkUm9uJxw078K3cuj0LXaCcRDP8/XFEoOHbgA3JnR+9p
 GirUKZ5fcEU/prrU=
X-Received: by 2002:a05:600c:54c3:b0:3cf:70a0:f689 with SMTP id
 iw3-20020a05600c54c300b003cf70a0f689mr8365742wmb.161.1668438411018; 
 Mon, 14 Nov 2022 07:06:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4u2a8TjbW6IkpEmGsMXwnoO0fFDx+r+qUDmFKLwSg9ZVdI5Ga7MwBbFb//FQZ78Qbex2TPRA==
X-Received: by 2002:a05:600c:54c3:b0:3cf:70a0:f689 with SMTP id
 iw3-20020a05600c54c300b003cf70a0f689mr8365719wmb.161.1668438410763; 
 Mon, 14 Nov 2022 07:06:50 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d6b81000000b0022ac672654dsm9674362wrx.58.2022.11.14.07.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:06:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 01/15] migration: Take bitmap mutex when completing
 ram migration
In-Reply-To: <20221011215559.602584-2-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:45 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:06:48 +0100
Message-ID: <87edu5bmnr.fsf@secure.mitica>
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
> Any call to ram_find_and_save_block() needs to take the bitmap mutex.  We
> used to not take it for most of ram_save_complete() because we thought
> we're the only one left using the bitmap, but it's not true after the
> preempt full patchset applied, since the return path can be taking it too.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


