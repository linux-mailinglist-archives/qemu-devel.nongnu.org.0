Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76C676DC9
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 15:48:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJbcP-0008CI-0i; Sun, 22 Jan 2023 09:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJbc5-0008Be-UU
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 09:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJbc4-0001nJ-0V
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 09:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674398786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNaZgcFTi2TLLnYOcABq2sGnqL8DnPGfx/J88r3uZ2A=;
 b=N5E9+0jvjCqe+nHNEtxu2oB29aNJfQbz8ucHXZAulFJIqkkRWwLBxx++BNSORf4p4LYGt3
 jVrPbmmQ+I5vQUuptx21ly1GXDF0LYJNfCHmnDhWdXYxPkB6gY0eZ4z0n9gnGMSNE5tAy4
 lx5cHvSvbBrSfmru79ZTMQAQZOYQfqo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-5o0gzOSDO7-5FL0TKZNzcA-1; Sun, 22 Jan 2023 09:46:24 -0500
X-MC-Unique: 5o0gzOSDO7-5FL0TKZNzcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j8-20020a05600c190800b003db2dc83dafso4624408wmq.7
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 06:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNaZgcFTi2TLLnYOcABq2sGnqL8DnPGfx/J88r3uZ2A=;
 b=hC+ler7YtmiC1q0FZAa2p5yMeN8WEuy/qNaNrXkZAmUFO49PDcdnyNkG8jx+3g1O7y
 dRrRs1RKruhZCFRIvZgKJsfv9cqYWEEgYJXn6q2WRS0TRgvbRxcAHLl++Wl7rt324zc5
 jfCAx7LEUY/O81P/WzvWhqVmNCqkocC2O97NxF0WwDxQ1CeFbmBF/oNCSb7AZHEzQHp6
 dSvQEGwq/b9GqfxXIbxoZI39zqxXu3fvR9qIPHsIkgRlbmhQHrFFBW8nxPr5147syaPb
 ONyuvQP0DOcra6GMb6V42ltobnuFBWi04thCoCbG0RpfIUoYTz+9ebdFmDGQgxuwl7v5
 toyQ==
X-Gm-Message-State: AFqh2koCooy2Dw3pCIlT+GGMYZV9O+/uf2H/5ORHdXqdQH3bRRPIsl5D
 GTU9s4ri7CjBzttDi9N0MBVFHHilXM9RYqUKWwZ7BRlGVrUdbGqEUJrr0oyaiEwEcfL7GBEEC3G
 wHAQFZcJ3ZhR3V1I=
X-Received: by 2002:a05:600c:4256:b0:3da:2a78:d7a3 with SMTP id
 r22-20020a05600c425600b003da2a78d7a3mr19882868wmm.33.1674398782706; 
 Sun, 22 Jan 2023 06:46:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUGuV2jHuEBSZ6ipM0HounKhaiht9pbMPWljeNvmNU8cILvpLxlcns0ZCiyIajVKDnU0MCjA==
X-Received: by 2002:a05:600c:4256:b0:3da:2a78:d7a3 with SMTP id
 r22-20020a05600c425600b003da2a78d7a3mr19882851wmm.33.1674398782491; 
 Sun, 22 Jan 2023 06:46:22 -0800 (PST)
Received: from redhat.com ([2.52.149.29]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003daf98d7e35sm8043061wmb.14.2023.01.22.06.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 06:46:21 -0800 (PST)
Date: Sun, 22 Jan 2023 09:46:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <20230122093903-mutt-send-email-mst@kernel.org>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Jan 22, 2023 at 02:36:04PM +0200, Anton Kuchin wrote:
> > > This flag should be set when qemu don't need to worry about any
> > > external state stored in vhost-user daemons during migration:
> > > don't fail migration, just pack generic virtio device states to
> > > migration stream and orchestrator guarantees that the rest of the
> > > state will be present at the destination to restore full context and
> > > continue running.
> > Sorry  I still do not get it.  So fundamentally, why do we need this property?
> > vhost-user-fs is not created by default that we'd then need opt-in to
> > the special "migrateable" case.
> > That's why I said it might make some sense as a device property as qemu
> > tracks whether device is unplugged for us.
> > 
> > But as written, if you are going to teach the orchestrator about
> > vhost-user-fs and its special needs, just teach it when to migrate and
> > where not to migrate.
> > 
> > Either we describe the special situation to qemu and let qemu
> > make an intelligent decision whether to allow migration,
> > or we trust the orchestrator. And if it's the latter, then 'migrate'
> > already says orchestrator decided to migrate.
> 
> The problem I'm trying to solve is that most of vhost-user devices
> now block migration in qemu. And this makes sense since qemu can't
> extract and transfer backend daemon state. But this prevents us from
> updating qemu executable via local migration. So this flag is
> intended more as a safety check that says "I know what I'm doing".
> 
> I agree that it is not really necessary if we trust the orchestrator
> to request migration only when the migration can be performed in a
> safe way. But changing the current behavior of vhost-user-fs from
> "always blocks migration" to "migrates partial state whenever
> orchestrator requests it" seems a little  dangerous and can be
> misinterpreted as full support for migration in all cases.

It's not really different from block is it? orchestrator has to arrange
for backend migration. I think we just assumed there's no use-case where
this is practical for vhost-user-fs so we blocked it.
But in any case it's orchestrator's responsibility.

-- 
MST


