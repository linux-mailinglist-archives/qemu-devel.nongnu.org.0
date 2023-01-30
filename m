Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871C68055B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMMm-0004A6-JV; Mon, 30 Jan 2023 00:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMMb-00049d-W8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMMa-0000ki-JL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FJ50LAETnNihgYFIypsEfUA7xLXn62Qp6rxo1EIoJV8=;
 b=YRbGoOZnQyIvmhyeSap1EnfnqvEQPX6NzbVKZgP/R4MEW0KiPDRq74h6sbh5IlU7fe2pQi
 Wc6rweej9O2+BxFjDeZbyGLzF9Z3AALEnyWfO6TOZhtMxJZJVv00LseI8kCW/LOyP4xJ9z
 kI7UAbwMcN6fa5KX/WDuxrQkRnWRTXo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395--8Dd1US9MouED3LvMQwUCg-1; Mon, 30 Jan 2023 00:05:50 -0500
X-MC-Unique: -8Dd1US9MouED3LvMQwUCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adff106000000b002bfe5fb9649so491116wro.14
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJ50LAETnNihgYFIypsEfUA7xLXn62Qp6rxo1EIoJV8=;
 b=nsx0Z3oSuICKoXM+KZ3M7IMUTQ7+sHrbXnLReoHr879n6JrgwekIWBfUqh4shUtztF
 Y+yWk6Kgi4ClwRQmFIR0xJjdx5twNbasX0jIrMVzui1R6CTL6kb67Fkg+EGSnBWjBslH
 91+MDwh1i5lcP4mePxwlMa8veAEPGRDelR6peNaDjcNGlzFRazUsFzHKrpnlVNhVpLUS
 Jr3+f9h/j5Os2A3x/CUXIY+BOuclUI359mGbNkOWfvBkzRygUc/7E6RnArSnLphAlHP7
 9+aCp9DwLSS8xmkvoJUTWDie2XWd4X6jgNxkwHDMLKj0XYWwTD/uhVFAcqN81y2CP254
 WnJw==
X-Gm-Message-State: AFqh2kpZvJEbAj71p7pDhJn3xbWJJ10ZGrFplgRqf/psuSJ6685yGx61
 yquO/lap9yNx7P9xe07b02/TaqaLUTsutaE9rdYJGHc21SgqZaHQn4Q24aWIMdBphlSG6P3HpeK
 /4V3fSrOHsjjOZ14=
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr43769603wmq.7.1675055149276; 
 Sun, 29 Jan 2023 21:05:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugiS9qe7r6yHmm0CuMJ6JRU2xb0FkZenn48gAqA/p8q191xWQYRo6hKoSb1DfR9VvRYOo6hw==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr43769591wmq.7.1675055149086; 
 Sun, 29 Jan 2023 21:05:49 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm11067341wmp.46.2023.01.29.21.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:05:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 08/21] ramblock: Cache the length to do file mmap()
 on ramblocks
In-Reply-To: <20230117220914.2062125-9-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:01 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-9-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:05:47 +0100
Message-ID: <878rhkk3x0.fsf@secure.mitica>
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
> We do proper page size alignment for file backed mmap()s for ramblocks.
> Even if it's as simple as that, cache the value because it'll be used in
> multiple places.
>
> Since at it, drop size for file_ram_alloc() and just use max_length because
> that's always true for file-backed ramblocks.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> @@ -2100,7 +2100,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>      new_block->used_length = size;
>      new_block->max_length = size;
>      new_block->flags = ram_flags;
> -    new_block->host = file_ram_alloc(new_block, size, fd, readonly,
> +    new_block->host = file_ram_alloc(new_block, fd, readonly,
>                                       !file_size, offset, errp);
>      if (!new_block->host) {
>          g_free(new_block);

Passing "size" in three places, not bad at all O:-)


