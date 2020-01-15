Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D313413C921
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:21:16 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlPv-0005b4-P5
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1irl8X-0007na-Om
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:03:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1irl8T-0001gr-PE
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:03:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43168
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1irl8T-0001gG-LQ
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579104192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjujLP1EwkH4zTinRmrZw1YnvyONNQsKUi8ls54BbMg=;
 b=YJVynrSI2rB1C/zUof/vrKw/pNA318eaPdz/5ieg4Rtj9vPDsh3SKetNZ31kUFPMkDIwCJ
 WfB/VIuRXQfcVa3u9giI5esNActOngGN9VHQYLesyzyRz3VhKtDpi2pK9X5Ucm/78OyC3L
 rmw91grKLDepIPeTwsXJaBoIFPe3rnI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-oVpERqGZNq2ZtiBanpJg7w-1; Wed, 15 Jan 2020 11:03:11 -0500
Received: by mail-wm1-f69.google.com with SMTP id w205so114300wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 08:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjujLP1EwkH4zTinRmrZw1YnvyONNQsKUi8ls54BbMg=;
 b=bSt8fRgPoAvCkS90WrBM9MygNwN6sbHgcsHBP8Gj1sGsPgfVRnytfA81TCPWx2Pc6h
 Ry70QLREIkGp2FSQNAPt3iKJRUE8APoEvXx72wx+A61hgOgaX/Vzkau2ibu+/EvdhwMk
 SMFU2YJjsQz+xHn6jdLME5z0Ld5UKlGlj8yb8/dgKiW88nyJWkjZKKpKcIzoCAcxmRcn
 JDgRLaUEltx1im9xTdEM13ithY3sGAMjqV1vcT0mQFjnJGrSIb+zmdQXzUQ71npA92XN
 zxXJVppZhrA2P9o+lmn1RMvQUeuEAFph0sQVfN3vdo5aXcVdGkmV3MDJHuVa9fUtgtm9
 kN1w==
X-Gm-Message-State: APjAAAX8YYBSB+VSTgm4PLJUitAyDOecpN4B8QfQSo9yc4Gac5c6oTbT
 SzMqIqbZJ1aeuILdk08XpI+pIOTp28FS9z0QRZo3QlbZlUn4fPk0hHci3P8IiLs579nu4tG4CFc
 ALY8sfLfb867EPDw=
X-Received: by 2002:adf:f382:: with SMTP id m2mr32176347wro.163.1579104190592; 
 Wed, 15 Jan 2020 08:03:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxabJcHX865CzUfNWy+QT11v7I6YEOsqiZ4sdr2YRIRiLrlGT5h4aGQBYdySGqC/7lcqSBStw==
X-Received: by 2002:adf:f382:: with SMTP id m2mr32176320wro.163.1579104190322; 
 Wed, 15 Jan 2020 08:03:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:436:e17d:1fd9:d92a?
 ([2001:b07:6468:f312:436:e17d:1fd9:d92a])
 by smtp.gmail.com with ESMTPSA id q3sm261977wmc.47.2020.01.15.08.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 08:03:09 -0800 (PST)
Subject: Re: [PATCH v2 80/86] hostmem: introduce "prealloc-threads" property
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-81-git-send-email-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <128a6dc6-4dcd-0d60-2112-d495426b184d@redhat.com>
Date: Wed, 15 Jan 2020 17:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-81-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: oVpERqGZNq2ZtiBanpJg7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/20 16:07, Igor Mammedov wrote:
> +        static GlobalProperty p[] = {
> +            {"memory-backend", "prealloc-threads", NULL},
> +        };
> +
> +        p[0].value = g_strdup_printf("%d", current_machine->smp.cpus);
> +        compat_props_add(machine_class->compat_props, p, G_N_ELEMENTS(p));
> +    }
> +

object_register_sugar_prop might be slightly cleaner.

Paolo


