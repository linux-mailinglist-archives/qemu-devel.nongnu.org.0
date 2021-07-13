Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CB63C6F1E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:06:33 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GFE-0002af-ET
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3GDh-0001VZ-FJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3GDe-00025G-SE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626174293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BaEF/PblhDz3wBi6AFwt0ctK5QRPduOJ6qjMRXL8weI=;
 b=P6CYimb9q/DzywDRa0RHS6Qt62+pD2obuas30GB9G3O3vRArOtiSLeOibZFJWNrfxYwHSU
 sK+ICPlPSyvYQiTNFCHQUYVKjKXpF2QUWlm/BNKSrkBPf3CGhS8hqQVjgrs2GR+iF8zZ8M
 BoURklVsOQpRmUFXsWkG+FuQqOpcWKM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-UfOpZnVAMLGeVIlTlH3Qmg-1; Tue, 13 Jul 2021 07:04:52 -0400
X-MC-Unique: UfOpZnVAMLGeVIlTlH3Qmg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p3-20020a05600c3583b02901f55d71e34aso1309095wmq.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BaEF/PblhDz3wBi6AFwt0ctK5QRPduOJ6qjMRXL8weI=;
 b=fV8MD12+kR9rje9W3utosjH0vjhq65w8y8tQmxK9Oy2lHeprTFlclQd01/3fdF2fNZ
 Z4q4aBa0rsPdmnmAMqdNGFbb2kmwTVIEY9D7hwv2uCuDHin8HT43bboew+8wht49XYWm
 BB3hD3/eeJ8qbjNopP1pFcJpeebsOQII7CzULtHeAZzQN9392VKu9RDlt02dspP58IEs
 wowWFjFRVdoUaooGD+74ozswW+SJQbGlIIC4Nt4By32cJfvr4rh/SMTtl7k9uBfUMb1w
 5Cjui5h7YYy7mnAXTGxL5H+GUeZyAPLYU67Rarrbp++lLDQx7bQKtL1O7u65ikIg1CIw
 E7yQ==
X-Gm-Message-State: AOAM533gve4DQA4SuS9t9jqTEanT6YvqERVW1tjalfwPgUzCjUei5c3+
 7MalQiHRIx7Qm+J7hM6tcy3QuF2xsuZ+lEwtx2Cw5eUHfjJhbSoQllPI66BDeqUgNtQc3ZzsT+U
 cuFzrUWYk7mW/ZDE=
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr20019694wmb.80.1626174291806; 
 Tue, 13 Jul 2021 04:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqUbeWhZysC2n/O1262e4bvNI/iXerzHcZpIlmXHum6iYay1fj9AHaHmB4aVpkuBUeuPc5Pg==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr20019675wmb.80.1626174291655; 
 Tue, 13 Jul 2021 04:04:51 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id y13sm17253868wrp.80.2021.07.13.04.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 04:04:47 -0700 (PDT)
Date: Tue, 13 Jul 2021 12:04:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/3] migration: Three more fixes for postcopy recovery
Message-ID: <YO1zTb8KxdGmt6P3@work-vm>
References: <20210708190653.252961-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708190653.252961-1-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Xiaohui <xiaohli@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> A few more issues spotted by either Xiaohui or me.  Please see and review
> individual patches for what they do.  Thanks,
> 
> Peter Xu (3):
>   migration: Release return path early for paused postcopy
>   migration: Don't do migrate cleanup if during postcopy resume
>   migration: Clear error at entry of migrate_fd_connect()
> 
>  migration/migration.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)

Queued

> 
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


