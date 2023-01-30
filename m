Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B70680584
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMXc-0000BG-MT; Mon, 30 Jan 2023 00:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMXZ-0000Ay-9R
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMXX-0002I1-Ln
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055830;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KvHD6Y3uScvtJYxqSIzK85lO11hGlOoNClITLXCx7V8=;
 b=ZZ+2jMV/pLgG2yCP+SjZt9DoE0yOVhXXlyj0RBsnGhzsuXZMXuthmM3b8Hzke98Sw8Nqo0
 wjsR/wFTH/mqMs3uw+j3qNQKmYEikOixm2BNRODAHQtg2qg1yGmAZPOUGxRVOwg/Qsyerf
 teCg9sTwvJP3s5jdthpej6Ec7qDBxPs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-2LoMcblbOVaRBEmxSFpRIw-1; Mon, 30 Jan 2023 00:17:08 -0500
X-MC-Unique: 2LoMcblbOVaRBEmxSFpRIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso6618697wms.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvHD6Y3uScvtJYxqSIzK85lO11hGlOoNClITLXCx7V8=;
 b=Kz+YU0cbEzSpY6nP3y5juHLlsRJo/vCCpJLkIxL9Kp8zP1pfMRoLtSaqElFLEiapxW
 NihALT7i/6R9Wgh2Alm9MJqtqWwK37FHAKkaA/Dmd2yY/dwgTu8h9jZ2y2//HIlRnIKi
 g/xFKOWGdZ9N5oeBektse0meFpJgOHjjiwiLdW4xPNDnh+v3dQ7GlUk7bR2RLFzfnr87
 xaZeHyPzPCPGvUyoEwCyme867h81B0D3hw27zVRCdSaJhvLEAOQgvviP5E9DkbXR+P+d
 ZG/sQAJoT7jg4olE7IRfJH2Zu8JArlxGi1G3nW754uCtKBA3Cb4kqnQQxMfUHaSDyFOF
 TxrA==
X-Gm-Message-State: AO0yUKXgYn9agby00GbKQM2ZWU0iqcN6Omug1QCLrtO48sYUt8e4IX2O
 Tyavt4DQs+UQaeaofEjPxHBJ+MdGwenkS9ocVCz7NrIn9ZicEgUjX5lPmsLc5fWDJ2OQocaRKma
 7Sa2V+sws2UhTxHc=
X-Received: by 2002:a05:6000:114b:b0:2bf:d3dd:6f65 with SMTP id
 d11-20020a056000114b00b002bfd3dd6f65mr8938270wrx.41.1675055827290; 
 Sun, 29 Jan 2023 21:17:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/a3qy2LgCvobPwFoDfBFh4VjGDloXcQLoxzGbim72u/YZMW0sm0wZIRPao2qMtZl5sE+rcVg==
X-Received: by 2002:a05:6000:114b:b0:2bf:d3dd:6f65 with SMTP id
 d11-20020a056000114b00b002bfd3dd6f65mr8938254wrx.41.1675055827047; 
 Sun, 29 Jan 2023 21:17:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6b47000000b002bbed1388a5sm10746597wrw.15.2023.01.29.21.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:17:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 12/21] migration: Introduce page size
 for-migration-only
In-Reply-To: <20230117220914.2062125-13-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:05 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-13-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:17:05 +0100
Message-ID: <87r0vciotq.fsf@secure.mitica>
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
> Migration may not want to recognize memory chunks in page size of the host
> only, but sometimes we may want to recognize the memory in smaller chunks
> if e.g. they're doubly mapped as both huge and small.
>
> In those cases we'll prefer to assume the memory page size is always mapped
> small (qemu_real_host_page_size) and we'll do things just like when the
> pages was only smally mapped.
>
> Let's do this to be prepared of postcopy double-mapping for hugetlbfs.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>


> ---
>  migration/migration.c    |  6 ++++--
>  migration/postcopy-ram.c | 16 +++++++++-------
>  migration/ram.c          | 29 ++++++++++++++++++++++-------
>  migration/ram.h          |  1 +
>  4 files changed, 36 insertions(+), 16 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index b174f2af92..f6fe474fc3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -408,7 +408,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>  {
>      uint8_t bufc[12 + 1 + 255]; /* start (8), len (4), rbname up to 256 */
>      size_t msglen = 12; /* start + len */
> -    size_t len = qemu_ram_pagesize(rb);
> +    size_t len = migration_ram_pagesize(rb);
>      enum mig_rp_message_type msg_type;
>      const char *rbname;
>      int rbname_len;
> @@ -443,8 +443,10 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>  int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>                                RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>  {
> -    void *aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, qemu_ram_pagesize(rb));
>      bool received = false;
> +    void *aligned;
> +
> +    aligned = (void *)(uintptr_t)ROUND_DOWN(haddr, migration_ram_pagesize(rb));

I am trying that all new code declares variables at 1st use, and this
goes in the wrong direction.  As this happens more than once in this
patch, can we change the macro (or create another macro) that also does
the cast?


