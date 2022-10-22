Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093560983A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiT1-00029h-1h
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHYa-0006IO-Qy
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omHYZ-0001iH-8Z
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666456865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhxALOvxMr8CfNH5duMYrhhEO633itkcsmzMVQ9g/Lo=;
 b=ZvRGbo/dwjWHrO27mko8eYeXXJiEjEaSHT0BiMcn3RRAswwOnvNeHxBJVwwGRVT7OeBObe
 m/hhR1VXIVmW5KR2LKAUNs/ms2A1n/Eif8Yr6QzCpVRtqdQlK2hgcEngrMySs7bkJOs6y+
 udviNFOBcByCEcu76IKU5KqrRArb34k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-931mPOhUPr239xcR1KMXoQ-1; Sat, 22 Oct 2022 12:41:04 -0400
X-MC-Unique: 931mPOhUPr239xcR1KMXoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay12-20020a05600c1e0c00b003c6e18d9aa8so5178361wmb.8
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fhxALOvxMr8CfNH5duMYrhhEO633itkcsmzMVQ9g/Lo=;
 b=oWg8/w5MKE4O2WsMomkD9FsKMjaMj06V/BXqeiHpliKFVOsihZ4OPQ9Wm4gmm4AZcn
 2dAHbSRsWAT8prTTeoec4aMXorQ895dDEx3tZVHnOVmW0TjBgUcBocEHJ1cuppAEpvba
 BxNyCg8nLp0jdCtj1r0MqdlDQbsNhAF5NK7oJaMU4cWJgtnApd0WP9G58shDX1SivE3t
 J4LjPsubJ5J+8096Xfc0Q4g1gfFdxaTcyk9m569gvlCBh9y3lc47IyF8e9zxYjVtqHWv
 ej0fGIeiXyBRdzxuV3HY4szdFRPNwCjdIet7NhQGn5jjXl8jFHLUqUu3VORF02ZBej//
 2HzA==
X-Gm-Message-State: ACrzQf0Wa0S2xDhujJ+E1FmiY5lfOumMh1+jtn9thV0uCpKvoh21CZPz
 ML9281j4zvpSDkXIkWF/KIamJLkncB+39HQxmBTqMmGy32iSgEGQf1lHaQBHo2zZB5Gne/78XYH
 P5WiuYnsQqZY70P4=
X-Received: by 2002:a5d:6485:0:b0:236:4ed2:409c with SMTP id
 o5-20020a5d6485000000b002364ed2409cmr7242479wri.110.1666456862815; 
 Sat, 22 Oct 2022 09:41:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uBpZFnvC+Ldz6DSYwX+V6TfvRUvcKoXM3Ad2AzLIde2rHhNSWC07qPc7sXy0dcnJfFzmg/A==
X-Received: by 2002:a5d:6485:0:b0:236:4ed2:409c with SMTP id
 o5-20020a5d6485000000b002364ed2409cmr7242464wri.110.1666456862595; 
 Sat, 22 Oct 2022 09:41:02 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7435:2100:975b:ee03:5e6d:6634])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c488500b003c6c4639ac6sm5644639wmp.34.2022.10.22.09.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 09:41:01 -0700 (PDT)
Date: Sat, 22 Oct 2022 12:40:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221022124008-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <20221021041731-mutt-send-email-mst@kernel.org>
 <CAARzgww8iQs7Czf0pCG-3JuaKTrf7qtx1buMf_U-J++f_FW1eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgww8iQs7Czf0pCG-3JuaKTrf7qtx1buMf_U-J++f_FW1eg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 05:12:07PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Oct 21, 2022 at 13:50 Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha wrote:
>     >
>     >
>     > On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin <mst@redhat.com>
>     wrote:
>     >
>     >     On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
>     >     > On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com>
>     >     wrote:
>     >     > >
>     >     > > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
>     >     > > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <
>     mst@redhat.com>
>     >     wrote:
>     >     > > > >
>     >     > > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
>     >     > > > > >
>     >     > > > > >
>     >     > > > > > Changelog:
>     >     > > > > > v6:
>     >     > > > > >   - skip test when dependencies (xorriso for example) are
>     not
>     >     installed.
>     >     > > > > >   - skip test when run on a platform other than x86_64.
>     >     > > > >
>     >     > > > > Hmm why is that btw?
>     >     > > >
>     >     > > > The bits binaries that generate the iso (grub-mkrescue etc) are
>     built
>     >     > > > for and are known to work only on x86_64 platform. They might
>     also
>     >     > > > work on amd64 but I do not have one at my disposal at the
>     moment to
>     >     > > > check.
>     >     > > > On other platforms, for example 32 bit x86 and non-x86, those
>     >     binaries
>     >     > > > will likely not work. The test will fail.
>     >     > >
>     >     > > confused. I thought we are distributing the iso?
>     >     >
>     >     > No, the test builds the iso after adding the modified test scripts
>     and
>     >     > then spawns the vm with it. It is all part of the test itself.
>     >     > We need to do that so that the iso contains the newly added tests
>     etc.
>     >
>     >     It's good to have for people developing tests, but for most qemu
>     >     developers please just have a ready iso and have avocado fetch it.
>     >     It's important to make tests run on all platforms.
>     >
>     >
>     > This changes things a lot and goes down the path of where do we check in
>     test
>     > code changes? Do we deal with multiple repos? Where do we keep iso? Etc.
>     having
>     > a static iso limits us also. 
> 
>     It's the same as any firmware really. I don't see much of a difference.
> 
> 
> Except that the iso is much larger than the current edk2 binaries and there are
> serious objections to keeping them along with other bios binary blobs in qemu
> repo.
> 

Right, I get that. So avocado was supposed to know how to download them
automatically, no?

-- 
MST


