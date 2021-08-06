Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A846B3E2DE2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:44:47 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC21e-0000dZ-PR
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC20p-0008Mk-Cl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC20n-000764-UM
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628264633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdNmrY+KHp3d4wpPgid5KINzkPzxMqkZFYnNufMmaAE=;
 b=Deg5h4c3HGRQknJcBHTVKm9Cvsk5YluZ+FLYpVKL69C5L3/rjFDSzQ+ueGqyb3xcOQsUm8
 EBki/r3wA1j9IvkxkiOiyPP3FYJ8PQA6JL10iUQTINdOlveiS+BgR9N5Z/3t0nQmkibAsO
 RP1KYtabqjLjzwSLhq4ROXd6+wHwscs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-z8A9azv1MauXtAY0bfxOcw-1; Fri, 06 Aug 2021 11:43:52 -0400
X-MC-Unique: z8A9azv1MauXtAY0bfxOcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j204-20020a1c23d50000b029024e75a15714so2554681wmj.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 08:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdNmrY+KHp3d4wpPgid5KINzkPzxMqkZFYnNufMmaAE=;
 b=Nc0CF9lEngrsJWVz7fii2QN3PF9cf62kALrmNMbpNLvaZl2gMM/eThfbDOSY1bCt89
 Lic1+pNQD6fKGQV2CLSuxYQT8Qtfa2IAGHUQp9pA8ozvgjw74RUL7MnsihfxP+BSzpGT
 3atm4RPDis4sm71NySxVtfxmVlvJ9DoiafB5Zv4Z9HbryOJBy6a0dT6F1TbnL/2mjta0
 rwR6IU73aXMIqvE9qVrTzc9aTj3U75j8GOg4JJkFJkxEklozmundPnd3KEXpSEdd9+c+
 1k2k6mMG4urX41rqARBGdBZF0WD+5f29AjRqrXNpac6ugW2Bv5sInx6v4iaV7izq9uK8
 OQ1w==
X-Gm-Message-State: AOAM530e9f+cw52vE09FRhxJcTjoE12JLAatfrMoIbHgNjdt/DKkALl6
 lF8Hnc/e4XwwTSkbe/pwf6oxMOP8xTAswprGl/hDaClwWbG4DMpUUydy4spSBFRkEjre3MCysJx
 dZDx7+mXYFahx4js=
X-Received: by 2002:adf:ed51:: with SMTP id u17mr11303049wro.416.1628264630964; 
 Fri, 06 Aug 2021 08:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAELipVTIo4fvlxbEMqcDGUgHUMH1XbJ4pX7tHSknC8irRq1sU7xtQ/imhtLUuQ7hjvzgjbg==
X-Received: by 2002:adf:ed51:: with SMTP id u17mr11303038wro.416.1628264630824; 
 Fri, 06 Aug 2021 08:43:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a191sm8581040wme.15.2021.08.06.08.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:43:50 -0700 (PDT)
Subject: Re: [PATCH 1/6] docs/about/removed-features: Document removed CLI
 options from QEMU v2.12
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210806151012.103108-1-thuth@redhat.com>
 <20210806151012.103108-2-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a2d9e8a-942f-c749-6646-f5386be2845c@redhat.com>
Date: Fri, 6 Aug 2021 17:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806151012.103108-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/21 17:10, Thomas Huth wrote:
> +
> +``-no-kvm-pit`` (removed in 2.12)
> +'''''''''''''''''''''''''''''''''
> +
> +There is no replacement, since this was just a dummy option that has been
> +ignored.

The same effect (plus also disabling the KVM IOAPIC) can be obtained 
with "-M kernel_irqchip=split".

> It still can be requested explicitly using
> +``-global kvm-pit.lost_tick_policy=discard``.

The right one is "delay" (it's wrong in the wiki), while discard 
corresponded to -no-kvm-pitreinjection

Paolo


