Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB666FC428
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKqB-0000pI-Hn; Tue, 09 May 2023 06:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKq8-0000ox-Hl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKq6-00076w-TJ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683629102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WDAaDuf/8aWPg1fBoMeNcR/iVsJlTgcSMn6vSzxiMG4=;
 b=J1D25ACN9hA68Rj/5Yu6ShJNh2abzAo1VSXjw2kHuKQS26W2sG2fvZOqZwSaqYLIg+z+0u
 By5tys8xYweMNc+w8S22oBXssL+kYfBb+q86t9VX8CQAGP3XKLHwNDr13Sbt3kZ+JaWzIS
 JVmfaG6KecVa+NMduHU4NvBNQLUVRgc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-Z01KjYC5MR-t59tIqE98Yw-1; Tue, 09 May 2023 06:45:00 -0400
X-MC-Unique: Z01KjYC5MR-t59tIqE98Yw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f423d47945so8910605e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629099; x=1686221099;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDAaDuf/8aWPg1fBoMeNcR/iVsJlTgcSMn6vSzxiMG4=;
 b=YLiUi10u/cu+KMwEa7++oGachTBh5vPyHyUPuG5KLz1qMb59aUg/UsiyytCsTdqetA
 uu5ppTTYai3bQ8reb7gTqFHT1BDOwNZWNUiVl07PwAQ1+A9I9EYuyLWzQ8/7ciFQzLD4
 EykM94u2MYFBIxVSoAFEhaOYGFfe2ZvNfirBOFk+EnePsz/TMpf10tGP43scogMEEnD2
 o5a8rYNDhT99EAAU3E85uPdpBIQ9b41qv0ehu9qwaXrG8KzgtX5pvwRO+mcWzCl9Tmhd
 BN40WbEtT97A8iwXwd2gtlJ/cXhYkFqTruFYyBE+4ACejiXG6sH0fZcgAeUObC9NiOqo
 weXA==
X-Gm-Message-State: AC+VfDwIPebaZvNRklSGFO+26/pXj88kC7/51Ltd0T6hRzbgaCFVeewu
 Iaspe9DBHFua/5Q3PTwckgpvD+IPIsjGWvrql8jSFWYNS83zNcYSueIqWtmMbHDxURT4B8YCrzU
 1e+ku0jaxTlEOyls=
X-Received: by 2002:a7b:ca4c:0:b0:3f4:2819:7777 with SMTP id
 m12-20020a7bca4c000000b003f428197777mr3107993wml.38.1683629099785; 
 Tue, 09 May 2023 03:44:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4IwkT6IJWWM30uNWXKviQAltGD9VX1dAMRUZ6VBgKuROfzJRBcHjJbJ8vi5C6oMU066xi5Wg==
X-Received: by 2002:a7b:ca4c:0:b0:3f4:2819:7777 with SMTP id
 m12-20020a7bca4c000000b003f428197777mr3107980wml.38.1683629099467; 
 Tue, 09 May 2023 03:44:59 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b00306415ac69asm13969651wrw.15.2023.05.09.03.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 03:44:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 2/6] ram: Let colo_flush_ram_cache take the bitmap_mutex
In-Reply-To: <35cb23ba854151d38a31e3a5c8a1020e4283cb4a.1683572883.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Mon, 8 May 2023 21:10:55 +0200")
References: <cover.1683572883.git.lukasstraub2@web.de>
 <35cb23ba854151d38a31e3a5c8a1020e4283cb4a.1683572883.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 12:44:58 +0200
Message-ID: <87ttwleqc5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> This is not required, colo_flush_ram_cache does not run concurrently
> with the multifd threads since the cache is only flushed after
> everything has been received. But it makes me more comfortable.
>
> This will be used in the next commits to add colo support to multifd.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


