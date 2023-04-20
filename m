Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB06E9BE4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:48:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZK6-0006Ky-OO; Thu, 20 Apr 2023 14:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZJv-0006Dn-Vb; Thu, 20 Apr 2023 14:47:52 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZJt-0002p0-LW; Thu, 20 Apr 2023 14:47:51 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7AC321FD8C;
 Thu, 20 Apr 2023 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682016466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygisrS+z3zZ/KOP2NdrPj7vqz689ERq9elA9YeQG1yE=;
 b=Pob8iVXo29ivuPFxmFogqdcOMZs9gV5iNLh275UGrANCuOJaYQ9xFQ1d4LcdkldtymZXQP
 gW07RnhSvrrHdywxQys0zi9MuBgmNi8UIAGg/k1Q4oXt5sBoDbFM3GiER96U2u+FSjmFf8
 W6WHzeFHAg6eCX/zOX5iI4+KKi3Xl+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682016466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygisrS+z3zZ/KOP2NdrPj7vqz689ERq9elA9YeQG1yE=;
 b=3WWV3LaDojyaqdDj4AglxEKVIcYWdefm9SYS1+O0U2cbRYCnTESEut7H5FWSIQcM1bffr9
 Fb7dsWj6hi+AJLDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0527513584;
 Thu, 20 Apr 2023 18:47:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xjXOL9GIQWT7OwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 18:47:45 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, David Hildenbrand <david@redhat.com>, John
 Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>, Hailiang Zhang
 <zhanghailiang@xfusion.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Leonardo Bras
 <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 21/43] migration: Create
 migrate_throttle_trigger_threshold()
In-Reply-To: <20230420134002.29531-22-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-22-quintela@redhat.com>
Date: Thu, 20 Apr 2023 15:47:43 -0300
Message-ID: <87ildq8k6o.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/options.c | 9 +++++++++
>  migration/options.h | 1 +
>  migration/ram.c     | 3 +--
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/migration/options.c b/migration/options.c
> index 2b6d88b4b9..b9f3815f7e 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -554,6 +554,15 @@ int migrate_multifd_zstd_level(void)
>      return s->parameters.multifd_zstd_level;
>  }
>  
> +uint8_t migrate_throttle_trigger_threshold(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->parameters.throttle_trigger_threshold;
> +}
> +
>  uint64_t migrate_xbzrle_cache_size(void)
>  {
>      MigrationState *s;
> diff --git a/migration/options.h b/migration/options.h
> index 96d5a8e6e4..aa54443353 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -55,6 +55,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +uint8_t migrate_throttle_trigger_threshold(void);
>  uint64_t migrate_xbzrle_cache_size(void);
>  
>  #endif
> diff --git a/migration/ram.c b/migration/ram.c
> index 7f28588dde..68801012ba 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1179,8 +1179,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
>  
>  static void migration_trigger_throttle(RAMState *rs)
>  {
> -    MigrationState *s = migrate_get_current();
> -    uint64_t threshold = s->parameters.throttle_trigger_threshold;
> +    uint64_t threshold = migrate_throttle_trigger_threshold();
>      uint64_t bytes_xfer_period =
>          stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
>      uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;

Reviewed-by: Fabiano Rosas <farosas@suse.de>

