Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A8686E8E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIKY-0005ok-1X; Wed, 01 Feb 2023 13:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIKV-0005oF-FM
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIKT-00041w-KI
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675277972;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=p++SXE9SdpB4P/mA4n/6Ae+DwYZEcaVNlghNpDNeu20=;
 b=XMn6TcYnFRXA29zbiIYObRZ84HMDoXEgGIe8AanNsty7ZPl8e7jDeCXSHq3eZt5IuxoKhI
 KBDx9g6URpAa9DpVeyiwzP5oNt667Azuewg/kixKkJRx/3WVYde6VFETPjetSUWXjCP9bf
 I+iIjdGyC54ey6IdyJsRYuJFemK6M2g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-W5NvAl1LOyW9DwdZtr8y3w-1; Wed, 01 Feb 2023 13:59:30 -0500
X-MC-Unique: W5NvAl1LOyW9DwdZtr8y3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso1424099wms.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p++SXE9SdpB4P/mA4n/6Ae+DwYZEcaVNlghNpDNeu20=;
 b=B7xR7urt9smjN/+PMxp1BrWppCqJ6cpV61oJPqTuaYzjq7zS2OzF6Dvbs1XvS5iRgM
 ULlDAKypHBuwblTF6eVKiEfGVbu6Fzf0LyCMMFiUPGCawFrFtTeu5YuK6FH5pjTUCcAw
 X0wP+kvd4zlhvQ4s300OsxMoVa7dxxjaE9s0Qj31AsYs8abEx93SqNtOggAUUTFi3lcG
 aTou3iAIX1tZKbOr6tDyXuyyzfSg2TXBPjxSedhpfjY42TAagG9zKuUw1p3bbVXQ7gE1
 rZ511HdrosD71HVVa8B4+e1Rc9RqT4d67sBKMgJ48YnS0DQvIVgTSxb+lxXlORfgdDDa
 36Pw==
X-Gm-Message-State: AO0yUKWX0cTTvg9FfQWP84jJzGTwLMEw26DqUMChN1v2d7HT6Q7TzMx1
 n/iVsbLA/G8xmFMh2Foaz24DKf4lrfz7+b+IQ5sMPsXjEG47Eei7QmUleis8iKwAACBFgWRbIPU
 ojnlZr5pOcM/gz9o=
X-Received: by 2002:a5d:610a:0:b0:2bf:bb02:2785 with SMTP id
 v10-20020a5d610a000000b002bfbb022785mr2848768wrt.7.1675277969774; 
 Wed, 01 Feb 2023 10:59:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+IkdBSlfVcGOkWz53ocXboFJGk9phHSduBo3IqPwuNiRAcilW5wS3NnU5XVAvGHZAsrAF4zw==
X-Received: by 2002:a5d:610a:0:b0:2bf:bb02:2785 with SMTP id
 v10-20020a5d610a000000b002bfbb022785mr2848758wrt.7.1675277969559; 
 Wed, 01 Feb 2023 10:59:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfaa84000000b002bfbf4c3f9fsm17939155wrc.17.2023.02.01.10.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:59:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 16/21] migration: Enable doublemap with MADV_SPLIT
In-Reply-To: <20230117220914.2062125-17-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:09 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-17-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 19:59:27 +0100
Message-ID: <87v8klw6sw.fsf@secure.mitica>
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
> MADV_SPLIT enables doublemap on hugetlb.  Do that if doublemap=true
> specified for the migration.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/postcopy-ram.c | 16 ++++++++++++++++
>  migration/ram.c          | 18 ++++++++++++++++++
>  2 files changed, 34 insertions(+)

Reviewed-by: Juan Quintela <quintela@redhat.com>


>
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 86ff73c2c0..dbc7e54e4a 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -694,6 +694,22 @@ static int ram_block_enable_notify(RAMBlock *rb, void *opaque)
>       */
>      reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
>      if (minor_fault) {
> +        /*
> +         * MADV_SPLIT implicitly enables doublemap mode for hugetlb.  If
> +         * that fails (e.g. on old kernels) we need to fail the migration.
> +         *
> +         * It's a bit late to fail here as we could have migrated lots of
> +         * pages in precopy, but early failure will require us to allocate
> +         * hugetlb pages secretly in QEMU which is not friendly to admins
> +         * and it may affect the global hugetlb pool.  Considering it is
> +         * normally always limited, keep the failure late but tolerable.
> +         */
> +        if (qemu_madvise(qemu_ram_get_host_addr(rb), rb->postcopy_length,
> +                         QEMU_MADV_SPLIT)) {
> +            error_report("%s: madvise(MADV_SPLIT) failed (ret=%d) but "
> +                         "required for doublemap.", __func__, -errno);

Here you write errno

> +            return -1;
> +        }
>          reg_struct.mode |= UFFDIO_REGISTER_MODE_MINOR;
>      }
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index 37d7b3553a..4d786f4b97 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3891,6 +3891,19 @@ static int migrate_hugetlb_doublemap_init(void)
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
>          if (qemu_ram_is_hugetlb(rb)) {
> +            /*
> +             * MADV_SPLIT implicitly enables doublemap mode for hugetlb on
> +             * the guest mapped ranges.  If that fails (e.g. on old
> +             * kernels) we need to fail the migration.  Note, the
> +             * host_mirror mapping below can be kept as hugely mapped.
> +             */
> +            if (qemu_madvise(qemu_ram_get_host_addr(rb), rb->mmap_length,
> +                             QEMU_MADV_SPLIT)) {
> +                error_report("%s: madvise(MADV_SPLIT) required for doublemap",
> +                             __func__);

Here you don't.

So I think you could change it.

I was thinking about creating a function for this, but as comments are
different I think it is overkill.

> +                return -1;
> +            }
> +
>              /*
>               * Firstly, we remap the same ramblock into another range of
>               * virtual address, so that we can write to the pages without
> @@ -3898,6 +3911,11 @@ static int migrate_hugetlb_doublemap_init(void)
>               */
>              addr = ramblock_file_map(rb);
>              if (addr == MAP_FAILED) {
> +                /*
> +                 * No need to undo MADV_SPLIT because this is dest node and
> +                 * we're going to bail out anyway.  Leave that for mm exit
> +                 * to clean things up.
> +                 */
>                  ret = -errno;
>                  error_report("%s: Duplicate mapping for hugetlb ramblock '%s'"
>                               "failed: %s", __func__, qemu_ram_get_idstr(rb),


