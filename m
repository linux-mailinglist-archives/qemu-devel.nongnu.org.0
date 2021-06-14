Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8FE3A5F36
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:37:19 +0200 (CEST)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsj1y-0007J6-N6
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsj1C-0006dD-7k
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:36:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsj18-00039K-PI
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:36:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l2so13815341wrw.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9P7vuQUYeVtaeyYm0f96pmElzkl472ee/Zm8sH8S97k=;
 b=CAjMp0Gnxr6Ub/S51e22PWjTRi7iwdmNeADswebhf33FKPuLo2UNj+3kyWU78dYIAF
 ejJf+OO0YuWdlCN8JYGJ7pi5JJVotwpo/ewpowYYtBziBqtXcJSYXBi2Nf9xtCBRkSjc
 NZ5p+AC9uKuKqdPnwB2APSrr1/3qfaeFOrmss+u0VYLorFHbPH8KGeZONQxvXv7IP81n
 ZEaxOQUUH5vnON4IqRCEQEy/s4Uys/LmirjMQnNnDgpJ0tOvwWg1rDJjcOcycWfj+x2M
 qzmFP5xV8Fm8ZqIl3PYiCDuWpVYgZqO/LXc0UsKR1TL/7Eymi8JVOvYfZxYAghF61Re9
 sHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9P7vuQUYeVtaeyYm0f96pmElzkl472ee/Zm8sH8S97k=;
 b=P5b+nNe8J4BTlRZ+Tq/n1x+2108mRZAQl9pPMOmWLBsJJ1fH6Qv/hL48FC9pk7kdGH
 qeEhlxgkTtV37YG8F8QRUkzcw2dP17xvUa3/UPFr0aEN6KbxwoD3WXVKCYPwnWmaQI+7
 J0/jxBVrBu0KuS8x7nGJ+IgB+p6x5+yQ6/dlwhtPM2+zmlcsQej3yUWM2qj4z32fnU2O
 3W0zQmiBk0mp6X/98TQHIdU7pFNalzuzLuyrOzCUKqrNmhUQ+4hv5TKQzx0SZygM1THI
 evxhmVI7KVJHX04jmMTAkjVIigiqvNrgQsUQoEVFN919ke2ekgwwBGDx/K4qDKG3ckAk
 6+WA==
X-Gm-Message-State: AOAM532jMd82+HlVwdDC3kazwssTz8g6zLroqrCYiW5a9KMpzns95adJ
 X3o7H7l1AE4fHmiQtysCBDJJTQ==
X-Google-Smtp-Source: ABdhPJzjMaNgnywoirzQr+pWRgtVcZnddiDIEtrWi/4kHi0Lu9a0Izu4U/ICupttOoCSI7LkvM/rqw==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr17595904wrw.158.1623663384542; 
 Mon, 14 Jun 2021 02:36:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m6sm18800304wrw.9.2021.06.14.02.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 02:36:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0E1A1FF7E;
 Mon, 14 Jun 2021 10:36:22 +0100 (BST)
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
 <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
 <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 00/34] tcg patch queue
Date: Mon, 14 Jun 2021 10:35:59 +0100
In-reply-to: <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org>
Message-ID: <87o8c8kctl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/13/21 10:10 AM, Peter Maydell wrote:
>> Also on x86-64 host, this failure in check-tcg:
>> make[2]: Leaving directory
>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/=
hppa-linux-user'
>> make[2]: Entering directory
>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/=
hppa-linux-user'
>> timeout --foreground 60
>> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-hppa
>>   signals >  signals.out
>> timeout: the monitored command dumped core
>> Illegal instruction
>> ../Makefile.target:156: recipe for target 'run-signals' failed
>> make[2]: *** [run-signals] Error 132
>> make[2]: Leaving directory
>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/=
hppa-linux-user'
>> /home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:102:
>> recipe for target 'run-guest-tests' failed
>> but I think this is a pre-existing intermittent.
>
> Interesting.  I've never seen this one before.
> Do you recall if this is only intermittent with -static?

It's about a 1% failure rate for static builds only - I have yet to
catch and keep a core dump.

--=20
Alex Benn=C3=A9e

