Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FD6F8523
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwtt-0002Bt-Os; Fri, 05 May 2023 10:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puwts-0002BK-6q
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puwtq-00052O-MX
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683298750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgkEGmlVc6UJiRF4K0/327cN10RFKpOHIfP3lqQ4DEo=;
 b=Ty0DKt1fu4YdODN+DLX7wJ7XuZd9cKH7NXYjCA/1fjxZYANl5S3Wi13tmoM6zHKYpmu82y
 fpYNVq9eZY5fn7SV9ObDMub7PIMGNfLRMAUTRDAWWBdF7Fzp8JuUMBx1JJYlWW5cSOYNR+
 5Pzj0EYehQXYxURHF5TsDlSa/kUwcEQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-4BCnrX9pM2ay_Bx8Qqc_6A-1; Fri, 05 May 2023 10:59:09 -0400
X-MC-Unique: 4BCnrX9pM2ay_Bx8Qqc_6A-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so4214011cf.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 07:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683298748; x=1685890748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgkEGmlVc6UJiRF4K0/327cN10RFKpOHIfP3lqQ4DEo=;
 b=gCqEyL4nRKz0/J7NkxNMeGbFXDr5FUbc8Y2quEIr0IR2zKEaC0CabGYqMom2PZmpT8
 nalDUxAI8OZe69qkQ1ApnEkJ1iFZezjeIcmfec1Ft7gIWK+N3h1/ZuyHQyTSVm5xdF7/
 Pf+bvXpDiudcTFMTbmmx0W+KGUyqP1EswzcImkrnb022iAvnxSqgzXRZHpa504TDQQk9
 9zgxoHXZCUsQ/NSoLt5EPkYbo9vdrX0HBXurqE7EZw0S1X4NOI1QxruLqR6ReFjuJ8/L
 Kv1Z7h1QMa36f/ohGgfZYvW9kiwUHQ1oq7pZ2qShI1+y/ZYnTm9/h0/7gYOKdimCQLs8
 4JcQ==
X-Gm-Message-State: AC+VfDzz6bUNzik2UGG+dnNOBw12EGTDCzpWgF/ta1CoGxaSEXmmT6mX
 BHUy7PxaXesqsu7dsfQ6T2Hf3+0Ekesch2sYP7+l7gE1jA7LJrLO+7KZIqPgrv1J6fGxmiCQKHj
 QjUl59l55D2AmVdA=
X-Received: by 2002:a05:622a:19a8:b0:3ef:4614:d0e9 with SMTP id
 u40-20020a05622a19a800b003ef4614d0e9mr2743884qtc.5.1683298748481; 
 Fri, 05 May 2023 07:59:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/s+u5TT2Z9jg321NuCdETeOMrrodl3ULFIGZP/VTNAfk9yz/7kZseZXwrkVfI8atnQaZfig==
X-Received: by 2002:a05:622a:19a8:b0:3ef:4614:d0e9 with SMTP id
 u40-20020a05622a19a800b003ef4614d0e9mr2743868qtc.5.1683298748254; 
 Fri, 05 May 2023 07:59:08 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05620a034800b0074ca7c33b79sm648184qkm.23.2023.05.05.07.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 07:59:07 -0700 (PDT)
Date: Fri, 5 May 2023 10:59:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, leobras@redhat.com,
 eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
 stefanha@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 pbonzini@redhat.com, t.lamprecht@proxmox.com
Subject: Re: [PATCH] migration: for snapshots, hold the BQL during setup
 callbacks
Message-ID: <ZFUZuiubiReBGucl@x1n>
References: <20230505134652.140884-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505134652.140884-1-f.ebner@proxmox.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 05, 2023 at 03:46:52PM +0200, Fiona Ebner wrote:
> To fix it, ensure that the BQL is held during setup. To avoid changing
> the behavior for migration too, introduce conditionals for the setup
> callbacks that need the BQL and only take the lock if it's not already
> held.

The major complexity of this patch is the "conditionally taking" part.

Pure question: what is the benefit of not holding BQL always during
save_setup(), if after all we have this coroutine issue to be solved?

I can understand that it helps us to avoid taking BQL too long, but we'll
need to take it anyway during ramblock dirty track initializations, and so
far IIUC it's the major time to be consumed during setup().

Commit message of 9b0950375277467 says, "Only the migration_bitmap_sync()
call needs the iothread lock". Firstly I think it's also covering
enablement of dirty tracking:

+    qemu_mutex_lock_iothread();
+    qemu_mutex_lock_ramlist();
+    bytes_transferred = 0;
+    reset_ram_globals();
+
     memory_global_dirty_log_start();
     migration_bitmap_sync();
+    qemu_mutex_unlock_iothread();

And I think enablement itself can be slow too, maybe even slower than
migration_bitmap_sync() especially with KVM_DIRTY_LOG_INITIALLY_SET
supported in the kernel.

Meanwhile I always got confused on why we need to sync dirty bitmap when
setup at all.  Say, what if we drop migration_bitmap_sync() here?  After
all, shouldn't all pages be dirty from start (ram_list_init_bitmaps())?

This is slightly off-topic, but I'd like to know if someone can help
answer.

My whole point is still questioning whether we can unconditionally take bql
during save_setup().

I could have missed something, though, where we want to do in setup() but
avoid holding BQL.  Help needed on figuring this out (and if there is, IMHO
it'll be worthwhile to put that into comment of save_setup() hook).

Thanks,

-- 
Peter Xu


