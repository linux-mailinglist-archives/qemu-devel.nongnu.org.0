Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835C632943
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:18:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9V0-0004SJ-0x; Mon, 21 Nov 2022 11:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox9Uv-0004RE-3M
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox9Ut-0007cr-2k
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669047492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ETzG5NiBaxztGPuhC/VPplUI9WEkw79/a1Nmk6TI7ck=;
 b=SHCGEyUc7skQWo3Cv1iBkyr8XWixBxn98jvaARSqqA89MYl3KHjgo/02RKtVJiGrAjHx7Q
 /496Ab4S0Dt+cn+6LtHOorBG0Ut+u3k7UyN0YWWcbMDXRm8pLxuRANWJvITcBrsMDA52hC
 2UGBGLB7YU9B0VjoGtse6alOqFqGdh8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-xJjU_U4mOkK9dk1GBOrnBA-1; Mon, 21 Nov 2022 11:18:11 -0500
X-MC-Unique: xJjU_U4mOkK9dk1GBOrnBA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h2-20020adfa4c2000000b00241cf936619so1264261wrb.9
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETzG5NiBaxztGPuhC/VPplUI9WEkw79/a1Nmk6TI7ck=;
 b=IRKhxn7gjF2NDToBXYE7cb8mpI3mrtkQk8s4ZOpS6e5BFcGSZxrBiPV5nmjHU5QKzG
 P942F/fY/ShFzr+hzo/pCdmXY3D9LTfM2d6FjFwBhM4BogmTbTbZzxSrA9+wPutW1i76
 F1X3rus2yqPt0FTx+mrGtEIo8920qoRLDUxEGwJT2GS2uLs4J9tPKeYA+C80FPRBevVU
 sCY7WOpPBCKff+VMxWPQu2w8BtCAUksWLh1HGDAzAVYBqXDM5tk/0eO/D9UCgiQJMhMB
 ItoxbrZYs0L3WIg5T3jttc+bkwTbuDS/taD+VtnCVld5vj0ljXafI/CBwoGmeOQp5PnJ
 YdRw==
X-Gm-Message-State: ANoB5pnlAU9hsI8XCHWYVfX+Qyx+XRYo2Lwvsu8KTz0ld+67qzmGW/VH
 24wtavg9rk67ZmvUnVnW73/XdY1OxBYGcbvWaGOa6DSgAGNE7esrs3pSe7Tdw72CidNc7fBghOZ
 oxdctptWXMGCP27yhITKa4KQ11lULSS3bAfjnrb6SBTVRIKg/ETiB2EFPKEFw6cuhQaM=
X-Received: by 2002:a5d:474c:0:b0:234:d495:d3ae with SMTP id
 o12-20020a5d474c000000b00234d495d3aemr4631686wrs.448.1669047489630; 
 Mon, 21 Nov 2022 08:18:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wcx6jXQZgMzHBKzYPA/BoQ2jrIKgAjQSNF/qvPeVPt6y0z0SjRBJ+CEEPsOy+7rrqI7gwag==
X-Received: by 2002:a5d:474c:0:b0:234:d495:d3ae with SMTP id
 o12-20020a5d474c000000b00234d495d3aemr4631659wrs.448.1669047489216; 
 Mon, 21 Nov 2022 08:18:09 -0800 (PST)
Received: from redhat.com (62.117.240.223.dyn.user.ono.com. [62.117.240.223])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a1c4b0f000000b003cf7292c553sm14115058wma.13.2022.11.21.08.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 08:18:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Fam
 Zheng <fam@euphon.net>,  Peter Xu <peterx@redhat.com>,  Michael Tokarev
 <mjt@tls.msk.ru>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,  qemu-trivial@nongnu.org,  Laurent
 Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 00/19] Migration patches for 8.8
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 21 Nov 2022 14:26:58 +0100")
References: <20221121132717.63070-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 21 Nov 2022 17:18:07 +0100
Message-ID: <87wn7ol1s0.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> Based-on:  <20221121125907.62469-1-quintela@redhat.com>

The subject should put 8.0 not 8.8.

Sorry, Juan.

>
> This are the patches that I had to drop form the last PULL request because they werent fixes:
> - AVX2 is dropped, intel posted a fix, I have to redo it
> - Fix for out of order channels is out
>   Daniel nacked it and I need to redo it
>
> Juan Quintela (4):
>   multifd: Create page_size fields into both MultiFD{Recv,Send}Params
>   multifd: Create page_count fields into both MultiFD{Recv,Send}Params
>   migration: Export ram_transferred_ram()
>   migration: Export ram_release_page()
>
> Peter Xu (15):
>   migration: Take bitmap mutex when completing ram migration
>   migration: Add postcopy_preempt_active()
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Use atomic ops properly for page accountings
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread
>   migration: Remove old preempt code around state maintainance
>   migration: Drop rs->f
>
>  migration/migration.h    |   7 -
>  migration/multifd.h      |   8 +
>  migration/ram.h          |  23 ++
>  migration/migration.c    |  47 +--
>  migration/multifd-zlib.c |  14 +-
>  migration/multifd-zstd.c |  12 +-
>  migration/multifd.c      |  27 +-
>  migration/ram.c          | 735 ++++++++++++++++++---------------------
>  8 files changed, 422 insertions(+), 451 deletions(-)


