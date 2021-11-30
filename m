Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D267F46318C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:51:01 +0100 (CET)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0iz-0003Ta-0M
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ms0dw-00055J-U5
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:45:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ms0dv-0001hY-GV
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638269146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DqA5UUl1SLiJEk0IcOKcECyfDbOx5vesGfUvdIMd0c=;
 b=MFuDi6l5kSAxwUe8VI1UQDEcburkXnSQtF1RMI6+lNgicdNf3GNUE4kUwnO4MaqM255G4p
 gBxKnHcEaG8PHvhIBUoZdq3NJTtEDENhpPkCdBOz5BKl/+mKRAzk0NZOFP8WAt9vMg8tkm
 AAgLjPbXbJHEYShaiJ36obYoKlR0/Zs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-181-x5KCg8WzPwaj3ek2qqlEIg-1; Tue, 30 Nov 2021 05:45:45 -0500
X-MC-Unique: x5KCg8WzPwaj3ek2qqlEIg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13538621wma.5
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6DqA5UUl1SLiJEk0IcOKcECyfDbOx5vesGfUvdIMd0c=;
 b=3U9g+fVlN63AaFhF5dBtjpV6UE7Tc19D/cQf8mwE5qdmuYYk4ZiX4GMPkF9o5XvliH
 pvQ8whvgU+buXR5kTPAZo/DPJ6pVsfydM3Zcj5wZjWL1qITEge3XCfeaNI9to5PCeTSu
 LWNhE7c83LSpJWT2Q998vhIzF54gPXNfKe1QQO1edgGLkixJOB5cHDett+KmjzKD7LjX
 j4Bp8EFpu3TWpFLOiKlyui3dT8So8ywQyMdUErOYD3+kwAbJ+zVbQNRduzjfUPSB9rZY
 Sddv05aifHRT5cmClgldC3h3TnLxGCi7uS+A4j19ftseAKxavSjScjkO0AjSrkt2LwBW
 iCEg==
X-Gm-Message-State: AOAM533Z2NPveL8jfj1U6kb6gU2kwVu135RwozxkA/h2+pqy0hHJ2yBJ
 cL0yw6zEDc35JdM0CbaJI/9JaIcpxuCOodyWCov7GqaCREEqgRDxJDbBgx6+9cpc5Cy9aMgFniP
 NFhq8h8YdHRRBX50=
X-Received: by 2002:a5d:658c:: with SMTP id q12mr39864786wru.34.1638269144312; 
 Tue, 30 Nov 2021 02:45:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEstckiFwvhYv1AKV533ZUm3sw43Ml1HXzvKk6d/hxVk++owZnjpjBFGHcNhjLL1t1VBdJeA==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr39864765wru.34.1638269144078; 
 Tue, 30 Nov 2021 02:45:44 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bg34sm2229244wmb.47.2021.11.30.02.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:45:43 -0800 (PST)
Date: Tue, 30 Nov 2021 10:45:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 16/23] multifd: Unfold "used" variable by its value
Message-ID: <YaYA1dtSWKzGVest@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-17-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-17-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 65676d56fd..6983ba3e7c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1059,7 +1059,6 @@ static void *multifd_recv_thread(void *opaque)
>      rcu_register_thread();
>  
>      while (true) {
> -        uint32_t used;
>          uint32_t flags;
>  
>          if (p->quit) {
> @@ -1082,17 +1081,16 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
>  
> -        used = p->pages->num;
>          flags = p->flags;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
> -        trace_multifd_recv(p->id, p->packet_num, used, flags,
> +        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
>                             p->next_packet_size);
>          p->num_packets++;
> -        p->num_pages += used;
> +        p->num_pages += p->pages->num;
>          qemu_mutex_unlock(&p->mutex);
>  
> -        if (used) {
> +        if (p->pages->num) {
>              ret = multifd_recv_state->ops->recv_pages(p, &local_err);
>              if (ret != 0) {
>                  break;
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


