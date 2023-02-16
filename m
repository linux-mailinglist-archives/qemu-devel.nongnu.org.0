Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF45699671
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSekm-0002As-H1; Thu, 16 Feb 2023 08:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSekk-0002Ac-Ao
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSekh-0007bA-VS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676555807;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAY9A4DgDYTs34l5F4SNL1vgPiLPs32KphqeD6tWbMs=;
 b=MMbSjKz8quNSwiwF5dIk7yZRucOpvGi3o/+m7kt22fZBv0HskAj0m2e0H3WNENrSYkrRED
 lEUaRiDnC8yuqohTh1gmFat/XArOJ0lDSphk0Kp20iIQmq32Vx10G+FHZk2VpeghGSJaM/
 B9dKJu5DNlVbO4E0X1v50Thj+G8khc0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-IW8_oaXnPhaFVt5iuZ4l9w-1; Thu, 16 Feb 2023 08:56:46 -0500
X-MC-Unique: IW8_oaXnPhaFVt5iuZ4l9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 n18-20020adfc612000000b002c3d80ab568so251251wrg.18
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yAY9A4DgDYTs34l5F4SNL1vgPiLPs32KphqeD6tWbMs=;
 b=swbemTy5LL9fBP6ySvP8MVRiil7x0B65rdQNP1bqItnm1ZKWWJDgPrk6jjAySmRx9s
 r4X0RXjg4Eui22+3F2GaumlqFunyhI4DbfPzN4c+SZ+lKb0Y74KTWoKXLAdNoBON8Z2b
 IxfYVfvNSR7ftxs/mJnzpruvoRZTUNxzObA2fnUWHuESyewhWpSNJ/k/qfURe5vx1qIN
 BSxQJNRxkvZPtgRq1jhF8/0J+1YIOFFr/Lfl1cvTtNBVQQh1PlYwMeRTkjKISjhLs8c0
 LxxJ4K2xNcAfviogSK8B7DpwfeMDdTnR8TIIulHASz69Fk0ydskgVrwYw83oTN1kyK57
 mlkw==
X-Gm-Message-State: AO0yUKUKeMf4cYsltavDklYlOjRzMtmhvE4AQG35e3KQdXRLHEZXXA0n
 cLAM+/4dAzHPwUYNCCLHRifSZ+P75abJlGiUB31ez3gF9rEGcnEJ6CeIayRaq1JtaPppdohg8pQ
 TjONavGEo2XUyg6A=
X-Received: by 2002:adf:d1c1:0:b0:2c3:be89:7c2a with SMTP id
 b1-20020adfd1c1000000b002c3be897c2amr2008365wrd.13.1676555804826; 
 Thu, 16 Feb 2023 05:56:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/UHB8LhBNMXatokxc3iGpvsyF0+wMJFk3Dy2w1kDt1q6H6J++YHovfDvwaPmRyJa35CX0Pug==
X-Received: by 2002:adf:d1c1:0:b0:2c3:be89:7c2a with SMTP id
 b1-20020adfd1c1000000b002c3be897c2amr2008337wrd.13.1676555804517; 
 Thu, 16 Feb 2023 05:56:44 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b002c567881dbcsm1579374wrt.48.2023.02.16.05.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:56:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mark Burton <mburton@qti.qualcomm.com>,
 Bill Mills <bill.mills@linaro.org>,  Marco Liebel
 <mliebel@qti.qualcomm.com>,  Alexandre Iooss <erdnaxe@crans.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Emilio Cota <cota@braap.org>, kvm-devel
 <kvm@vger.kernel.org>, "Wei W. Wang" <wei.w.wang@intel.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Future of icount discussion for next KVM call?
In-Reply-To: <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
 ("Alex =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 16 Feb 2023 10:23:58
 +0000")
References: <87bklt9alc.fsf@linaro.org>
 <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 14:56:43 +0100
Message-ID: <875yc1k92c.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> (replying all because qemu-devel rejected my email again)

Just to see what we are having now:

- single qemu binary moved to next slot (moved to next week?)
  Phillipe proposal
- TDX migration: we have the slides, but no code
  So I guess we can move it to the following slot, when we have a chance
  to look at the code, Wei?
- Markus asked to have only one topic per call
  (and it is reasonable)
- the future of icount cames with documentation to read before the call.

So I think we can do the icount call this week, and discuss here on list
if we move to a weekly call on the same slot.

What do you think?

Later, Juan.


