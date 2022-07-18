Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EB578264
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:34:55 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPxd-0002FK-Vb
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDPte-0008NL-Mw
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDPtb-0004aD-TL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658147443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2MDxG6rJvfAbXRmnrtB0n9py5K0KSRgyBc48Sj0BAs=;
 b=hoiFvssjZGu88TxukvITeaMCG5K0+atPOyyjTElNLi4bJJZ+R/iRjwAaQeoWQIL+zPc8WS
 p9XUaWPuaoULDxJnL/gk/QC5L2fALMnsI3WSq49ca7cl0ojvGYpWSpQUXXkSXMJXlwvNzq
 w81OdkHVO/xyuakhB5WacLJLBoqtFr8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-H0OPcE7YNUmDo1qDGRUxxw-1; Mon, 18 Jul 2022 08:30:36 -0400
X-MC-Unique: H0OPcE7YNUmDo1qDGRUxxw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so184376wrg.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z2MDxG6rJvfAbXRmnrtB0n9py5K0KSRgyBc48Sj0BAs=;
 b=eFzBwzsW0Hg4gIr3vl/SCBY+NACE4MfJ2FC7jJV3eEV6gJQNXQsvQK/AusULu8P8UV
 DvWZ4pHVRq/7Tvj05SDk5E6Y0iCGc4vqsDOt/WWLVr4SHscL6hw0veUaPYaSFoOggNxm
 zsaEadB+Y8kBoObt8xgtHVbKij0+L1yCSznQMvRnZU2IaSdoGqlydTXqwahQCYOKuqWX
 Mpu7/FeamA0ylKHoNcapOHS3fDorPQea5r1YVUUIoReDNufBDM6RHHHNMZTu2b3wrmhD
 jVTTEqGUgtSj6dOEqiwYtRQhDEbXoWamlO7taZZVNVGJyVjctZH+x74iP2LDjE4xJ3VF
 VtjA==
X-Gm-Message-State: AJIora+TBpDfLCY6Zsp8TiGZowPPkId3mNvwfgUwjVtJ483eCeVE4N1w
 BB2gxKLEX/J1EWL6+v/aURXliJ86aT+KVzQgZdbu/RtjfJOnrdLQpwK3aEME0/OMSZFGYObDrZ9
 1SzVqjz/lTKSYTbY=
X-Received: by 2002:adf:f9c3:0:b0:21d:7b3d:d924 with SMTP id
 w3-20020adff9c3000000b0021d7b3dd924mr23214689wrr.536.1658147434806; 
 Mon, 18 Jul 2022 05:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+KbkHE4BzC9h1c9sxSDijSRdBYSg69floGlinuNZ+7UXwyn2kbyyxgzXLKigLZLSiak6V2A==
X-Received: by 2002:adf:f9c3:0:b0:21d:7b3d:d924 with SMTP id
 w3-20020adff9c3000000b0021d7b3dd924mr23214664wrr.536.1658147434521; 
 Mon, 18 Jul 2022 05:30:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6781000000b0021d6dad334bsm10945558wru.4.2022.07.18.05.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 05:30:33 -0700 (PDT)
Date: Mon, 18 Jul 2022 13:30:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 08/13] multifd: Prepare to send a packet without the
 mutex held
Message-ID: <YtVSZ9AWI4oTbiwW@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-9-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-9-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
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

* Juan Quintela (quintela@redhat.com) wrote:
> We do the send_prepare() and the fill of the head packet without the
> mutex held.  It will help a lot for compression and later in the
> series for zero pages.
> 
> Notice that we can use p->pages without holding p->mutex because
> p->pending_job == 1.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 ++
>  migration/multifd.c | 11 ++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index af8ce8921d..d48597a1ea 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -109,7 +109,9 @@ typedef struct {
>      /* array of pages to sent.
>       * The owner of 'pages' depends of 'pending_job' value:
>       * pending_job == 0 -> migration_thread can use it.
> +     *                     No need for mutex lock.
>       * pending_job != 0 -> multifd_channel can use it.
> +     *                     No need for mutex lock.
>       */
>      MultiFDPages_t *pages;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 69b9d7cf98..056599cbaf 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -661,6 +661,8 @@ static void *multifd_send_thread(void *opaque)
>                  p->flags |= MULTIFD_FLAG_SYNC;
>                  p->sync_needed = false;
>              }
> +            qemu_mutex_unlock(&p->mutex);
> +
>              p->normal_num = 0;
>  
>              if (use_zero_copy_send) {
> @@ -682,11 +684,6 @@ static void *multifd_send_thread(void *opaque)

Looking at my source tree, without the rest of your series, I see an
unlock just before this pair of }'s; doesn't that need to go?

Dave

>                  }
>              }
>              multifd_send_fill_packet(p);
> -            p->num_packets++;
> -            p->total_normal_pages += p->normal_num;
> -            p->pages->num = 0;
> -            p->pages->block = NULL;
> -            qemu_mutex_unlock(&p->mutex);
>  
>              trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
>                                 p->next_packet_size);
> @@ -711,6 +708,10 @@ static void *multifd_send_thread(void *opaque)
>              }
>  
>              qemu_mutex_lock(&p->mutex);
> +            p->num_packets++;
> +            p->total_normal_pages += p->normal_num;
> +            p->pages->num = 0;
> +            p->pages->block = NULL;
>              p->sent_bytes += p->packet_len;;
>              p->sent_bytes += p->next_packet_size;
>              p->pending_job--;
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


