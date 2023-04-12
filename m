Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D319F6E0048
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:02:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhbd-0005ty-KS; Wed, 12 Apr 2023 17:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmhbU-0005s8-Ok
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:02:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmhbR-0006vk-LU
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681333324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w6EzJISfh1GW1UNcw+TX3Nmlh3GQ1r7vqvXlR0HnwvE=;
 b=O97tAcrf2TXto9s/eLlVcZOBPXCm1fLIOJtvj9czJ7gmvhCVa6vVrzqtBLG3ANlrMFy3R8
 GpYB6P+6GeO5wivN5VN33WE53sW2mwSZOyCt7sB4msSsoRtbSdfAe3Wlid52wL2ls46BXJ
 vYd23U2Fh33myQrv1aPa4kyFxEtF50M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-FSApcaQTP4mvYUktZPF3Hw-1; Wed, 12 Apr 2023 17:02:02 -0400
X-MC-Unique: FSApcaQTP4mvYUktZPF3Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bh6-20020a05600c3d0600b003f0a1353fe2so715525wmb.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333321; x=1683925321;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6EzJISfh1GW1UNcw+TX3Nmlh3GQ1r7vqvXlR0HnwvE=;
 b=W0oxlmMyfbdmKnkV0zChj/TQSiHG6puGJCx4CzVqgIS+h08b0VuDcEyQnePwCCfLVk
 LPHdrYPMBlOEKoDk7hbU7flQhbyvhZfSgcBxSbdz9tobCdPlq4mAQSdLf9+SrIdTPXZb
 KhGVq6ZEp9xp9DYLcU0VTpmtwR/P/ef/bHe0d3j6q4Zt9WIl52iAKnFT1DXSjhqU0nD2
 9v3otBJPmgwKKwAV4xzQmLH4LVj7EZbguotc/CQ1u9+wlaGEUJKKUdsYeRDqq0BP0drO
 liXuRrGfSRXlKWVAHzkM1AcJVgv+G2DHoEG/m+kyXDSkZu2Er/znEOv8AWj1SfRY2EAO
 qQQQ==
X-Gm-Message-State: AAQBX9eF3mXKLfJcWL7quv3lWe58v1i4AYfnCqYcMe9eNxM+yNYJ37yx
 uwR/axrpdvZWZoxQkuaLOWCxKXH5E/ij6OVRYavZ8Ooh/xsamDX+aFbMZM3G+nsB8yZh67hY1zz
 IdRYS0sqpEogWT78=
X-Received: by 2002:a05:600c:b59:b0:3ed:b590:96e6 with SMTP id
 k25-20020a05600c0b5900b003edb59096e6mr79523wmr.4.1681333321677; 
 Wed, 12 Apr 2023 14:02:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNUc1y+RsoZ39+dYtEFzAx6m2T4++CurBO9iUpJjV6q8EmOLJT98R+9V/7kp1MpIqe7DsWbw==
X-Received: by 2002:a05:600c:b59:b0:3ed:b590:96e6 with SMTP id
 k25-20020a05600c0b5900b003edb59096e6mr79514wmr.4.1681333321385; 
 Wed, 12 Apr 2023 14:02:01 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b003ef36ef3833sm3697132wmo.8.2023.04.12.14.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:02:00 -0700 (PDT)
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
Date: Wed, 12 Apr 2023 23:01:59 +0200
Message-ID: <87mt3cn7aw.fsf@secure.mitica>
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

As this is tcg, could you tell the exact command that you are running?
Does it needs to be in s390x host, rigth?

$ time ./tests/qtest/migration-test
# random seed: R02S940c4f22abc48b14868566639d3d6c77
# Skipping test: s390x host with KVM is required
1..0

real	0m0.003s
user	0m0.002s
sys	0m0.001s


> Some initial findings:
> What seems to be happening is that after migration a control block
> header accessed by the test code is all zeros which causes an
> unexpected exception.

What exception?

What do you mean here by control block header?

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

If block is all zeros, then remaining_size should be zero, so always
smaller than max_size.

I don't really fully understand what is going here.

>          qemu_mutex_lock_iothread();
>          WITH_RCU_READ_LOCK_GUARD() {
>              migration_bitmap_sync_precopy(rs);
>
> on top fixes or hides the issue. (The comparison was removed by c8df4a7aef.)
> I arrived at this by experimentation, I haven't looked into why this makes a difference.
>
> Any thoughts on the matter appreciated.

Later, Juan.


