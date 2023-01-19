Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5267349E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR7H-0003pf-8L; Thu, 19 Jan 2023 04:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIR7F-0003pI-Gs
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIR7E-0005qd-0a
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674120107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBjeONvfyecR/nctSr+yv1UhqD7ALDLuct8iYEgvHeM=;
 b=U28udJP7i27SljGzuUm8/mJUI8vBpeEvZt2jumaZkJUbiMsUDjkxdCJeA6IV/tLF7TKUwF
 uO1hihXW21iAGbDQWsH2bq1e3UABCsu9FJx/FE2LohRQSaUsKWMHxUSUM1zxLnkk4CEKwt
 tbGTSzfm8DLDG7z9og0H3x2/8Hly/b0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-ji-oL7QlPGGuyvet783Oqw-1; Thu, 19 Jan 2023 04:21:45 -0500
X-MC-Unique: ji-oL7QlPGGuyvet783Oqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j11-20020adfa54b000000b002bd9b1e1656so219520wrb.15
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 01:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBjeONvfyecR/nctSr+yv1UhqD7ALDLuct8iYEgvHeM=;
 b=ikVJ2A6cMlaznU2ucNL5eevvq79Zw0gMUjeplnr4r7yRxPJpiE8CFecM8OnI2h51yK
 661o9K8+o9IqNfWcza3tKb7Qb+X62QMJAo9jM0nHnM0xvPJKwGtZUDDJqjsPs/9/Fgcv
 MRhbIvXgRFtVXGYF+rtQaXq6B5fsvTFGllEw8itYTU/5sHBswognYejzhVY4oRljlYX+
 OPBHgatds9WStqdP9zbXEb6L6PoP8Mw8q3QxV+3Zx37fPn3Hofcsl19LYMPT2cAyBsxu
 q9OmK9EU/fUeuDN3xxaeREa3iH1Dl/Oog82kHZJljvBYPNr3+fa2dhPgLMBaQmYN7dAs
 pz+A==
X-Gm-Message-State: AFqh2kp+c98/4pdoMdBUPji1FwB7QvDvVq+7Zn0LY1yh5Ek8Xy7alQEo
 j5vPun/r9f9KFUc5exgjuf0W7B/lv8VjmBGnpKTLfOwV1rAt/ykBxNUGoV0Ljc/wbDaIUPWN5kd
 W1rwXgsKStOKUvAM=
X-Received: by 2002:a05:600c:3b82:b0:3d2:392b:3165 with SMTP id
 n2-20020a05600c3b8200b003d2392b3165mr9630558wms.12.1674120104486; 
 Thu, 19 Jan 2023 01:21:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfJH+7tWpaVwi9+ofIbK5kglcFlYCHfhm2NwNbf4fI5xHPl41A+szMkVboW8fmaS+OQkL22Q==
X-Received: by 2002:a05:600c:3b82:b0:3d2:392b:3165 with SMTP id
 n2-20020a05600c3b8200b003d2392b3165mr9630542wms.12.1674120104281; 
 Thu, 19 Jan 2023 01:21:44 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003c6b7f5567csm6544818wms.0.2023.01.19.01.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 01:21:43 -0800 (PST)
Date: Thu, 19 Jan 2023 09:21:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, quintela@redhat.com
Subject: Re: [PATCH 1/2] MAINTAINERS: Cover userfaultfd
Message-ID: <Y8kLpuWAFaRfuDTg@work-vm>
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119091545.3116376-2-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Commit 0e9b5cd6b2 "migration: introduce UFFD-WP low-level interface
> helpers" added util/userfaultfd.c without covering it in MAINTAINERS.
> Add it to section "Migration".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fe50d01e3..0dfdf71d48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3089,6 +3089,7 @@ S: Maintained
>  F: hw/core/vmstate-if.c
>  F: include/hw/vmstate-if.h
>  F: include/migration/
> +F: include/qemu/userfaultfd.h
>  F: migration/
>  F: scripts/vmstate-static-checker.py
>  F: tests/vmstate-static-checker-data/
> @@ -3096,6 +3097,7 @@ F: tests/qtest/migration-test.c
>  F: docs/devel/migration.rst
>  F: qapi/migration.json
>  F: tests/migration/
> +F: util/userfaultfd.c

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
>  D-Bus
>  M: Marc-Andr?? Lureau <marcandre.lureau@redhat.com>
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


