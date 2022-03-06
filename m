Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE224CEAA9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:07:02 +0100 (CET)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoj7-0005zZ-3x
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nQogL-0005Gf-5d
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nQogH-0006pY-Rb
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646564643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqbiZzv4Jh6+DQqrPRGzXQQ0/kRA1zZUTyKBjx3NUmo=;
 b=ZVTlMdL3NX8w8PhOm7XwNgB+rlpm0ruUltEhwnbOGkOyBjzTC5/UBQOiSlzL3ZC49WWPmK
 u+Gd3t0NG3o2TEHhsklh/GYJwC9IsC7NpkGq0Sg46Y1OZCXe6u8PVw9C9026TzhloF2qZF
 btlymcKNcjXqiPXESOM29ufhotTMLPU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-JcWoRwiaOSmDgeZ7ZBmB4w-1; Sun, 06 Mar 2022 06:04:01 -0500
X-MC-Unique: JcWoRwiaOSmDgeZ7ZBmB4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o207-20020a1ca5d8000000b0038977354e75so2010104wme.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SqbiZzv4Jh6+DQqrPRGzXQQ0/kRA1zZUTyKBjx3NUmo=;
 b=RPgGZA2i9XR0kGRrSNF3vwL8biWFCM2VzvBQNP3tLxZphIsJb2LRFX5GreyomNQ891
 2Xi/dWj9aws7ne0IxIDP6rCbaCpHdEw4xLSlvR2xPDxcCPy8E9bDtqdEVbqUvDjWHk2L
 ZC55ckhTbzdIZLW+V96xAIZTHIJ0y2r5yUJdLGOIPDt9uElxIDml9uuW8BILo9dL7tey
 mwsQJfztz7uvNPclcVQbDXMZlldpAIcnvHBWtMuZEWOOhlILjukysPKK9zowAEqM66EM
 P0ajBryoMcicgVjyxDMMqvcUPW/rhNO2ckCGx0nxB7drDauUQE1rAQH8BGWVxc9W9UwW
 x6/w==
X-Gm-Message-State: AOAM530eV8DL+UvVP6ZbG8qIxoi5s1bdz6Hw/NLFWvUEQH7JcQMoGn4i
 zP5RLm8uqH6DNOB9/5NhnimOBpG7TNnqrUuF4jvJWGwuzai0HQhWtDbfqqZTDI2MxB6bY363YxM
 JT4ul/an8twoQ12k=
X-Received: by 2002:a5d:5850:0:b0:1f0:2d5b:dc35 with SMTP id
 i16-20020a5d5850000000b001f02d5bdc35mr4865706wrf.344.1646564640587; 
 Sun, 06 Mar 2022 03:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/hHPXLG2GWOGCQmLVhkb9+BYoURpIFHdksDAyPGyo9O9UAYUJwnasAdUE43+BndqWNl9ogA==
X-Received: by 2002:a5d:5850:0:b0:1f0:2d5b:dc35 with SMTP id
 i16-20020a5d5850000000b001f02d5bdc35mr4865695wrf.344.1646564640346; 
 Sun, 06 Mar 2022 03:04:00 -0800 (PST)
Received: from fedora (ec2-3-80-233-239.compute-1.amazonaws.com.
 [3.80.233.239]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003899f5a8195sm1891782wmq.32.2022.03.06.03.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:03:59 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/3] i386: Add support for Hyper-V Enlightened
 MSR-Bitmap and XMM fast hypercall input features
In-Reply-To: <20220217142949.297454-1-vkuznets@redhat.com>
References: <20220217142949.297454-1-vkuznets@redhat.com>
Date: Sun, 06 Mar 2022 12:03:55 +0100
Message-ID: <8735jvbaw4.fsf@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> 'XMM fast hypercall input feature' is supported by KVM since v5.14,
> it allows for faster Hyper-V hypercall processing.
>
> 'Enlightened MSR-Bitmap' is a new nested specific enlightenment speeds up
> L2 vmexits by avoiding unnecessary updates to L2 MSR-Bitmap. KVM support
> for the feature on Intel CPUs is coming in v5.17 and is queued for 5.18 for
> AMD CPUs.
>

Gentle ping) It seems the time is running out to get this in 7.0...

-- 
Vitaly


