Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC96F02B6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:41:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prxBD-0002WY-UH; Thu, 27 Apr 2023 04:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxBB-0002WL-TL
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxB4-0003yl-Oc
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682584833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ptzfbgb3K9u39sazBrHzFWcnSjhJ6hSDZKTgZQWOY2Y=;
 b=BRjDD4I/N0JWqsMC8WIa9PCqtVn86mjLP3xStv0YsATU2ayqs1YREc+5u4BoU1hgLKpTeD
 1I7wq4Byn0Eagke1XINA0EuJpdqaTUWNKaGQOAyeN6Kg+GabQvZFfsGeOu40g63I3C7fSk
 TWUE3p58O4sCB4h3XIhJThOdW7e53xc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-K17j9nbVPbiPeETx_HkF1g-1; Thu, 27 Apr 2023 04:40:31 -0400
X-MC-Unique: K17j9nbVPbiPeETx_HkF1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1912ed0daso26651155e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682584830; x=1685176830;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptzfbgb3K9u39sazBrHzFWcnSjhJ6hSDZKTgZQWOY2Y=;
 b=cNXG2NsnxvSJ5+7iGrdlcWrynIbe2GVcrJfmZXuoxCYFA6wynrEbS9Lk1MW8OvojvW
 l3xKMZ2Nw6wg4DGBIrbk5nL92jSd1db0Emgt6SnuuJ1jX+GzsAfHaPwtmS+IVxIXBNhp
 k+/RL3KSvchhbQeq565IFcHHVgjykjJzEBj7QaGT0ihun0d0B5aC4IIy2n5XMFVu0sZX
 tEJ/j7E+EmSVuzrGJFSCR2vDKG4zue4LcU4g/DgWbZ67H8N4XmoIRA4WQOEBvJTMRX8v
 Uf50+y+sKTgp3xdYOwzWnvVVZI/r0qaPGABDsbpubPBrcIxrzz6wa5JJxmZKL+fMeEV8
 8OKQ==
X-Gm-Message-State: AC+VfDzsvlKwmEw6Fqs+b3HV699AT7c0AMyqinVjEmt6TAR78vForx4C
 O4EOu6fhKx1eJyIijin5BQ/I24wO3eHzTXWQhpEBcGwnr02WDVgP4Q3mkHVqyQK7tXMCXipISOQ
 qFzK39Wf7OH0AeTU=
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id
 j22-20020a5d4536000000b002f94fe974demr677492wra.16.1682584830607; 
 Thu, 27 Apr 2023 01:40:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57UZ5KwflJVyayQAkq7CpXbYnBAqv9gjtj2k1CpEL/kFKe2cdcj1Gx0w9r6kOFnT3Unm3kAw==
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id
 j22-20020a5d4536000000b002f94fe974demr677473wra.16.1682584830287; 
 Thu, 27 Apr 2023 01:40:30 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s1-20020adff801000000b00300aee6c9cesm17928200wrp.20.2023.04.27.01.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 01:40:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 2/2] migration: Make dirty_bytes_last_sync atomic
In-Reply-To: <e50334ea-9ae6-13d1-ac41-035f07ce7980@redhat.com> (Paolo
 Bonzini's message of "Thu, 27 Apr 2023 10:19:28 +0200")
References: <20230426201002.15414-1-quintela@redhat.com>
 <20230426201002.15414-3-quintela@redhat.com>
 <e50334ea-9ae6-13d1-ac41-035f07ce7980@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 10:40:28 +0200
Message-ID: <87o7n9d8g3.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
> On 4/26/23 22:10, Juan Quintela wrote:
>> Don't use __nocheck() functions.
>
> Doesn't this break on 32-bit platforms?
>
> #if defined(__x86_64__) || defined(__sparc__) || defined(__mips64)
> # define ATOMIC_REG_SIZE  8
> #else
> # define ATOMIC_REG_SIZE  sizeof(void *)
> #endif
>
> #define qatomic_set(ptr, i)  do {                      \
>     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
>     qatomic_set__nocheck(ptr, i);                      \
> } while(0)
>
> So if sizeof(void*) == 4 it would trigger a compile-time assertion.
>
> Paolo

Yeap.

Really I was waiting for stat64_set() that you have just sent, will do
it on top of that.

And yes, I already broke the build with that patch.

Later, Juan.


