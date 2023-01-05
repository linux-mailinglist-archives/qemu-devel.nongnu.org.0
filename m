Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF8A65E27E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 02:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDF2e-0001Wh-Oc; Wed, 04 Jan 2023 20:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDF2b-0001WE-9D
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDF2Z-0002HL-NN
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672882050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YwG6yhJjj7aJhYQKxuxgQEqP/yrc4XtFbfCy40tTNoQ=;
 b=A8/Jwwq9rn5LOl/3QhzcO/gqDWwkdGp1I0ZY/+ggyjHAhkV/4HdVFVjaFfhtYK+YcLOTPl
 rM7s/Az8yButY2eTw3cCz5HrQ07FWVNn1YR7ydCwg4XbSZ9SgdyXRIZf2HWhfKQgLB9OB2
 drEeNUziT56D0sD92iEZmL0DDBd5Pyo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-g5lHCWdSMUSQM2b5NDVOxw-1; Wed, 04 Jan 2023 20:27:29 -0500
X-MC-Unique: g5lHCWdSMUSQM2b5NDVOxw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h18-20020a05640250d200b004758e655ebeso22700542edb.11
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 17:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwG6yhJjj7aJhYQKxuxgQEqP/yrc4XtFbfCy40tTNoQ=;
 b=KLTpIH4u8wmbcc3sUCNwynERHoS+iNrXxCiFihdK074rLRl44Rwe5Yj/WH/ex1gIrr
 w86nZt+VfO38r6C+0ouqyYdfeD/mN4UmAWvfpu6mxwBT4qNdcasQzrRyKQvtlMfsV5oD
 RPyxTc+omlbygxRtpoTXRStfcpDEzabsIaH1sKQLPSJtBN8J1ZbJjUijG8GVvtS4zLmh
 Ia+1LkHyrEveNR0KJ84+ph1aMNQ4gEM/BWAz87qXm9WUk9QKcqZTz4sOlZwixgtbZK8v
 lviKWuou0kxXj72Fv/RXYZRGpj9/4uuY7EL4rkq1u9GBB9aAApqvAKRpdvuiXnlvq84/
 mLXg==
X-Gm-Message-State: AFqh2kq+zle3A4deuQkN5wwpDaNm/9ZFobECiRjC7R2Pkj/uc/lFoEqE
 xvz//QjN2GfmBHR0/b47FL4wpz29mZaTlESM+al+mkfNpUU6zV6dUGpUXmiq9vqF0H4JpJSGGQZ
 jXfDS0/QrPOa/9Dc=
X-Received: by 2002:a17:907:d302:b0:7c1:3472:5e75 with SMTP id
 vg2-20020a170907d30200b007c134725e75mr44543370ejc.29.1672882048346; 
 Wed, 04 Jan 2023 17:27:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtk+6YZmCKtWQLeST3gOiK26liZ3/gahSflRqZs6NUS0i4NzjEaFf0u4MvKnp15Up/XSHeMHg==
X-Received: by 2002:a17:907:d302:b0:7c1:3472:5e75 with SMTP id
 vg2-20020a170907d30200b007c134725e75mr44543356ejc.29.1672882048120; 
 Wed, 04 Jan 2023 17:27:28 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r7-20020a170906280700b007b27aefc578sm15828873ejc.126.2023.01.04.17.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:27:27 -0800 (PST)
Date: Wed, 4 Jan 2023 20:27:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <20230104202707-mutt-send-email-mst@kernel.org>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com>
 <950cb6c6-6271-8126-9c75-533a6b6edaae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <950cb6c6-6271-8126-9c75-533a6b6edaae@redhat.com>
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

On Fri, Dec 23, 2022 at 10:34:36AM +0100, David Hildenbrand wrote:
> On 22.12.22 12:02, David Hildenbrand wrote:
> > For virtio-mem, we want to have the plugged/unplugged state of memory
> > blocks available before migrating any actual RAM content. This
> > information is immutable on the migration source while migration is active,
> > 
> > For example, we want to use this information for proper preallocation
> > support with migration: currently, we don't preallocate memory on the
> > migration target, and especially with hugetlb, we can easily run out of
> > hugetlb pages during RAM migration and will crash (SIGBUS) instead of
> > catching this gracefully via preallocation.
> > 
> > Migrating device state before we start iterating is currently impossible.
> > Introduce and use qemu_savevm_state_start_precopy(), and use
> > a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
> > state will be saved in qemu_savevm_state_start_precopy() or in
> > qemu_savevm_state_complete_precopy_*().
> > 
> > We have to take care of properly including the early device state in the
> > vmdesc. Relying on migrate_get_current() to temporarily store the vmdesc is
> > a bit sub-optimal, but we use that explicitly or implicitly all over the
> > place already, so this barely matters in practice.
> > 
> > Note that only very selected devices (i.e., ones seriously messing with
> > RAM setup) are supposed to make use of that.
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> [...]
> 
> >       if (inactivate_disks) {
> > @@ -1427,6 +1474,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> >           qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
> >       }
> > +    /* Free it now to detect any inconsistencies. */
> > +    g_free(vmdesc);
> 
> Missed to convert that to a json_writer_free().


I get it you will post v4?

> -- 
> Thanks,
> 
> David / dhildenb


