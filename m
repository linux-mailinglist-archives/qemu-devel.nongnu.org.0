Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22A3F5277
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:53:28 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGwb-0007dL-R7
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIGuA-00066O-8U
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 16:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIGu7-0007wN-Ed
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 16:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629751846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMKWHAY0g+Ovw69d+ugZWjuqMJHlTDavDyGGFqeiX68=;
 b=TatJS7DXVpP3ILw2WF1zo+OifdRrqtEVdJUv1+iRXZWDGG0PcClkaCSUwMqwyFCYmvnzCR
 jXhjVrQyZscV5ubzBAMEgHZkolF+Dm8OYOqpkZ0wD80Mti833mOKRy25FPpwgyY4AoUteC
 tOc9NHtqfdB1UIU6PzQtXWdqlZmGDDI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vTmwzHBDPxWa4vTOFtRd5g-1; Mon, 23 Aug 2021 16:50:40 -0400
X-MC-Unique: vTmwzHBDPxWa4vTOFtRd5g-1
Received: by mail-qk1-f198.google.com with SMTP id
 x19-20020a05620a099300b003f64d79cbbaso7037940qkx.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 13:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tMKWHAY0g+Ovw69d+ugZWjuqMJHlTDavDyGGFqeiX68=;
 b=I4Qm88NuEUNqTw4yv3eGMBK6vXyuk0UybUclHAimoKPqEck+RtbeUfdfgstasr2Elq
 thySWuuir1FCXNrwT0n2n8oQbmGIVpXxHZ6Mh8/r3yykoEvJcsMFG5G6DsDPTU4x7z2s
 /CVwFUgQmcc25fLs4dwNsv0DhKVhp8UUGBOwp67FeaoOZpIFBaZ7zV8HxwQ0Fa6i6L/a
 OuYC0y2Zhn7xtSoOPQ3LGAMz5BbK87/AeOTXtYkSlPfMvqC0a9E5b81oyjXtz8jbzPLE
 7YMLH/7DsX1Y6rCKqNMYIllr03skNViJqR+Dipw+Nr8c1/4L99EjVp1LzOSPpE+jXy67
 leAQ==
X-Gm-Message-State: AOAM530bt9iTUQ1mlHmjNLwA237OI5REcYvBWHOApgUSWm6uIM04s5zL
 ZB2cZUHkYsJp++Eog015ymDZl7GPQsIB6Yv/SG9s1sy9wUA9nRPtioQHwCWTAaHRyW3ck+neqfJ
 Wiw0W3RfU0zdlSaQ=
X-Received: by 2002:a05:620a:145c:: with SMTP id
 i28mr22382915qkl.118.1629751840188; 
 Mon, 23 Aug 2021 13:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhyVcVkpmyZgkTPA+0jCq2D298F6fzKsklx/HK+Q07ExAs+quAzJ9URsMBcLWytZOFCqs7Dw==
X-Received: by 2002:a05:620a:145c:: with SMTP id
 i28mr22382898qkl.118.1629751839972; 
 Mon, 23 Aug 2021 13:50:39 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id m8sm9119026qkk.130.2021.08.23.13.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 13:50:39 -0700 (PDT)
Date: Mon, 23 Aug 2021 16:50:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <YSQKHaGiJZE5OAk2@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > This series aim to kill a recent class of bug, the infamous
> > "DMA reentrancy" issues found by Alexander while fuzzing.
> >
> > Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
> >
> > - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> > - MEMTXPERM_UNRESTRICTED (allow list approach)
> > - MEMTXPERM_RAM_DEVICE (example of deny list approach)
> >
> > If a transaction permission is not allowed (for example access
> > to non-RAM device), we return the specific MEMTX_BUS_ERROR.
> >
> > Permissions are checked in after the flatview is resolved, and
> > before the access is done, in a new function: flatview_access_allowed().
> 
> So I'm not going to say 'no' to this, because we have a real
> recursive-device-handling problem and I don't have a better
> idea to hand, but the thing about this is that we end up with
> behaviour which is not what the real hardware does. I'm not
> aware of any DMA device which has this kind of "can only DMA
> to/from RAM, and aborts on access to a device" behaviour...

Sorry for not being familiar with the context - is there more info regarding
the problem to fix?  I'm looking at the links mentioned in the old series:

https://lore.kernel.org/qemu-devel/20200903110831.353476-12-philmd@redhat.com/
https://bugs.launchpad.net/qemu/+bug/1886362
https://bugs.launchpad.net/qemu/+bug/1888606

They seem all marked as fixed now.

Thanks,

-- 
Peter Xu


