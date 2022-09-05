Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F15ADAE5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:35:07 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJkI-0005iE-J1
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJha-0002mt-U2
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:32:27 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJhZ-0005qB-8Q
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:32:18 -0400
Received: by mail-ua1-f43.google.com with SMTP id r17so3685164uat.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e0gQO4WVrYxUzWWwRHZLjbwqah5msHjJ2/p0BQ8eWig=;
 b=fNsVm2aQf7R1YhYKRSOwcpFW6HsBSDUyk+UcRHmh+AC8SYsZB/H5fwAWkXS/2hhulr
 2LWC9DDiD6RfXc3R0VmfQdSqwNdOMyP03+WLlYkfB2FOoJYS7S00fiCWS6ZucNNGhZD7
 Upr8ucWBhvT3EqNzLoXiZVqlEBJ8BSHo/IC+q9SxNMsHnOJpNhk4LNvhb1gkTMBQRXNu
 nSqfUBQDay568eFpQvwAXiSpm5Bn++D6eItS8PtxpZgR5tReqF5Ff6E6S2Wm9eQ3e5mE
 pEJXhKlY95j1GC8sEAmtx0UGs/IAZ0hQW+GYTGm78Y2gMV5+GtaqZcluk/LaxuHSx9cu
 PRew==
X-Gm-Message-State: ACgBeo1l3m90ltD/JGQ+Oz/4CKnHfG/dQOiakbmXpUPCYb4tRTiCzo4N
 9xvnh9/MieQkmoFRf6J3/LUIJjDHjM46uVmI+hE=
X-Google-Smtp-Source: AA6agR5lh5GGZWcItOFnMXq4tuQTYMvSkkQokaM0geQE/gfrgByHAHjsmnk0gI67dnJ2Zf4bazagICkeFkWQPHRnmMk=
X-Received: by 2002:ab0:36e7:0:b0:3ae:ad51:ab3 with SMTP id
 x7-20020ab036e7000000b003aead510ab3mr1938508uau.70.1662413533776; Mon, 05 Sep
 2022 14:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220905123910.46703-1-pbonzini@redhat.com>
In-Reply-To: <20220905123910.46703-1-pbonzini@redhat.com>
Date: Mon, 5 Sep 2022 23:32:02 +0200
Message-ID: <CAAdtpL5SoakRBooFcF3SSVz-CQ4g6098d7PwSUxRrxYYD+6+ng@mail.gmail.com>
Subject: Re: [PATCH v2] kvm: fix memory leak on failure to read stats
 descriptors
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.43;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f43.google.com
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

On Mon, Sep 5, 2022 at 3:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Reported by Coverity as CID 1490142.  Since the size is constant and the
> lifetime is the same as the StatsDescriptors struct, embed the struct
> directly instead of using a separate allocation.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

