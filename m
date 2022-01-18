Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E42492F0D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:13:37 +0100 (CET)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9urI-0004Hm-IM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uOg-00083E-MP
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uOc-0002kS-3u
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642535027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3HBHWIbbtQPx61DTu+cLs+T9kosfpbBIf8+MIiJ5JQ=;
 b=Fo2RhgMat6tYERyQGLa62/W7vITzyaHqgc4ayzMpaP1o5cxcKOzAPAOkE1jRZTnqakc6B1
 SSm5XGHewwYfpb4n8bFrGfdOTezW7n1FTir9+tj4ONn8aOyJPM1o8D9G2yNWb0ZP5Z6yR6
 tXnvgxqh2bANPT9gfVj1fS3CslwB3tM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-DVVDENxuMZCGR21l0g9CHg-1; Tue, 18 Jan 2022 14:43:46 -0500
X-MC-Unique: DVVDENxuMZCGR21l0g9CHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 14-20020a05600c024e00b0034a83f7391aso185540wmj.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V3HBHWIbbtQPx61DTu+cLs+T9kosfpbBIf8+MIiJ5JQ=;
 b=Fn0Tf0kxhJxDbm2J73qBzgGDW1/aQs5f4mpMGw6DfTK7XNC0aqwK0yr6rLaFJk1+V7
 BhQ97GsjjKaVMZfiTgG3JDS7Vx4qhBxlqBi3LdwYfM3XzAq/rE5BT/yG63IIkjkYgF/s
 t8zoAK9mdUbB216FL3WGQn4NPlhsLOOZoZRJzZL07L2Kfvn3AeQClLbq0GBJBGUtduKI
 LvRqqmt7pJPxVesrSVASt3NkdHBvT7EWRMRNjN224dvv2hxECuKiFpp7tVAWXfGPMOp1
 6gAIJ4HStTNRrIwELezgYmUWdbi/ERHZvDaKw1vbjftWehsrzkG1zpqdL0lWccSn4UEt
 7Zcg==
X-Gm-Message-State: AOAM530SHpZpohq/JknFlrWmS55QZ2BuVN9/4a6wjKSkd1kIwUrIi/Mh
 tpSzj8O2/krplQEZbCN4Pt7BzPboaqgvbN6pE+z4vGho4hujY4gSv7JDSd4ByvdB12TysEIu7Nm
 WvEzwln0lFIu42L0=
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr110606wmh.102.1642535025033; 
 Tue, 18 Jan 2022 11:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy75qfMXqYqeUoTpWlms6MEa1TNDQZ9RTI9wyNgrUuzspfFJ4HWlBZBugGmqNW5CNegfOOLNQ==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr110598wmh.102.1642535024857; 
 Tue, 18 Jan 2022 11:43:44 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t15sm16974900wrz.82.2022.01.18.11.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:43:44 -0800 (PST)
Date: Tue, 18 Jan 2022 19:43:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 18/23] migration: Make ram_save_target_page() a pointer
Message-ID: <YecYbroeoeWfZkFM@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-19-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-19-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We are going to create a new function for multifd latest in the series.
                                                        ^^ 'later'



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index e9dcd3ca4e..3536778e19 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -294,6 +294,9 @@ struct RAMSrcPageRequest {
>      QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
>  };
>  
> +typedef struct RAMState RAMState;
> +typedef struct PageSearchStatus PageSearchStatus;
> +
>  /* State of RAM for migration */
>  struct RAMState {
>      /* QEMUFile used for this migration */
> @@ -348,8 +351,8 @@ struct RAMState {
>      /* Queue of outstanding page requests from the destination */
>      QemuMutex src_page_req_mutex;
>      QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
> +    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
>  };
> -typedef struct RAMState RAMState;
>  
>  static RAMState *ram_state;
>  
> @@ -2117,14 +2120,14 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
>  }
>  
>  /**
> - * ram_save_target_page: save one target page
> + * ram_save_target_page_legacy: save one target page
>   *
>   * Returns the number of pages written
>   *
>   * @rs: current RAM state
>   * @pss: data about the page we want to send
>   */
> -static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
> +static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
>  {
>      RAMBlock *block = pss->block;
>      ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> @@ -2200,7 +2203,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>      do {
>          /* Check the pages is dirty and if it is send it */
>          if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            tmppages = ram_save_target_page(rs, pss);
> +            tmppages = rs->ram_save_target_page(rs, pss);
>              if (tmppages < 0) {
>                  return tmppages;
>              }
> @@ -3008,6 +3011,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>  
> +    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
>      multifd_send_sync_main(f);
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


