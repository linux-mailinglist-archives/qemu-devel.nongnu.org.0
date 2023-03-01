Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A196A7055
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOm7-0004XA-Km; Wed, 01 Mar 2023 10:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOm5-0004Ut-Nm
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOm4-0007za-A5
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677686026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9IZw7MPlOeDH0bgZtGzPvRkxT98IkeM3rZ50O1BiJ0=;
 b=NZ+4sfiFEmS6Dhvh31vHNAk6DY2UQkuyuc5j1MUP6pIGQE+1xowxtcp0ImTguAzNmvWo3f
 uK8H3Pk6xzT8ZCVf5DzbnD2LaALu+gWh7+2pa/WXcWv5rpu3fDWrka4drHtAhFGQcup6L8
 b9/lZ8G+63/+BAm0bU6FyoX2moFoYCo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-oznwWzqKOl2iNnkOeQ679A-1; Wed, 01 Mar 2023 10:53:11 -0500
X-MC-Unique: oznwWzqKOl2iNnkOeQ679A-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020a056000188700b002cdd0562b11so251885wri.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677685979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9IZw7MPlOeDH0bgZtGzPvRkxT98IkeM3rZ50O1BiJ0=;
 b=iXb9o1eYD3oh5ls7Ny2mMoCq3hnstAb/0U/rqq6ZHioKwRJfNMChxe3SN5S+Q8+7/i
 r4pNpN3CQXEDV2Bc916LJKGMTWbrtKfKB7rHvehvRbzdRMeRa3aG4K+ktd1TP/albg9k
 uiFLoq2f2o4Vb1j24UjGoMEyNYS8lQmCBnXPw0Xa5Rh9Uxo6QpDVt9DNX2ulj/cRCezf
 e8ciuGUnTidA+XlADZ7OMh9T9QMunyRBTfVl4B+0bFGLDU2TR+y6tkGsMtHWxknRdtu1
 NVc8kNv4ijLDMfuzaUY46rj5rkHZ5RLRXJrL7jG+sAq07cIModoRMdrPxt4JDQQcSIVd
 5+aw==
X-Gm-Message-State: AO0yUKUGBebNjpg5lDKLcnzUniF00yVrOFr5eQpLrZB9NjQSAILWPn03
 6/wBIMBh+yjX2TraaczdJf146A5FKanTG6kNtzlEkvDmH9MNgOMkZaVWyVoCeuUI1xowzJfZyoy
 yX12Bb6NI3djb8Ec=
X-Received: by 2002:a05:600c:43ca:b0:3da:2a78:d7a4 with SMTP id
 f10-20020a05600c43ca00b003da2a78d7a4mr5142851wmn.21.1677685979289; 
 Wed, 01 Mar 2023 07:52:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9CY4vfNBoH90tsrNNPFE61MUtkZhDj8LH2M55QdeDRRjGY7XVG5/KTes1YfYziaQfMvQbZlA==
X-Received: by 2002:a05:600c:43ca:b0:3da:2a78:d7a4 with SMTP id
 f10-20020a05600c43ca00b003da2a78d7a4mr5142836wmn.21.1677685978945; 
 Wed, 01 Mar 2023 07:52:58 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003dec22de1b1sm17931818wmq.10.2023.03.01.07.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:52:58 -0800 (PST)
Date: Wed, 1 Mar 2023 10:52:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301104316-mutt-send-email-mst@kernel.org>
References: <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <e1f45021-071c-b8c4-69bd-85f8c29c669a@yandex-team.ru>
 <20230301094424-mutt-send-email-mst@kernel.org>
 <39577b2c-71ec-5e83-d796-2c4fe3d1fc10@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39577b2c-71ec-5e83-d796-2c4fe3d1fc10@yandex-team.ru>
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

On Wed, Mar 01, 2023 at 05:40:09PM +0200, Anton Kuchin wrote:
> So catching errors in not the only purpose of this property, but it
> definitely
> allows us to catch some obvious ones.

OK let's say this. If migration=external then migration just works.
If migration=internal it fails for now. We are agreed here right?

Our argument is whether to check on load or save?

I propose this compromize: two properties:
	migration-load and migration-save

	migration-load : how is incoming migration handled.
			 internal - through qemu
			 external - through the daemon

			  checked in pre-load

	migration-save : how is outgoing migration handled.
			 internal - through qemu
			 external - through the daemon

			  checked in post-save

This way whether the check is on source or destination or both
is up to the user.

Hmm?

-- 
MST


