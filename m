Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD0678908
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 22:02:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3wA-0002ti-PF; Mon, 23 Jan 2023 16:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pK3w4-0002qK-27
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pK3w2-00064N-HY
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674507657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rs7AeJ9uSx4PLAXOKh6hhs9WNuPQ2imOYOZshvQwmwo=;
 b=Uk9jjcAMSL3DoFUBwohIBDTQavbPj6+s+A2pnJ7dnxQUSE6EJEB+qZHGxvzPrJL0JtwTSn
 O0ifsfW/V9pFnh8HiJON8j24sCZiy7jvLBvbbRnxZnjrzvHk98g4WIULCPoNvPUm41mSke
 329Qc01hm7T9soAX55uTlDAYKXgBzWQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-m0pJ4MgzNByiTcwHgOjmrw-1; Mon, 23 Jan 2023 16:00:56 -0500
X-MC-Unique: m0pJ4MgzNByiTcwHgOjmrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl5-20020a05600c0b8500b003db12112fdeso8108527wmb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 13:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rs7AeJ9uSx4PLAXOKh6hhs9WNuPQ2imOYOZshvQwmwo=;
 b=cPQ3gxDcbGGKkpdPQ2dygovdRoWGLGrfO6HvaZ+cvfQtLd5Gu0lsdYtEIT3E6AZLxy
 jXW7pcEdB5uDbBFVwnZx96XD5mSkgipFoVD9rivyUTfIX1hh57D9wyck0hIZ3NTNyyTf
 7REy+SSyUmzW7+mQe4Sp9av84VLW3JdZ69f30X2JgA9Uh+HdiF2VJwl+B2b4viq09cAT
 v7F+h/3DX2uC/KBtiIBKuIjD7ngnVoXKlMUky9AxY525Gjr52QJ0KR+q8o56GaPfSnRY
 Zj/nQtZgQUUxkYhE4LuhssZ+Pbd2Vau+YRXokyFQVNL0VHvueC3wpuvSPmOST9WFSMaf
 n7Qw==
X-Gm-Message-State: AFqh2krQ4OBcst+RALDB6C4+IUSmO/o2vF0/MiIbaOSO/vw0FVkYYPsY
 0hu/7Zh3kaaMErWxuzJXQV4xQjjPIhSBb0gESdITczTdZp8eYUh1DmOcRYzkTcRuCYB4K/PuZyt
 phUAwUdzi+ddm3m4=
X-Received: by 2002:adf:b604:0:b0:242:1809:7e17 with SMTP id
 f4-20020adfb604000000b0024218097e17mr21959516wre.6.1674507655242; 
 Mon, 23 Jan 2023 13:00:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOYvo43hTWlnIVDTzAy+okaNJw0aUeT0IkROZZ7OhK0oNx1V1zTqjKpD+g/u/txWTMWWYQIg==
X-Received: by 2002:adf:b604:0:b0:242:1809:7e17 with SMTP id
 f4-20020adfb604000000b0024218097e17mr21959497wre.6.1674507654947; 
 Mon, 23 Jan 2023 13:00:54 -0800 (PST)
Received: from redhat.com ([2.52.149.29]) by smtp.gmail.com with ESMTPSA id
 v20-20020adfa1d4000000b00241cfe6e286sm261230wrv.98.2023.01.23.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 13:00:54 -0800 (PST)
Date: Mon, 23 Jan 2023 16:00:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <20230123155228-mutt-send-email-mst@kernel.org>
References: <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
 <CAJSP0QXnKGrX3WuSJxe7pLctcueW1AkEc_KUsHGucaDq=VJZkg@mail.gmail.com>
 <21b87a0d-99b1-2755-00de-d1201d85a63e@yandex-team.ru>
 <Y87k0wBnHuf5Oktp@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87k0wBnHuf5Oktp@fedora>
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

On Mon, Jan 23, 2023 at 02:49:39PM -0500, Stefan Hajnoczi wrote:
> The point of the migration blocker is to prevent breaking running
> guests. Situations where a migration completes but results in a broken
> guest are problematic for users (especially when they are not logged in
> to guests and able to fix them interactively).

I thought it's the reverse - we block when we are sure it can't work.
If we are not sure we should leave policy to orchestrators.

You can always get into situations like this with stateful storage (as
opposed to RO one).  For example, naively scp the backend file then
start migration. Will seem to work but corrupts the disk (I didn't try,
for sure with raw but what about qcow2?)

> If a command-line option is set to override the blocker, that's fine.
> But there needs to be a blocker by default if external knowledge is
> required to decide whether or not it's safe to migrate.

If all the command line says is "I want migration to work" then
that's more like shifting the blame than helping users.
They just learn this one weird trick and it seems to work
until it doesn't.  Then we are like "we told you only to set this
flag if you are sure" and they are like "well I was sure".

-- 
MST


