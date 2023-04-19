Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C944B6E820B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:44:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDhv-0006z6-8s; Wed, 19 Apr 2023 15:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDhr-0006xM-GE
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDhp-0003qM-8m
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681933383;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3NEkSY6jm1r/ZalW1BU9sPwN+blcLUGvp/1o1J/QIKs=;
 b=d7+sYHceV0Nigmrymrb1dfO2JS8gP3ovAta+uTZrkgQ8VGDTfeGWLhvubLjDQ6SZNC6EdG
 gGdC52xHEd9vDQfAmqMRLB990JCn5wj2CQ7nVTSvkn6umnNGxGktlMWkP5N4kbvdUpIxEG
 f66vG5KrueQ+psWxNWkK/oO3xeJJJuA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-UchymLk5Mk-R88db0jQO5A-1; Wed, 19 Apr 2023 15:43:02 -0400
X-MC-Unique: UchymLk5Mk-R88db0jQO5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f443ca3357so11696f8f.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681933381; x=1684525381;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3NEkSY6jm1r/ZalW1BU9sPwN+blcLUGvp/1o1J/QIKs=;
 b=G0XYGnpOoNqAUq5H2vkbS9BEkAhSHoZ2jtHO3TgUjgAAVl545AS8yMcO8q8oRkm88f
 5/s2sm4fsG6G/bKrM33N6qNRrRAmfzYBamYT0IxBf0F07yFTQRlNvbBAuhkEN2rsLgAj
 FXt6dCbtJ2ahdBMklWpq7c6XOlu+ufQ0XawJOH5v5+a303uCN6LdW+4HRjNlYdQ9++PL
 NkYOvPflu9mk+6ZSiwt/zpLf3JsFXlhTYilwgAAlnCDv+r3BCEEC8dSP/jG2rfRdWpQ+
 Axsu5vdav1ELpVmP4e9Vg/jYX2i1iR6GWYfjhr5SYxaTFoLUF/WrEDvQ3IDsiGaGT2No
 fKtg==
X-Gm-Message-State: AAQBX9cIe2ybRRbNzlloVMprCTdiTN5XupA04s90mimSIFqdKmFlpEZ4
 4xTnsm1q1cBHp2FgV4JCeDuP7xIUvgtKMHyWvkcJ+wMkVQU5JxFkiAeOA3L3lK6cbMThVItcdT9
 TH0k6m+6uv6RdqBU=
X-Received: by 2002:adf:e84d:0:b0:2f2:542a:6f50 with SMTP id
 d13-20020adfe84d000000b002f2542a6f50mr5810095wrn.56.1681933380646; 
 Wed, 19 Apr 2023 12:43:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350bn0Tw+uAksJpznYI1DCwZr+d617YdYtM09dIjPa2dlqQI1Y5y/aX0Io4gNLzgK1sKkVKaLDQ==
X-Received: by 2002:adf:e84d:0:b0:2f2:542a:6f50 with SMTP id
 d13-20020adfe84d000000b002f2542a6f50mr5810093wrn.56.1681933380345; 
 Wed, 19 Apr 2023 12:43:00 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c211300b003f17a00c214sm3054433wml.16.2023.04.19.12.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:42:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>,  David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 3/4] migration/postcopy: Detect file system on dest host
In-Reply-To: <20230419161739.1129988-4-peterx@redhat.com> (Peter Xu's message
 of "Wed, 19 Apr 2023 12:17:38 -0400")
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 21:42:58 +0200
Message-ID: <87354v1wvx.fsf@secure.mitica>
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
> Postcopy requires the memory support userfaultfd to work.  Right now we
> check it but it's a bit too late (when switching to postcopy migration).
>
> Do that early right at enabling of postcopy.
>
> Note that this is still only a best effort because ramblocks can be
> dynamically created.  We can add check in hostmem creations and fail if
> postcopy enabled, but maybe that's too aggressive.
>
> Still, we have chance to fail the most obvious where we know there's an
> existing unsupported ramblock.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> -static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
> +static int test_ramblock_postcopiable(RAMBlock *rb)

This should return a bool, right?
Notice that it was already there, just noticing.

>  {
>      const char *block_name = qemu_ram_get_idstr(rb);
>      ram_addr_t length = qemu_ram_get_used_length(rb);
>      size_t pagesize = qemu_ram_pagesize(rb);
> +    QemuFsType fs;

You can move the variable definition to the only block that it is used.

>      if (length % pagesize) {
>          error_report("Postcopy requires RAM blocks to be a page size multiple,"
> @@ -348,6 +350,15 @@ static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
>                       "page size of 0x%zx", block_name, length, pagesize);
>          return 1;
>      }
> +
> +    if (rb->fd >= 0) {
> +        fs = qemu_fd_getfs(rb->fd);

Minor nit: Seeing it in use, I wonder if it is clearer to name the function:

qemu_fd_get_filesystem(fd)

> +        if (fs != QEMU_FS_TYPE_TMPFS && fs != QEMU_FS_TYPE_HUGETLBFS) {
> +            error_report("Host backend files need to be TMPFS or HUGETLBFS only");

I think that the "only" is not needed on that error message.

> +            return 1;
> +        }
> +    }
> +
>      return 0;
>  }
>  
> @@ -366,6 +377,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>      struct uffdio_range range_struct;
>      uint64_t feature_mask;
>      Error *local_err = NULL;
> +    RAMBlock *block;
>  
>      if (qemu_target_page_size() > pagesize) {
>          error_report("Target page size bigger than host page size");
> @@ -390,9 +402,23 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>          goto out;
>      }
>  
> -    /* We don't support postcopy with shared RAM yet */
> -    if (foreach_not_ignored_block(test_ramblock_postcopiable, NULL)) {
> -        goto out;
> +    /*
> +     * We don't support postcopy with some type of ramblocks.
> +     *
> +     * NOTE: we explicitly ignored ramblock_is_ignored() instead we checked
> +     * all possible ramblocks.  This is because this function can be called
> +     * when creating the migration object, during the phase RAM_MIGRATABLE
> +     * is not even properly set for all the ramblocks.
> +     *
> +     * A side effect of this is we'll also check against RAM_SHARED
> +     * ramblocks even if migrate_ignore_shared() is set (in which case
> +     * we'll never migrate RAM_SHARED at all), but normally this shouldn't
> +     * affect in reality, or we can revisit.
> +     */

I think we can tweak the English of that two paragraphs.

> +    RAMBLOCK_FOREACH(block) {
> +        if (test_ramblock_postcopiable(block)) {
> +            goto out;
> +        }
>      }
>  
>      /*

In the big scheme of things, patch is ok for me.

Later, Juan.


