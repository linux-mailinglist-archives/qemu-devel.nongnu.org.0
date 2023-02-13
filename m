Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A301694C36
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbUa-0000Ez-9B; Mon, 13 Feb 2023 11:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRbUW-0000B5-TM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRbUT-0006Ag-Pk
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676304940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHcJmuWryCkOlUEcENVKPKPhB1uQztKB43EMuRuG4EY=;
 b=Sqe3Nd6CqLrC7K2kHxiUGxOfydCcT3kncNhjDjrAbJRZAT6AgQrz64v0Vz9CAuOZ2n6E7F
 F7v4ZFxhwl9OPNiVbBwGmOAd9bH/Tlk7zPwp552RTay4GREV5PToFW0YVzdCwp2y7gnHwd
 6MC9p3vLY3/KIF4juUbwZMCQz5vBO7M=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-YNFh3BodPu26EjdOVTu-9g-1; Mon, 13 Feb 2023 11:15:39 -0500
X-MC-Unique: YNFh3BodPu26EjdOVTu-9g-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-52ecbe73389so96545597b3.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676304939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHcJmuWryCkOlUEcENVKPKPhB1uQztKB43EMuRuG4EY=;
 b=ujHfFBDRBx4p+KUkYwG51Gv731jeB0+uyvJJzA0e8rrNY+EvhYJ9DJg2pPaz+hemA2
 sauxRiNH/hhgp1xhoohuM8p3lXPeNf1jqBrPtllkKoGXAXUrEAZEihJO7Vul0WVSBhom
 W35pqp3xHAuqKFwE/qcVHImLRUz7VtkXxvOfIi7WGdP+nPeIzMQcMu8awqSn1WKTJmGc
 mmtPxKT94HNdnPm8idBrnGNRyKdUWK3CWWjT3VT5exZ4MMivL93lA5PgHgt3w9BxNAd4
 Wo5Lt2tcMXlZES1TK0OtHdk/DAf7nZja+cYC2MwT3UqjzQUNlTNpYVEpYBiUmwC3/Ofj
 tdNA==
X-Gm-Message-State: AO0yUKXibErBvE3GkdirL74LclHe57tsF8HX1AmQS+/AcaikCk7aBgMF
 rj4WORZkyOLTb0J6aEwohSw4Av1O8dWfnkZfYW8nwcNwuhYMAlud5M3BPdQueSsKMq0NKufRMVa
 d2NEXLE26/HwhhK4=
X-Received: by 2002:a81:441a:0:b0:52f:f2c:a8b9 with SMTP id
 r26-20020a81441a000000b0052f0f2ca8b9mr4388601ywa.1.1676304938714; 
 Mon, 13 Feb 2023 08:15:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8n96GUOm+exk3UNR+o72wnq1d8yNzrAkfLPVsEa5lIsoCHxsieyw6Wu6LhpPDycxWrOxYDaw==
X-Received: by 2002:a81:441a:0:b0:52f:f2c:a8b9 with SMTP id
 r26-20020a81441a000000b0052f0f2ca8b9mr4388568ywa.1.1676304938343; 
 Mon, 13 Feb 2023 08:15:38 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 m123-20020a375881000000b0073b4cdb0745sm966950qkb.116.2023.02.13.08.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:15:37 -0800 (PST)
Date: Mon, 13 Feb 2023 11:15:36 -0500
From: Peter Xu <peterx@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, philmd@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Message-ID: <Y+piDukOkeg+xs9G@x1n>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com>
 <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
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

On Mon, Feb 13, 2023 at 03:47:42PM +0100, BALATON Zoltan wrote:
> On Mon, 13 Feb 2023, Peter Xu wrote:
> > On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
> > > On 07/02/2023 17.33, BALATON Zoltan wrote:
> > > > On Tue, 31 Jan 2023, BALATON Zoltan wrote:
> > > > > On Thu, 19 Jan 2023, BALATON Zoltan wrote:
> > > > > > Currently -d guest_errors enables logging of different invalid actions
> > > > > > by the guest such as misusing hardware, accessing missing features or
> > > > > > invalid memory areas. The memory access logging can be quite verbose
> > > > > > which obscures the other messages enabled by this debug switch so
> > > > > > separate it by adding a new -d memaccess option to make it possible to
> > > > > > control it independently of other guest error logs.
> > > > > > 
> > > > > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > 
> > > > > Ping? Could somebody review and pick it up please?
> > > > 
> > > > Ping?
> > > 
> > > Patch makes sense to me and looks fine, so:
> > > 
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > 
> > > ... I think this should go via one of the "Memory API" maintainers branches?
> > > Paolo? Peter? David?
> > 
> > Paolo normally does the pull, I assume that'll still be the case.  The
> > patch looks good to me if Phil's comment will be addressed on merging with
> > the old mask, which makes sense to me:
> 
> Keeping the old mask kind of defies the purpose. I've tried to explain that
> in the commit message but now that two of you did not get it maybe that
> message needs to be clarified instead?

I think it's clear enough.  My fault to not read carefully into the
message, sorry.

However, could you explain why a memory_region_access_valid() failure
shouldn't belong to LOG_GUEST_ERROR?

commit e54eba1986f6c4bac2951e7f90a849cd842e25e4
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Oct 18 14:11:35 2012 +0100

    qemu-log: Add new log category for guest bugs
    
    Add a new category for device models to log guest behaviour
    which is likely to be a guest bug of some kind (accessing
    nonexistent registers, reading 32 bit wide registers with
    a byte access, etc). Making this its own log category allows
    those who care (mostly guest OS authors) to see the complaints
    without bothering most users.

Such an illegal memory access is definitely a suitable candidate of guest
misbehave to me.

Not to mention Phil always have a good point that you may be violating
others using guest_error already so what they wanted to capture can
misterious going away without noticing, even if it may service your goal.
IOW it's a slight ABI and I think we ned justification to break it.

Thanks,

-- 
Peter Xu


