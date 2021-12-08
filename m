Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955046DB72
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:44:17 +0100 (CET)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv1vL-00042Q-Hf
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:44:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv1sh-0003Lx-Eh
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv1se-0004Ux-UG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638988888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpfhtwY/6ifK2JM7M9oJecfBVRK4XMYL2ezLNHXRA9E=;
 b=TdNBP0tqMGJnryvkN3U1tKwdw0kSPo0l3/vrntwoZoQsYbjWPbp+YnhdGYM2I/44OKOi53
 9Th5TLqUT/KjZbgdwRpDgRAn53Iy0hrWFAof7epChDB9B7d3mI36C76XAVGVpKDpuKf/iA
 SatYgarwLUHCdrwoL7fMJwNn+Ri7qro=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-x3uoapcINYGG3tRgMfy0OA-1; Wed, 08 Dec 2021 13:41:27 -0500
X-MC-Unique: x3uoapcINYGG3tRgMfy0OA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so3427591wmd.9
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 10:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bpfhtwY/6ifK2JM7M9oJecfBVRK4XMYL2ezLNHXRA9E=;
 b=NhZyFoU8XcTvVD11PChsLDy5b/x1nQCE4QWyYHf/CgpogYS7kUH+NBOiehJDERdift
 n1K5mh4+6bRBBaDIse28IKWewkOm23aW7pIFL1wsBOJNBz/ndpXvjWCB4G5JPUc+ovqe
 cISFVXEBydHdnGKL7/eSiXoGKvBTEasxZjIrZ+bpEq40eSjJuedTlJDmvllBBMZOmCbo
 87HHsv5vLkz49+sOiuos0+xtaFVNreDvE6zCMH/iFKNSLeamMnlA+BUmvt/vpVDwZ7RW
 yYWEiKt+qrS5WKftUxSI0qZRVUjE8am7Z/gO7HHw3ws1E8WwXn8rlIA52i2y4dEjeP1g
 /KIg==
X-Gm-Message-State: AOAM533tZ2+M3qJDkql+UIsXmTjbl5Dmx2EEV8RBQVD31wZE9AmwHxDV
 a9mPLh60Ja/O39sOV5dUqZ8N0lDN8SnPttMgTv44OjRoh/dUEFA8eRRh046WMoU0nWNfJ+AU+Hu
 U3SGwNpUHT43n1Ys=
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr464514wrw.141.1638988885779;
 Wed, 08 Dec 2021 10:41:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz27NeZIrXWezpYUeR7vKXNIx5CJg/fYIvjYqkSgk3CAZEZCQbJ4EICCck0E8nzOiu2Ok+yrw==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr464486wrw.141.1638988885480;
 Wed, 08 Dec 2021 10:41:25 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id a9sm3548501wrt.66.2021.12.08.10.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 10:41:24 -0800 (PST)
Date: Wed, 8 Dec 2021 18:41:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 6/7] migration: Dump sub-cmd name in
 loadvm_process_command tp
Message-ID: <YbD8Uuscfd+bm2Ex@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-7-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-7-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> It'll be easier to read the name rather than index of sub-cmd when debugging.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 2 +-
>  migration/trace-events | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d59e976d50..17b8e25e00 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2271,7 +2271,7 @@ static int loadvm_process_command(QEMUFile *f)
>          return qemu_file_get_error(f);
>      }
>  
> -    trace_loadvm_process_command(cmd, len);
> +    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
>      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {

No! you can't do that name lookup before the limit check.

Dave

>          error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
>          return -EINVAL;
> diff --git a/migration/trace-events b/migration/trace-events
> index b48d873b8a..d63a5915f5 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""
>  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
> -loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
> +loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>  loadvm_process_command_ping(uint32_t val) "0x%x"
>  postcopy_ram_listen_thread_exit(void) ""
>  postcopy_ram_listen_thread_start(void) ""
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


