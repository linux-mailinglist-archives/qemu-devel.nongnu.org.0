Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1B543DFD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:57:34 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2k9-000462-CY
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2iH-0001pq-Aw
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2iF-0002sU-Tp
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654721735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQAyacIGWA2VuxBreF0Nztd2ShyV4ltWLxSA/UnYKRk=;
 b=Z4Rl84sAPC7IzMuch5bGBGkw6LRcUL0nI933Gbc6osJeU2U3Ip8+ndz58huxS2j5yZkkYL
 VSbgAtNU4OxVcSuRCNb69b8fdYf99UW1n6jgbhuEPQf37KQeXyJPOz1OLER4frk6IdO6UM
 DwPtoSoNuwU4Jz3bOEBazJUzl5Npu/c=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-RLGCSL-NP86QgbJLpOpxRg-1; Wed, 08 Jun 2022 16:55:33 -0400
X-MC-Unique: RLGCSL-NP86QgbJLpOpxRg-1
Received: by mail-io1-f72.google.com with SMTP id
 l3-20020a05660227c300b0065a8c141580so10389832ios.19
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RQAyacIGWA2VuxBreF0Nztd2ShyV4ltWLxSA/UnYKRk=;
 b=qd+qNAdcq6qSJ4fNRU07okDEKQ1qFIYtBnWCZyJs2808Du71ONvxKONqFiGnOWA+H3
 yHuwJdaIXtVdxT1Klc0kmwKFFHygn1I4lGRSKI5emcHvwY7ZdTY+sTty1nmLGV5lT7gD
 giSS55SXOOk17O+BPRWKMLOG/6Uy/LSNx3KlIG3BRob7uUfmqkenVjQZH5qWGCVVeUPS
 2Bmox92uTPyzAiH4izlZV17DGgrQ3pLvj1jaEki0Xe02s2wVYJRRF89ujhJnonO7SDP6
 RKBWkfkHqXL88OSjhaNNgP6bTl7mGzjADeRrVuHrRe2jlWwakTUbuJf0G9uqjRGbeEmt
 xnKA==
X-Gm-Message-State: AOAM5339HqGLN3uPa+QG3Grqic4PR7BWxb3hg/hbbb9ENanVR4iGcmdB
 qwb9/c2KuOow50h+vU9Q8sXAmYILls8ynqWegsQQNZalrHaEKxqUK3G4++CisNMP8xSmAoaevy3
 JAWaU2NDHmdNv03Y=
X-Received: by 2002:a5d:94c2:0:b0:60b:bd34:bb6f with SMTP id
 y2-20020a5d94c2000000b0060bbd34bb6fmr16671893ior.32.1654721733140; 
 Wed, 08 Jun 2022 13:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA2oxLbsn+jWmkkDB3k5Cth5LecRztoQoXydTqhR/OpXcQLXQ6C2pZHh21m7FhNH8G1npPaQ==
X-Received: by 2002:a5d:94c2:0:b0:60b:bd34:bb6f with SMTP id
 y2-20020a5d94c2000000b0060bbd34bb6fmr16671882ior.32.1654721732915; 
 Wed, 08 Jun 2022 13:55:32 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a02cc17000000b0032e2c859d8esm8484314jap.138.2022.06.08.13.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:55:32 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:55:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
Message-ID: <YqEMw4NWo3POMK47@xz-m1.local>
References: <20220608181808.79364-1-leobras@redhat.com>
 <YqEF4ikvnsizTQGO@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqEF4ikvnsizTQGO@xz-m1.local>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Jun 08, 2022 at 04:26:10PM -0400, Peter Xu wrote:
> On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> > Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> > part of the flushing mechanism got missing: incrementing zero_copy_queued.
> > 
> > Without that, the flushing interface becomes a no-op, and there is no
> > garantee the buffer is really sent.
> > 
> > This can go as bad as causing a corruption in RAM during migration.
> > 
> > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> > Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> Copy Dave/Juan; Leo please remember to do so in the next posts, or no one
> will be picking this up. :)

My fault, it's an io channel patch.  But still good to copy relevant
developers..

-- 
Peter Xu


