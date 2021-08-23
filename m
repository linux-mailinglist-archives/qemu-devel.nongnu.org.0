Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C855F3F478D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:30:35 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6Hq-000426-T9
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI6GH-0003B8-TK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:28:57 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI6GG-0007LA-HC
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:28:57 -0400
Received: by mail-ed1-x529.google.com with SMTP id n12so25195329edx.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZthOerlYBnv9rPbKlJf08abboV9TdbnO2MhbhgQcP/Q=;
 b=DOCriFSbxDOwl4tlpSbol80RKIw2knnozwPyQnDQKxZqFMlvYMEqjUlSy54Uq/DUuc
 dXgDlY8Rdj61f1Z9kFyPFBr+WrGuJBNQXmSJoC1CHfQ47125q8l16SMmEH31FKAb9YKy
 4Q35vbWOvpjkFIJOEsjUZahuq4LUcrmxk7KJNubA9/mxKzxjGzIBHfFOBKsFleJV0Hn7
 n8uiONR78bE+lOuBRRh0KOUFvQxojodjmuaQflvF/1iK8GOds4YcbKqFpdAsBkLkM3JA
 mB2v57KZ8z1oRJ8vXwrmk6BwbHGslVw2oRyMwWsdbkC9gvhNn4CZuhRvxFQZzqu/ZNvN
 chtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZthOerlYBnv9rPbKlJf08abboV9TdbnO2MhbhgQcP/Q=;
 b=lBwNgX4vL4JOKLo6T+PX4Jxh8tkr1kkWKtnOhXyd3HYn/gyBr87JY3ilyh6Ltc4QiR
 etkaeOtFvrP6A58OvFkU6fkpeadI3yd/noPEGiFhzPfDHUjs83l5QnJ3Q2gBF7fhiriT
 xgUicFsEJONNnyesp0BMBYX/+sbm9D1xV+zp6y4eOEsnAf6YZpnVMrmHdrAM/0ST9sZl
 uohbhwP02hwN4FYOlWVyAA+EJJ7uJuIkBgD6O83MAUlJvumrMIzrFAwUXtIj0v/tUerd
 447sN5dE4ZyeNcgGMacvXmkFpAvvI02/hnYOF/PMHWRmNbwTeZIVQSzvMqE+bhZDqc01
 Byng==
X-Gm-Message-State: AOAM533InDzLbFz80s1CipVM5wKqVgBzyJ5xhEC/qKKo9ly6GgmrgxnA
 3xJpuxkTcp7EeR2JHZlG5NN+IP8+UHf9Q960rbAyLw==
X-Google-Smtp-Source: ABdhPJwkYP95XXtl9yaOYyyWjEJiX5yCF9W63kU9psA4LqHy+9+ddYn9dNUWi/Mj+liE+SYbJhsyRgdPWA3iuLIZsTQ=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr35848853edu.100.1629710935054; 
 Mon, 23 Aug 2021 02:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210823085429.597873-1-philmd@redhat.com>
 <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
In-Reply-To: <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 10:28:08 +0100
Message-ID: <CAFEAcA8ok3RL41upiYt3mUeuFc8Nr_HPsQ7h4HvEPM9VH3jmiw@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 10:20, David Hildenbrand <david@redhat.com> wrote:
>
> On 23.08.21 10:54, Philippe Mathieu-Daud=C3=A9 wrote:
> > +static void mtree_print_as(gpointer key, gpointer value, gpointer user=
_data)
> > +{
> > +    MemoryRegion *mr =3D key;
> > +    GSList *as_same_root_mr_list =3D value;
> > +    struct AddressSpaceInfo *asi =3D user_data;
>
> Reverse Christmas tree?

This has never been part of the QEMU style guidelines
and I would oppose our adding it. It would gain us very little,
the codebase doesn't consistently follow that rule today so
it wouldn't be preserving an existing consistency of style,
and it would be yet another weird stylistic issue that trips
people up and requires patch repins.

-- PMM

