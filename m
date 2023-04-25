Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C16EE326
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:33:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIn7-0000q6-Sf; Tue, 25 Apr 2023 09:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prIn5-0000pR-T0
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prIn4-00028D-9W
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svgNIZ5eP0FTVh8RCQkRk+xNG+olzbmoYO7o8WyjxrQ=;
 b=LyIpF/ALelgaXzxMxJvPYCIWgPjp+5zq0EQUeIT1nTQY0JMNobP8Md1pSXUW1rtoQ3Qgem
 oQGVgN5+vi5xgLW1LTa+Fzl8RoJLkrK96Foqm2NIdCkqcaB1Za7FuaLgbRH4EN/Y2+E/Sq
 owGonzyZ6AYqpk/MBHCPY5SgEbFW/oA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-jws16vTxMSGPiAHazhQOoA-1; Tue, 25 Apr 2023 09:32:59 -0400
X-MC-Unique: jws16vTxMSGPiAHazhQOoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so59027565e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 06:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682429578; x=1685021578;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=svgNIZ5eP0FTVh8RCQkRk+xNG+olzbmoYO7o8WyjxrQ=;
 b=crHIDX3xd7WEhheKqMAkWPFB9xLNxQSTksmzJOFei/FLecFFjQRs+BrJYh95bE8kQ8
 ilHn9no2Pdp9VQ5JRv/N/5FtSshIUMHwRYsCECve4eq8FvDk6+Rf4SepGEJylqNXNOvt
 dzoqU68V+43PwKb88pzPAxpRYsU8EHe/2Pe7un/q5ywb7dw9PWf+YZ6UVWzoDmb9D5Bx
 Dz/mnKybrYPK46PSWxjwcj3b6UmV6dgABNWV6jmcTjbmbh3eWjaUd2R8JBQpa8gX7gCq
 nxL3BktM+MSPdN4VyIJgEUYkm+pjimf6CU8rv8lRwZKIaf53cjiBItCfj3euQNy+i1Pl
 G0ZA==
X-Gm-Message-State: AAQBX9flJkEv2+fnAw51HcglOVBxdJK0cki5ago4KLsblA6IgrEZixwy
 Plo3JYrJ3ImkOyr8ADWv6bCDmjXWgqgs6bwqKI8P0vnwEkjpVchMj+Dam1+q2JObPC/Ok6orNPs
 NHKp+BACgRP04wMU=
X-Received: by 2002:a7b:c8c4:0:b0:3ee:1084:aa79 with SMTP id
 f4-20020a7bc8c4000000b003ee1084aa79mr9153613wml.20.1682429578543; 
 Tue, 25 Apr 2023 06:32:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDW9dQIae7aw5zGNCpAEYK4agoMS0t6i145NlW1VJPvXjNJVGiI0ZuiF2MUHEet9R9QUnGPQ==
X-Received: by 2002:a7b:c8c4:0:b0:3ee:1084:aa79 with SMTP id
 f4-20020a7bc8c4000000b003ee1084aa79mr9153593wml.20.1682429578233; 
 Tue, 25 Apr 2023 06:32:58 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f17848673fsm14930795wml.27.2023.04.25.06.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 06:32:57 -0700 (PDT)
Date: Tue, 25 Apr 2023 09:32:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230425093235-mutt-send-email-mst@kernel.org>
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
 <20230425105603.137823-4-vsementsov@yandex-team.ru>
 <20230425084121-mutt-send-email-mst@kernel.org>
 <12e32fad-f4a2-73df-8345-2ce7ac56aa35@yandex-team.ru>
 <56042897-8efc-d77d-68eb-9af94a8921a5@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56042897-8efc-d77d-68eb-9af94a8921a5@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 25, 2023 at 04:19:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 25.04.23 16:07, Vladimir Sementsov-Ogievskiy wrote:
> > On 25.04.23 15:43, Michael S. Tsirkin wrote:
> > > On Tue, Apr 25, 2023 at 01:56:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > On incoming migration we have the following sequence to load option
> > > > ROM:
> > > > 
> > > > 1. On device realize we do normal load ROM from the file
> > > > 
> > > > 2. Than, on incoming migration we rewrite ROM from the incoming RAM
> > > >     block. If sizes mismatch we fail.
> > > > 
> > > > This is not ideal when we migrate to updated distribution: we have to
> > > > keep old ROM files in new distribution and be careful around romfile
> > > > property to load correct ROM file. Which is loaded actually just to
> > > > allocate the ROM with correct length.
> > > > 
> > > > Note, that romsize property doesn't really help: if we try to specify
> > > > it when default romfile is larger, it fails with something like:
> > > > 
> > > > romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
> > > > 
> > > > This commit brings new behavior for romfile="",romsize=SIZE combination
> > > > of options. Current behavior is just ignore romsize and not load or
> > > > create any ROM.
> > > > 
> > > > Let's instead preallocate ROM, not loading any file. This way we can
> > > > migrate old vm to new environment not thinking about ROM files on
> > > > destination host:
> > > > 
> > > > 1. specify romfile="",romsize=SIZE on target, with correct SIZE
> > > >     (actually, size of romfile on source aligned up to power of two, or
> > > >      just original romsize option on source)
> > > > 
> > > > 2. On device realize we just preallocate ROM, and not load any file
> > > > 
> > > > 3. On incoming migration ROM is filled from the migration stream
> > > > 
> > > > As a bonus we avoid extra reading from ROM file on target.
> > > > 
> > > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> > > why is this a bad idea:
> > > - on source presumably user overrides romfile
> > > - we have a general rule that source and destination flags must match
> > > 
> > > I propose instead to ignore romfile if qemu is incoming migration
> > > and romsize has been specified.
> > > 
> > 
> > Hmm, that would work even better, as no additional options needed, thanks. I'll resend
> > 
> 
> romsize needed anyway, of course.

yes but it can match on source and dest.

> -- 
> Best regards,
> Vladimir


