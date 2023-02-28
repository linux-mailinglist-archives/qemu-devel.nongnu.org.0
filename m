Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23466A54FE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:00:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvq3-00023b-L6; Tue, 28 Feb 2023 03:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvpy-00022o-HF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:59:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvpw-00046g-Vg
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677574792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
 b=ij/6JtTKNm62zZuEX2/Nns8lGc8Cojbdm5wzSc5jaGPkE770Qlyp5w4QdGQQcKXmt4jkzr
 SvRnJeS+xLJxRGw6CLDUtslZlmPLI6F9bXeRhlSnUGhFi6pdczvu8YYeCSKOuBIM/e1dE9
 xibY5cy9NYoh2uIhc5LbEJjrzGKkqBA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-6K4snyq4OLutYLMgiWJU5g-1; Tue, 28 Feb 2023 03:59:50 -0500
X-MC-Unique: 6K4snyq4OLutYLMgiWJU5g-1
Received: by mail-ed1-f71.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso12760785edb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677574789;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
 b=d8qpbJ9lXQ50UNybVLtDXRem+wkkgVHXv1qOlcf37UH6kvqqhyW/dW8H3JqLhWgT+t
 33u9yxWtuRzKuyNzACvc6CWmxrPgeovrT/u2m+tVqjT1RxFy5FJV3lb3M1TCvPmW2Ltd
 VTZA5ll/foIMl36Vp7eyvYVbKYAsvCfBpWAdjn+UGhRIQJvQM1ExLW12FrJ1AnVZKbzt
 1Myo27smBN9h35oKXOiQwZOld33OdveaDXK1c5aNca9NepgljLoSuw1vdOpemS2EWFoG
 RtSqA4e4GCr00sMN2RB6tv+eLRxy6KHD/xYYAZssJ9FQZ/zoBCAqKDiPrfXOQ+oJlHBz
 dwxg==
X-Gm-Message-State: AO0yUKV1Pdc0sffkGjYoIM5GaH+hOg+sNVLLAIQ7FLEFpeJf1RQOaApX
 aQMne1HLwlO9PuRRMFtyrqqP3BM1op0cgQsCopKi1CqoO8DjmWKTC++aXXfbV8600v6+VHvfc/m
 iCQrVXqXtfQab8p8=
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id
 i13-20020a170906264d00b008b179d0bc58mr1697096ejc.16.1677574789512; 
 Tue, 28 Feb 2023 00:59:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+fUW5AwCYmimNt17fLi6VkNVMvM8T0LSvQi1PwptV14D5OBhXq8nQB0YakRdPxskPQaBqfcQ==
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id
 i13-20020a170906264d00b008b179d0bc58mr1697089ejc.16.1677574789259; 
 Tue, 28 Feb 2023 00:59:49 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 ha14-20020a170906a88e00b008c405ebc32esm4229508ejb.28.2023.02.28.00.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:59:48 -0800 (PST)
Date: Tue, 28 Feb 2023 03:59:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035917-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> On 2/27/23 10:12, Michael S. Tsirkin wrote:
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
> It's not that small.  It only works for single-threaded system mode.  It
> silently does not honor atomicity for user-only mode, which is perhaps worse
> not working at all.

We should probably block multi-threading on 32 bit then.

-- 
MST


