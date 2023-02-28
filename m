Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA16A5450
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvDC-0001xW-Pu; Tue, 28 Feb 2023 03:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvCt-0001v5-FT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvCs-0005B2-26
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677572368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
 b=hwVriYqOXDLEmq9D9ciyHLXTVf3PDLwysYlGbMx5IUuw0DIfCluUvSqUe7EmMEtYk95OA2
 WX8yDbc0r3D6hgW7frVtd3w+9C8eVJRVauj6mOkuMxRsRgJx/cVgCfkRrhPQh4yqX7MPHY
 eQD98/Zj7NAhFbtVgke0uly04sGqWxc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-2Qi3QyDnPKSXC-dHJh63XA-1; Tue, 28 Feb 2023 03:19:26 -0500
X-MC-Unique: 2Qi3QyDnPKSXC-dHJh63XA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so3947511wms.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677572365;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
 b=KXLKWhGls28nAH79JaxcjGkcNxr/hFy7eMgvEsmvRUeaJgrUwifZXf+xU3qXFxJJIE
 W1+wStWbGFHKwkLrMSsBCcSpww4boAdVASMKn/cDPSkxBsgL+QSK3uwxvFqSJbx4RVLg
 zU5VyORtwYHNiccuH+NILbX9MrudOE6sHAvL5ZqaiZml+QjKnRQbVzRnWI3l9pvz3qRg
 kcXlNu7KfAP0igdLWrKZGwau12jk/TKVCSjedf8rVlrpStXSP3AQpeIKQ0mjc4YR6HTN
 Leua8bEXYNc4t9n2uGL8qQCXL4ekIZC/9zsaCuMNYINEQUtyK7qlF9w4ZgtnqW8NX78+
 KeVQ==
X-Gm-Message-State: AO0yUKXdyWB+5Ly3fu/V7Nas0wVoND9TVPJyiIMeFTXlRPmiK19JsEHx
 04KOgCUB1t8xGpLTt85/jCJ2+/oun5vN/PPaAYfiGtnpZhy/BNbq4QGUERqG1tuqc81tPrXT69i
 1H7TRQaaW5zLs90w=
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id
 x34-20020a05600c18a200b003eb41627352mr1641556wmp.23.1677572365536; 
 Tue, 28 Feb 2023 00:19:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8MhRkZ82bCO1bCO62bz1qOyJGqKvLzP3Zce+ps0g0WYqtWG4J8YWNdNhuZ9T91hDRDN92U1Q==
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id
 x34-20020a05600c18a200b003eb41627352mr1641531wmp.23.1677572365194; 
 Tue, 28 Feb 2023 00:19:25 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003e20970175dsm15603198wms.32.2023.02.28.00.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:19:24 -0800 (PST)
Date: Tue, 28 Feb 2023 03:19:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228031026-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > I feel like we should have separate deprecation entries for the
> > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > although they're related they are independant features with
> > > differing impact. eg removing qemu-system-i386 affects all
> > > host architectures, not merely 32-bit x86 host, so I think we
> > > can explain the impact more clearly if we separate them.
> > 
> > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > a superset.
> > 
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> someone is still using QEMU usermode emulation
> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

I don't know - why x86 specifically? One can build a 32 bit binary on any host.
I think 32 bit x86 environments are just more common in the cloud.

> > In fact, keeping this support around forces correct use of
> > posix APIs such as e.g. PRIx64 which makes the code base
> > more future-proof.
> 
> If you're concerned about PRIx64 and friends: We still continue to do
> compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> run in the CI.
> 
>  Thomas

Yes - fundamentally 32 bit does not seem that different from e.g.
windows builds - we presumably support these but AFAIK CI does not
test these.


-- 
MST


