Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15D60EA13
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:14:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmlL-0001pM-OA; Wed, 26 Oct 2022 16:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmlJ-0001mc-TG
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmlI-0002ZC-E3
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666815147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JLywmIeEFaLDhas8WGjxolpEbFqvnMLBujHt83+l1w8=;
 b=Ck3nmVLzg+H4zMi/QEGiNc29vQBrzB/T5iIiLaSJyuZNDAwB52LkhPTjAxYdDqPvEwWHY2
 fWlQJ+dcaManRvDlu01GB9oQrbPXDQYtt8/jR6sGe32ImfEDNxY1ohv2L1C62YBI5Jhpql
 53Ep6OeWWNBnJcq7IiQZ0546xhrz1/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-D6ZVNeK5OquMWcSY0dpZCw-1; Wed, 26 Oct 2022 16:12:25 -0400
X-MC-Unique: D6ZVNeK5OquMWcSY0dpZCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so6624708wmb.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLywmIeEFaLDhas8WGjxolpEbFqvnMLBujHt83+l1w8=;
 b=xlkHlSjnbkP4lqJ1hnWvDO35FWCW+BAQniQoL+3avzda/J4mjJjlu7v024kcLzMCJT
 kFmDh0ne/N1EWt5/AXWQN6B8JjtFUvVy2LGlskwcAkbDQfuwZ1HNIKjxZixN2UJvfnPy
 k7ECQOy+WJkQFuu6asA34SD17e1e68z5J2TsPaudAjnU3AKew9BX0k69amBIgF28oOMX
 jP2E/dz/p+ASVp9Vnf+ujTlk1jU8BFNGFWBWugPEyY8E7p4BKmWqu0ikLYDozt9LDB21
 Tp1hdSmDpwAWLuyRHXQYc/npJnNTbkpZfOffKsrRwcYhVl2Bv14uhEHDXRDG/287m4Ja
 8nlw==
X-Gm-Message-State: ACrzQf2aeSHa3nfGlic6S5dppyZ/ZcqPwqQ5P+u4zYPJFatq7dthlhoo
 Sgpgdqae92C7uc+X7ELsmX9KVWrHZrHXuVKOhL4VIk1LXSGe6fjIp9MM/RCjMGur2sMPv8mCAQx
 +t39iCU5gfi0fSXY=
X-Received: by 2002:a5d:53c9:0:b0:236:69fd:d4cc with SMTP id
 a9-20020a5d53c9000000b0023669fdd4ccmr14338284wrw.618.1666815144582; 
 Wed, 26 Oct 2022 13:12:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4PAiC25h5aI4YK5EHay5JKSnOm/OYaczwZcLhFukbJ2wPRb/zlsi6O4I3X4nq3n5lhZz6WLg==
X-Received: by 2002:a5d:53c9:0:b0:236:69fd:d4cc with SMTP id
 a9-20020a5d53c9000000b0023669fdd4ccmr14338270wrw.618.1666815144344; 
 Wed, 26 Oct 2022 13:12:24 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 x23-20020a05600c21d700b003a83ca67f73sm2768542wmj.3.2022.10.26.13.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:12:23 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:12:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, lvivier@redhat.com,
 amit@kernel.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, david@redhat.com
Subject: Re: [PATCH 0/4] Replace QERR_PERMISSION_DENIED by better error
 messages
Message-ID: <20221026161208-mutt-send-email-mst@kernel.org>
References: <20221012153801.2604340-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012153801.2604340-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 12, 2022 at 05:37:57PM +0200, Markus Armbruster wrote:
> Markus Armbruster (4):
>   qom: Improve error messages when property has no getter or setter
>   backends: Improve error messages when property can no longer be set
>   qtest: Improve error messages when property can not be set right now
>   qerror: QERR_PERMISSION_DENIED is no longer used, drop

vhost user things

Acked-by: Michael S. Tsirkin <mst@redhat.com>

>  include/qapi/qmp/qerror.h       | 3 ---
>  backends/cryptodev-vhost-user.c | 2 +-
>  backends/rng-egd.c              | 2 +-
>  backends/rng-random.c           | 2 +-
>  backends/vhost-user.c           | 2 +-
>  qom/object.c                    | 6 ++++--
>  softmmu/qtest.c                 | 4 ++--
>  7 files changed, 10 insertions(+), 11 deletions(-)
> 
> -- 
> 2.37.2


