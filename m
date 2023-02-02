Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2A687CAA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:50:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY6c-0006g0-LV; Thu, 02 Feb 2023 06:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY6B-0006cj-3A
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY69-0003KO-DG
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338588;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bW6fN8f4/JUAaCMheHA9gJHEOZuZG3+65T7yO9dsoFs=;
 b=Uq4YmMmtvcDbyITirYlYAF9Dm0xmIlBrq1fVznky38c91SgRqROkDasSgJB0xxZYt0VPfI
 FRW6P6rerDOAvfxahxXTzhIIo3qhMxOHP5rMVaQUW2zJGa9p/AggCnnmT2VGbwFPPmoRAy
 KwCB9KMX8foALDyQ1CashXy9e+dZxSo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-CQ4kvE5QP_G5P8yJbHPIMA-1; Thu, 02 Feb 2023 06:49:47 -0500
X-MC-Unique: CQ4kvE5QP_G5P8yJbHPIMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so829434wmq.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bW6fN8f4/JUAaCMheHA9gJHEOZuZG3+65T7yO9dsoFs=;
 b=dn1Pe1uNxypWQSgVoPsZA2SShtJY09+nAUkEBdbi12F/UP6qhYV8LSGVrN+V9e8kmI
 PN/8sRFW19VqQBauwZrQOWMJdDQCuOXC4/WnV/Nvyz6fDkrMXr9aRaLMugWGQoVMRrsa
 Famn4M9Y4rsS6kuuNFub/alG/SMS3QZwKlKLqc668otFVzGanmdyGhQDlR8CRzWev3ce
 qdEZJoCMLHq9pUkCnj9Gbihpvgt8DbJBMxlIcvzHmAxR9bPWmTIfhbzSGtgyw1/gY1qt
 oRu9zMse+K0g2dX9/9jXRpGIvWKuRf475n373tkq3n7KSqXavkxnBEiVsAli9R7pagWU
 oDDQ==
X-Gm-Message-State: AO0yUKXOlzQ1i6EejFSeg7vfG2avPdtn6l0N5FhXdsx5F+7zcvTkGdWW
 cWsReWYSbo0lvRch18LZNozIwXv4SNYTuO7VwLEG+PGpqkiejL8fyTA3zpZSyvHt/8PsuLxBr+I
 uQhufdp8V3GytKPA=
X-Received: by 2002:a05:600c:5113:b0:3dc:59ee:7978 with SMTP id
 o19-20020a05600c511300b003dc59ee7978mr5644145wms.38.1675338586622; 
 Thu, 02 Feb 2023 03:49:46 -0800 (PST)
X-Google-Smtp-Source: AK7set81oJQbLn9MVe5xjldbldVkFQiD0+vdJn+TdQ93/Dlre/Iu1Srp4uAsYjnl3hU0el5kLFG09A==
X-Received: by 2002:a05:600c:5113:b0:3dc:59ee:7978 with SMTP id
 o19-20020a05600c511300b003dc59ee7978mr5644133wms.38.1675338586399; 
 Thu, 02 Feb 2023 03:49:46 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003db0ad636d1sm5612565wms.28.2023.02.02.03.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:49:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 3/8] migration/savevm: Allow immutable device state
 to be migrated early (i.e., before RAM)
In-Reply-To: <20230117112249.244096-4-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:44 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-4-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:49:44 +0100
Message-ID: <87y1pgnv6v.fsf@secure.mitica>
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

David Hildenbrand <david@redhat.com> wrote:
> For virtio-mem, we want to have the plugged/unplugged state of memory
> blocks available before migrating any actual RAM content, and perform
> sanity checks before touching anything on the destination. This
> information is immutable on the migration source while migration is active,
>
> We want to use this information for proper preallocation support with
> migration: currently, we don't preallocate memory on the migration target,
> and especially with hugetlb, we can easily run out of hugetlb pages during
> RAM migration and will crash (SIGBUS) instead of catching this gracefully
> via preallocation.
>
> Migrating device state via a VMSD before we start iterating is currently
> impossible: the only approach that would be possible is avoiding a VMSD
> and migrating state manually during save_setup(), to be restored during
> load_state().
>
> Let's allow for migrating device state via a VMSD early, during the
> setup phase in qemu_savevm_state_setup(). To keep it simple, we
> indicate applicable VMSD's using an "early_setup" flag.
>
> Note that only very selected devices (i.e., ones seriously messing with
> RAM setup) are supposed to make use of such early state migration.
>
> While at it, also use a bool for the "unmigratable" member.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



