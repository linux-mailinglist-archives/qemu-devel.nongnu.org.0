Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD083FEF63
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLncD-0000SC-2C
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLnaq-0007Tw-Ao
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLnan-00045N-CZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630592483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qyh+uIF/GVTmiin0NKSyDFR9mMg+98rKht45oaTQEck=;
 b=PNkdGrUc94No4hYw+p/8u4mISSyENKs70JIB0qjBbdQ23nowQ0GjdGtibcs9EWnjBkFbSt
 NjrSKIUpjyNnAtW1VbPAA/xfGnu7yu0O2SL9A0mXIw/+JYQouqA5RG1cFJ/8rKNRCMAa0C
 Ci1xYd9m64DgodSB42cKGG8AaSkLwpA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-pbuJywLsNDKsQkGbnTCBrQ-1; Thu, 02 Sep 2021 10:21:22 -0400
X-MC-Unique: pbuJywLsNDKsQkGbnTCBrQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 g73-20020a379d4c000000b003d3ed03ca28so1718181qke.23
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 07:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qyh+uIF/GVTmiin0NKSyDFR9mMg+98rKht45oaTQEck=;
 b=U7LmET++B5bYSQvoGnlfJN6bgE/wkGbaZ+ITM38u4PWcW4yopLCquNeLGzvLcc4Of9
 XhUj9ZO/0QYrlZ2Ecfm2l8DlzMb8KGvItsIXKsoEJhn09btUa86SBLi6qSPUbVkCd7z+
 t1DUxYNZR7sGrE8YO8Fv8qWiHVpYa18iJZmoW+/e/wVZlymSIaKlmdT2sozfPofkPUS0
 t+oXsuoVx4e7ExInlIJ3guWbLqke8cNpYrotJab1TgwvbKEnWQZqUmSMljPj1w3Z64Oj
 AbP3ieNzFGKy/Yht/JDFCgDB4gl/XNbLa6X2fH5IoOS8++EeGosEMwc3NGbIKhw0JbI2
 UMdw==
X-Gm-Message-State: AOAM53269IrC5GOQAtNbbg1Tjh4/ir3PiAZasZuH/Foub4x7Vagnx/qj
 VQgzzuTFWY0+27cw7nVfbJaGfHr13BNDFxR+lDoX4WbvYbDjmGql0nYCZbAHSn3obcjvTpRTDdO
 UVArTIW7zzjcANUA=
X-Received: by 2002:a05:620a:bcc:: with SMTP id
 s12mr3381983qki.431.1630592481804; 
 Thu, 02 Sep 2021 07:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTzoP4oMirY2FfpgmmO/LqXQSnEZVvKv6Ko4Gy3IQfGTjIfySE9NCYbLVn/colEa1v9aeSPQ==
X-Received: by 2002:a05:620a:bcc:: with SMTP id
 s12mr3381963qki.431.1630592481544; 
 Thu, 02 Sep 2021 07:21:21 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id x29sm1080058qtv.74.2021.09.02.07.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:21 -0700 (PDT)
Date: Thu, 2 Sep 2021 10:21:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTDd31TI0fW83ND2@t490s>
References: <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <YTDXPB/t22lzRS/H@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTDXPB/t22lzRS/H@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Dan,

On Thu, Sep 02, 2021 at 02:53:00PM +0100, Daniel P. Berrangé wrote:
> The correct ordering of devices/backends is generally pretty obvious
> for libvirt to determine. Most of the problems we've had related to
> ordering are on the QEMU side, because the ARGV given to QEMU made
> correct sense if parsed left-to-right, but QEMU didn't actually process
> them in that order. We've patched QEMU to hack around its inability to
> honour the CLI order repeatedly.

Is there a pointer to the problem?

> 
> Being completely self-ordering on the QEMU side using a topological
> sort would be neat from a conceptual purity POV, but that is quite a
> challenge to implement and I'm not convinced it is worth it, compared
> to other problems we want to spend time on.

I just noticed there can also be dependency between the buses; that cannot be
fixed by ordering of classes indeed as either proposed in this series, or
introduce a new priority.

Thanks,

-- 
Peter Xu


