Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E646E22B2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:55:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnI1F-00032d-0d; Fri, 14 Apr 2023 07:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnI1A-00032O-GK
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnI17-0005B0-OK
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681473300;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GgyPBdIrghH4TFoHaMLSS4BvsxG9bz5uInwBmEXF8gg=;
 b=A8k9VVOjXRvH/KpsO2S1U9N52B+H00m9R8TONt2dsJ4AyDNb63Jc/KahWeslSnrdH+YFd5
 Ex8GFhl7t1Coc3uvi8WZMvklMxegp7uXF0dUcESaEr/rtHR8YQUW3vYM3cXBYXmSYhKj5R
 RymaLbMDJAN8vlKdES5h7DP6uxeHhzY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-M03rrD4XNOGaesZbN_O6Yw-1; Fri, 14 Apr 2023 07:54:59 -0400
X-MC-Unique: M03rrD4XNOGaesZbN_O6Yw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j18-20020adfa552000000b002f7ab124e2eso155230wrb.13
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681473298; x=1684065298;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GgyPBdIrghH4TFoHaMLSS4BvsxG9bz5uInwBmEXF8gg=;
 b=G+Acdj2YIQvfYIfO7Ti/Ush9EI7MY6tLnK+vbl8kBwMQqSzDRAX3NO1yJPeOivC2Al
 prJT2uuXQho0sNKSx+sOzTMBT5Zut3oJfU+aSL0lPAWSqmQ+usQutslHIcfMXHAKTDqg
 cskrLBUMcpm5kUxOAKvgfu6ljcKthzJt+DMl32XksSF0Yf/rkOCKwoxm96hLRFpzfFGL
 4X8XwhVvXu+/klLmhVN3BYUxZRRE7qU93lGsdNw4TEBbM8Yhp3d9hdg1I+eCiw8N+X2z
 Q+wha8GK24BaV9EgFpAf/oDQJY9gBooiPKqCZLAg8j1MHErH7i/kE8T78k6/nDlqbY7u
 758g==
X-Gm-Message-State: AAQBX9cxLoQwHcCLADdiXV4pW8w5SHzHkVfOgaH/UiErx0GttVe0MLGb
 5b1YyUJd/etIz5PtswEyB58RX9ID7KseKQGYGQE5AAVPs3ud30rBpLrKTBzbGPfC9a2m9+hLZN4
 Hyts9BaolOCVxJbY=
X-Received: by 2002:a5d:6148:0:b0:2e4:eebe:aee3 with SMTP id
 y8-20020a5d6148000000b002e4eebeaee3mr4240094wrt.60.1681473298080; 
 Fri, 14 Apr 2023 04:54:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdAkSoFIQ6YJrnbL5ATFreXBnnqoRjKJA4IhqfKuQQr3Wri3TIB9XfJti3wabh5ctbuwUAaQ==
X-Received: by 2002:a5d:6148:0:b0:2e4:eebe:aee3 with SMTP id
 y8-20020a5d6148000000b002e4eebeaee3mr4240083wrt.60.1681473297755; 
 Fri, 14 Apr 2023 04:54:57 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d6a89000000b002cf1c435afcsm3422579wru.11.2023.04.14.04.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:54:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] migration: mark mixed functions that can suspend
In-Reply-To: <20230406102808.243438-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 6 Apr 2023 12:28:08 +0200")
References: <20230406102808.243438-1-pbonzini@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 14 Apr 2023 13:54:55 +0200
Message-ID: <874jpifzlc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Paolo Bonzini <pbonzini@redhat.com> wrote:
> There should be no paths from a coroutine_fn to aio_poll, however in
> practice coroutine_mixed_fn will call aio_poll in the !qemu_in_coroutine()
> path.  By marking mixed functions, we can track accurately the call paths
> that execute entirely in coroutine context, and find more missing
> coroutine_fn markers.  This results in more accurate checks that
> coroutine code does not end up blocking.
>
> If the marking were extended transitively to all functions that call
> these ones, static analysis could be done much more efficiently.
> However, this is a start and makes it possible to use vrc's path-based
> searches to find potential bugs where coroutine_fns call blocking functions.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/migration/qemu-file-types.h |  4 ++--
>  migration/qemu-file.c               | 14 +++++++-------
>  migration/qemu-file.h               |  6 +++---
>  3 files changed, 12 insertions(+), 12 deletions(-)

Hi Paolo

I think you are still missing some qemu_get_* functions.

Or puting as a question, why this functions don't need the mark?


qemu_get_ubyte()
qemu_get_be16()
qemu_get_be32()
qemu_get_be64()

And the same for the functions that end with an 's.

And to add insult to injury (I know, I know), some functions are marked
in .c but not in the .h

qemu_get_byte() cames to mind.

From my point of view, every function that is qemu_get_* or qemu_peek_*
in either of the three files should get the annotation.

Or what I am missing here?

Later, Juan.


