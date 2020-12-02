Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267842CC9DE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 23:48:09 +0100 (CET)
Received: from localhost ([::1]:45332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkaut-0007eD-Mb
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 17:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkatK-0006zT-Lr
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 17:46:30 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkatI-0000aD-1J
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 17:46:30 -0500
Received: by mail-yb1-xb43.google.com with SMTP id g15so208007ybq.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTcuUdP5ILEVF8knhAEVcNwSryuaJ5/WbUTgQV6A0DI=;
 b=gtBS9xzY6iNthJT0kSJhF9NoPMo0jNlerUHSBN/EhR+Sdae2LUK1YJMLLd2PnFnvYB
 qG25jnIu119eiwAJNRyQutMpe4pxjN0x9Jl6PNZ3IQ9QrpcqWB54U72CJlTtrZL7PVC9
 fbcPf8f8HrE7xDZPUPS4eBYje4e+NjS0MtJ5RBsj36lDCNIhk7hs6as5VDimMlP6UBjB
 hlYNXzZgnZU/vBACzdlPdd1jhEZoLaDkXqKmvCVGnHHGO48oM+IynQQPEMVWvaoeTKpK
 stOvyrMYEdvvTyEYUvWUo3v/nIYzLm32SVW2JdaVtjM7nGXrP6qbekmyqgTOqNSIZNEJ
 NRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTcuUdP5ILEVF8knhAEVcNwSryuaJ5/WbUTgQV6A0DI=;
 b=DZsX+z4osxlfmZK/WjXeJJI7rh/VVU/vD9KRYo1LmoZfvbd4XwGNrl2vo2K6XB2YLy
 /x5FL3zjCrZ1DLddHHvnc97x6SH4nytr5QXHjUcsVjnXxLJHDkpv/95A8hGxMIOCG6r8
 6kX945K5sf9OP/uE1GnGcRbRLRcNMxI5Q+bBxq3NTxTZCbihHM2hJyThoQ065yq3Z0o/
 2fYsE86ZDs6XNxp0EsESQJ29KZ6DleTt8khSN/xrUwLi8mzWIsUVUCFdWgi/iJGw3TeU
 IghN0QKpjOLzAIYzs+YMkoe+cf2K6FNqoUS/NZfATEdbBiwgPDC8mFemxSwKaPP6gjnE
 DlGA==
X-Gm-Message-State: AOAM531WQtgxzOVNUKia0Z3AnwfStP9ZNU1S+fpf6dm6XICaBIIGvypW
 ykfnShmndPEuoEpmu+quVgaB2N8HaMMJAtdntunrjg==
X-Google-Smtp-Source: ABdhPJySsowPY7zEKBD1QOk4u7ypk7tl7RZ0uso+ihNfiHEM8ButL9bOp3ZRM0PGckVAiGnmIwU1bMMtuyM66DnY3lg=
X-Received: by 2002:a25:24d4:: with SMTP id k203mr673203ybk.62.1606949186741; 
 Wed, 02 Dec 2020 14:46:26 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
In-Reply-To: <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
From: Frank Yang <lfy@google.com>
Date: Wed, 2 Dec 2020 14:46:13 -0800
Message-ID: <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000073149705b5830324"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=lfy@google.com; helo=mail-yb1-xb43.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000073149705b5830324
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:

>
> On 02.12.20 23:19, Frank Yang wrote:
>
>
> From downstream:
> https://android-review.googlesource.com/c/platform/external/qemu/+/1515002
>
> Based on v3 of Alexander Graf's patches
>
> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>
> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
> require effort to do that accurately---with individual values, even if
> they are a tiny bit off it can result in a lockup due to inconsistent
> time differences between vCPUs. So just use a global approximate value
> for now.
>
> Not tested in upstream yet, but Android emulator snapshots work without
> time warp now.
>
> Signed-off-by: Lingfeng Yang <lfy@google.com>
>
>
> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, we
> should be able to just recover the offset after migration by looking at
> QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>
> That would end up much easier than this patch I hope.
>
>
>
The virtual clock interfaces/implementations in QEMU seem complex to me
relative to the fix needed here and they don't seem to compute ticks with
mach_absolute_time() (which in this case we want since we want to compute
in timer ticks instead of having to mess with ns / cycle conversions). I do
agree this patch does seem more complicated on the surface though versus
"just" setting cntvoff directly to some value. Maybe we should simplify the
QEMU_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using
mach_absolute_time() first?

> Alex
>
>
>

--00000000000073149705b5830324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 2:28 PM Alexan=
der Graf &lt;<a href=3D"mailto:agraf@csgraf.de">agraf@csgraf.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 02.12.20 23:19, Frank Yang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div>From downstream: <a href=3D"https://android-review.googlesourc=
e.com/c/platform/external/qemu/+/1515002" target=3D"_blank">https://android=
-review.googlesource.com/c/platform/external/qemu/+/1515002</a><br>
          <br>
          Based on v3 of Alexander Graf&#39;s patches<br>
          <br>
          <a href=3D"https://patchew.org/QEMU/20201202190408.2041-1-agraf@c=
sgraf.de" target=3D"_blank">https://patchew.org/QEMU/20201202190408.2041-1-=
agraf@csgraf.de</a><br>
          <br>
          We need to adjust CNTVOFF_EL2 so that time doesnt warp.=C2=A0 Eve=
n
          though we<br>
          can set separate CNTVOFF_EL2 values per vCPU, it just is not
          worth the<br>
          require effort to do that accurately---with individual values,
          even if<br>
          they are a tiny bit off it can result in a lockup due to
          inconsistent<br>
          time differences between vCPUs. So just use a global
          approximate value<br>
          for now.<br>
          <br>
          Not tested in upstream yet, but Android emulator snapshots
          work without<br>
          time warp now.<br>
          <br>
          Signed-off-by: Lingfeng Yang &lt;<a href=3D"mailto:lfy@google.com=
" target=3D"_blank">lfy@google.com</a>&gt;<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>If we just always make CNTV start at the same 0 as
      QEMU_CLOCK_VIRTUAL, we should be able to just recover the offset
      after migration by looking at QEMU_CLOCK_VIRTUAL to set CNTVOFF,
      right?<br>
      <br>
      That would end up much easier than this patch I hope.<br>
      <br>
      <br></p></div></blockquote><div><br></div><div>The virtual clock inte=
rfaces/implementations in QEMU seem complex to me relative to the fix neede=
d here and they don&#39;t seem to compute ticks with mach_absolute_time() (=
which in this case we want since we want to compute in timer ticks instead =
of having to mess with ns / cycle conversions). I do agree this patch does =
seem more complicated on the surface though versus &quot;just&quot; setting=
 cntvoff=C2=A0directly to some value. Maybe we should simplify the QEMU_CLO=
CK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using mach_abs=
olute_time() first?</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div><p>
      Alex<br>
    </p>
    <p><br>
    </p>
  </div>

</blockquote></div></div>

--00000000000073149705b5830324--

