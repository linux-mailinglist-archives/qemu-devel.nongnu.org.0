Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FC618538
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdND-0002o2-FH; Thu, 03 Nov 2022 12:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqdN8-0002lT-KG
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:47:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqdN6-0004gA-HS
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:47:18 -0400
Received: by mail-pg1-x532.google.com with SMTP id r18so2141309pgr.12
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OhboURfVf5tHX7A+ER0lG+tCBC8OOtoME5UYu22nOg=;
 b=Tn6QFRFCnqOP07iIsKZlsOplD+WSDXJWoz/wIwDpmsHi45l1RpUlzvOjzdFOAbs3Go
 aL4LaCGvn78twrqNRQWY/Tf+r7TGZXbUl1XKI++n/efcKyYUdB40bBaaS5nP0K1NlI7w
 KeIaR7FTqWX01qdEhWFWHwBPohwxR6qdEw9yPdpAQbNN9TyCB8O9uCddK+4y1l+wFRVu
 i2dSMONGEmnybwacyhgsQfQMJ3UvrBIxCLx9ngSQEmfLqQKH+/91baqoxV/XkcVoISWg
 UFHD+kSY6It0k0B0loZf405xOTn+Ookcj9KJCSumoiu73Fto/YAde1rA0/JbGrlTsbBW
 My6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OhboURfVf5tHX7A+ER0lG+tCBC8OOtoME5UYu22nOg=;
 b=j0KMR5EJrzRwILK0hqcVno1N0JHc7G2sknVRw11O5r6qhU2M9H082+P9XZHKGFHlqk
 AM+ei0IbGlcBLLX9h1bjHu7+kNPWMsqBS4wU6HhrZLm0QPNA8eIfVe5+yCi18pN9mFHu
 e/aYjxOb1RzX7hQzcgoD6/Uz3civaP+oS2uX6xud76kMi97StaRJ3/q68wMxe/3BIjP3
 dk8fafjGGnw10L6nnDgaXD+z6DCy/qaOXqLfUvzhI4mZGt5+sS/uMMP3NJq7Kqi2g38r
 eCUYv3FnVqTOBUCvDtMCgHilDEgqpeoD4xTu0HQB76Qbe5L2EmJgnnsuZeNiP0Uxvs2z
 t9hw==
X-Gm-Message-State: ACrzQf0YBkTiDMU/o3uMF8gq+pDmg0Hbp5VAyTiNYTX14hpsg+wrq4UO
 WIN0x+4uYun4QtozwtsOioJkQjgL9EYTZIdWPajFLg==
X-Google-Smtp-Source: AMsMyM6dwHD/34/EnVJDZU8jxh8NnW/go4uB5NuSOQnLBh5MN2Q1KSh/MIPyaa0g+i22JgpUJdyU6s6w7KDtHL240f0=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr12803977pfk.51.1667494034902; Thu, 03
 Nov 2022 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <Y2Plai60TK1kErl5@redhat.com>
 <CAJSP0QUk4iWY6B7-oxjLtW22OMyAfR-KH7M6QMmQVjvOhwQ+nQ@mail.gmail.com>
 <Y2Pui+kYDyJ1Rgja@redhat.com>
In-Reply-To: <Y2Pui+kYDyJ1Rgja@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 16:47:03 +0000
Message-ID: <CAFEAcA_BEUTWEeTOgeHR9Sy_XOCJ=ckM=ki3c9sSuAMT_emL1w@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 philmd@linaro.org, 
 mst@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 16:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Thu, Nov 03, 2022 at 12:25:49PM -0400, Stefan Hajnoczi wrote:
> > 2. The GitLab output does not contain the full command lines because
> > environment variables are hidden (e.g. $QEMU_CONFIGURE_OPTS).
>
> Note, $QEMU_CONFIGURE_OPTS is set by the container image itself, so
> there's no need to know that one.
>
> $CONFIGURE_ARGS meanwhile is set in the build-XXXXX template and
> easy to find.

Not all that easy if you're looking at some specific gitlab
job output... it would be helpful if the scripts
echoed the exact configure command line before running it,
then you wouldn't need to go ferreting around in the gitlab
config files and hoping you've found the right bit.

-- PMM

