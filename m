Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86E44B8CC8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:45:38 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMUs-00018H-1d
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:45:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKMSc-0007py-Kv
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKMSK-0001EL-NA
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645026180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VZZ467rBSLH9SsS36Qy7U7gvT48lzxKJav1IVSaVskU=;
 b=gDvy0vUwCyQEWpXrB6mDITuyskDYxGdAdOUkSnqQxwmoILckFTdBBo8Pf6BfmwP5Ttph2F
 UxscMkGpvtMIVmVXu3Of8v2dWkWXtcbhK9c+DRfRS5xb56BfkV8aeNRrrnMLWp0WmP3RJn
 zD0WtV2nZ9s2Iv1fD+1ePK5L1FWMYuU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-QE3O7xKJP66fm9a6BUN9Jg-1; Wed, 16 Feb 2022 10:42:58 -0500
X-MC-Unique: QE3O7xKJP66fm9a6BUN9Jg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so1213305wrb.20
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VZZ467rBSLH9SsS36Qy7U7gvT48lzxKJav1IVSaVskU=;
 b=e6JxlqnG60FSF3Lp5jRCJSQf82e7yFk6Ihk5XuwgRjqqLW7oilXv8YecdZDCga3vwG
 IBW0NgDiirLnQ3Sn2WAp7oCAOo/Q+b4BEHYNAr2vde/r1S+lOGuTJZX9nOc+77RCphvt
 2CK6E1YO5rkpfYTGEAMst/w/4JkMA0MwKEM44s3yeOfz5R9EYnqM56EE3UqJSEhTxj4f
 mAEvWdOIZG6iOpga7u4xpCyALnPRXofemnF1ZJ0wwc40q2OsNyOdWVNuxSAq/Ke+jOFj
 tYZf32qr1mk7JPz+kz62+NCq1c4dR6Duifm7iVjJctcQ6EaE57uOUqjYH24GHe0N0UGa
 kHdw==
X-Gm-Message-State: AOAM532zcnITEAQIzb6ngwzoDS+9kyCPF1vB1cnv+z0bAlTIrjN1Iz21
 0GNj3WVi22YD9u8JtpOUQj9Smy735nI2iPgZKDlhcOAtLZ4ZnxxlKKxvhLvV3Uy8VSAcqZOFG8D
 V66UwDmJijrv4OnA=
X-Received: by 2002:a1c:6a03:0:b0:37b:dda6:4259 with SMTP id
 f3-20020a1c6a03000000b0037bdda64259mr2250483wmc.20.1645026177547; 
 Wed, 16 Feb 2022 07:42:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2GyoVxOxPV4zUDl5WMBknd0V+kG/9u02fA9mdnqLPElXX1pSpXMbdiHg3RVCSygFIWlRRfQ==
X-Received: by 2002:a1c:6a03:0:b0:37b:dda6:4259 with SMTP id
 f3-20020a1c6a03000000b0037bdda64259mr2250463wmc.20.1645026177323; 
 Wed, 16 Feb 2022 07:42:57 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l9sm18370076wrt.29.2022.02.16.07.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:42:56 -0800 (PST)
Date: Wed, 16 Feb 2022 15:42:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 01/20] migration: Dump sub-cmd name in
 loadvm_process_command tp
Message-ID: <Yg0bfpUbbs6akEAe@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-2-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> It'll be easier to read the name rather than index of sub-cmd when debugging.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c     | 3 ++-
>  migration/trace-events | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 1599b02fbc..7bb65e1d61 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2273,12 +2273,13 @@ static int loadvm_process_command(QEMUFile *f)
>          return qemu_file_get_error(f);
>      }
>  
> -    trace_loadvm_process_command(cmd, len);
>      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
>          error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
>          return -EINVAL;
>      }
>  
> +    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
> +
>      if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
>          error_report("%s received with bad length - expecting %zu, got %d",
>                       mig_cmd_args[cmd].name,
> diff --git a/migration/trace-events b/migration/trace-events
> index 48aa7b10ee..123cfe79d7 100644
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


