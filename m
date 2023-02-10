Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA436691F54
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSsL-0001bk-7j; Fri, 10 Feb 2023 07:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSsI-0001bb-64
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSsG-0006TL-Hh
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676033491;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bp22qvXB/rTC7INiYAAJZ81H+kxEolammFuqBXi9VE0=;
 b=FgGO6l/tWNYH36WNdfwaUoMhP4mwfethV/0ycmELnB7DROuk1bRfy8PSffX/+xL8TYcrh/
 NxXo5gwFg+6F06AOc6a1ipEr0Ady1zEINvkPn9U4/FB6UVAsdF02VLibFLQ4YjL3fQLpIL
 0Ap2H6GSadgsTyziuOr7f4ap2Fmts5o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-MCctQzt2PfiKKyW849VoDA-1; Fri, 10 Feb 2023 07:51:30 -0500
X-MC-Unique: MCctQzt2PfiKKyW849VoDA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so4524376wmq.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bp22qvXB/rTC7INiYAAJZ81H+kxEolammFuqBXi9VE0=;
 b=qPn5PCmeXpY99/ZsRVmRCe3AW3Ati5hFPW+oGeM1Odtf9kMdwbwHb+QOhH01SDXVw7
 rbdruhkZ6cDYyS339UO1NgjJuvipy4n8V0AOxrepV9qbMXW3hJ4vuR+T0BFW2bWC619w
 URQ2NluyTDNfCD61N2OHTZ8p3ct0zPa3Nf8XVM8/Iz8yzuyLUyMUF0bNS1yjF4xuilob
 +dnhOj+v+eCQh5NvG6asbXLwCy1rhKE7s+LxPsr4N/FmQmE4GCD+RGWRFHx+1JrTJrFo
 hsoBnk9PRWRuCmObDtczr5t/18248Yttb3ngvEHQmKZI8qRiEXIFLsfS6OvlA3iT67iN
 lFZQ==
X-Gm-Message-State: AO0yUKVKOpdVAlgBEJyf7iRx0A06sbROwID0dCkO1ScVlNhJqmPPLF5D
 /HQOLpwAi9KAcpOH4thQ5TNyLOGHSuyOFYaqR4mUlCeijUv/PcSb0OGVUrtbOGkcZ/AO4eEylsJ
 qLyMZK7puBPlgT0w=
X-Received: by 2002:a05:600c:3b06:b0:3df:f85a:46fe with SMTP id
 m6-20020a05600c3b0600b003dff85a46femr16509425wms.40.1676033489560; 
 Fri, 10 Feb 2023 04:51:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8QxgiXN8ffKrjPu1MN4VPXLEwRoDfFbTorZm2MO3zL0gp0/kunk3zZFcYbRtLZj0S854+QXg==
X-Received: by 2002:a05:600c:3b06:b0:3df:f85a:46fe with SMTP id
 m6-20020a05600c3b0600b003dff85a46femr16509405wms.40.1676033489334; 
 Fri, 10 Feb 2023 04:51:29 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm4546235wmp.46.2023.02.10.04.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:51:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 4/4] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
In-Reply-To: <20230210063630.532185-4-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 10 Feb 2023 03:36:31 -0300")
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-4-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 13:51:27 +0100
Message-ID: <87bkm1heeo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Leonardo Bras <leobras@redhat.com> wrote:
> Currently running migration_incoming_state_destroy() without first running
> multifd_load_cleanup() will cause a yank error:
>
> qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> (core dumped)
>
> The above error happens in the target host, when multifd is being used
> for precopy, and then postcopy is triggered and the migration finishes.
> This will crash the VM in the target host.
>
> To avoid that, move multifd_load_cleanup() inside
> migration_incoming_state_destroy(), so that the load cleanup becomes part
> of the incoming state destroying process.
>
> Running multifd_load_cleanup() twice can become an issue, though, but the
> only scenario it could be ran twice is on process_incoming_migration_bh().
> So removing this extra call is necessary.
>
> On the other hand, this multifd_load_cleanup() call happens way before the
> migration_incoming_state_destroy() and having this happening before
> dirty_bitmap_mig_before_vm_start() and vm_start() may be a need.
>
> So introduce a new function multifd_load_shutdown() that will mainly stop
> all multifd threads and close their QIOChannels. Then use this function
> instead of multifd_load_cleanup() to make sure nothing else is received
> before dirty_bitmap_mig_before_vm_start().
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


