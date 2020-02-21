Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFA1678E6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 09:59:21 +0100 (CET)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j549Y-0003LZ-Pv
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 03:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j548p-0002u6-IL
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:58:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j548o-0005pm-ET
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:58:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38150
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j548o-0005od-A7
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582275513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbEGghv9Fkh2xUqbLjrfACBCBEh4FPFIgZ6NiRZ4yMg=;
 b=RTGg2jUmhOZcBNn9Y3BiHfRAU08QdwLpIDmg1h+j1k+O4dU1MNLQn+lG77yJH+5RZzOdPC
 PzpxQfouyWTirSH7hGVYYDWlb7l+gRi1Nwp6G9EgtzoXxdCyWiY/YG3USBvOtYgrvZmxJ5
 hlkulYd3TrkeJ6yRGcbBFk5gjYBjkVM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Ktvx9bJxOQe96JNvMvu-4A-1; Fri, 21 Feb 2020 03:58:32 -0500
Received: by mail-wr1-f69.google.com with SMTP id z15so742303wrw.0
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 00:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DbEGghv9Fkh2xUqbLjrfACBCBEh4FPFIgZ6NiRZ4yMg=;
 b=APTEOYMJOQhCcSPLYDSZn5psZHLP+9Ylwc7bmQz90O7D8fj+1siP9bPPRZ2qCH2WLM
 eBs2FpMhb5UOdzxGKs23swGkdpUPBHvWPSWigt3GiXziK1JO0GWGky3ZHdYSL1cQ/3bb
 AqlyCSL76B4BELD9rCe1qlgpT4WuO5gAD2m4MJEFS4kFqhk5JLWOaq3pBgZccbR9x/2a
 mWRVq9nX1oOfvu324OXbN6Macvu6EWGRnlOZzQG7RAY5w2rU4/FOg5Goz2ygWNsj8th7
 iyRWKDa1Tk320It/Wu3hXjsekLOVgL6amtbZApCQd704WjfrI5ytxdmkPsxYSuas8BeA
 /XpA==
X-Gm-Message-State: APjAAAW9GdMEnmAL4fWaHauh9beIJ7hao98ZwgobH/Fmfnc2wWHJudBY
 0HTLkbg0QmGFQrVdEYJVlWnOCINaoGoGl5CXE5L9Jy9SGjsT3DtfQJoWlnV2Xv/wh9diY8B56FU
 jOZMfNcDYOgB5rss=
X-Received: by 2002:adf:e68d:: with SMTP id r13mr46864597wrm.349.1582275511095; 
 Fri, 21 Feb 2020 00:58:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMboISk3QqnD9hEGtiILLhqITLNvm9kYfaFASA9hWIp7BZDvR2gPbdYtzkP0ayaZD+pm84LA==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr46864566wrm.349.1582275510802; 
 Fri, 21 Feb 2020 00:58:30 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id d16sm3295705wrg.27.2020.02.21.00.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 00:58:30 -0800 (PST)
Subject: Re: [PATCH] target: i386: Check float overflow about register stack
To: chengang@emindsoft.com.cn
References: <20200221034547.5215-1-chengang@emindsoft.com.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a5533719-7ef1-938b-e52c-20711e65417f@redhat.com>
Date: Fri, 21 Feb 2020 09:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200221034547.5215-1-chengang@emindsoft.com.cn>
Content-Language: en-US
X-MC-Unique: Ktvx9bJxOQe96JNvMvu-4A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, Chen Gang <gang.chen.5i5j@gmail.com>,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/20 04:45, chengang@emindsoft.com.cn wrote:
>  static inline void fpush(CPUX86State *env)
>  {
> -    env->fpstt = (env->fpstt - 1) & 7;
> -    env->fptags[env->fpstt] = 0; /* validate stack entry */
> +    set_fpstt(env, env->fpstt - 1, false, true);

On overflow fpstt is ~0, so this does:

    env->foverflow = true;
    env->fpstt = 7;
    env->fptags[7] = 0;      /* validate stack entry */

Is this correct?  You are going to set ST0 so the register should not be
marked empty.

>  static inline void fpop(CPUX86State *env)
>  {
> -    env->fptags[env->fpstt] = 1; /* invalidate stack entry */
> -    env->fpstt = (env->fpstt + 1) & 7;
> +    set_fpstt(env, env->fpstt + 1, true, true);

While here:

    env->foverflow = true;
    env->fptags[7] = 1;
    env->fpstt = 0;

>  void helper_fdecstp(CPUX86State *env)
>  {
> -    env->fpstt = (env->fpstt - 1) & 7;
> +    set_fpstt(env, env->fpstt - 1, false, false);

This is clearing env->foverflow.  But after 8 consecutive fdecstp or
fincstp the result of FXAM should not change.

>      env->fpus &= ~0x4700;
>  }
>  
>  void helper_fincstp(CPUX86State *env)
>  {
> -    env->fpstt = (env->fpstt + 1) & 7;
> +    set_fpstt(env, env->fpstt + 1, true, false);

Same here.

The actual bug is hinted in helper_fxam_ST0:

    /* XXX: test fptags too */

I think the correct fix should be something like

diff --git a/target/i386/fpu_helper.c b/target/i386/fpu_helper.c
index 99f28f267f..792a128a6d 100644
--- a/target/i386/fpu_helper.c
+++ b/target/i386/fpu_helper.c
@@ -991,7 +991,11 @@ void helper_fxam_ST0(CPUX86State *env)
         env->fpus |= 0x200; /* C1 <-- 1 */
     }

-    /* XXX: test fptags too */
+    if (env->fptags[env->fpstt]) {
+        env->fpus |= 0x4100; /* Empty */
+        return;
+    }
+
     expdif = EXPD(temp);
     if (expdif == MAXEXPD) {
         if (MANTD(temp) == 0x8000000000000000ULL) {

Paolo


