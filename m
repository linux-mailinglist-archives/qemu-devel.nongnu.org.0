Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF96EB5FB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 01:56:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq0aa-0001Qd-5J; Fri, 21 Apr 2023 19:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pq0aY-0001QT-Fy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:54:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pq0aW-0000rM-Iu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:54:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5068e99960fso3789718a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682121286; x=1684713286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/P9c+dm6zZc8lr/tHvqFYHBFZPdBZoGnF7gM90G3clo=;
 b=jwoaq2rM7okpr7LcRz8Dh8k1ayTiKouak77uL+LMifTMN1VNJVt2csnsMV1xb+7KU4
 O8RN6jvxlUNKzUnJu9WCd4dI+tYMTi6b3aeyIbbDHLRUIUI2M0jyEuzx3VDUAaGsxohM
 dTmVFuClE4lS1yZAS+bCmMkCJWUS5poG5haZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682121286; x=1684713286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/P9c+dm6zZc8lr/tHvqFYHBFZPdBZoGnF7gM90G3clo=;
 b=PwNUlp8WEs1b+NpvmwpwkDvF1E4qxQ3cBzJEQnX7qWHa4HmTnGPo6kEiRE2kSMdIIw
 D40d/oEkw8JVLRH1mXltLPWoYJGrMF4RD7j9fmpbw96qHR7Q2+6w8lL2ROW+WPyuC0RV
 LyWkBa/bi3aOrW0lJh70bxXbC/0JzylRE2lIrxHyaNzyTWTte8Lh/B0Q2oBolBIeW8+P
 881menPQR9yIA+rGbc6OjnvhJMZny4fJjjAWEMlnm1W2yjXQrGPFBTOBdVCGtpPpRZsD
 4H0vjv7SOkqRftSqGnpPhHMPQjkl+svraGiy7TlXyxRsfXcfbSg6nmQAoKt+K42rJ/WA
 FAHA==
X-Gm-Message-State: AAQBX9c8N6/d1VFXrYPTyvZOIdw04CX6gTUxmlsQT97cGVZGp5gP3Qi2
 LLcd9H1r6iStyPHnWsJrwkZowbrQbwznu8wRUhWWXA==
X-Google-Smtp-Source: AKy350YPwiB146m7rhggvnZypXFhYOWnvPWpNFXJWOvejyQxgPZT2JNLgn608FZfO77llbCZWay+EA==
X-Received: by 2002:a05:6402:1a4e:b0:506:b228:7b03 with SMTP id
 bf14-20020a0564021a4e00b00506b2287b03mr6616392edb.13.1682121286561; 
 Fri, 21 Apr 2023 16:54:46 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa7c709000000b0050499afe96bsm2278938edq.10.2023.04.21.16.54.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:54:44 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-506bf4cbecbso3254141a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:54:44 -0700 (PDT)
X-Received: by 2002:a50:d09b:0:b0:505:47d:29b5 with SMTP id
 v27-20020a50d09b000000b00505047d29b5mr1938486edd.1.1682121283779; Fri, 21 Apr
 2023 16:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <CAJSP0QVrxSgFJFqPd=iBfBoV9brL2v6d6P+4E7BmGYAxwEYPmw@mail.gmail.com>
In-Reply-To: <CAJSP0QVrxSgFJFqPd=iBfBoV9brL2v6d6P+4E7BmGYAxwEYPmw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 21 Apr 2023 16:54:30 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=n8CJ7cL9kS84TMu1+hBrnWUYhaXAw7jhBPEra_EdgwQ@mail.gmail.com>
Message-ID: <CAAfnVB=n8CJ7cL9kS84TMu1+hBrnWUYhaXAw7jhBPEra_EdgwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] gfxstream + rutabaga_gfx: a surprising delight
 or startling epiphany?
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 21, 2023 at 9:02=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > From: Gurchetan Singh <gurchetansingh@google.com>
> >
> > Rationale:
> >
> > - gfxstream [a] is good for the Android Emulator/upstream QEMU
> >   alignment
> > - Wayland passhthrough [b] via the cross-domain context type is good
> >   for Linux on Linux display virtualization
> > - rutabaga_gfx [c] sits on top of gfxstream, cross-domain and even
> >   virglrenderer
> > - This series ports rutabaga_gfx to QEMU
>
> What rutabaga_gfx and gfxstream? Can you explain where they sit in the
> stack and how they build on or complement virtio-gpu and
> virglrenderer?

rutabaga_gfx and gfxstream are both libraries that implement the
virtio-gpu protocol.  There's a document available in the Gitlab issue
to see where they fit in the stack [a].

gfxstream grew out of the Android Emulator's need to virtualize
graphics for app developers.  There's a short history of gfxstream in
patch 10.  It complements virglrenderer in that it's a bit more
cross-platform and targets different use cases -- more detail here
[b].  The ultimate goal is ditch out-of-tree kernel drivers in the
Android Emulator and adopt virtio, and porting gfxstream to QEMU would
speed up that transition.

rutabaga_gfx is a much smaller Rust library that sits on top of
gfxstream and even virglrenderer, but does a few extra things.  It
implements the cross-domain context type, which provides Wayland
passthrough.  This helps virtio-gpu by providing more modern display
virtualization.  For example, Microsoft for WSL2 also uses a similar
technique [c], but I believe it is not virtio-based nor open-source.
With this, we can have the same open-source Wayland passthrough
solution on crosvm, QEMU and even Fuchsia [d].  Also, there might be
an additional small Rust context type for security-sensitive use cases
in the future -- rutabaga_gfx wouldn't compile its gfxstream bindings
(since it's C++ based) in such cases.

Both gfxstream and rutabaga_gfx are a part of the virtio spec [e] now too.

[a] https://gitlab.com/qemu-project/qemu/-/issues/1611
[b] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04271.html
[c] https://www.youtube.com/watch?v=3DEkNBsBx501Q
[d] https://fuchsia-review.googlesource.com/c/fuchsia/+/778764
[e] https://github.com/oasis-tcs/virtio-spec/blob/master/device-types/gpu/d=
escription.tex#L533

>
> Stefan

