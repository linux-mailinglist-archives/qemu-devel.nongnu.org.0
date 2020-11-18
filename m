Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C52B8404
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:46:56 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSTn-0001kX-0X
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfRzf-0004dY-Ie
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfRzc-0001ge-UP
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cov0/NdG3cKC7SI2GfAlhVOAan+N9XneJ/4ZOEy9llQ=;
 b=Ffo0P+OHJca2OYxNnQ26tX/9KzC1cnKA9W8AcPd2k47TVoOtHisuEbOsXOBaQTH/xYIuZt
 0L5U6N62XdgaN1B75FnwFjY5o6uzKPPjrYtzuT8hn8XQ0XRaXuF6pmlm1WqUINXjFubtcA
 J9GzSzuG2R2xC1BuFHx0rDwjUtTKqzM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-LphMlGDHNmyh-VByluVKEg-1; Wed, 18 Nov 2020 13:15:41 -0500
X-MC-Unique: LphMlGDHNmyh-VByluVKEg-1
Received: by mail-wm1-f72.google.com with SMTP id a134so1147548wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cov0/NdG3cKC7SI2GfAlhVOAan+N9XneJ/4ZOEy9llQ=;
 b=qLGgG2P+QGhrVujYx46BHFRFABzCSCANVNwgAanyJuj//cBvu76VLm4QQdPicZaO3F
 Atn5bkMCqATEHv9qFPeEWxz9CJqEflc4Git+SgO3cpIVzhYSQr5sZ3uUv319cEgygQzD
 gW8OmmAlpquELL11DTzitU31g4nKDotsEZVDQ/I0Z9DsFB7FaNUIlERkFojtJfxLlozH
 pGEadnGrasC9JwT6tOV0pS8UndPtvEB09AIzwBdsb9MDAp73H7zN1po4sShHKXdhpZs2
 ESqJsRf8IRIr0lr+OwtagEYFbPNJgwiWMap7gLG3/d2GfqlsQ3b4j8M7zKt60glxN5dx
 xQDw==
X-Gm-Message-State: AOAM5336rc1emzxAFZjm6caKlXL1XZgO9yBE8DBUtrNmpPnWYSUmN6hg
 /3RfN5Nef84nXKcBB8IIup4q6PYD45iSlBnVaahfamd+HQxdUy9PAk1aNNr3pocM2sxUoPCKNyT
 gEBHsppzJb+Lw8MY=
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr351686wmg.155.1605723337209;
 Wed, 18 Nov 2020 10:15:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxkIXJHTz7soeWi32kGIwscuIHBT0yYIiiBezjIM3LRjMe0fGUvMB7xNLE/Fri1bduzxuHSg==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr351669wmg.155.1605723336970;
 Wed, 18 Nov 2020 10:15:36 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q7sm38560552wrg.95.2020.11.18.10.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:15:36 -0800 (PST)
Subject: Re: [PATCH 2/6] configure / meson: Move check for pty.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef0be417-b4fe-1e37-6336-9c00006721bb@redhat.com>
Date: Wed, 18 Nov 2020 19:15:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:10 PM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 9 ---------
>  meson.build | 1 +
>  2 files changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


