Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8D544C4D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:41:00 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHT9-00026D-H7
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzFKj-0008Fw-Fu
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:24:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzFKg-000123-5L
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654770245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7V/Vx2owmsDDg/rrD9HA4FLWZThlPOJmUc7ZYMkJ1g=;
 b=NaA9LZ+cG/3Xln+9q0xPRPtJW9065MVEFYu9NQsINpLSuvixv/grDKfX3ygvZ/MnU6yeLT
 c/SahpfahCaeiyO3F5J5/UsLosg9KLsusiOs3LtuC2MFWFrlyYKbYTD/gLxqHSQ3MpygH/
 /bUCC7kh30POvsowkaneS3Y8+z9xU54=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-Z8zA88LuN1aegVX_E5IPog-1; Thu, 09 Jun 2022 06:24:04 -0400
X-MC-Unique: Z8zA88LuN1aegVX_E5IPog-1
Received: by mail-wr1-f69.google.com with SMTP id
 t2-20020adfe442000000b002108370e7a3so5404161wrm.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=E7V/Vx2owmsDDg/rrD9HA4FLWZThlPOJmUc7ZYMkJ1g=;
 b=i6VMRiIM6S8Spd54ixAeqih+0Cu43BPrbxN5QoZZZmi53hv4imMaTDn9kH5TtasM3M
 tgH97JU61SNc1Uq/IbzfDK0oTjglEtr7+teDMR+pZ14fujBIUoO/reKNbtU41KYVe8D7
 S/fVkA4WCOHpVjLlsmXX1PLiEjyuiYf2eqhKLx8/NftGlGqAtcTCoGn60hT5YvGDFGta
 bxV018AGyz9au/SLsrBigazLiICNZU5SLqJNFMMzbxVpK5Rt3ulq8nsJXW42sY3sCJRD
 hdrpOjksnR8sR1BsnU6lZ+P6mo9+DA6wh+Z83kd+HiRwqP8BIaVXZyNw00SuquSklzp9
 p0gA==
X-Gm-Message-State: AOAM533ogrKQVFfufXZuvaK+54D93TtWkC+x1yNrLOzqt5RZxfR3sKZ0
 QTD8fkr0KXtWhB891WAbiRYHknUXMdjuepMcvlAaLTOiATJhVjw5G3sVYOGULca6f8w0vkYlh1K
 hRbUYfwuSdhryl9c=
X-Received: by 2002:a05:600c:3593:b0:39c:3162:acf8 with SMTP id
 p19-20020a05600c359300b0039c3162acf8mr2573315wmq.64.1654770243265; 
 Thu, 09 Jun 2022 03:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYcV16/G2uYcug6EVetdfqUIQvn48+v6Q8yH4zX3d27P51NzMMmg9/gMAV8puKydBFxvr8fg==
X-Received: by 2002:a05:600c:3593:b0:39c:3162:acf8 with SMTP id
 p19-20020a05600c359300b0039c3162acf8mr2573278wmq.64.1654770242835; 
 Thu, 09 Jun 2022 03:24:02 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm26899733wmk.35.2022.06.09.03.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 03:24:02 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:23:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 06/20] migration: rename qemu_ftell to
 qemu_file_total_transferred
Message-ID: <YqHKP8gSqIU/2tEn@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-7-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-7-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The name 'ftell' gives the misleading impression that the QEMUFile
> objects are seekable. This is not the case, as in general we just
> have an opaque stream. The users of this method are only interested
> in the total bytes processed. This switches to a new name that
> reflects the intended usage.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Mostly,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Two nits below:

> ---
>  migration/block.c     | 10 +++++-----
>  migration/migration.c |  2 +-
>  migration/qemu-file.c |  4 ++--
>  migration/qemu-file.h | 40 ++++++++++++++++++++++++++++++++++++++--
>  migration/savevm.c    |  6 +++---
>  migration/vmstate.c   |  4 ++--
>  6 files changed, 51 insertions(+), 15 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index 077a413325..823453c977 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -756,8 +756,8 @@ static int block_save_setup(QEMUFile *f, void *opaque)
>  static int block_save_iterate(QEMUFile *f, void *opaque)
>  {
>      int ret;
> -    int64_t last_ftell = qemu_ftell(f);
> -    int64_t delta_ftell;
> +    int64_t last_bytes = qemu_file_total_transferred(f);
> +    int64_t delta_bytes;
>  
>      trace_migration_block_save("iterate", block_mig_state.submitted,
>                                 block_mig_state.transferred);
> @@ -809,10 +809,10 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
>      }
>  
>      qemu_put_be64(f, BLK_MIG_FLAG_EOS);
> -    delta_ftell = qemu_ftell(f) - last_ftell;
> -    if (delta_ftell > 0) {
> +    delta_bytes = qemu_file_total_transferred(f) - last_bytes;
> +    if (delta_bytes > 0) {
>          return 1;
> -    } else if (delta_ftell < 0) {
> +    } else if (delta_bytes < 0) {
>          return -1;
>      } else {
>          return 0;
> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..ab1e9610ef 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3544,7 +3544,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>  /* How many bytes have we transferred since the beginning of the migration */
>  static uint64_t migration_total_bytes(MigrationState *s)
>  {
> -    return qemu_ftell(s->to_dst_file) + ram_counters.multifd_bytes;
> +    return qemu_file_total_transferred(s->to_dst_file) + ram_counters.multifd_bytes;

I think that's hit line length limits.

>  }
>  
>  static void migration_calculate_complete(MigrationState *s)
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index b21da4c5bf..664ac77067 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -657,7 +657,7 @@ int qemu_get_byte(QEMUFile *f)
>      return result;
>  }
>  
> -int64_t qemu_ftell_fast(QEMUFile *f)
> +int64_t qemu_file_total_transferred_fast(QEMUFile *f)
>  {
>      int64_t ret = f->total_transferred;
>      int i;
> @@ -669,7 +669,7 @@ int64_t qemu_ftell_fast(QEMUFile *f)
>      return ret;
>  }
>  
> -int64_t qemu_ftell(QEMUFile *f)
> +int64_t qemu_file_total_transferred(QEMUFile *f)
>  {
>      qemu_fflush(f);
>      return f->total_transferred;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 3f36d4dc8c..febc961aa9 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -124,8 +124,44 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>  int qemu_get_fd(QEMUFile *f);
>  int qemu_fclose(QEMUFile *f);
> -int64_t qemu_ftell(QEMUFile *f);
> -int64_t qemu_ftell_fast(QEMUFile *f);
> +
> +/*
> + * qemu_file_total_transferred:
> + *
> + * Report the total number of bytes transferred with 
> + * this file.
> + *
> + * For writable files, any pending buffers will be
> + * flushed, so the reported value will be equal to
> + * the number of bytes transferred on the wire.
> + *
> + * For readable files, the reported value will be
> + * equal to the number of bytes transferred on the
> + * wire.
> + *
> + * Returns: the total bytes transferred
> + */
> +int64_t qemu_file_total_transferred(QEMUFile *f);
> +
> +/*
> + * qemu_file_total_transferred_fast:
> + *
> + * Report the total number of bytes transferred with 
> + * this file.
> + *
> + * For writable files, no pending buffers will be
> + * flushed, but the reported value will include the
> + * size of any queued buffers, on top of the amount
> + * actually transferred.
> + *
> + * For readable files, the reported value will be
> + * equal to the number of bytes transferred on the
> + * wire.
> + *
> + * Returns: the total bytes transferred and queued

I think this would be clearer if it just said:
 * qemu_file_total_transferred_fast:
   As qemu_file_total_transferred except for writable
   files, where no flush is performed and the reported
   amount will include the size of any queued buffers,
   on top of the amount actually transferred.

Otherwise you're left eyeballing the two to try and spot
the difference.

Dave

> + */
> +int64_t qemu_file_total_transferred_fast(QEMUFile *f);
> +
>  /*
>   * put_buffer without copying the buffer.
>   * The buffer should be available till it is sent asynchronously.
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d9076897b8..75d05f1a84 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -916,9 +916,9 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
>  {
>      int64_t old_offset, size;
>  
> -    old_offset = qemu_ftell_fast(f);
> +    old_offset = qemu_file_total_transferred_fast(f);
>      se->ops->save_state(f, se->opaque);
> -    size = qemu_ftell_fast(f) - old_offset;
> +    size = qemu_file_total_transferred_fast(f) - old_offset;
>  
>      if (vmdesc) {
>          json_writer_int64(vmdesc, "size", size);
> @@ -2887,7 +2887,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>          goto the_end;
>      }
>      ret = qemu_savevm_state(f, errp);
> -    vm_state_size = qemu_ftell(f);
> +    vm_state_size = qemu_file_total_transferred(f);
>      ret2 = qemu_fclose(f);
>      if (ret < 0) {
>          goto the_end;
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 36ae8b9e19..b0551e82c6 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -360,7 +360,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                  void *curr_elem = first_elem + size * i;
>  
>                  vmsd_desc_field_start(vmsd, vmdesc_loop, field, i, n_elems);
> -                old_offset = qemu_ftell_fast(f);
> +                old_offset = qemu_file_total_transferred_fast(f);
>                  if (field->flags & VMS_ARRAY_OF_POINTER) {
>                      assert(curr_elem);
>                      curr_elem = *(void **)curr_elem;
> @@ -390,7 +390,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                      return ret;
>                  }
>  
> -                written_bytes = qemu_ftell_fast(f) - old_offset;
> +                written_bytes = qemu_file_total_transferred_fast(f) - old_offset;
>                  vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
>  
>                  /* Compressed arrays only care about the first element */
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


