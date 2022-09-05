Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FC5ADAE4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:34:46 +0200 (CEST)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJjs-0004rI-59
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJgt-0002O2-8b
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:31:40 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:38887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJgm-0005mi-3n
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:31:30 -0400
Received: by mail-vk1-f175.google.com with SMTP id s11so463738vkb.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sMpqXy9ccadFa29SQHFWqr4a8P7bYkzQF15gUHUPBy8=;
 b=P3s3ticnnAZTUnEWNkoLDUuWmYDykR8aD1M4aM82pF5WcbPNpz6XKlprG4N4XR+klh
 OT943Vj2Kwj1mr7CQh4RTfzk89lSUil1lBhABBed5x9aLsFUGl7DNmSy7xA2ObQGVypG
 k0Xs7n3w0DWNTnKL0USz8DVEcaB3iyJOvxyKV+MjBvomNzHqxc5X4aKC+hVegRuwLnED
 hDXXm9prA7kEBmmHsJVaIxeI9T8BVuvCsc9Bdxh3CL0iLfq7Zl7Ji+EBMM3JcQvNWgzh
 ypw5t809L9NjqvNkqwu2wT6apvzaKZlFRmlrVm2FZgrxiOLt0XRaUzxRPumaxztIMEGL
 lgcw==
X-Gm-Message-State: ACgBeo3WPbl9D12XxMmjQdO8u0sSZK06Eg9339Toqsl7EhHWdJUV1DnA
 WlyJAm+wmI/1NIVBlutK7aokAVBhIlIL4pB5z8Q=
X-Google-Smtp-Source: AA6agR5EQyMynO7rebLqQwq72mjM+rf1u07LHntap6WuIWdK19f5J1Teq/bkEStdS+rRYdGq9pVsXMM1XnVIbnb92oE=
X-Received: by 2002:a1f:9c52:0:b0:389:404d:44bc with SMTP id
 f79-20020a1f9c52000000b00389404d44bcmr14919264vke.23.1662413485637; Mon, 05
 Sep 2022 14:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220905204349.102405-1-pbonzini@redhat.com>
In-Reply-To: <20220905204349.102405-1-pbonzini@redhat.com>
Date: Mon, 5 Sep 2022 23:31:14 +0200
Message-ID: <CAAdtpL4rM8Z-USyPf=oQaVko5wcOjQtASOihWO5QoCtdpL75Qw@mail.gmail.com>
Subject: Re: [PATCH v2] smbios: sanitize type from external type before
 checking have_fields_bitmap
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, Sep 5, 2022 at 10:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> test_bit uses header->type as an offset; if the file incorrectly specifie=
s a
> type greater than 127, smbios_entry_add will read and write garbage.
>
> To fix this, just pass the smbios data through, assuming the user knows w=
hat
> to do.  Reported by Coverity as CID 1487255.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/smbios/smbios.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

