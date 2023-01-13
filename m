Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C44669C70
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLru-0002eg-Sl; Fri, 13 Jan 2023 10:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pGLrF-0002D1-3A
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pGLrD-0000F1-08
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673623235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/VQw1TjVKkuepSuOf24tENZjplTtzjBaJ4MwI8/4k0=;
 b=cXwaLpQ81yS8Gk9MHjgX0tkqMlhIAN0OelPIKV4mg3IlnWoLN6VF4Uk3as5Yjk74r16Qrn
 x5PAJfmuy4LcXL2YM+s2Fv5fOe0kooU58ldPiWzw2EvMVT7tSMlKeQNssiBvxfGUA5eZoq
 5W0pwNPkvYGIsClS9+ld+Y7e10XjpEw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-bDSTB-kjNyqdK-B0lpWmSA-1; Fri, 13 Jan 2023 10:20:34 -0500
X-MC-Unique: bDSTB-kjNyqdK-B0lpWmSA-1
Received: by mail-qk1-f198.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so15296965qki.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/VQw1TjVKkuepSuOf24tENZjplTtzjBaJ4MwI8/4k0=;
 b=KsWt+bzcP0ZW8RFO2wtXMacy+B2mkCoowT57zU6P18ETtgRX2MYeNI8TEypaGrA0eF
 AP+gXuRE806mrWlXcPiCKWce/ft7pgukoSQmy5ZzE7fUx6IfyfjyXTyf9z+mDS0jek/s
 R/HCxg36a1LbfBH6XeFwIL8hHRJxJpMQaY+j3CnbTc2UJkKFPFFU4KvPGqP3eDQ9coms
 f+9ZiM2WGprO/PKAyiZrLDtjp5MSa6gkYG0KuVM4WS08o5EsQim2OgwmZ8blt+N9Nz06
 /YDMo2YnQmatnsRJ1hz+Hioxg+DMqw3+eMLRP/6/91hDTrUDQOxApNYWDq42lNrlz++2
 B4Rg==
X-Gm-Message-State: AFqh2koI0RJUxmkyEasa129DgDfxNfNpm/LEmJL8xatlxysLeTy6U3Io
 W0MSvLYPTEQkaXPXaqRI89DWJ5Crysn8QlRGgB25umsB3WSpNFLY7IpD2c7UgT0wSh3cgfMnw6z
 YvzcZoHclYT9JNFE=
X-Received: by 2002:a05:622a:244e:b0:3a5:17f0:e718 with SMTP id
 bl14-20020a05622a244e00b003a517f0e718mr110110052qtb.14.1673623233143; 
 Fri, 13 Jan 2023 07:20:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJqwCzeeVcGY/iU1b/uJIPIbjX+eO4XMKT3tUdSy3GktIIyW34h1uYmZTmHeSEtFtSrl/z0g==
X-Received: by 2002:a05:622a:244e:b0:3a5:17f0:e718 with SMTP id
 bl14-20020a05622a244e00b003a517f0e718mr110110029qtb.14.1673623232882; 
 Fri, 13 Jan 2023 07:20:32 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 ge9-20020a05622a5c8900b003a7e38055c9sm10682631qtb.63.2023.01.13.07.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:20:32 -0800 (PST)
Date: Fri, 13 Jan 2023 10:20:31 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8F2v+ikvEJa5+qc@x1n>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
 <Y8BlCeViRSzyTQ8+@work-vm> <Y8CGYZ3F/h1oXV+d@x1n>
 <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Jan 13, 2023 at 02:47:24PM +0100, David Hildenbrand wrote:
> I'd prefer to not go down that path for now. QEMU_VM_SECTION_START without
> QEMU_VM_SECTION_PART and QEMU_VM_SECTION_END feels pretty incomplete and
> wrong to me.

That's fine.

> 
> If we want to do that in the future, we should conditionally send
> QEMU_VM_SECTION_START only if we have se->ops I assume?

Yes.  START/FULL frames are mostly replaceable afaiu in the stream ABI, so
we always have space to change no matter what.  Let's leave that as-is.

Thanks,

-- 
Peter Xu


