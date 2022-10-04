Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E815F40F9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:45:12 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offQF-0005cW-Cx
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offN9-0001UD-2m
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offN7-0002Z1-K7
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664880116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5C34Gmv568I5JpnCmHejbryrnACMU0cliz+IZLqse30=;
 b=N/4ONB3YGKf864JBJz3jXuvI6j1jMFkspkFOgJLpuLor03TIrsDYaOnuC+I3rO/KSfeSbl
 EnBjC+PuUo/fgnsQab+a/9j2Xf0eNcpQwzUfbaWsMCW3Fh79RAzQQDhalrzn43v1xVwRxW
 grtsebLJmNM14pcGYcYS1krS/hESEqY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-T2bkBitoO_--mN7ekTi9dw-1; Tue, 04 Oct 2022 06:41:55 -0400
X-MC-Unique: T2bkBitoO_--mN7ekTi9dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so67017wme.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 03:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5C34Gmv568I5JpnCmHejbryrnACMU0cliz+IZLqse30=;
 b=OX5PDWzqWD4oSWWj6VwnAVES7tZPdYEoMu0KOCHsyNtcZoTrdW6LudtFLnIjSC+T5W
 k+G5eUtCXe3jNSMOe+TSzXSQ6gyBVqpAHJEXgehnOIgsrNbLGLWn9rVl+Q8pSzu18M9v
 TJe7jOz6vXOZfW1Ey7ME7MGYgRbQ+MzKOwV3Gav/2Z9lH56F3H1PplyyTxGO/Smx4c7s
 aYGT787ocB8elSlKn0vCLiSqmtRbmKvsSa6C+yaQhWtjOiI+Ga42nLUpZHMFD25KMNxQ
 pe02E+cTicoSCqRxX8ZO396oPQl8q7Pt5v6eAUEH6LH3Pf8IKDHjm7f0Qjcum0rzjjwY
 /xHw==
X-Gm-Message-State: ACrzQf2nRJFTak5jHjE3P7CTuwVonnCu8gn5UQ0vfh5nwepk+GWadzh8
 n9tPY9w0WjmIBrT3Tm2T9rVvoSiUC/2+AtiYjE6HDIVfFvCXaj7p1dxGBUo9lALiYku1L3XXS+1
 WijQaff9HU3jqlws=
X-Received: by 2002:adf:de11:0:b0:22e:32bf:73f0 with SMTP id
 b17-20020adfde11000000b0022e32bf73f0mr8525194wrm.37.1664880114483; 
 Tue, 04 Oct 2022 03:41:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42QFMGNOl3QH/GQeXY10xmnft3ERCBJhstLYFRZ6/xXVD7nmL6umy6dT/oRYLu8pzukyUSjA==
X-Received: by 2002:adf:de11:0:b0:22e:32bf:73f0 with SMTP id
 b17-20020adfde11000000b0022e32bf73f0mr8525177wrm.37.1664880114302; 
 Tue, 04 Oct 2022 03:41:54 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h11-20020adfe98b000000b0022c906ffedasm12095856wrm.70.2022.10.04.03.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 03:41:53 -0700 (PDT)
Date: Tue, 4 Oct 2022 11:41:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 03/14] migration: Trivial cleanup save_page_header() on
 same block check
Message-ID: <YzwN7x0YKhH95o1z@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225106.48451-4-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225106.48451-4-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
> to be clearer.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index fc59c052cf..62ff2c1469 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -661,14 +661,15 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>                                 ram_addr_t offset)
>  {
>      size_t size, len;
> +    bool same_block = (block == rs->last_sent_block);
>  
> -    if (block == rs->last_sent_block) {
> +    if (same_block) {
>          offset |= RAM_SAVE_FLAG_CONTINUE;
>      }
>      qemu_put_be64(f, offset);
>      size = 8;
>  
> -    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
> +    if (!same_block) {
>          len = strlen(block->idstr);
>          qemu_put_byte(f, len);
>          qemu_put_buffer(f, (uint8_t *)block->idstr, len);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


