Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEEC6A6EC4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:47:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNj7-0008Pb-39; Wed, 01 Mar 2023 09:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXNj2-0008PJ-VW
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXNj1-0006jG-2A
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677681994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUodR8JxkRYa87fm6MkZDbh50z3pIalO3KjLeCU20yg=;
 b=g5sfOp3YjgmwCYj2ddwz8enBo8muXzr6EQ5N8hNfFNTb9lapBupTygrY0sKQsBjGkzDNHy
 Km41/VFjktOY0N1YnSmkMX5uBSAp3tmGqV10y3x1OILoRLwVhm1uHx2VIRQfN+H33tVbQt
 VDPzYngFleSws58ynrML3WYFqJnjr9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-Zv2hQHc3M0up0s7zsB8RCw-1; Wed, 01 Mar 2023 09:46:33 -0500
X-MC-Unique: Zv2hQHc3M0up0s7zsB8RCw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso5423907wmh.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677681991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUodR8JxkRYa87fm6MkZDbh50z3pIalO3KjLeCU20yg=;
 b=GSHmt/nnBajTAr9P0RXbjWXNj8xqdvZrTSs5drF9xoDaLlo/Z/kpTxZ/seLr3M93p0
 05YFW5sP5uuIxdBW3Ky1VlohiQKFqAZ+iL5N+VYY+4/aVz2pVxz4MiI56ow5P+Eaif0O
 gFQgs/OF3MP34Sz4WXVtYuhsV2+Ac7zRjm/RL1fxZJPat7gWH19SREcLVEvofAM3tOlB
 SvSCoWh8rwrU5q5q/g4Nsg2vxaZenMyfdNEAGRG3O/FRqVZZcrLLH7JG4C/+EyG5mtFo
 jexKVK1ooEI+Mi00sQIv0d6GbcDE2x92V+dniOZHUSm+LOXBdurcc3v0ES01gXaXPEj6
 /QlA==
X-Gm-Message-State: AO0yUKU8T4S4E4ngt2EbxuZ9bq98gZCPaJs/ObKzY30mrq1DAQ98H12s
 Jh6eqE+ZcNkUGgJ3usM8YAUiJfYhIGC5VkGw99gqzBRSwlv4pME2sEMVwPYorxfiAwHxit3Ldgu
 Raltpn31rAf0r8OE=
X-Received: by 2002:a5d:4561:0:b0:2c9:9147:a710 with SMTP id
 a1-20020a5d4561000000b002c99147a710mr4993064wrc.43.1677681991348; 
 Wed, 01 Mar 2023 06:46:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/POqB/fdM1lHVckOXuu0l3XVz2LDJ2SYblRRAxHWBe2M8n5ZNUxP0Xr2q5R13IQNsFwbQvHQ==
X-Received: by 2002:a5d:4561:0:b0:2c9:9147:a710 with SMTP id
 a1-20020a5d4561000000b002c99147a710mr4993045wrc.43.1677681990986; 
 Wed, 01 Mar 2023 06:46:30 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b002c705058773sm12767346wrs.74.2023.03.01.06.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:46:30 -0800 (PST)
Date: Wed, 1 Mar 2023 09:46:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301094424-mutt-send-email-mst@kernel.org>
References: <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <e1f45021-071c-b8c4-69bd-85f8c29c669a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1f45021-071c-b8c4-69bd-85f8c29c669a@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 01, 2023 at 05:03:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 01.03.23 00:24, Michael S. Tsirkin wrote:
> > > Said that checking on destination would need another flag and the safe
> > > way of using this feature would require managing two flags instead of one
> > > making it even more fragile. So I'd prefer not to make it more complex.
> > > 
> > > In my opinion the best way to use this property by orchestrator is to
> > > leave default unmigratable behavior at start and just before migration when
> > > destination is known enumerate all vhost-user-fs devices and set properties
> > > according to their backends capability with QMP like you mentioned. This
> > > gives us single point of making the decision for each device and avoids
> > > guessing future at VM start.
> > this means that you need to remember what the values were and then
> > any failure on destination requires you to go back and set them
> > to original values.
> 
> Why do we need to restore old values?

To get back to where you were before you were starting migration.

> For me, this new property is a kind of per-device migration
> capability. Do we care to restore migration capabilities to the values
> that they had before setting them for failed migration? We don't need
> it, as we just always set capabilities as we want before each
> migration. Same thing for this new property: just set it properly
> before migration and you don't need to care about restoring it after
> failed migration attempt.

If you really trust your management then we can just remove the
migration blocker and be done with it. All this song and dance
with changing properties is to catch errors. If one has to
carefully play with QOM to achieve the desired result then
IMHO we failed in this.


> > With possibility of crashes on the orchestrator
> > you also need to recall the temporary values in some file ...
> > This is huge complexity much worse than two flags.
> > 
> > Assuming we need two let's see whether just reload on source is good
> > enough.
> > 
> 
> -- 
> Best regards,
> Vladimir


