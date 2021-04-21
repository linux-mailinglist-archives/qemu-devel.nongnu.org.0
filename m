Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBBD366B18
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:47:39 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZCGY-0006FD-AO
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC4O-0002XY-0e
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZC4M-0005HA-5m
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619008500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRb3NiXPQeUjeX7Yoa33ZpsJaKl2I10FtCwbbia8Vjw=;
 b=W3GnbnQA4FUvKETLW+TS+k7zAJ5jZX3eF5zN1JhBkUC5o3f0K3pyhAjJaaggTzb075sC+H
 TwgX7mo87FUtJIpSdBzFWAc74JPA7pfMs6k2F8zxquX7dq81XybseezVZztdK0KemGpkXd
 tWzoLk6g5DQB9V3b0zu3DXmTeOfpu28=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-zqDzdqPYOfiTo5D2T77b4A-1; Wed, 21 Apr 2021 08:34:59 -0400
X-MC-Unique: zqDzdqPYOfiTo5D2T77b4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so12607549wro.8
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRb3NiXPQeUjeX7Yoa33ZpsJaKl2I10FtCwbbia8Vjw=;
 b=HqxzRYs2+Swbd9jyeC5MiXLsfFMQLtiRGFKTe8phg1sISqNb6lVa2Fsii8efLc90sZ
 IIUDTRayRyEGB8ylp7tJQFiNKlzBdbalBtJ8bADh7u5djfGtB0rjU2pt/xsO/aUQvLe1
 5aIue1BD5QLYyQ29owhGIKAeBi/bxhPVJJ2l6wWSBD6dq2kbuDbLIj3lMF3Wc4zGeVsl
 /dX4G89+6Q/I6GmQB5VuOpicNrwAggiDBw6lMgbUe2dWZ4IB7eeNILqZrV++wyS8mg8h
 /Znh7PgDfMyk2mW0E4z4Aqhzw8kwh8jICkN/F2MItUr1vT0fA6z1PEUCTXTZYQJV5c9T
 qZsg==
X-Gm-Message-State: AOAM5304Qjmx7+iRLVayZcBw4r2e0AZuMPB5+6zgGIXhrJu6XZSGXu9q
 pwJyWHCRT0a/ju0ZN96e5vvG1mWJomf0KR9AWcyIYeI3kQgGqbQVJubE3hS5Kk68P49TiuqzAXS
 +stIucE5L1YRSNmc=
X-Received: by 2002:a1c:9d90:: with SMTP id g138mr9512395wme.156.1619008498297; 
 Wed, 21 Apr 2021 05:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgMSy4IszT6BDsAxi+Mh8qYwXyyDqXZmvhUIo8z0b4voF7hrlKPzsIk5PT+U500/2i3eGrBg==
X-Received: by 2002:a1c:9d90:: with SMTP id g138mr9512365wme.156.1619008498084; 
 Wed, 21 Apr 2021 05:34:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm2880085wri.41.2021.04.21.05.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:34:57 -0700 (PDT)
Subject: Re: [PATCH v6 06/15] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc() and qemu_ram_alloc_internal()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-7-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95a14673-bbb4-383c-c23b-3a58cf78ae99@redhat.com>
Date: Wed, 21 Apr 2021 14:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421122624.12292-7-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 2:26 PM, David Hildenbrand wrote:
> Let's pass ram_flags to qemu_ram_alloc() and qemu_ram_alloc_internal(),
> preparing for passing additional flags.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/ram_addr.h |  2 +-
>  softmmu/memory.c        |  4 ++--
>  softmmu/physmem.c       | 29 ++++++++++++-----------------
>  3 files changed, 15 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


