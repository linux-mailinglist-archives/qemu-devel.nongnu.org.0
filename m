Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8A20C153
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 14:58:09 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpAPI-0006YJ-4m
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 08:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jpAOZ-00067i-Gh
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 08:57:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27609
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jpAOX-0001mB-0i
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 08:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593262639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BU51Cpt6ehS7yG2Y68eB3BnU668AI8Cr+sXY2EHPL5E=;
 b=Z1IeboqKPCkqrtcEOSN4BA3n94+iiU9hCYynJ2tSfC3dLMPMsXlc4nktDNKMMmpuyuvDok
 r9ccXPwlUhWSkeMw3gLiP3tWibbnF4V/XPGMBKlZGLtvqyeFyS9vy90pD+Lx/XoZRP10Pd
 tQnKrHhN0Ll9FKR2jhJXhw536TtXqQw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-fppz-EeON2yZu5A8Met9XQ-1; Sat, 27 Jun 2020 08:57:18 -0400
X-MC-Unique: fppz-EeON2yZu5A8Met9XQ-1
Received: by mail-qk1-f198.google.com with SMTP id i6so8665102qkn.22
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 05:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BU51Cpt6ehS7yG2Y68eB3BnU668AI8Cr+sXY2EHPL5E=;
 b=dqzPiqFira/FiQbgU+EzbJrmdCEUldKdod+DIMO3YkI6rGYBv9Ss71LtJbfmqvI1nW
 cmrv6OSaHs1FV8ZfnbarSI5ZAm4iCkZc/qZfofwXvtR7KKbSU3YdRyzPcM85lpQoeeX3
 WIIBHoceovUwugJv4Mrun80k1d3sEUSEDKDgDsixGNxGiExXHS7rpwGxMwFEUfT/LNGO
 4vv282wAwKcujbiXrMoOKIJyzpn7m1i1I8gTw5Re8g+WOUhOGxomyOihZxe/tomGuLlc
 Ik9Lm+kI6AXswn2tJwMnvO2iq/ZRxAZb/ZIPglyhcJvyAAFggzY3kFkKsctFK6G3qThN
 40OQ==
X-Gm-Message-State: AOAM5333y4EF8Ae7ifWU8Ct67rstELtpa9viSpX3w62WmJrd5diziP65
 Dt/tFvtPBs4r+6rI+enwUdyBAopQg9XA4e/IcPwnVxdhDL6q6ZpJcCCwLzWkW+TeyqgjC2X8l5s
 yWpZbKgB/sotzg+A=
X-Received: by 2002:a37:a542:: with SMTP id o63mr6816539qke.316.1593262637690; 
 Sat, 27 Jun 2020 05:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTsQYAd/0a9R/Dd1WRRTouaiUMtqGRaPSM3VFUnSnG0UsJiVjr3+Nd3Vy+ukoXX7yA+vRkvQ==
X-Received: by 2002:a37:a542:: with SMTP id o63mr6816523qke.316.1593262637361; 
 Sat, 27 Jun 2020 05:57:17 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id q47sm12406638qta.16.2020.06.27.05.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 05:57:16 -0700 (PDT)
Date: Sat, 27 Jun 2020 08:57:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Yan Zhao <yan.y.zhao@linux.intel.com>
Subject: Re: [RFC v2 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Message-ID: <20200627125714.GA212287@xz-x1>
References: <20200626064122.9252-1-eperezma@redhat.com>
 <20200626064122.9252-2-eperezma@redhat.com>
 <20200626212917.GD175520@xz-x1>
 <20200627072644.GC18338@joy-OptiPlex-7040>
MIME-Version: 1.0
In-Reply-To: <20200627072644.GC18338@joy-OptiPlex-7040>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 07:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 27, 2020 at 03:26:45AM -0400, Yan Zhao wrote:
> > -    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> > +    if (notifier->notifier_flags & IOMMU_NOTIFIER_ARBITRARY_MASK) {
> > +        tmp.iova = MAX(tmp.iova, notifier->start);
> > +        tmp.addr_mask = MIN(tmp.addr_mask, notifier->end);
> NIT:
>        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;

Right.  Thanks. :)

> > +        assert(tmp.iova <= tmp.addr_mask);
> no this assertion then.

Or change it into:

  assert(MIN(entry_end, notifier->end) >= tmp.iova);

To double confirm no overflow.

-- 
Peter Xu


