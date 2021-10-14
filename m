Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3D42D634
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:37:15 +0200 (CEST)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxAj-0000o3-VA
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1max7n-0006cu-9v
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1max7k-0006I6-5n
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634204042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dQloR2WT9SJw/FJS/sFYYP5BQQOwwWA6gECcS+bM8Y=;
 b=SX2992rPv3c02KX7c7EHI40Ghc+pJd7swfnsQpFUyGGARGxrTjeMsZyhIRGwSEZSY+NFm8
 IX8ubGDScMXw10o3zSpUCmgxVLCIwujCD0weXTHKYrb87rzBH+i3WExaKSs8BO/AAHKkfV
 Be8vpJZpbuELpx58LVx36Gfikv1eA4Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-wAn6HQ36Pm6OAbasw8UFHw-1; Thu, 14 Oct 2021 05:34:01 -0400
X-MC-Unique: wAn6HQ36Pm6OAbasw8UFHw-1
Received: by mail-wr1-f71.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so4101264wrd.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3dQloR2WT9SJw/FJS/sFYYP5BQQOwwWA6gECcS+bM8Y=;
 b=gYJuSJL6+cniiit4PMCl9Zs2umnX6suVL/MGVznbBAQztTsqNgWC8hJajAmdPDNI8d
 R+W5q9M8sr6YgPZziCPrpMdOxB3CFBjU6XFdI5/VaXgWDwF43Vg0vqUvaFHh/6jSIM4u
 uh1R6WbHkvaFmz+un5IgkN2bq66ayVnUD6jFDe7/EGPKW7Gn6obGbTjO25ViWnbjm84V
 DRtbf5QOaP9e76mpWk28Uz8lKizYxUfT/w6gI8rl8EvAH9Z9DTM64GZeUu253OLWc5N0
 hcegJYBK93w9jB5XuipMqCRqh4KewtiYjsHiCBAeHjhqdgIBlP4IT31bgdS4Ra7ar/N1
 3bQA==
X-Gm-Message-State: AOAM530+c8GX14xhJKtySdfJ/vih3a3znLo4IZSQLYBlDXSUYbWoB5gD
 SGV9/QWzHLormgrZjvfw0K1INxOKscIKzcs2w1iGKy3cMyef2qDYkt4/6C1Wxh3Tvv7+OOVWSGD
 Dj9huyJfObhHCMcE=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr5193710wrz.389.1634204040539; 
 Thu, 14 Oct 2021 02:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfnoxzhalPmCkcRxXXyxZZLYpqW/GJQE71O8pSB7X7CKGH8I6TWceO3ly2p+UkSko9MKmlmg==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr5193689wrz.389.1634204040366; 
 Thu, 14 Oct 2021 02:34:00 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 196sm1671367wme.20.2021.10.14.02.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 02:33:59 -0700 (PDT)
Message-ID: <b2f42f5a-7691-39e4-d4bd-9c60a225a31a@redhat.com>
Date: Thu, 14 Oct 2021 11:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 7/9] migration: Simplify alignment and alignment checks
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-8-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211011175346.15499-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 19:53, David Hildenbrand wrote:
> Let's use QEMU_ALIGN_DOWN() and friends to make the code a bit easier to
> read.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/migration.c    | 6 +++---
>  migration/postcopy-ram.c | 9 ++++-----
>  migration/ram.c          | 2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


