Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD13BE9DD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:37:49 +0200 (CEST)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18gO-0006Gf-9r
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m18fd-0005cO-EE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m18fb-0003ol-OK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625668618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOXz3aTn1Hzzi69zH0J0JkCOlDPcqXuF9+msMhyPlbw=;
 b=fCS4GH73mv2ocg9z1pyr0+Jiv8uEr3hQ9TH8hoMRA6dNT+5BaV0pYOKCs9pYi7vkeUySB6
 NIxQpbq+hlsxx8gJ0KDSQUpTopHLk67ijFiG1M0s9GOLwLhIhHaS5fyETctlnEpGhZ0UH6
 9tGuKdcuPKZ6mU8Z2womCEzdSuR5Bus=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bl2IjCMrOhq1dZRdv5bulA-1; Wed, 07 Jul 2021 10:36:56 -0400
X-MC-Unique: bl2IjCMrOhq1dZRdv5bulA-1
Received: by mail-ej1-f72.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so641493ejz.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 07:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOXz3aTn1Hzzi69zH0J0JkCOlDPcqXuF9+msMhyPlbw=;
 b=BV2YJQHvTrHkSyl9/z5l38GIdYldnyIhqVp49sSITct8pMQYvyxufobP3K3HM5M8+F
 ZJr9j0FDWX8NVQ0MCYNsvPtNNfk2x+dtSsRe5l444XjnuWjhJdh3RSfbnOpl99SUObuQ
 g48en2UQYyVCtNAW+5AgdV/BO9sxaCNm6z08zv7R5mUct3iJiObNmTVMEH721IYUdb6r
 gyrxKLZmlLeIYPYHMHHkBT18Ju7hI3rn4YdGmAn5+CM9y/KGCYSgIuzA/4Ttbu4bFbSc
 8RBP/M5OzAm22Fyfs2ASCtuDL3eYQbbg6T0I/Ewn6VzAhp982PTWqUIiYxRCI7tdeW12
 g/iA==
X-Gm-Message-State: AOAM5327C3sLkSku7QlBMJCp0EXTnF0lRfeBLzadmbGEHLL0QkQFolKs
 dSt8FwAjpN31Xte4QFTLvY0Qm/H2HvksyO/UbkP3+Eecq5FKxrjxRkPEg+CVs11yBw30zVyvC8z
 k81YZ08ph4rRoNUiFSw6rCx2/YomMzYweXlZf2fxGC+1uU0ujPnCwpVWXqlti575pYFw=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr29943842eds.217.1625668614848; 
 Wed, 07 Jul 2021 07:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHFNmwJetQ2OxJM6xJQWsWH6WobI2gY4Vk9oyCNfxv3IfinbYuhXriRFm/lluSPNLG8zy8Iw==
X-Received: by 2002:a50:ef02:: with SMTP id m2mr29943810eds.217.1625668614570; 
 Wed, 07 Jul 2021 07:36:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bq1sm7090062ejb.66.2021.07.07.07.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:36:53 -0700 (PDT)
Subject: Re: pipe2 & configure script
To: Thomas Huth <thuth@redhat.com>, Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
 <75613b21-f747-46d0-3120-88b18c41a293@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2a765707-7b7a-daab-d563-0a93320fa633@redhat.com>
Date: Wed, 7 Jul 2021 16:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <75613b21-f747-46d0-3120-88b18c41a293@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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

On 07/07/21 06:42, Thomas Huth wrote:
>> What conditions are required for "#define CONFIG_PIPE2" to be set in 
>> build/config-host.h? It prevents building for Haiku as pipe2() doesn't 
>> exist. I didn't see anything in the configure script regarding pipe2. 
>> I also updated my code to the latest in the repository and this issue 
>> just popped up.
> 
> CONFIG_PIPE2 is set from meson.build instead of the configure script. 
> But why is this blocking your build? The only relevant spot is in 
> util/oslib-posix.c and there is a fallback to the normal pipe() function 
> there...

I suspect the compilation is succeeding with a warning, but linking is 
not successful.  The correct fix is anyway to use a linker test, because 
a compiler test would not detect a broken system header/library combo, 
where the prototype is defined but the function is not included.

Paolo


