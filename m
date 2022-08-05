Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03758A812
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:32:32 +0200 (CEST)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJskx-0006Ix-Io
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJsYt-0004ky-I8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJsYr-00056R-F6
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659687600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRkWmfOdI/r+Z1VDPe0wEa2tC/zW229Do1XAwmgOvaY=;
 b=ewaJc3ZdCHpq4O5cuGrQ1nCgVRFfVoQQA9CVqcXlaCuvWWkgNd2KicA+CPWE73dLmFRssG
 eAjwdV/BbxXWQ23FbYCd7cG0ju7uDreq8IxOifTUpzqabqcv07zLNJPTTR33oPlSsEFbxf
 5J1O4BMG+3Bgo2Pyjc9hbY4KT2YG9bQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-QT4RMOofM-2vWbGoqLDaeA-1; Fri, 05 Aug 2022 04:19:58 -0400
X-MC-Unique: QT4RMOofM-2vWbGoqLDaeA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so349093wmp.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=sRkWmfOdI/r+Z1VDPe0wEa2tC/zW229Do1XAwmgOvaY=;
 b=xllm7EutOFaqK6lHVAWd//R3SZt3XkNLQm+YtXaW+FL1Xrw91gW6kr8UAOi9p7547a
 NAz9ILHtK4ydpVnNM1WIuRZusP9VGzmUmKoDc4eHQWuhJl/68WSXmml7duM9bGWw+g35
 uied+DIPsKq5XlB665tHwKdPS3KmIwMGi6P7/LsHAUOsYk63aOV5sCC/4lRjRDlhOOOT
 J63wvTYaGu20H1yYsBQ0pXMUVkeELO3P+Ueypvf93c6B+lEgMbMMZ+xlocrsKYnUniXR
 COMU7UjBcWt2FHsEhWdPLJQbLtztV94le4668grwkttxDYznGSffvA9LcmVVALp4PNvf
 UPzw==
X-Gm-Message-State: ACgBeo0OksBFX8uSXuB9kplTiRt4eJCuozmlESZ/pKouBz8Y24UinKcP
 SgFzvh5WTS6ukyTNAzXXxS68NQ8ukqZTAn85s97BvfxN+wvF2ddjdzqjquey86AoZTgCm+l+gsn
 oub1E/cO2hnT4mwI=
X-Received: by 2002:a5d:64c1:0:b0:220:8590:3809 with SMTP id
 f1-20020a5d64c1000000b0022085903809mr3616519wri.97.1659687597733; 
 Fri, 05 Aug 2022 01:19:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50GlGSW++rVT2lMQcOaO9fPx8xZsVgLKBHIw5kErOxCc7MDT+jpGp5P4Wodl9lSCRRIct62w==
X-Received: by 2002:a5d:64c1:0:b0:220:8590:3809 with SMTP id
 f1-20020a5d64c1000000b0022085903809mr3616503wri.97.1659687597470; 
 Fri, 05 Aug 2022 01:19:57 -0700 (PDT)
Received: from redhat.com ([2.52.137.185]) by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b0021d69860b66sm3997585wrr.9.2022.08.05.01.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 01:19:56 -0700 (PDT)
Date: Fri, 5 Aug 2022 04:19:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] pc: add property for Linux setup_data random number
 seed
Message-ID: <20220805041810-mutt-send-email-mst@kernel.org>
References: <20220804212441.458478-1-pbonzini@redhat.com>
 <20220805025107-mutt-send-email-mst@kernel.org>
 <9a54556f-9a9e-f9cd-9e77-c46fc781c0f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a54556f-9a9e-f9cd-9e77-c46fc781c0f4@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 10:16:37AM +0200, Paolo Bonzini wrote:
> On 8/5/22 09:01, Michael S. Tsirkin wrote:
> > > -    if (!legacy_no_rng_seed) {
> > > +    if (x86ms->linuxboot_randomness != ON_OFF_AUTO_OFF &&
> > > +        (protocol >= 0x209 || x86ms->linuxboot_randomness == ON_OFF_AUTO_ON)) {
> > Hmm so if user requested "on" but protocol is too old then we just
> > ignore it silently? I'd rather we failed initialization.
> > So:
> > 
> > if (x86ms->linuxboot_randomness == ON_OFF_AUTO_ON &&
> >      protocol < 0x209) {
> > 	fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
> > 	exit(1);
> > }
> 
> It doesn't ignore the "on" setting; it passes the seed anyway even if the
> protocol is too old.  Basically, a kernel that is too old to support setup
> data is treated the same as a kernel that supports setup data but doesn't
> know about the seed datum.

Oh it's an || not an &&. You are right. I needed more coffee.

> It seemed the more sensible implementation because anyway you cannot know if
> the kernel will use the datum.
> 
> Paolo

OK then.

-- 
MST


