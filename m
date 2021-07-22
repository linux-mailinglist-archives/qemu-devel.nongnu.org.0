Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E803D2C8C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:15:08 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6e9z-00057C-Dp
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6e92-0004Qw-2v
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6e8y-0005qZ-Ke
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626981243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fV8yWUBt2e91L4121V63CnecW/BH6X+8cRzNJOlsTd4=;
 b=RMspv1m2f/KlTGXsCzgHfpLSlx3OBVJJxQpjfPthDWXqChx2X6Rheux+RAZ7tjfkaLj9gR
 TsekrMNIeQL7KdrLAUEK9CUQ+DLqUIBW4FYfHBA+GTJvS3P4U37+JAGFNu4nBGqB91KC09
 ArLCJLwL7Q9ZQGWTcu8vQNEDTIq7FaM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-zxWIV2u7NrGqsC3bmFwixw-1; Thu, 22 Jul 2021 15:14:02 -0400
X-MC-Unique: zxWIV2u7NrGqsC3bmFwixw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so2769379wrs.22
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fV8yWUBt2e91L4121V63CnecW/BH6X+8cRzNJOlsTd4=;
 b=VwiOoDWzcPqDM9fPAr07IDa7RtiMnLZ7GPwzLADs7d99BjSTL9UrVPMbWuNm5K1lfG
 DumJlOh7uFzg8rx1UeO6rwoOa9edKt1GNrK9p61+W3+7Iq06gB6SVHrG9m6zXrDGiiW9
 eREPZB9Sy/HK1l4zSlmTh8Di8803h4r//ox8/mbNNrkEqbFZu3sD1MFTNF1XU18KGIQH
 +LxaC5pGMvksJh/FT2VXXHjVICZeZHyNKrzmbHsb7wvcNpkFM+Rr7O0c8qCgeGIvMKYO
 YL+YO80LqJxSRKlVgvWZ0Rlhqpx6w5GPIKsCtCHay5p5WMdkZk7zowD/fxR2VksaBuoH
 kcsw==
X-Gm-Message-State: AOAM531mVZMyDh1+hr+MfXQdMf8yvhXlHrvwYxgbXcAQH0WiJYTYBC0O
 blcFCiZPrXd4AlD6K4uUpuk5mF4QeK1QZJ6UCWsFIEG2wYqbVkUcBLU1+JAKR97QTQnU+Jz+zQk
 gn6sD39aw8o9H4sM=
X-Received: by 2002:adf:f404:: with SMTP id g4mr1522412wro.56.1626981240851;
 Thu, 22 Jul 2021 12:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh0YeVYSjr1kFmedwWnu8pNb+gRIPFT+YT9Ht2dEyVO5ab68sHKNZHTstpWhW7XofAYSYNaw==
X-Received: by 2002:adf:f404:: with SMTP id g4mr1522396wro.56.1626981240687;
 Thu, 22 Jul 2021 12:14:00 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id a64sm24792486wme.8.2021.07.22.12.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:14:00 -0700 (PDT)
Date: Thu, 22 Jul 2021 20:13:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Prefetches in buffer_zero_*
Message-ID: <YPnDdT1VYANI0Wzw@work-vm>
References: <YPlCJpMIOb2Umc+Z@work-vm>
 <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
MIME-Version: 1.0
In-Reply-To: <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, jmario@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
> > Hi Richard,
> >    I think you were the last person to fiddle with the prefetching
> > in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
> > prefetching still made sense on modern CPUs, and that their hardware
> > generally figures stuff out better on simple increments.
> > 
> >    What was your thinking on this, and did you actually measure
> > any improvement?
> 
> Ah, well, that was 5 years ago so I have no particular memory of this.  It
> wouldn't surprise me if you can't measure any improvement on modern
> hardware.
> 
> Do you now measure an improvement with the prefetches gone?

Not tried, it just came from Joe's suggestion that it was generally a
bad idea these days; I do remember that the behaviour of those functions
is quite tricky because there performance is VERY data dependent - many
VMs actually have pages that are quite dirty so you never iterate the
loop, but then you hit others with big zero pages and you spend your
entire life in the loop.

Dave
> 
> r~
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


