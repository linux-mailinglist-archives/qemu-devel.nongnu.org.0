Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352864DAD0A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 09:57:13 +0100 (CET)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPSy-00030r-8r
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 04:57:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUPRW-0001Yz-Vk
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUPRV-0007Lu-HD
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647420941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=74OsEXuKg7OyD+ph51A+sxncTARkOfPwgJa3TD008K4=;
 b=I+w2O9Vw2pXRuSZT9BIIq5BcugrOuoCt7VApGjdTQaSaO9AQaDwQDJS2CrROOZfIdifr7R
 4XTHT43JPRmyyFaXCphy+k1IbZFRuo6daxPHh0gkzjeBRCs5ajZ6cB0htGliMqUz6JGgr+
 jgi+2ujvagz4mVCSu9irm6r49TwPh8g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-JtuDSj8OM92E6MEP47GcMQ-1; Wed, 16 Mar 2022 04:55:37 -0400
X-MC-Unique: JtuDSj8OM92E6MEP47GcMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso327736wrq.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 01:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74OsEXuKg7OyD+ph51A+sxncTARkOfPwgJa3TD008K4=;
 b=uM5rH1a+t0fBxTuZTuvFY66DWN3PsSBunv+NEV1v3vTyNkLmev8D2d9dDxK7LWkxCw
 cY8+cwgsT8qrQlj7MvbNg3SIJrStkElx7wCqBjtLvt9c6IZdbF7wvC6u4+DNDvVijv1K
 F7qxOU/tU6MlvpPs/dj/7f2lPQAaZ8MxSbuMcRtonSGq9K96UjKjfo16QpJ9cVgAn/Nh
 o7LRvi1FdqarJ46EvKxWv/YcwmRSOnbZAYqaq5F8HMR8H4zmLUbSdtGlHrBzaFjG+2IG
 ccmqcnjvgdOJEEGKhyFg2ZiUDIRIqDvMClyT4kaER0iGwF5+SN50dLy7oaDQz9w7Dy66
 sSyw==
X-Gm-Message-State: AOAM531SFTkYO9JqltgHmqRtS4pjzBHjsijWRn4FnVz95CRkwNWdnG+b
 X3Ix+PnT/9P/VcHGXVGfiym0+PpT2sdif+vUDHuzgIbJqRUtec1q9ajJWNNrLn0mpTT9d8056Ne
 yEyrd2QeBbMoK5m4=
X-Received: by 2002:a05:600c:14a:b0:389:948e:eb2f with SMTP id
 w10-20020a05600c014a00b00389948eeb2fmr6404328wmm.141.1647420936058; 
 Wed, 16 Mar 2022 01:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgcDE6EcCmugZnARVpIw674YMA7t1T2lNVZtD88xnS64aP8LcXvNpSaPRCKjZW0ycMffIsQg==
X-Received: by 2002:a05:600c:14a:b0:389:948e:eb2f with SMTP id
 w10-20020a05600c014a00b00389948eeb2fmr6404315wmm.141.1647420935852; 
 Wed, 16 Mar 2022 01:55:35 -0700 (PDT)
Received: from redhat.com ([2.53.2.35]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b00389e8184edcsm4452474wmq.35.2022.03.16.01.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:55:35 -0700 (PDT)
Date: Wed, 16 Mar 2022 04:55:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH v3 0/3] Fixes for building on Solaris 11.4.42 CBE
Message-ID: <20220316045519-mutt-send-email-mst@kernel.org>
References: <20220316035227.3702-1-adeason@sinenomine.net>
MIME-Version: 1.0
In-Reply-To: <20220316035227.3702-1-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 10:52:24PM -0500, Andrew Deason wrote:
> With these minor fixes, I can build qemu on Solaris 11.4.42 CBE
> (Oracle's new rolling release thing), using '--disable-rdma
> --enable-modules --disable-dbus-display --target-list=x86_64-softmmu'.
> I'm just interested in the guest agent right now, so that's all I've
> tested (briefly), but the rest of the build wasn't hard to get working.
> With this, the guest agent runs fine using isa-serial.

Who's merging this? Me?

> Changes since v2:
> - Rename new symbol to HAVE_MADVISE_WITHOUT_PROTOTYPE
> - Move madvise prototype to include/qemu/osdep.h
> - More comments in meson.build
> 
> Changes since v1:
> - Change the CONFIG_MADVISE checks to not be platform-specific
> - Add the last commit removing util/osdep.c cruft
> 
> Andrew Deason (3):
>   util/osdep: Avoid madvise proto on modern Solaris
>   hw/i386/acpi-build: Avoid 'sun' identifier
>   util/osdep: Remove some early cruft
> 
>  hw/i386/acpi-build.c |  4 ++--
>  include/qemu/osdep.h |  8 ++++++++
>  meson.build          | 23 +++++++++++++++++++++--
>  util/osdep.c         | 10 ----------
>  4 files changed, 31 insertions(+), 14 deletions(-)
> 
> -- 
> 2.11.0


