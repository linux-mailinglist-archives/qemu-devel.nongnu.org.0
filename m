Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8A30E38E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:50:45 +0100 (CET)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OAm-000209-7A
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7Nhs-0005bL-1s; Wed, 03 Feb 2021 14:20:52 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7Nhq-00014L-4R; Wed, 03 Feb 2021 14:20:51 -0500
Received: by mail-ot1-f51.google.com with SMTP id y11so996066otq.1;
 Wed, 03 Feb 2021 11:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YrGgGWWweZkEz7oDY1Wcj2Z6pQgRXUiEDcvYXKMtsUU=;
 b=iPD5zEkvgxzrxORmiUpzdR1Ren/NyJ8CaZz4o4olmR1nxMBmcRyZQaH6gU4nDpg2+v
 7/qAVIxfuhnr4ScaE2XoYplVbp5G4z+lHbtJIjB3dAiqfs3KaIx2TRJEUPUZUgSsrjgH
 N1TAXyf7Fwo8V2qDWS8ICwqSZne+LAAXhnZOclqEf5RBTw62b7KOUGRIvGeK03YYSf63
 wyd/oS3qtbQH5BJZy2eMNq3yocAm5r5dbaefNVA+17YNO1ZxqRqpxlqypBmdi/yusfe7
 ICtgadtw4g7kkm3H+VYgzptFQI82YrSi0l8u/RS4UFEsU7Aq1aPl3MNr2/ofywxj6HnZ
 idgg==
X-Gm-Message-State: AOAM533lay8ogA0IhEj9twGSgaVdy9hS3gJ0gWSy1JsgCEHwZ6NL9Y/t
 pm8GrbOhOVzNxHobVk9xYdP4ojAdabCS/3Nt8BY=
X-Google-Smtp-Source: ABdhPJwvKYj5n2c4rrF+eH1No5W4eVZW74seyMjtiYN1xJ69m5x8vh23uprQeUN3HF/hD6o+O05e3ScG9KkIf3DIsMk=
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr3139135otf.37.1612380047163; 
 Wed, 03 Feb 2021 11:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-4-richard.henderson@linaro.org>
 <fd583fe4-46c5-a9dc-dd3f-c38504e2e498@amsat.org>
 <f51c9b7a-c9b5-29b6-9f88-b6d774be5da9@linaro.org>
In-Reply-To: <f51c9b7a-c9b5-29b6-9f88-b6d774be5da9@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 3 Feb 2021 20:20:36 +0100
Message-ID: <CAAdtpL4=ndPPrfV61ZKMcH9SL2qEjZa-WTLGFYC-ewz_0p9EMg@mail.gmail.com>
Subject: Re: [PATCH v5 03/31] exec: Use uintptr_t for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 8:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 2/3/21 9:08 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2/3/21 7:59 PM, Richard Henderson wrote:
> >> This is more descriptive than 'unsigned long'.
> >> No functional change, since these match on all linux+bsd hosts.
> >>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  include/exec/cpu-all.h | 2 +-
> >>  bsd-user/main.c        | 4 ++--
> >>  linux-user/elfload.c   | 4 ++--
> >>  linux-user/main.c      | 4 ++--
> >>  4 files changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> >> index c23c77589b..c52180e8e6 100644
> >> --- a/include/exec/cpu-all.h
> >> +++ b/include/exec/cpu-all.h
> >> @@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
> >>  /* On some host systems the guest address space is reserved on the ho=
st.
> >>   * This allows the guest address space to be offset to a convenient l=
ocation.
> >>   */
> >> -extern unsigned long guest_base;
> >> +extern uintptr_t guest_base;
> >>  extern bool have_guest_base;
> >>  extern unsigned long reserved_va;
> >>
> >> diff --git a/bsd-user/main.c b/bsd-user/main.c
> >> index 65163e1396..c09d74d788 100644
> >> --- a/bsd-user/main.c
> >> +++ b/bsd-user/main.c
> >> @@ -41,7 +41,7 @@
> >>
> >>  int singlestep;
> >>  unsigned long mmap_min_addr;
> >> -unsigned long guest_base;
> >> +uintptr_t guest_base;
> >>  bool have_guest_base;
> >>  unsigned long reserved_va;
> >>
> >> @@ -965,7 +965,7 @@ int main(int argc, char **argv)
> >>      g_free(target_environ);
> >>
> >>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> >> -        qemu_log("guest_base  0x%lx\n", guest_base);
> >> +        qemu_log("guest_base  %p\n", (void *)guest_base);
> >
> > Why not use PRIxPTR?
>
> Didn't think of it.  Worth a respin?

No, I was simply curious if it weren't possible for some reason.

> >
> > Otherwise:
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
>

