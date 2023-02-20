Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDF469CA59
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4kj-0007om-N7; Mon, 20 Feb 2023 06:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pU4kg-0007oA-7y
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pU4ke-0005Yv-D3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676894074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TH4heAkd9VMklcYtFtHsbJ7cFvEpofoQQlBNmQcmA7U=;
 b=NlHV9o+Tr3zbTD/1ghh1nyE6anaF4TpNAIeo+QVeGhYfMTa9VQG9vm+c/F3WzQE5C5AZva
 GVg9SBJsN+dy2Mb7dD3tkANxy6NnbW/71Mf3Y6Ntg8wkWKMWL2SVs0A6zzy0elxts0+Uu/
 6/2gALdWw1GEY8ENM+OJ6ECaWutjOcg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-UkiSl4kdMHKdt33IEmK2VA-1; Mon, 20 Feb 2023 06:54:32 -0500
X-MC-Unique: UkiSl4kdMHKdt33IEmK2VA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so511118wmk.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TH4heAkd9VMklcYtFtHsbJ7cFvEpofoQQlBNmQcmA7U=;
 b=iVeWx2R8xKaNmelzwJpxWBGzIdS2FyBZa7Q3YGi4s6DbHgzEZx0e6GR6xLIL0A83rv
 IK+Xz9aq2SsqbHW44UkYpwexuJ+5mBLbk7+z1wIo5L5R+dPIIaTpUgU22a6hBd70EPah
 FjZNGRx89NiYMw2XZoaKsiNCO7ioX64H3INDbe2wmx4wqSzgWyYORovmvP0Xqw6VhGLJ
 RXGt7AQI19VbjS0YLcMqK2YGQWKq4p/asQNykxe1ox34kJiVwCfFb7Y3FP/B5sQ5tZnW
 XzQmeW5s0w6Y+mrvWczQJiukqfRZerU9D3sY54N8hDryVydnJorj37TLAOOPkLmIq/qA
 uNzw==
X-Gm-Message-State: AO0yUKVvhMNeK4MeSNxaNJF5njlgJ8u7eKfMjWRQY58ADViUOF8qgjpk
 nJ/eE6IF6kMejxDDuT66XGgAwiQicGhbjcKTWWYqNQ6UhPfnWEJaiCp25Hsgu5G5lgNcAYYQOtg
 hFNJEOXI1LyHn1A4=
X-Received: by 2002:a05:600c:a698:b0:3e2:1e31:36bc with SMTP id
 ip24-20020a05600ca69800b003e21e3136bcmr110362wmb.12.1676894071593; 
 Mon, 20 Feb 2023 03:54:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/cmHCer5I++eQzXfxaAsD+TKAnuLkw6cXg2aGfsbXV/ILAK/XbJNFn/oWrn3mcd7fYW9rmvA==
X-Received: by 2002:a05:600c:a698:b0:3e2:1e31:36bc with SMTP id
 ip24-20020a05600ca69800b003e21e3136bcmr110346wmb.12.1676894071316; 
 Mon, 20 Feb 2023 03:54:31 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003e4326a6d53sm2783361wmb.35.2023.02.20.03.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:54:30 -0800 (PST)
Date: Mon, 20 Feb 2023 06:54:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH RFC 0/7] revert RNG seed mess
Message-ID: <20230220065418-mutt-send-email-mst@kernel.org>
References: <20230208211212.41951-1-mst@redhat.com>
 <Y+YratFIX/WHWbFy@redhat.com> <Y/NQGfiH322iZuhX@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/NQGfiH322iZuhX@redhat.com>
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

On Mon, Feb 20, 2023 at 10:48:57AM +0000, Daniel P. Berrangé wrote:
> On Fri, Feb 10, 2023 at 11:32:58AM +0000, Daniel P. Berrangé wrote:
> > On Wed, Feb 08, 2023 at 04:12:23PM -0500, Michael S. Tsirkin wrote:
> > > All attempts to fix up passing RNG seed via setup_data entry failed.
> > > Let's just rip out all of it.  We'll start over.
> > > 
> > > 
> > > Warning: all I did was git revert the relevant patches and resolve the
> > > (trivial) conflicts. Not even compiled - it's almost midnight here.
> > > 
> > > Jason this is the kind of approach I'd like to see, not yet another
> > > pointer math rich patch I need to spend time reviewing. Just get us back
> > > to where we started. We can redo "x86: use typedef for SetupData struct"
> > > later if we want, it's benign.
> > 
> > This approach looks suitable for applying to the 7.2 tree too,
> > which will be good for fixing the regressions in stable.
> 
> Since no further alternative has been proposed, can you consider sending
> a pull request for this series. This has been broken for too long and
> many users & vendors are looking for an official fix to be applied to
> master before they backport to 7.2
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

Will do. Thanks!


