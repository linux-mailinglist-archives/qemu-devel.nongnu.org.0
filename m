Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38E57A131
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:20:51 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDo5i-0006BC-MR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDnvd-0007Ah-Cu
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDnvZ-00063n-DM
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658239820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UUeEMy3ay/gCSYNmRI7LGB8eZyjUhQ2bKSBnGYErFis=;
 b=DmN9fNsVjyWvsYNZJ3GdSEl6nBzC8M17OGsHXkZyINCSAhURILtO/xh+Jo3xaxpQmTpCo+
 tDBWr50u4iYmuQaTSOPogRJIoBnTCLEpKffN1p9ACr/caf12SwxEYKg9JoC5cHTv+V7FpP
 t67GQBGWu06iR1MzdsMqmh7cydbcheE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-kyjDPd3iMoe2xijo7Lcbtw-1; Tue, 19 Jul 2022 10:10:18 -0400
X-MC-Unique: kyjDPd3iMoe2xijo7Lcbtw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i13-20020adfaacd000000b0021d96b4da5eso2625104wrc.18
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UUeEMy3ay/gCSYNmRI7LGB8eZyjUhQ2bKSBnGYErFis=;
 b=h3KLjHS6ZgYfQR1strNJLcvTWhEOrmnwHek9/OpUQrrhbFlzZpjYawEuTrcY6QeIps
 EMGX5R7/g1l/1pEqV4s/RLEUWm7nO+pyWZuU4hVDCOf8ACoWqRTCEI2giVWZ1hPNa/qZ
 See1NHgy1pou2VjLoM/xl6dnhHs8Yu/FqYZ1HGJkEL1a4EoY4Isw+zqhWOCKOnQBLK+C
 rroPIZ2/KGJE7WVAJO2ysECxDaBQn5TCOEIJPKBd/QXUBl6Em7POhk6eeRoKPXZ7+2uj
 1LAlfnQi2jjRYTSQa4fioZzb3k7m+DC4y5vKNNq9sEtVX4EYIKoubzIrG8igKJhLS68A
 RZug==
X-Gm-Message-State: AJIora8mZnkOMbu0lOGcNVMZVg6oB5i6oswtcmYux2bQxOZYKMtFUGNn
 P9yCO0EpXtFwwLJ62pF9VHDf5d9IABWBtMILwa3vwW+NvSiDuJ4eI8Ld4KIMhqS/rTOkLU/9imt
 xmcmWp8wI5axfpt8=
X-Received: by 2002:adf:e604:0:b0:21d:6ddb:d0ec with SMTP id
 p4-20020adfe604000000b0021d6ddbd0ecmr27418596wrm.177.1658239817374; 
 Tue, 19 Jul 2022 07:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFTCI0yjxeziU0oODJ7vAijxgKCjYAWs2BOffFlGlHtQsUrSdlIDdGXW5pvvKH0/cbiyb0hA==
X-Received: by 2002:adf:e604:0:b0:21d:6ddb:d0ec with SMTP id
 p4-20020adfe604000000b0021d6ddbd0ecmr27418571wrm.177.1658239817117; 
 Tue, 19 Jul 2022 07:10:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm26337080wmc.45.2022.07.19.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 07:10:16 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:10:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/3] Zero copy improvements (QIOChannel + multifd)
Message-ID: <Yta7RoAS9bV20mdg@work-vm>
References: <20220711211112.18951-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711211112.18951-1-leobras@redhat.com>
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

* Leonardo Bras (leobras@redhat.com) wrote:
> The first patch avoid spuriously returning 1 [*] when zero-copy flush is
> attempted before any buffer was sent using MSG_ZEROCOPY.
> 
> [*] zero-copy not being used, even though it's enabled and supported
> by kernel
> 
> The second patch introduces a new migration stat
> (dirty-sync-missed-zero-copy) that will be used to keep track of [*]. 
> 
> The third patch keeps track of how many zero-copy flushes retured 1 [*]
> 
> Changes since v3:
> - Patch#1: Also checks if no packet was queued after the last flush
> - Patch#2: Improve dirty-sync-missed-zero-copy doc and hmp print message
> 
> Changes since v2:
> - Documentation release number changed from 7.2 to 7.1
> - migration stat renamed from zero-copy-copied to 
>   dirty-sync-missed-zero-copy
> - Updated documentation to make it more user-friendly
> 
> Changes since v1:
> - Idea of using a warning replaced by using a migration stat counter

Queued
> 
> 
> 
> Leonardo Bras (3):
>   QIOChannelSocket: Fix zero-copy flush returning code 1 when nothing
>     sent
>   Add dirty-sync-missed-zero-copy migration stat
>   migration/multifd: Report to user when zerocopy not working
> 
>  qapi/migration.json   | 7 ++++++-
>  migration/ram.h       | 2 ++
>  io/channel-socket.c   | 8 +++++++-
>  migration/migration.c | 2 ++
>  migration/multifd.c   | 2 ++
>  migration/ram.c       | 5 +++++
>  monitor/hmp-cmds.c    | 5 +++++
>  7 files changed, 29 insertions(+), 2 deletions(-)
> 
> -- 
> 2.37.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


