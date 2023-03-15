Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C486BBE46
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 21:58:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcYBx-0001W9-S0; Wed, 15 Mar 2023 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcYBv-0001SN-2e
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcYBt-00024Q-En
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678913864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Su35NByslQ7vkyq8AYJmNhwF8Dawa03AgWtziG6uyVo=;
 b=hL3Bzk0nOiexvbWyS5iltY2r8ixyBf+5pSdP0abrpMIBOe94D33YIe1sBvW4l8OBdsZ9iJ
 iINjyyU+LZ260w9x0IcelNv8vjvON3B/VDl3BkSWS+Nce+knk6Ped5XP9GLvuijnBat+qR
 uzVSrPQjrn00rbNZ72YXmSRFlcqFmd8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-32lqcqUbONqc5HyleNfdHw-1; Wed, 15 Mar 2023 16:57:43 -0400
X-MC-Unique: 32lqcqUbONqc5HyleNfdHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bd26-20020a05600c1f1a00b003ed23f09060so1205027wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 13:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678913861;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Su35NByslQ7vkyq8AYJmNhwF8Dawa03AgWtziG6uyVo=;
 b=Ep5ijMnCXnCkGQhZG7Z3mzIgcXbO31LIPdCvZf8b8ZzzoOOKj3B3kZKST3R5rTHy2W
 GbrY+b2E7YLHe8LTpT1jnuwiKPkGBXRs/B8/5KcHK2epxRNKJyVHERXOeAXCLaTvOgpe
 RHXuQN2mNB7ibu/ceml9iPCwfY4PRhXqeSkXHCFwWnpzUj68H/wQFxxoslOyxzHfEiTp
 wgGUpHxdRVB5NjuFEdZSCGnkd8Qse83xSYw6/YVi5RPXlOplWZSa57zmlnTm5XtVV88v
 KZ+hLKeeKii9HlaMa+M4oL3pD2tGL4a1lY9s+qgXxLTff30FidVszBNdw3s8bJo7ipzY
 hFGQ==
X-Gm-Message-State: AO0yUKUdAh/qRohiLlytBDT3ZT7aFp4olTmxVSDabwsSB8DIxVNsesgh
 Amlzexb1+ZhQAyOqxBPZxLjjCKqZisIQTK3QvOF/oqDWnKhIn5S2MzEn3UzXMQLjpGDCiev2NKg
 MCLbr41HSYtYptxE=
X-Received: by 2002:a05:600c:470e:b0:3eb:29fe:734a with SMTP id
 v14-20020a05600c470e00b003eb29fe734amr19253221wmo.39.1678913861693; 
 Wed, 15 Mar 2023 13:57:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set8/iOZwpgaY7VV5NavLetCjB4c1CGtkF7kIg8eoZxX1ociaUKGDtP/D5laPdGPzLfr9Ok/9Ag==
X-Received: by 2002:a05:600c:470e:b0:3eb:29fe:734a with SMTP id
 v14-20020a05600c470e00b003eb29fe734amr19253208wmo.39.1678913861340; 
 Wed, 15 Mar 2023 13:57:41 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b002d1daafea30sm222364wrr.34.2023.03.15.13.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 13:57:40 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: <qemu-devel@nongnu.org>,  <bcain@quicinc.com>,  <dgilbert@redhat.com>,
 <ling1.xu@intel.com>,  <zhou.zhao@intel.com>,  <jun.i.jin@intel.com>
Subject: Re: [PATCH RESEND v2 2/2] migration/xbzrle: fix out-of-bounds write
 with axv512
In-Reply-To: <08a655a31d3161e76c4fceaf43e8960e751cdf87.1678733663.git.quic_mathbern@quicinc.com>
 (Matheus Tavares Bernardino's message of "Mon, 13 Mar 2023 15:58:20
 -0300")
References: <cover.1678733663.git.quic_mathbern@quicinc.com>
 <08a655a31d3161e76c4fceaf43e8960e751cdf87.1678733663.git.quic_mathbern@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Mar 2023 21:57:40 +0100
Message-ID: <87pm99n35n.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Matheus Tavares Bernardino <quic_mathbern@quicinc.com> wrote:
> xbzrle_encode_buffer_avx512() checks for overflows too scarcely in its
> outer loop, causing out-of-bounds writes:
>
> $ ../configure --target-list=aarch64-softmmu --enable-sanitizers --enable-avx512bw
> $ make tests/unit/test-xbzrle && ./tests/unit/test-xbzrle
>
> ==5518==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x62100000b100 at pc 0x561109a7714d bp 0x7ffed712a440 sp 0x7ffed712a430
> WRITE of size 1 at 0x62100000b100 thread T0
>     #0 0x561109a7714c in uleb128_encode_small ../util/cutils.c:831
>     #1 0x561109b67f6a in xbzrle_encode_buffer_avx512 ../migration/xbzrle.c:275
>     #2 0x5611099a7428 in test_encode_decode_overflow ../tests/unit/test-xbzrle.c:153
>     #3 0x7fb2fb65a58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
>     #4 0x7fb2fb65a333  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a333)
>     #5 0x7fb2fb65aa79 in g_test_run_suite (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa79)
>     #6 0x7fb2fb65aa94 in g_test_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa94)
>     #7 0x5611099a3a23 in main ../tests/unit/test-xbzrle.c:218
>     #8 0x7fb2fa78c082 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x24082)
>     #9 0x5611099a608d in _start (/qemu/build/tests/unit/test-xbzrle+0x28408d)
>
> 0x62100000b100 is located 0 bytes to the right of 4096-byte region [0x62100000a100,0x62100000b100)
> allocated by thread T0 here:
>     #0 0x7fb2fb823a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
>     #1 0x7fb2fb637ef0 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
>
> Fix that by performing the overflow check in the inner loop, instead.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

As David said, we can still improve the code.

thanks, Juan.


