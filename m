Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AD2BA9DA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:09:41 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5ES-00028N-GS
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg5Dd-0001fs-QN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:08:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg5Da-0005Em-Ug
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605874125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5WIWTtZoPuy/7kyX53vKCsuoFZ39lxzaMUTRn0K73M=;
 b=GQbfb4ECR7TTbHQ0OItu5HJ4Z/5Baih/lMuD5BVJTCu8QhuIRWZ9mWSq6NyHzIQb5iLjXd
 y9zZCnh68as8bNEo96ie7ziufE6urSXOpN8u06blDd6n/HLSX0SyJ0K/eq6l85cDwqfaU3
 QvdLjYny9T1HZ9c5HinDozVFI4gRrso=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-Dn8UxOR9OAe6sUZ-Z0JwHg-1; Fri, 20 Nov 2020 07:08:43 -0500
X-MC-Unique: Dn8UxOR9OAe6sUZ-Z0JwHg-1
Received: by mail-ed1-f72.google.com with SMTP id s7so3624924eds.17
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 04:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5WIWTtZoPuy/7kyX53vKCsuoFZ39lxzaMUTRn0K73M=;
 b=ucSAzyJAjPV3mnGmswM8MF8Vea0ve+3i6W8qZPaa4Hz2swExar7blPN/CMUbV8+TyY
 23rATTEygLpPjufyQr2CihoMlXEq0uiwOTybJMhYxTq3fUWnk1fxZyY5xFPNNuulUnoL
 ZYc5bS4UHot7xqRsqgg9DJCRi4Vd1XIEAR7M9OAS0vvLO7sjUML2y8wbw6jrKaAS516q
 MsQbhcYiZG/524EjikH3N1AJGwrKpjm15iZETTHEH4THcTnA0AOnyEPYAG1WoroHqqd0
 NA7bBIf56UrcNhJcLarSGESjMUGUHnHISgup9Pbnd7ykV9dL/5A6N9ParxMw68IpRJMa
 IAjA==
X-Gm-Message-State: AOAM533JRzbO9MVnymrS5JnAiqfotn1KTzCQM8Xv5EfXiTu5SgRHAvoZ
 +RXL8OkI1/KbQdTwv1P1sSL0ms1NZsMwOVezgzHgPQOtJf7o2gKzdhTFzBdGHoRt3TwlIO0OMPa
 pkmKgza7JnBuDFGE=
X-Received: by 2002:aa7:da81:: with SMTP id q1mr34987809eds.14.1605874122330; 
 Fri, 20 Nov 2020 04:08:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIyqA/gJvB8eISjkoKepzZTO9g1Exoqrt5xCxx53dqKE+lsL2OX03RYSx460bQjlWP0RsXjA==
X-Received: by 2002:aa7:da81:: with SMTP id q1mr34987792eds.14.1605874122136; 
 Fri, 20 Nov 2020 04:08:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gn41sm308780ejc.32.2020.11.20.04.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 04:08:41 -0800 (PST)
Subject: Re: [PATCH for-5.2] microvm: fix kconfig for non-default devices
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20201120085524.108200-1-pbonzini@redhat.com>
 <20201120093830.zgm6fn63xnvr7fxx@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cda9f7eb-c2a8-5f87-8bb0-9e256094bfea@redhat.com>
Date: Fri, 20 Nov 2020 13:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120093830.zgm6fn63xnvr7fxx@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 10:38, Gerd Hoffmann wrote:
> On Fri, Nov 20, 2020 at 09:55:24AM +0100, Paolo Bonzini wrote:
>> PCIe and USB support can be disabled on the command line, and therefore
>> should not be included if QEMU is configured --without-default-devices.
> 
> I don't think this will work.  I expect linking will fail due to
> xhci_sysbus_build_aml and acpi_dsdt_add_gpex being not available.

Hmm, you're right.  On the other hand that also means that you're 
missing a depends on ACPI for USB_XHCI_SYSBUS.  What about moving those 
two directly to hw/acpi/aml-build.c?

Paolo


