Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBF6DFFE7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:33:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmh8C-0003OO-RA; Wed, 12 Apr 2023 16:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmh8A-0003Nn-HM
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmh87-0008GL-AW
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681331506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=i8licc1AXZfHM36lEiPckOFInbq0+WXJdsFyDrGIR7c=;
 b=iZKWFd5st6pkql6RG4D9wIyrDVph3rGUFmx1veDpRSF8VVelxcb2pJ4VhSVNygrMfFo045
 a0pzE91kkcZz/j9wHT4k4Dq2VBch+rMrsNffBgbV+NItCO+6LOnOZfC09eS+dFrd8VO5T4
 HGiXsHiRZ4Lptr0+fkM7B6lkbqqBdsY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-mtCbcv1WNE6IDnU-j0ICvQ-1; Wed, 12 Apr 2023 16:31:44 -0400
X-MC-Unique: mtCbcv1WNE6IDnU-j0ICvQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r20-20020a05600c35d400b003edd2023418so7535334wmq.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331503; x=1683923503;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i8licc1AXZfHM36lEiPckOFInbq0+WXJdsFyDrGIR7c=;
 b=bXCONyP/5OQULRDWaU+kgz/WCpPbhNX8qzejVnpbCN6EQBZ9kP/Os6vgfohB4A/ryu
 a1zoTIfaHZdOh+2d7gKEXB2aRuqBl3sRK4QxZWyFHFQRQ/y8KrSIjrU7R2uW9jJlmkpB
 7XAmraURBdIdfC5Rq+ITYu26W/ABgbxKtE7C5fl1NtCkYY2uSL9JCf+xCWV5IvoZWmPv
 k1EpVJY7m+zCLzuMFW7WMY419vet3R1d84TKJRkVVVWAOxefmyhhIPpEj0rva+jQl5Rh
 IJZ01HcU6EZcT6XhfjBdJMZAm1P/15jPO6tbazAapc83kpfHhBVFDMwYoAqjwUwMamJl
 zBtw==
X-Gm-Message-State: AAQBX9dyuLxBt2mkNDAFF57mQIl4DrVF7xFpTF+TzdAsIrvsG2RESty6
 c+w7M91AkWCz6mBvs3Ikh8J40a2QnahVSjGpv8n56V5QQd6y2h/fWmiZg3GxIn7SEkmoZceVXY0
 AQ6QBIackEzjWwjQ=
X-Received: by 2002:adf:fd01:0:b0:2db:bdc2:f8da with SMTP id
 e1-20020adffd01000000b002dbbdc2f8damr13177797wrr.71.1681331503605; 
 Wed, 12 Apr 2023 13:31:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWnQupk2960cO5BegzQQSy/0AAjAvASvBLXvZnVX5WuAZCa4a+248w3tpd0fD8CfWHIhQL5A==
X-Received: by 2002:adf:fd01:0:b0:2db:bdc2:f8da with SMTP id
 e1-20020adffd01000000b002dbbdc2f8damr13177757wrr.71.1681331503277; 
 Wed, 12 Apr 2023 13:31:43 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b002f483a1210asm2375930wrq.98.2023.04.12.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 13:31:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,  John Snow <jsnow@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Fam Zheng <fam@euphon.net>,  Thomas Huth
 <thuth@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  qemu-s390x@nongnu.org,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Eric Blake <eblake@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>
Subject: Re: s390x TCG migration failure
In-Reply-To: <20230324184129.3119575-1-nsg@linux.ibm.com> (Nina
 Schoetterl-Glausch's message of "Fri, 24 Mar 2023 19:41:29 +0100")
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 12 Apr 2023 22:31:41 +0200
Message-ID: <87v8i0n8pe.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Nina Schoetterl-Glausch <nsg@linux.ibm.com> wrote:
> Hi,
>
> We're seeing failures running s390x migration kvm-unit-tests tests with TCG.
> Some initial findings:
> What seems to be happening is that after migration a control block header accessed by the test code is all zeros which causes an unexpected exception.
> I did a bisection which points to c8df4a7aef ("migration: Split save_live_pending() into state_pending_*") as the culprit.
> The migration issue persists after applying the fix e264705012 ("migration: I messed state_pending_exact/estimate") on top of c8df4a7aef.
>
> Applying
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 56ff9cd29d..2dc546cf28 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3437,7 +3437,7 @@ static void ram_state_pending_exact(void *opaque, uint64_t max_size,
>  
>      uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
>  
> -    if (!migration_in_postcopy()) {
> +    if (!migration_in_postcopy() && remaining_size < max_size) {
>          qemu_mutex_lock_iothread();
>          WITH_RCU_READ_LOCK_GUARD() {
>              migration_bitmap_sync_precopy(rs);
>
> on top fixes or hides the issue. (The comparison was removed by c8df4a7aef.)
> I arrived at this by experimentation, I haven't looked into why this makes a difference.
>
> Any thoughts on the matter appreciated.

Ouch, you are right.
Good catch.

Queued the fix.

Later, Juan.


