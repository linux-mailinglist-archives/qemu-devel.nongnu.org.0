Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFAD686907
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEEx-0007o3-KM; Wed, 01 Feb 2023 09:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEEe-0007g4-AD
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEEc-0004IF-Hs
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675262234;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Hvw4V3lpgSiQcmhkEsNzgnX+nPUi7uw8GuAW03Cktog=;
 b=fxwnWIxw0Ksj+564HLtPrx01tell9d1EkRsBgXrIT0/LzvSFdTLXdyq7/Qbq4C0hCluW48
 eE0KVguoD3HrV+dONB7Yt501cCIG63TUavtUFfaweq/2mlj3g8vA4F5Fnk+VQ7q27sVQhu
 qHiabzj/GnN5HH8pjmtA0tdBQ95ftJQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-vuCGZo98OYSsm21c4padww-1; Wed, 01 Feb 2023 09:37:12 -0500
X-MC-Unique: vuCGZo98OYSsm21c4padww-1
Received: by mail-wm1-f71.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso10513222wms.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hvw4V3lpgSiQcmhkEsNzgnX+nPUi7uw8GuAW03Cktog=;
 b=qDJ5MTffzOPM5vZmBP669VFd0ad2DRad2FYwgsjT5TwaPTuWZnE87P9HgicGgYTz/J
 XcRZIntu5uKqaS1uPBaDYYlpcXA5Tf4SqvahL/XWFE+9LExaRr7g3cVWDk6tm/l7KVCi
 FIOHP3+ZEluietJQ4T66v7NJNoRDnYmOgVhv5S2dN1ekZIMJDeJiv80+o5yGA7EJKlcp
 /07R1stalU4avlZ1CboMJHk2ArPi0jC/3/N3yngg2bCXWfixR8ZXFfG4FZ/hUx/FGK2/
 PT4I/NYCwT57IOYZVGocg513RKKhYlULYsX3b2WETJQoZR1QV4Q9ezOYwhof/Zv+novW
 N5xQ==
X-Gm-Message-State: AO0yUKXWQn2A1yGTp8ei9pe7J0DOaGcLRedU3NqaZUxTOY92G2DMwuo2
 PQ3rcPph2wQB6Ongnz7HmBSlicE8cHACCzhJKeocXB1915Y/qzuZWwnAA/K7Bn9OPzsPlCyQFez
 Xcpq9P+P//AU7OLc=
X-Received: by 2002:adf:c70b:0:b0:2bf:b5c0:f157 with SMTP id
 k11-20020adfc70b000000b002bfb5c0f157mr2682253wrg.39.1675262231738; 
 Wed, 01 Feb 2023 06:37:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/JYZig3G04UTRvMUOK9dia1b+so8i+gBsY0Wb4zvEcEyDBE3eSLUsLNh064gB1j2tE+epu2A==
X-Received: by 2002:adf:c70b:0:b0:2bf:b5c0:f157 with SMTP id
 k11-20020adfc70b000000b002bfb5c0f157mr2682225wrg.39.1675262231497; 
 Wed, 01 Feb 2023 06:37:11 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6e89000000b002bfe266d710sm12650968wrz.90.2023.02.01.06.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:37:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Anton
 Kuchin <antonkuchin@yandex-team.ru>,  qemu-devel <qemu-devel@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Eric Blake <eblake@redhat.com>,
 yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
In-Reply-To: <CAJSP0QUANuLkOjkLsB4LqKdi5_sJj+y6zK5vgcNmYZ5BLQ73rQ@mail.gmail.com>
 (Stefan Hajnoczi's message of "Tue, 24 Jan 2023 07:48:12 -0500")
References: <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
 <Y87Ri4r6SiETdCrt@work-vm> <Y87lv8fXrYpxkK/3@fedora>
 <CAJSP0QV5wfXxhvjjFnLLUCvmSxiHxTPXh4qQJwHhnKdBu3EOQQ@mail.gmail.com>
 <Y8+p8HFG8NxYlfoo@work-vm>
 <CAJSP0QUANuLkOjkLsB4LqKdi5_sJj+y6zK5vgcNmYZ5BLQ73rQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 15:37:10 +0100
Message-ID: <87cz6te9k9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Tue, Jan 24, 2023, 04:50 Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:

[...]

>> > I checked how bad the situation is. libvhost-user currently enables
>> > LOG_ALL by default. :(
>> >
>> > So I don't think the front-end can use LOG_ALL alone to determine
>> > whether or not migration is supported by the back-end.
>> >
>> > There are several existing back-ends based on libvhost-user that have
>> > no concept of reconnection or migration but report the LOG_ALL feature
>> > bit.
>>
>> Ouch, yes that's messy.
>>
>> Going back to the original question; I don't think a command line flag
>> will work though, because even for a given VM there's the possibility
>> of some (local) migrations working but other (remote) migrations not
>> working; so you don't know at the point you start the VM whether
>> your migrations are going to work.
>>
>
> The user or management tool should know which types of migration a
> vhost-user-fs backend supports. That can be passed in as a per-device
> parameter.
>
> Then a migration parameter can be used to distinguish between same host and
> remote host migration? QEMU already distinguishes between pre-copy and
> post-copy migration, so this can be thought of as yet another type of
> migration.

I was going to suggest this (my previous answer was after reading only
the other part of the comments).

What we have here is that this device has "three" states:
- You can't migrate it to other host (now and the default behaviour)
- You can migrate some of the backends if you are migrating in the same
  host (note, we don't know directly that we are migrating inside the
  same host, so I would agree to add _that_ migration capability, that
  is related to migration, and it makes sense for migration code and
  devices to know that is happening)
- In the future, perhaps, you can migrate "always" some vhost-use-fs,
  that would be a property on my opinion.

Later, Juan.


