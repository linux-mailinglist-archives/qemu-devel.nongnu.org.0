Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB368861D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNe0F-0001oo-Pk; Thu, 02 Feb 2023 13:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNdza-0001lw-Fl
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:07:27 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNdzY-0007JA-7i
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:07:26 -0500
Received: by mail-ed1-x533.google.com with SMTP id cw4so2840433edb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qS2IXYxp8yU8zvKrd59L5bRXHOVgB0wEsKEh/WWwjj4=;
 b=S47/9/P4x9bmIUSasETyhPLinKPj7tKchay7HobSJddp3jcPGgHmnWvLUyDJ6wl8R8
 iUQ7gskrbRrj12VFz2wbku0oL4LBlmMGEmm05mFTmR9MncGT1DFFtMFdbbmNhKyD88ef
 Gqt+W5KnpITJt65JryWBSQcxWcsa7Yp1raFGn+Wd4cGuouofNbhVtYEFukzIEJHC9NKW
 hbo5tuPTr9XAvGX2IKTvO9Ry4K6z//MJPAiOIA3zKm5Rp4oPlPueJ2AuuelmcDQ/m3hr
 AkQwjbzNI4bNkx2+Papb1YmyqOi8Ju7B5KO+MGwCZGE3+8cHOlFtRgKIm/hxrXK7O8Lw
 fjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qS2IXYxp8yU8zvKrd59L5bRXHOVgB0wEsKEh/WWwjj4=;
 b=IKqhbmeKNxs6qp4tZk48SHihwaDjn0J/gryS3WSubjCWe3nTc57uZBGgxwY+1R0opd
 GFOpEtI5X4CG+JxrFzrKL5BcSGo+TVKM58jmHwc/YU5MV5UP9K3zgZmwGPJn26c6NjNH
 cQSdnkmHz8pBXkCT9cwxk3DvhVT7P/bp1S5JpFyBRaDfTyaL5S2m5MGeSeFuE0ooo4cM
 RKXF7n6lBXwrkw+jmMeD450IioIf06hTy3GLSQvkFHK6PW5nLJnB/slzJ9pylqXbgk6F
 X+pB6Gc0hEHH01DV1gdVYHngFw1BK0gPH4A9xZC0xz/uKVpzB2ki1iTpzO9R5aFi5vPC
 b6JA==
X-Gm-Message-State: AO0yUKUPykHoynaMzGodyWdmB7FENvzOTOIwHVq8+R9tyxlJlruM1t2p
 f+zo/0epB+WJw60WglYQ1Nq6D9IU6SCBfV8KyQvssQ==
X-Google-Smtp-Source: AK7set9abVs8QP27sDKE03Be2o9JSJqJQIzqUKRGHiObcEDFP7l5580oyKW1rDuMB9yC3fb79giE5pDahovFPDM0NXM=
X-Received: by 2002:a05:6402:1f8e:b0:49c:9760:2def with SMTP id
 c14-20020a0564021f8e00b0049c97602defmr2466456edc.64.1675361241053; Thu, 02
 Feb 2023 10:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-7-lawrence.hunter@codethink.co.uk>
 <CAAeLtUA188Tdq4rROAWNqNkMSOXVT0BWQX669L6fyt5oM5knZg@mail.gmail.com>
 <CAAeLtUDcpyWkKgAo2Lk0ZoHcdyEeVARYkh05Ps27wbOzDF0sHA@mail.gmail.com>
 <16a6fadf-ca13-d3aa-7e4b-f950db982a21@linaro.org>
In-Reply-To: <16a6fadf-ca13-d3aa-7e4b-f950db982a21@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 19:07:09 +0100
Message-ID: <CAAeLtUCTBASoGMMgzp_LxOiFkJq0wJFQUC4kDzCWA47iLR_N5Q@mail.gmail.com>
Subject: Re: [PATCH 06/39] target/riscv: Add vrol.[vv, vx] and vror.[vv, vx,
 vi] decoding, translation and execution support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org, 
 dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk, 
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com, 
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 18:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/2/23 04:30, Philipp Tomsich wrote:
> > On the second pass over these patches, here's how we can use gvec
> > support for both vror and vrol:
> >
> > /* Synthesize a rotate-right from a negate(shift-amount) + rotate-left =
*/
> > static void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t a=
ofs,
> >                         TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
> > {
> >      TCGv_i32 tmp =3D tcg_temp_new_i32();
> >      tcg_gen_neg_i32(tmp, shift);
> >      tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
>
> We can add rotls generically.
> I hadn't done this so far because there were no users.

I read this such that your preference is to have a generic gvec rotrs?
If this is correct, I can drop a patch to that effect=E2=80=A6

Philipp.

