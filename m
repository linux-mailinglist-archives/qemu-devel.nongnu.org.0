Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5E6784E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 19:28:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK1Xb-0000cc-3F; Mon, 23 Jan 2023 13:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK1XZ-0000cS-7V
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK1XX-0007Hv-EW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674498449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sba/+uTWbJ7F7cTnBGqJtGA0puoRVfBR5yRmmV/ZbyE=;
 b=OqdTt/fhrUDVZkdN77xf5LbDPxCtX9pSg0E5MGkwRfZrk31JKVgTG8NuuLbEAe+UmVjDV0
 ANlhZ4TQXgJ9TVJ+B/zRRPWvFkNoM6AonOXyaKZp54fEGvh0GCNr4bR9y+/YeSUbzZrF1o
 8Dz9UCm0sYDUTGIY3ZGl/wDAOJd65ds=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-4TExVCQXPJaFXtDauH9Y3g-1; Mon, 23 Jan 2023 13:27:27 -0500
X-MC-Unique: 4TExVCQXPJaFXtDauH9Y3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 o15-20020a5d684f000000b002be540246e1so1682058wrw.22
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 10:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sba/+uTWbJ7F7cTnBGqJtGA0puoRVfBR5yRmmV/ZbyE=;
 b=b7jfP6XiTxQSlH81ldc8qnbJ0GCF9GhQJM2Pz6N5FmK1rvTzNb4Rau4kzHiHb+Bii1
 u7DDnEVxvxIpjfWLHLpE4DrBZx4kmsQDVC/pxcoZzbUkL/baWF0ma1Ara1Co8kmff4t9
 RQwDVXgJq/xFgZzUDKk2qD4ZK7rdWRWE6OYdikizuJDlBy/mxtCBuM/gpOEzOftLSUsD
 lL/zstg8rguKGKUX5NRzK1+rmE62jVhOSsdnTmMmt5sOVqr9fFg9cOKv+6MNrxJZuBqZ
 rORd2dd5whrlwB2UiNH8LaiJrjiQefjTIKKeWXJam79FbNZdHksB1rvDbuNpRdmVjiUk
 Z8Fg==
X-Gm-Message-State: AFqh2kr40vCxUQH3GNaA4vSak2OMprC5waCX1/Jy7iPN2a674WTurnT8
 0w4UdM15n5kBz5IBCqr0rL6enx0URs/UvtDQW4iUtLcXtpmXT+0Ls83bt3LKVKKTu9rhT+oMIL4
 Tc4tJZDpJIQ0oVv0=
X-Received: by 2002:a05:600c:3b82:b0:3d3:5d0f:6dfc with SMTP id
 n2-20020a05600c3b8200b003d35d0f6dfcmr24394886wms.30.1674498446644; 
 Mon, 23 Jan 2023 10:27:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLBdWiGs/wx7yesnY6alL9fDGKkem0nKoDWiaG2OxJYLqPSdPSCxeYcLBnFZ3pxI3Zd5gGOA==
X-Received: by 2002:a05:600c:3b82:b0:3d3:5d0f:6dfc with SMTP id
 n2-20020a05600c3b8200b003d35d0f6dfcmr24394865wms.30.1674498446426; 
 Mon, 23 Jan 2023 10:27:26 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a1c541d000000b003dc0cb5e3f1sm132878wmb.46.2023.01.23.10.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:27:26 -0800 (PST)
Date: Mon, 23 Jan 2023 18:27:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y87Ri4r6SiETdCrt@work-vm>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230122111618-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
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

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Sun, Jan 22, 2023 at 06:09:40PM +0200, Anton Kuchin wrote:
> > 
> > On 22/01/2023 16:46, Michael S. Tsirkin wrote:
> > > On Sun, Jan 22, 2023 at 02:36:04PM +0200, Anton Kuchin wrote:
> > > > > > This flag should be set when qemu don't need to worry about any
> > > > > > external state stored in vhost-user daemons during migration:
> > > > > > don't fail migration, just pack generic virtio device states to
> > > > > > migration stream and orchestrator guarantees that the rest of the
> > > > > > state will be present at the destination to restore full context and
> > > > > > continue running.
> > > > > Sorry  I still do not get it.  So fundamentally, why do we need this property?
> > > > > vhost-user-fs is not created by default that we'd then need opt-in to
> > > > > the special "migrateable" case.
> > > > > That's why I said it might make some sense as a device property as qemu
> > > > > tracks whether device is unplugged for us.
> > > > > 
> > > > > But as written, if you are going to teach the orchestrator about
> > > > > vhost-user-fs and its special needs, just teach it when to migrate and
> > > > > where not to migrate.
> > > > > 
> > > > > Either we describe the special situation to qemu and let qemu
> > > > > make an intelligent decision whether to allow migration,
> > > > > or we trust the orchestrator. And if it's the latter, then 'migrate'
> > > > > already says orchestrator decided to migrate.
> > > > The problem I'm trying to solve is that most of vhost-user devices
> > > > now block migration in qemu. And this makes sense since qemu can't
> > > > extract and transfer backend daemon state. But this prevents us from
> > > > updating qemu executable via local migration. So this flag is
> > > > intended more as a safety check that says "I know what I'm doing".
> > > > 
> > > > I agree that it is not really necessary if we trust the orchestrator
> > > > to request migration only when the migration can be performed in a
> > > > safe way. But changing the current behavior of vhost-user-fs from
> > > > "always blocks migration" to "migrates partial state whenever
> > > > orchestrator requests it" seems a little  dangerous and can be
> > > > misinterpreted as full support for migration in all cases.
> > > It's not really different from block is it? orchestrator has to arrange
> > > for backend migration. I think we just assumed there's no use-case where
> > > this is practical for vhost-user-fs so we blocked it.
> > > But in any case it's orchestrator's responsibility.
> > 
> > Yes, you are right. So do you think we should just drop the blocker
> > without adding a new flag?
> 
> I'd be inclined to. I am curious what do dgilbert and stefanha think though.

Yes I think that's probably OK, as long as we use the flag for knowing
how to handle the discard bitmap as a proxy for the daemon knowing how
to handle *some* migrations; knowing which migrations is then the job
for the orchestrator to be careful of.

Dave

> -- 
> MST
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


