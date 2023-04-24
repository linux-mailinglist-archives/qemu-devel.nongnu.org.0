Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C96EC99F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:59:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsxL-0003Y1-Rq; Mon, 24 Apr 2023 05:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqsxH-0003Xa-Lo
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqsxF-00045k-MO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682330272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HNn/AE88k4lqHROzaBzztmGz4cjkpF+StVZyPt0UkbE=;
 b=BkAr2yAxlwsiKfFYpgXzVj49uRn4Of9QdT4lnpcfG/IKGkbhk2vmLAPwpEtq8pb2TzPNck
 31eCQEAcUwa+JDi3kWvWmrjUSHJAo4FgcebwOFMA4dW1FibZVTjuht7S4yhquMG4TzR3/4
 pm+5atjcUlpZosegvyANQ0chofHWHZs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-eJEJn7N8OX2qCdUyLgm2SA-1; Mon, 24 Apr 2023 05:57:50 -0400
X-MC-Unique: eJEJn7N8OX2qCdUyLgm2SA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e32aso1496014f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682330269; x=1684922269;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNn/AE88k4lqHROzaBzztmGz4cjkpF+StVZyPt0UkbE=;
 b=ljXcMiSyA3/LoP38eYQCFBDlmKcMEyR2iuS3jDNv5lT8AJPrbKovX+ewM6MFIxZMiE
 nAzNzJ5bckqcaV1e0u7/SHXgIMtpOsjNQqKQHzrkcStrwVZk/NOF9l+6WBs6/PJHn5cZ
 TmtyRtUy7P6GsAGgvhBiYAcAPXz6ABJy/f/9odZbAnzI2M0uqvYkubsn9fmARa6chtUF
 YmHSw4RMDxAcNDsaKIB0ZabrsaDDlGdKJoNsvpj/HG6wwAG3uYHxZVHIGeqBjH+gMM5o
 jFPZwllNIvML68FZOw+bDUe63kYMTBpWauRX8Xfirdot9H0cwE410PYw8LMYIibye0VY
 9oNQ==
X-Gm-Message-State: AAQBX9fF17NWna8/fkYySohwsWHIx2GNyIjKYgqN82UbHoFpaGVmejfn
 23HpBTdY+fU21g4tyEkwYx0GudTn/yI9/uDDAz9sbQhNIutl5A2cLueBvdEaaERLh9Kt880fuh+
 jjjbvY9i+R7k5tGA=
X-Received: by 2002:adf:e507:0:b0:2f5:7ce1:781d with SMTP id
 j7-20020adfe507000000b002f57ce1781dmr10129318wrm.50.1682330269617; 
 Mon, 24 Apr 2023 02:57:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350YFgO4m6KhlhMOI/0G0GnoqydyZuweb8oY44/ZVRtDPyNwcwEFIjMEX1E8FxHQ1ZS2yldaEeg==
X-Received: by 2002:adf:e507:0:b0:2f5:7ce1:781d with SMTP id
 j7-20020adfe507000000b002f57ce1781dmr10129306wrm.50.1682330269334; 
 Mon, 24 Apr 2023 02:57:49 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 y11-20020adfe6cb000000b002f81b4227cesm10478710wrm.19.2023.04.24.02.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:57:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/20] Migration 20230420 patches
In-Reply-To: <87pm7vdj93.fsf@secure.mitica> (Juan Quintela's message of "Sun, 
 23 Apr 2023 11:45:44 +0200")
References: <20230420131751.28534-1-quintela@redhat.com>
 <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
 <87y1mke0hb.fsf@secure.mitica>
 <cf72042a-ecb2-bdb6-d4a4-3b45ab9b3cd8@linaro.org>
 <87pm7vdj93.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 24 Apr 2023 11:57:47 +0200
Message-ID: <87leihtxes.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
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

Juan Quintela <quintela@redhat.com> wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
>> On 4/22/23 10:21, Juan Quintela wrote:
>>> Richard Henderson <richard.henderson@linaro.org> wrote:
>>>> On 4/20/23 14:17, Juan Quintela wrote:

>> I'll note that mips32 and armv6 (that is, *not* debian's armv7 based
>> armhf distro) are the only hosts we have that don't have an atomic
>> 8-byte operation.
>
> This is the kind of trouble that I don'k now what to do.  I am pretty
> sure that nobody is goigng to migrate a host that has so much RAM than
> needs a 64bit counter in that two architectures (or any 32 architectures
> for what is worth).
>
> A couple of minutes after sending the 1st email, I considederd sending
> another one saying "my toolchain lies better than yours".
>
> I moved the atomic operations that do the buildcheck and run make again:
>
> $ rm -f qemu-system-mips*
> $ time make
>
> [....]
>
> [2/5] Linking target qemu-system-mipsel
> [3/5] Linking target qemu-system-mips
> [4/5] Linking target qemu-system-mips64el
> [5/5] Linking target qemu-system-mips64
>
> So clearly my toolchain is lying O:-)

And here I am.
Wearing a brow paper bag on my head for week.

These are emulatores for mips.  Not cross-compiled to run on MIPS.

/me hides on the hills in shame.

Later, Juan.


