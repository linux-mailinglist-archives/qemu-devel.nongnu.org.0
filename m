Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45B4A8B84
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:24:26 +0100 (CET)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgmP-0008Kb-Os
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFgDn-0005CP-5s
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFgDl-0005AR-6b
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643910516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6C/WgMLRG4DH86nUBkwEHyt5ev+mvUwemK4r6tj/V0=;
 b=iucxwJpUjpQX8jiA7XzSJVpr7PtocZrpnvfvFPD+B2t2YCLFBsDxAT/RggaQ1axIDsp0dY
 Zcw/Pob0y9ETjtJAfUktx8OW/bpGv02M342uUnUQMdyoO7q/wUAAEQIsOyhb3F+go2dphC
 /uBhaoPbgZgRoAyTnEdS0oPGjZCyEnY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-PudqIlANPaCn9zfIO3QgHQ-1; Thu, 03 Feb 2022 12:48:35 -0500
X-MC-Unique: PudqIlANPaCn9zfIO3QgHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b0035399bb7e85so4196196wmc.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K6C/WgMLRG4DH86nUBkwEHyt5ev+mvUwemK4r6tj/V0=;
 b=fEqhGryMhhapEQF0hWJgT922JI+Gjxam6/1bnaXVcUg+AIy19aet1liKbUAI5Rx/Mq
 IScz9XFD1ev339IWnRiMjksp5/HQ2PhL/avegl7fjEeftorzguXGD+FEGLmQAdrfHdNF
 lnTfGCCtOjWvXOscmKWBJTmYHJLFb6hIvLZuNkqMJbg+brrdhUIM5PpYIY9gIWM5T2Lm
 esBlu/bAm0D21MjmvDfy+8c9DZjrNSozNSF4Ngxn1mOQG8HW9i1ZW9tMfOvjaVfPP5tZ
 22tQTSgPjr7tZSNjzyFChC6ekehogoz9/dKbCEcwFnM9f+IFIs56ZNU92VPC+uS2jx8y
 h3rw==
X-Gm-Message-State: AOAM532A1NK0LVivplP2PbLrVT7bpWC8Y492bp4qKoDVmO5ToXpxFKR7
 dfw1cC2vX0k4TWmX2visn3JEX0sD3f/Qeq0G3oGXKsIcpfyj+d+IGrSRQE4JqXMeU0BsyyT3LAp
 WAz+tuVHT7d2vOdw=
X-Received: by 2002:a05:600c:3229:: with SMTP id
 r41mr11415101wmp.181.1643910514216; 
 Thu, 03 Feb 2022 09:48:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB914ljpD5axTZsVn6h4BFMj0phnFvvwwNkXBjjJMS/WlwvO2O7d1c/1xvh3XI/nDJDTkm5Q==
X-Received: by 2002:a05:600c:3229:: with SMTP id
 r41mr11415091wmp.181.1643910514024; 
 Thu, 03 Feb 2022 09:48:34 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id j15sm9830134wmq.19.2022.02.03.09.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:48:33 -0800 (PST)
Date: Thu, 3 Feb 2022 17:48:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 10/15] migration: Move static var in
 ram_block_from_stream() into global
Message-ID: <YfwVbwmjyoRL0B72@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-11-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-11-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Static variable is very unfriendly to threading of ram_block_from_stream().
> Move it into MigrationIncomingState.
> 
> Make the incoming state pointer to be passed over to ram_block_from_stream() on
> both caller sites.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

OK, but I'm not sure if I noticed where you changed this to be per
channel later?



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dave
> ---
>  migration/migration.h |  3 ++-
>  migration/ram.c       | 13 +++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 35e7f7babe..34b79cb961 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -66,7 +66,8 @@ typedef struct {
>  /* State for the incoming migration */
>  struct MigrationIncomingState {
>      QEMUFile *from_src_file;
> -
> +    /* Previously received RAM's RAMBlock pointer */
> +    RAMBlock *last_recv_block;
>      /* A hook to allow cleanup at the end of incoming migration */
>      void *transport_data;
>      void (*transport_cleanup)(void *data);
> diff --git a/migration/ram.c b/migration/ram.c
> index 3f823ffffc..3a7d943f9c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3183,12 +3183,14 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>   *
>   * Returns a pointer from within the RCU-protected ram_list.
>   *
> + * @mis: the migration incoming state pointer
>   * @f: QEMUFile where to read the data from
>   * @flags: Page flags (mostly to see if it's a continuation of previous block)
>   */
> -static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
> +static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
> +                                              QEMUFile *f, int flags)
>  {
> -    static RAMBlock *block;
> +    RAMBlock *block = mis->last_recv_block;
>      char id[256];
>      uint8_t len;
>  
> @@ -3215,6 +3217,8 @@ static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
>          return NULL;
>      }
>  
> +    mis->last_recv_block = block;
> +
>      return block;
>  }
>  
> @@ -3667,7 +3671,7 @@ static int ram_load_postcopy(QEMUFile *f)
>          trace_ram_load_postcopy_loop((uint64_t)addr, flags);
>          if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>                       RAM_SAVE_FLAG_COMPRESS_PAGE)) {
> -            block = ram_block_from_stream(f, flags);
> +            block = ram_block_from_stream(mis, f, flags);
>              if (!block) {
>                  ret = -EINVAL;
>                  break;
> @@ -3881,6 +3885,7 @@ void colo_flush_ram_cache(void)
>   */
>  static int ram_load_precopy(QEMUFile *f)
>  {
> +    MigrationIncomingState *mis = migration_incoming_get_current();
>      int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
>      /* ADVISE is earlier, it shows the source has the postcopy capability on */
>      bool postcopy_advised = postcopy_is_advised();
> @@ -3919,7 +3924,7 @@ static int ram_load_precopy(QEMUFile *f)
>  
>          if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>                       RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
> -            RAMBlock *block = ram_block_from_stream(f, flags);
> +            RAMBlock *block = ram_block_from_stream(mis, f, flags);
>  
>              host = host_from_ram_block_offset(block, addr);
>              /*
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


