Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC83DD5D8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:40:03 +0200 (CEST)
Received: from localhost ([::1]:52976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXEg-00007v-Fv
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXD2-0007tc-Nz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:38:20 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXD1-0000EN-B3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:38:20 -0400
Received: by mail-ed1-x533.google.com with SMTP id x14so24242058edr.12
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ozxeWsR17OhLFblQfs+6foUVtIUT5LLmHNG0DDtG/Pc=;
 b=XnQJa8XmPTsUZCtfcb1pxyLObeYgxaG5gA9aEo2Z/ED9T4OnarYRhyeRIq0kdFzvtA
 KtaSvDI52acs0M/4ylWynhKhtJVPwjzECTjo2W3ZcgNyWQ7ScWpQgfYrOTmVLS78kdNN
 MGkD2pizxGAwXA2LsG7zomRoY36lSZEpihFsQdqT6GKhwI7PlZ3JNqy90eVrjmWZ/6lb
 aCkkH5zBwXqSSzgpIA3Yhu0noT1ylUkA7x0d0unhWPmplAZALm2Rz9C1MTyD9Gokoenk
 wKsZvsE8dw2uAVgoeuAeDUE4ahdqy2xi5hGYZGAbfWu+4IFQk9zW6uc69A3bnrw+Fhe3
 tl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ozxeWsR17OhLFblQfs+6foUVtIUT5LLmHNG0DDtG/Pc=;
 b=TeyOeDpcqyGTUKr13kTS0i/qEfB1v5IyImPDCa+FZBVwlF6I4X2RbmRXK279i/bI2q
 YuTF+v3fEyTZTB4+bfMhMvmxw/pMJy3l2kE+tJyfv7jq9zjbcDRtSO3neuP1s+NpZYIl
 +8fUalOwvPhNP+rm6jFeBzrTzvgVEAym+DO2tplY/vq8UoZ1BPpwsuJb+QwnejLmeaLy
 K0Gw01fUWmsoJM9AhMAkLn/pFe3M4IdYWIEJewVWnUI8ZyYujM5EnKSxUjBGznL7gvOZ
 6m3QHfEN9mqG/iUscAuGxGHTqAmATvo0XQAEGb5U/98O6E/dtCv/TwbixWWANHee9zsN
 LKhQ==
X-Gm-Message-State: AOAM533XTio7sIbaWpYN4nNqIx96Pp+75oDNDx9fEiRqNYHO8VJt71uv
 iq5h454/I6GkOvAtEec47nn88YP+hEnR4uNmcuaag/1PkJM=
X-Google-Smtp-Source: ABdhPJxwXanosu7kC2Itaxohf5bwJjGjI5JZQRuKC/r+PGPUfkGB0jhKz/wpyx21uu39MEC8qCOAayS7wr9wtyKNLUY=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr7768601ede.44.1627907897647; 
 Mon, 02 Aug 2021 05:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-6-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-6-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:37:34 +0100
Message-ID: <CAFEAcA8waPm76z1TXqLtnscLUSJYa6+CE3YyiYb6=i3TTsMo5A@mail.gmail.com>
Subject: Re: [PATCH 5/6] coverity-model: constrain g_malloc/g_malloc0/g_realloc
 as never returning NULL
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> g_malloc/g_malloc0/g_realloc only return NULL if the size is 0; we do not need
> to cover that in the model, and so far have expected __coverity_alloc__
> to model a non-NULL return value.  But that apparently does not work
> anymore, so add some extra conditionals that invoke __coverity_panic__
> for NULL pointers.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I do wish Coverity Scan had a better notification of updates/changes
and feedback path for bugs than "we'll just silently break stuff for
you" :-(

thanks
-- PMM

