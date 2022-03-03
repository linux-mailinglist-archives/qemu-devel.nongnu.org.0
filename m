Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6E4CC350
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:58:17 +0100 (CET)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPomO-0005Ro-5m
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPokQ-0003pS-IX
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:56:20 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=38660
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPokL-0002j7-Du
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:56:12 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id u3so11489458ybh.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htFJKZz7CQkcj59ILy4ODBABd2qfwGydyOiYLaDiqC4=;
 b=gaLo8WifYZUB8YgXUn4uxjK+BHw0C0YK587ejrXxSD/14C5oxyP37tO9LS+mVL65bK
 5pbP+tnw+C6CmNrtbfN1qv6rdGgvzRTYbQ+w9OqIn4VA1U17g3ivo3CaYicMPPG85gxh
 YgnwIzvLve+VAhWefErm+FH4EMNdW6dHsaXfwGTLoSlHJMx/RJqtk/oFMVLOYsSr9nRm
 2iVuMPMzIPpJyfA6rsjyZ6Ane00LjfbR016QyFfyNMJvYX/nQGyDUeMdnnkYTItqDQov
 r5VD9NsSPPRAFlqgolU+Re0N/xtAmuV2cg8PALMNpJRrs37lvxDAxLwRhimmQx8TEui/
 J4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htFJKZz7CQkcj59ILy4ODBABd2qfwGydyOiYLaDiqC4=;
 b=QkBgGpRKzyUG1pBTnVJia145rTNkEhL73aI9U2qQXZnXZr/cxC+4wShyCnCe7tqVid
 US29xeOPzaaM4zSgA2PfP+i+80O1csGifVzfQEGFgSpFNK+Bvio+T8VF47VyeyYYSIkU
 pbxXeKJr/VXXtnxITXn8ogr7tUtsMFHyOt7mldfGJFyZZsNXBSrssOBPCaJIF/gnyF2/
 R0NFPmjzWxl9RfEBTPBiw5UGYQIT3ByYUnh/ZQH7AL2hDeAxaTJWSGTotxMDAFSt3noc
 TkIxL8VxdZv2qvwuxOSWTr81xev1GxcPwpwbzegPx19olgYohjpIU/eKG8jMkJIiv6Ox
 ErpQ==
X-Gm-Message-State: AOAM5332q5DOu+RPBdxEZW9BstOGtvZdctPLqPj5lPBrWRXlZxlo+uqN
 AE6EESzlLQ6/OEI9Kqs1P8wPxuBeH3F8oPB89MfndQ==
X-Google-Smtp-Source: ABdhPJwQajJLwgSnvBZxwXTQc8jx5kavkgOyvE4YSav9mGUxaIUsnm5//a/C3ondky7C43xonxVepxoh1fV/7IsGyLo=
X-Received: by 2002:a25:dad5:0:b0:628:7b94:c196 with SMTP id
 n204-20020a25dad5000000b006287b94c196mr13174504ybf.85.1646326567845; Thu, 03
 Mar 2022 08:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
 <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
 <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
 <91cc02c4-8ea5-23e7-7384-6c6b2c8e12b5@linaro.org>
In-Reply-To: <91cc02c4-8ea5-23e7-7384-6c6b2c8e12b5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 16:55:56 +0000
Message-ID: <CAFEAcA9mO0rEuhj4rxerDF7qiePjWo0tUs5PBUF-zqgxqsdm3A@mail.gmail.com>
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/27/22 02:54, Peter Maydell wrote:
> >>> +    if (size) {
> >>> +        ptr = _aligned_malloc(size, alignment);
> >>> +    } else {
> >>> +        ptr = NULL;
> >>> +    }
> >>
> >> Oh, should we set errno to something here?
> >> Otherwise a random value will be used by qemu_memalign.
> >
> > Yeah, I guess so, though the errno to use isn't obvious. Maybe EINVAL?
> >
> > The alternative would be to try to audit all the callsites to
> > confirm they don't ever try to allocate 0 bytes and then have
> > the assert for both Windows and POSIX versions...
>
> Alternately, force size == 1, so that we always get a non-NULL value that can be freed.
> That's a change on the POSIX side as well, of course.

Yes, I had a look at what actual malloc() implementations tend
to do, and the answer seems to be that forcing size to 1 gives
less weird behaviour for the application. So here that would be

   if (size == 0) {
       size++;
   }
   ptr = _aligned_malloc(size, alignment);

We don't need to do anything on the POSIX side (unless we want to
enforce consistency of handling the size==0 case).

I'd quite like to get this series in before softfreeze (though mostly
just for my personal convenience so it's not hanging around as a
loose end I have to come back to after we reopen for 7.1). Does anybody
object if I squash in that change and put this in a pullrequest,
or would you prefer to see a v2 series first?

thanks
-- PMM

