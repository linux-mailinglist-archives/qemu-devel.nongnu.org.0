Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94993BE22B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:43:39 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zPO-0007xl-Qd
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zOf-0007It-6g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zOd-0004Zj-JB
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625632970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcBvLUXlJfhYJeAwwKDvWGqHE474mwfgrp8R9HHoLXU=;
 b=AErajzO9YfK/Qp2Jipl/OXCRIxbBv6c6/IwaB6MTPwh9hU3KMkXogTu9c61Qa/spDiP7aJ
 QDJjqE4PW+uhyKpupOZ8LsYj5d9wdEdlj53TSLSRPxCmx+NUhgfZfZt5s59bhRPNMWgDSj
 NHzn6LjXzuiMkXkzqAQ+V+OKmwqnW9c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31--hV_G8ILOpeC3_PQyTUpNQ-1; Wed, 07 Jul 2021 00:42:48 -0400
X-MC-Unique: -hV_G8ILOpeC3_PQyTUpNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so410843wmh.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 21:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zcBvLUXlJfhYJeAwwKDvWGqHE474mwfgrp8R9HHoLXU=;
 b=ele4Yca31L2bjIt51KW2KB03bJfpsZPgAYa9x/2nm+jtq8EbdgvlHI/LMwCnMQ6LJ3
 RpbXfKzQQ5d+8VE3R7zGBK9YtUCy83lJeq1F8DSSRcK09M065pppr2+qMIuKx2l8NRqD
 AtC9goCFR8f4y8+jxKflM0sNxXyFzOUwARTSId9m2w6fhMSNuK0p2alV2u8hcmhCHYjK
 +5XkqbLnOBW2YW6p7wmX28395RLwAHt5935O7uUv+QC3O/lbhHT+J6zZDlFh5cdoHdgk
 6jD3bk2ttrk+G1zz1gcR0t++tqbdF9Wz01R8fXb7u6mjDHX6PyGyikDTdWDM4ECJuZqg
 9Gpw==
X-Gm-Message-State: AOAM533RpDTMMHC2K0IgfMkW9eJyaWAvrwOP0ht4UL8sZe4Ifybww5a/
 OH/6fKMEobzY1ZlXGbPSG4fh4kHckOYf1mLso52i1RFzAfEoAiiKtA9WB/np610YdSYbYUmwJ/k
 cPuJdOa46Qo0W53mf/V594YPa5ril48sbnJ/jEqQaoiNv+7hXcKv45uRRjBBOPVk=
X-Received: by 2002:a7b:ce0d:: with SMTP id m13mr4394636wmc.59.1625632967023; 
 Tue, 06 Jul 2021 21:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxavBVBEtCno4zTcA1zZbZWs0vmsSfTGyJ0asnXuwhzKm2GcScjgk5u+eA8AdCnLmKnfcMgkg==
X-Received: by 2002:a7b:ce0d:: with SMTP id m13mr4394623wmc.59.1625632966788; 
 Tue, 06 Jul 2021 21:42:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id z11sm4578428wru.65.2021.07.06.21.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 21:42:46 -0700 (PDT)
Subject: Re: pipe2 & configure script
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <75613b21-f747-46d0-3120-88b18c41a293@redhat.com>
Date: Wed, 7 Jul 2021 06:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 05.24, Richard Zak wrote:
> What conditions are required for "#define CONFIG_PIPE2" to be set in 
> build/config-host.h? It prevents building for Haiku as pipe2() doesn't 
> exist. I didn't see anything in the configure script regarding pipe2. I also 
> updated my code to the latest in the repository and this issue just popped up.

CONFIG_PIPE2 is set from meson.build instead of the configure script. But 
why is this blocking your build? The only relevant spot is in 
util/oslib-posix.c and there is a fallback to the normal pipe() function 
there...

  Thomas


