Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1862475447
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:29:05 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPeq-0001Z1-TZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:29:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxPMM-0000qz-5c
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxPMH-0004m4-4B
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639555792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=063UgQCsLEwfIIW8wNrfuKXHX9G0PQjXyr7l04AmoJ0=;
 b=DIvkM5lazvduKKyQagRzGFZfPbPq6zlUdEqCqnG71zFwW2gDVK2hOQjaJeo94fSD3VtnOw
 oaKUtbo3TuO2IKlYcbjlZGt9nHQ1h/MqY1i9vtc9lgPb4BqXeIBrh1s0CSYC5a+UU37rbr
 Maw104gUtD6TKNDwi7jUd6pZWf/nW+4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-RRkaoBIPNeOHapSettvvbg-1; Wed, 15 Dec 2021 03:09:48 -0500
X-MC-Unique: RRkaoBIPNeOHapSettvvbg-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so14309500wma.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 00:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=063UgQCsLEwfIIW8wNrfuKXHX9G0PQjXyr7l04AmoJ0=;
 b=VjOXDNOcuERODZ7SYJOUfFllfmXHWo2nRQLAPBRV8g2ON/QGWBWyMMVQGHi1zSaXxs
 gMGpR5j+BH+ZUR3UeUy2pQbw2tGy3LHE2RHy/MdnRnMLk/xbu9ae2exyKXXvauSswSPo
 S2FrxlXVfFIkVlr6xD2Hb6640I2ll3Sze/oyI5A5den0CS9F3K4e/i2l1z6eiqsP+gV8
 zIiv8Mxy2Pvy7bBfAtghH4j3fEz+5zxz4z2Xy2Vn4ZNnzfjjHQtYz2sfR9MzWwOkA9fu
 3zgeLdqbk3tGwSIcmWnKKFYRMuxq18/VvIxlVk87d4U2xQAqQ6Uh5OxRDrg6AU2qwJp0
 5xcQ==
X-Gm-Message-State: AOAM532PrYL8hbCIiPjWn1ID5k/WPTeuPIj7aP6lleQkEUHuTjRf+81y
 W62aPiJUDymEDU/8j1GVhiV4arpR9NapotOTlqLI2HrvJCZvg9OkgeeQw3sXvjaqEpl9wurKtmr
 n9OaqCCqKIxjhgeo=
X-Received: by 2002:a5d:440f:: with SMTP id z15mr589949wrq.29.1639555787491;
 Wed, 15 Dec 2021 00:09:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJiOZAPhtT21xtFGEdGKgbDdx7fuB9+jshl9gxmFtwFD3Iokg9Ojux6lFwxSkUADRs3owKiA==
X-Received: by 2002:a5d:440f:: with SMTP id z15mr589925wrq.29.1639555787259;
 Wed, 15 Dec 2021 00:09:47 -0800 (PST)
Received: from xz-m1.local ([64.64.123.23])
 by smtp.gmail.com with ESMTPSA id l22sm833601wmq.2.2021.12.15.00.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 00:09:46 -0800 (PST)
Date: Wed, 15 Dec 2021 16:09:39 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
Message-ID: <Ybmiw59Qh3sHukyh@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 03:56:55PM +0800, Hyman Huang wrote:
> > > +{ 'command': 'vcpu-dirty-limit',
> > > +  'data': { 'enable': 'bool',
> > > +            '*cpu-index': 'uint64',
> > > +            '*dirty-rate': 'uint64'} }
> > 
> > Drop @enable, please.
> > 
> > If @dirty-rate is present, set the limit to its value.
> > 
> > If it's absent, cancel the limit.
> > 
> Ok. Indeed, this is the simplest style. :)
> 
> So the final qmp format should be like:
> 
> case 1: setup vcpu 0 dirty page limit 100MB/s
> vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s
> 
> case 2: cancle vcpu 0 dirty page limit
> vcpu-dirty-limit  cpu-index=0

I actually agree with what you said... for human beings no one will read it as
"disable vcpu throttling", instead people could consider it enables vcpu
throttle with a default dirty rate from a gut feeling.

I think what Markus suggested is the simplest solution for computers, but it
can confuse human beings.  So it turns out to be a general question to QMP
scheme design: should we always assume QMP client to be a piece of software, or
should we still consider the feeling of human beings operating on QMP
interfaces using qmp-shell.

IMHO we should still consider the latter, if we don't lose much, anyway.  But I
don't have a strong opinion.

Thanks,

-- 
Peter Xu


