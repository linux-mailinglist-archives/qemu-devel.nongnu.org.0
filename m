Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E7636771
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:40:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtiQ-0006cR-Gm; Wed, 23 Nov 2022 12:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxtiP-0006cA-B9
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxtiM-0002p3-Nb
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669225153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lf++Q1XdFQlym+P8FDyJrY4LwACRnbuEiiaJTFJJtAY=;
 b=eYS1326PIC4mO6GAFCMN8tU2ZfmeIYn8KhfGFeakp/7s+ojdtQtqrZWhYQzhAfOe8dDa0Q
 bOPCJ+pyRSqa7dUJ2YKWkDPNxOwGKwZv2k5g/yozzK3Y52ciMopp+rd2QTeL8BuUY//Vrv
 gxKqK232XOfGqx9Fzo41J2ZoHtBe/f8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-LQN1XVWXNKKu3gz3u59yNQ-1; Wed, 23 Nov 2022 12:39:12 -0500
X-MC-Unique: LQN1XVWXNKKu3gz3u59yNQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfa304000000b00241e5b2c816so1447922wrb.21
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 09:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lf++Q1XdFQlym+P8FDyJrY4LwACRnbuEiiaJTFJJtAY=;
 b=YeLuSYIb1NXWmQD/fokwo2YyeGLRTxXH166t+7kZRzge53FZxwGfMuugryPxvUxDM2
 ynUnyTqsWcvbn7RP2GkKqfqCnbR2BuTq/tydnyPOx/tw1oFdJTid9H7CVawneBEPDwaG
 PovE72ngc0nomKl1KpikWXJ+Ry7ixurNd86pk7SAUjOwjATqQlYCXj5G04D2y0Yg/J8M
 bmLkx2MgdQqjINVaMQhOK6+/jrrMdWHzJ2qpBYR/tIR1M61A2S7phKWEvdwTgSFKMMNi
 b4yzdaidOtozg7F2JDUNNGfQ9d04DOKlsosVCna92+Fx6AvBd1qttC33fjPht2pBg3Bk
 rkmg==
X-Gm-Message-State: ANoB5pn1Z777IhdWk+oRgnVeZIBn1Dg3MGpaKGGM5gtOaEPECrS7APiL
 oaESYHDzfrHbRTZZ1lgQSwBAPxdG1RASnIV3cexDob/TPNvxXngqPCRWom12f58sKsfOrcbIZyG
 7tuqwLnXzXKu1t6I=
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id
 u1-20020adfdb81000000b002365144f8cemr11650057wri.657.1669225151212; 
 Wed, 23 Nov 2022 09:39:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eDi1tWzY6ZeIa2fdpXteVuEZVSVOZTHSGfvnoK5ptF6wtPeT3B+OO9HTssrpRkay+ARImtw==
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id
 u1-20020adfdb81000000b002365144f8cemr11650025wri.657.1669225150869; 
 Wed, 23 Nov 2022 09:39:10 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cf483ee8e0sm3287766wmo.24.2022.11.23.09.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:39:10 -0800 (PST)
Date: Wed, 23 Nov 2022 17:39:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC 6/7] migration: simplify migration_iteration_run()
Message-ID: <Y35avKPXdgNFdaYN@work-vm>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-7-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-7-quintela@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 97fefd579e..35e512887a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3747,23 +3747,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>          trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
>      }
>  
> -    if (pending_size && pending_size >= s->threshold_size) {
> -        /* Still a significant amount to transfer */
> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
> -            qatomic_read(&s->start_postcopy)) {
> -            if (postcopy_start(s)) {
> -                error_report("%s: postcopy failed to start", __func__);
> -            }
> -            return MIG_ITERATE_SKIP;
> -        }
> -        /* Just another iteration step */
> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
> -    } else {
> +    if (pending_size < s->threshold_size) {
>          trace_migration_thread_low_pending(pending_size);
>          migration_completion(s);
>          return MIG_ITERATE_BREAK;
>      }
>  
> +    /* Still a significant amount to transfer */
> +    if (!in_postcopy && pend_pre <= s->threshold_size &&
> +        qatomic_read(&s->start_postcopy)) {
> +        if (postcopy_start(s)) {
> +            error_report("%s: postcopy failed to start", __func__);
> +        }
> +        return MIG_ITERATE_SKIP;
> +    }
> +
> +    /* Just another iteration step */
> +    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>      return MIG_ITERATE_RESUME;
>  }
>  
> -- 
> 2.37.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


