Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4934602864
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:33:13 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiyE-00070P-3e
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okimz-00066o-59
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:21:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okimt-0002RS-TK
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:21:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j7so22473526wrr.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LX7Edatotd5l237gismvf9oRHHALtu8Ho/Tg6UePg4I=;
 b=h9QR1/bctaE+NwOPk/h6Vz4+YLmSXeynJcq5CqfHB6cWxtt15+6gebeC63GXVfTUQY
 jpEQgQrAla0RRgRW7pCaMA6uvGAq4sYDY7RG/eo3808MIzf8GsBIz9lGf3irJs9KTsPU
 TGmZPZCsWORxFg88STA0vre/XGzRmY+srZPVRRA0SI0Hq+MVOMfAAneUGfbQb7P2C3F9
 0bESQTFwMdkzrhEKiex2OiwLCCNGJurQgZfy0F7lgOjmufoBw+lhsA8efbcE7tp/QNkl
 PXlQ8aycsFkZbdvvJBDqpfQtlR6q4JyhdBNAiRhZHWDBtV/cpFaA5THznR9xmhpgjRHh
 Ah2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LX7Edatotd5l237gismvf9oRHHALtu8Ho/Tg6UePg4I=;
 b=uPijeZimdDeWVfI/wVKcj2OlWGC0UB6MHje7dEwQiiXDkz+fwWAAEw+VkPREeWGxaf
 +HiFvSGHsJlbywrdClN+saeNBftx+UD3ZggTtc0QUUZjBUXZdQON5gJMT/30Qmncu4D0
 YGuMJsJxPZcVkYG7SyT+tT5/skcVpbNBFzzOgx9rygxoMGaj8A5ohhKZGaW26TIwR9yO
 rBbD6ZVOXCDUgCDtuloRDQ/9UpLZEWxISGl7v2sP7rY1RMpOm3yPiwlRwmhNZjPzxjQn
 +CYqHyEA37OkvwBP2dNskm1AJsoacqLKYGUHwMS0Maec+ZFBLS9doLQzfvPzOs9zm90k
 mU4w==
X-Gm-Message-State: ACrzQf0fdM7LiPsvXByNuYeQZtEhZo75L+L1/yo/FTaWMu00VKACgVAv
 XXdJg45ikbre6XkCwrQXS3RJ6Q==
X-Google-Smtp-Source: AMsMyM5uotw/z0ajTxffef/mBBb8HscmcI5kBr0Dy+f2BrCMl7muQthn5zPr6AnPy5Ws1wSjlZkDIA==
X-Received: by 2002:a5d:64c3:0:b0:22e:57e7:6230 with SMTP id
 f3-20020a5d64c3000000b0022e57e76230mr1246826wri.482.1666084885374; 
 Tue, 18 Oct 2022 02:21:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a5d4250000000b0022e47b57735sm10415043wrr.97.2022.10.18.02.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 02:21:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20B4A1FFB7;
 Tue, 18 Oct 2022 10:21:24 +0100 (BST)
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
 <380c1527-e664-f7c5-6d18-bf53d99aed33@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov
 <alxndr@bu.edu>, Chris Friedt <chrisfriedt@gmail.com>, cfriedt@meta.com,
 qemu-devel@nongnu.org
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Date: Tue, 18 Oct 2022 10:18:49 +0100
In-reply-to: <380c1527-e664-f7c5-6d18-bf53d99aed33@kernel.org>
Message-ID: <87zgdtcwrv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jiri Slaby <jirislaby@kernel.org> writes:

> On 17. 10. 22, 16:13, Peter Maydell wrote:
>>   * for situations where the guest has misprogrammed the device,
>>     log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>>     and continue with whatever the real hardware would do, or
>>     some reasonable choice if the h/w spec is vague
>
> As I wrote in the previous mail, can we stop the machine after the
> print somehow, for example? So that the students have to "cont" in the
> qemu console as an acknowledgment when this happens.

You can bring the system to a halt with vm_stop(RUN_STATE_PAUSED) or
possible RUN_STATE_DEBUG?

I don't know how obnoxious the message should be at this point (i.e.
should it be masked by LOG_GUEST_ERROR) because if the system halts the
user might not notice. However I guess with this device they would be
expecting to check this sort of thing.

>
> thanks,


--=20
Alex Benn=C3=A9e

