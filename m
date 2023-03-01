Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553AC6A71F7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQ7K-0007Cf-HO; Wed, 01 Mar 2023 12:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXQ7H-0007CQ-BR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXQ7F-0003Ql-SD
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677691185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rVu7shDNK3L2Z65QFZYcSdrjDV980yhR9ifX/44UFJg=;
 b=aYHomNM68+jp8/dJXNDmkVnk+yVycDebbshkUVRztgEJrW5aNOTQBSZSiSXZkB/7cNXQ2i
 GMHum7tnk//GkiV3bIsTPfxnyERxfx4ijobT/FQ6QZNFI3PlpzAL41nUPSTKuSsQx37tVV
 2TWyPr998iOtyL7NjQAOWMQSwwX5Mks=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-bSLWh83yMqaDdCVh0TfZUg-1; Wed, 01 Mar 2023 12:19:42 -0500
X-MC-Unique: bSLWh83yMqaDdCVh0TfZUg-1
Received: by mail-wm1-f71.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so8624269wmj.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677691181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVu7shDNK3L2Z65QFZYcSdrjDV980yhR9ifX/44UFJg=;
 b=TsfXDJ6/FaiZcXmmxJOrrzvpoPdcA+a2wSLnpJYMqvlLTJd3gCWISO1u68gQOosnnV
 0Mm4iouhZZndYNiJ3pMBaA0qMssFQCaTdrLWNKjWnznJhD6MAQDv0Yz7qJR21a63TbBQ
 zJ04dgAnwXxNxbQiY26pQZC7+lVr8EKJLRypdoo/MP0tezKGR1ayCYab47CtbgKADAO4
 ZmPKwd494bW0MjsGV9A4Gq8AR7cxQ+0SXiLTRYXgm8GSwo+Ch3LzkqCv5YKIErhjEcxj
 SbwkMhAYHy6hfhp11ovTX8DfTWCzEEPL/Qe4fo+a/8GGLqdisK1vzeHQmXPIOi5xuCKR
 ixtw==
X-Gm-Message-State: AO0yUKUPVXPvPN6B7mdx/qWOKLmkVPdlfBMNbGEaRWuVB0RAbxnFgE0p
 ixff98t6hEvsiCxCoGU3+UjpH0n05n3CAW4TLgdQIypAwKeBcZYJqM/zaQQMpYhXXZXdHNxQg2J
 D3OQ33gASVtwzQg4=
X-Received: by 2002:a05:600c:3b28:b0:3eb:3104:efe7 with SMTP id
 m40-20020a05600c3b2800b003eb3104efe7mr5638205wms.23.1677691181687; 
 Wed, 01 Mar 2023 09:19:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8izzpXUB0EoZvksRADDfnep2LnSsk+/CJeiZmkAD/g32QFCuBzBhf0Iv7UsVMWQGZQLNK7Wg==
X-Received: by 2002:a05:600c:3b28:b0:3eb:3104:efe7 with SMTP id
 m40-20020a05600c3b2800b003eb3104efe7mr5638187wms.23.1677691181342; 
 Wed, 01 Mar 2023 09:19:41 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003ea57808179sm145315wmj.38.2023.03.01.09.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 09:19:40 -0800 (PST)
Date: Wed, 1 Mar 2023 12:19:36 -0500
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
Message-ID: <20230301121751-mutt-send-email-mst@kernel.org>
References: <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <e1f45021-071c-b8c4-69bd-85f8c29c669a@yandex-team.ru>
 <20230301094424-mutt-send-email-mst@kernel.org>
 <39577b2c-71ec-5e83-d796-2c4fe3d1fc10@yandex-team.ru>
 <20230301104316-mutt-send-email-mst@kernel.org>
 <59d5d035-c787-1536-5a02-d979a3c0904e@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59d5d035-c787-1536-5a02-d979a3c0904e@yandex-team.ru>
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

On Wed, Mar 01, 2023 at 06:29:50PM +0200, Anton Kuchin wrote:
> On 01/03/2023 17:52, Michael S. Tsirkin wrote:
> > On Wed, Mar 01, 2023 at 05:40:09PM +0200, Anton Kuchin wrote:
> > > So catching errors in not the only purpose of this property, but it
> > > definitely
> > > allows us to catch some obvious ones.
> > OK let's say this. If migration=external then migration just works.
> > If migration=internal it fails for now. We are agreed here right?
> > 
> > Our argument is whether to check on load or save?
> > 
> > I propose this compromize: two properties:
> > 	migration-load and migration-save
> > 
> > 	migration-load : how is incoming migration handled.
> > 			 internal - through qemu
> > 			 external - through the daemon
> > 
> > 			  checked in pre-load
> > 
> > 	migration-save : how is outgoing migration handled.
> > 			 internal - through qemu
> > 			 external - through the daemon
> > 
> > 			  checked in post-save
> > 
> > This way whether the check is on source or destination or both
> > is up to the user.
> > 
> > Hmm?
> 
> Hmm, sounds interesting, this can be a really good compromise.
> 
> So migration-save will be "none" by default to protect unaware
> orchestrators.
> What do you think should migration-load be "none" too to force orchestrator
> set proper incoming migration type?

Yes.
I am also thinking whether we should block setting migration-load
if qemu is starting a VM as opposed to loading it.
Thoughts?


-- 
MST


