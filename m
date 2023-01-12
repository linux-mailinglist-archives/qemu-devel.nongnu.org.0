Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A7667D25
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1op-00012n-5k; Thu, 12 Jan 2023 12:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG1oj-0000wJ-2Q
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG1oh-0005EK-CO
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673546202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VzwgRB3mFR8GvqbHw81Xn1Cq8Z8+fTWfMFsljdYTv4o=;
 b=PqPnhQ4X+zok1HOKdnoS8mqqsNzcQ7NV9BAS2SaroOGP5btZ1WkCv7BMBoclPajbbR+UaJ
 8WFj4RQhhOAoOpO1uUGZ1KptzoeyMgGe2G7IdC7yMBpVeoQKNX1Bp5+NVuW9hHaCZF8sFQ
 a+58PSBEFJhHxlSxdmZ7VvsIPAeJ9jE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-StzyGfF0OwCBnm8IDgZSwg-1; Thu, 12 Jan 2023 12:56:39 -0500
X-MC-Unique: StzyGfF0OwCBnm8IDgZSwg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so3717321wrd.17
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzwgRB3mFR8GvqbHw81Xn1Cq8Z8+fTWfMFsljdYTv4o=;
 b=5CL6RLlaRAPFeUZXbK2eAPkhHPFVSTh/akbc00sIKl0CjfBMDLETBc1riUYLDrj37+
 6P0rp/opOnMTcry+AAtRqRWI8wkmGIvcucm3KTDfh5IuLczufIqukZgMbb8JziPFQX8z
 6n0qgBlUh3nQgin6cy3DS6X7gcXXBFty0TcB02ailXc6lgg7ySisYCKw0vY9XPlbjmKH
 OKFcy5E5q5zoBxFbok1XBxL4E6fCGr8dynzYRsS7Ucncdw8yfAtSPB3bFFx6Or1l4ey6
 CgLD5J1O1YaNQDLE4TDrUwZbVqOqW200scQgnoLTEh8PcmS93HITOGKFfn3+WqmjlT2M
 ITow==
X-Gm-Message-State: AFqh2krToS7bIVgT/8kK4C+61wgrZlgtgGuFcgdoUEKRMWheHc/lrDaY
 zqntawTKpEnZ6u3vIVSapFAReNG1buJd/w6iTCmUByV8YAcSE2mJrHWCR9clqOCxAm0HNMt2qmf
 aKWGwvsQsejbIFJo=
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id
 b19-20020a05600c4e1300b003c6e63dfcfcmr56148349wmq.35.1673546198718; 
 Thu, 12 Jan 2023 09:56:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlfXtuw1WTTUlAy/7jU3dk49MXF5Y8yZtqtytaHTZbTT1GRaW84docNY60EqLER9nIZ+PkmA==
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id
 b19-20020a05600c4e1300b003c6e63dfcfcmr56148338wmq.35.1673546198503; 
 Thu, 12 Jan 2023 09:56:38 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm26795559wmb.14.2023.01.12.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:56:38 -0800 (PST)
Date: Thu, 12 Jan 2023 17:56:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8BJ02EiHNSr6xMv@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-4-david@redhat.com>
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

* David Hildenbrand (david@redhat.com) wrote:
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
> Migrating device state via a vmsd before we start iterating is currently
> impossible: the only approach that would be possible is avoiding a vmsd
> and migrating state manually during save_setup(), to be restored during
> load_state().
> 
> Let's allow for migrating device state via a vmsd early, during the
> setup phase in qemu_savevm_state_setup(). To keep it simple, we
> indicate applicable vmds's using an "immutable" flag.
> 
> Note that only very selected devices (i.e., ones seriously messing with
> RAM setup) are supposed to make use of such early state migration.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/migration/vmstate.h |  5 +++++
>  migration/savevm.c          | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index ad24aa1934..dd06c3abad 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -179,6 +179,11 @@ struct VMStateField {
>  struct VMStateDescription {
>      const char *name;
>      int unmigratable;
> +    /*
> +     * The state is immutable while migration is active and is saved
> +     * during the setup phase, to be restored early on the destination.
> +     */
> +    int immutable;

A bool would be nicer (as it would for unmigratable above)

>      int version_id;
>      int minimum_version_id;
>      MigrationPriority priority;
> diff --git a/migration/savevm.c b/migration/savevm.c
> index ff2b8d0064..536d6f662b 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
>  
>      trace_savevm_state_setup();
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (se->vmsd && se->vmsd->immutable) {
> +            ret = vmstate_save(f, se, ms->vmdesc);
> +            if (ret) {
> +                qemu_file_set_error(f, ret);
> +                break;
> +            }
> +            continue;
> +        }
> +

Does this give you the ordering you want? i.e. there's no guarantee here
that immutables come first?

Dave


>          if (!se->ops || !se->ops->save_setup) {
>              continue;
>          }
> @@ -1402,6 +1411,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>      int ret;
>  
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (se->vmsd && se->vmsd->immutable) {
> +            /* Already saved during qemu_savevm_state_setup(). */
> +            continue;
> +        }
> +
>          ret = vmstate_save(f, se, vmdesc);
>          if (ret) {
>              qemu_file_set_error(f, ret);
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


