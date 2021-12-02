Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DB466898
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:47:18 +0100 (CET)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspEr-0006YI-9t
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspAj-0000DE-Hy
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspAf-0001C0-RJ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638463376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2syveVEv7akazd7OzV5CYTkZ0T937F6YsNFDnDIJcEc=;
 b=YhF38L2M1mXy+i1vCqwvmsHWBLGr7QWpGxFY1539QJcQEP1P89e5kYEVXl6sNjzZc5vBqf
 IMR1eGUjTjK2qOylPA8y85K3lDMEwkIjbW7h+PwSFBL+BWVX3r4CTME5SZ2fIARKS8Kcmt
 rTx0GOJOBfG439AGUkJwN64T8S3lEB4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-yFL_i7IQNzOJnjY9mHSQQQ-1; Thu, 02 Dec 2021 11:42:55 -0500
X-MC-Unique: yFL_i7IQNzOJnjY9mHSQQQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so7206wrg.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2syveVEv7akazd7OzV5CYTkZ0T937F6YsNFDnDIJcEc=;
 b=1aBHWMj1+tm1MuLcp1KmOtyk6UhgNcHisoIyax4Gmu0luTrECxHdEQFpDKY/AdrS17
 0KOmPwQmDM4UDcq1AL98PGYRaVTTAx3y5kgXv1zYwYMW+JzYLOFZx8alBRX8e+ixmFZz
 QuS5VBZaAy15bAHGEiwXWR4SOS4TIf3Vw+H01ahbxyWrwGP3/qNf4HxWnPyI5+UDnR+/
 +UBReQcVPg+rvvs+znnr6FiVi0AXIiGlaMZ/r3tYge0mUV95jWj54OalRdaVva9ODYfT
 NYosTydsytXofVDA3pFsyfRG5GxaKNR9DcOpzDiy34hDBkG88ALv1sgVID3DvG1IfOJW
 sVug==
X-Gm-Message-State: AOAM532vpmh5L14L0nYnzce48LZbksqkleUKKibXMzswfYn7cf7rUC0Q
 9Kla0EQDdaqfDMRHjzwyWDfA3DHIqMSIPSI6rlNAhMFjuFxe+I0Qbt5BwtDPq+nx021BcmiWFTt
 1HyMYCO3E3iQ7NbM=
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr15184711wrb.50.1638463374643; 
 Thu, 02 Dec 2021 08:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5KzZOXCpynmfgS7bsTDo2UtGGu/oQpSVFf1Mhz+achapEMxkWFE/rQEGPblI9hVY0ZSur4w==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr15184669wrb.50.1638463374217; 
 Thu, 02 Dec 2021 08:42:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id 9sm432476wry.0.2021.12.02.08.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:42:53 -0800 (PST)
Date: Thu, 2 Dec 2021 16:42:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 22/23] multifd: Zero pages transmission
Message-ID: <Yaj3i1S8DRB1y4DG@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-23-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-23-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> This implements the zero page dection and handling.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 2e4dffd6c6..5c1fc70ce3 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/rcu.h"
>  #include "exec/target_page.h"
>  #include "sysemu/sysemu.h"
> @@ -277,6 +278,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> +    for (i = 0; i < p->zero_num; i++) {
> +        /* there are architectures where ram_addr_t is 32 bit */
> +        uint64_t temp = p->zero[i];
> +
> +        packet->offset[p->normal_num + i] = cpu_to_be64(temp);

OK, so if I'm understanding correctly here, the packet->offset array
starts with the 'normals' and then the zeros?
If so that probably needs a comment somewhere.

Other than that,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    }
>  }
>  
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> @@ -362,6 +369,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          p->normal[i] = offset;
>      }
>  
> +    for (i = 0; i < p->zero_num; i++) {
> +        uint64_t offset = be64_to_cpu(packet->offset[p->normal_num + i]);
> +
> +        if (offset > (block->used_length - page_size)) {
> +            error_setg(errp, "multifd: offset too long %" PRIu64
> +                       " (max " RAM_ADDR_FMT ")",
> +                       offset, block->used_length);
> +            return -1;
> +        }
> +        p->zero[i] = offset;
> +    }
> +
>      return 0;
>  }
>  
> @@ -652,8 +671,14 @@ static void *multifd_send_thread(void *opaque)
>              p->zero_num = 0;
>  
>              for (int i = 0; i < p->pages->num; i++) {
> -                p->normal[p->normal_num] = p->pages->offset[i];
> -                p->normal_num++;
> +                if (buffer_is_zero(p->pages->block->host + p->pages->offset[i],
> +                                   qemu_target_page_size())) {
> +                    p->zero[p->zero_num] = p->pages->offset[i];
> +                    p->zero_num++;
> +                } else {
> +                    p->normal[p->normal_num] = p->pages->offset[i];
> +                    p->normal_num++;
> +                }
>              }
>  
>              if (p->normal_num) {
> @@ -1112,6 +1137,10 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
>  
> +        for (int i = 0; i < p->zero_num; i++) {
> +            memset(p->host + p->zero[i], 0, qemu_target_page_size());
> +        }
> +
>          if (flags & MULTIFD_FLAG_SYNC) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


