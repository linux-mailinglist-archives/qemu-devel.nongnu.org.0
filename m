Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96054308070
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 22:24:32 +0100 (CET)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5EmF-0008Ky-MA
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 16:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5EkP-00074C-Ir
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:22:37 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5EkN-0008FZ-Rh
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:22:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id m2so5397304wmm.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 13:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lk41ArAuEXf0HR0zWPv1erHT5ww9FT/SgZgBBAvHYSs=;
 b=KAGveLq6xuKg4SU3g+pVo19/Wjzx4Lf5g4F8JUwPJvOqdujsc+Zw6/yIZP7r5SQmIs
 ORy6Mt/wIzJxnUbUeQAD5o8f1H/T8VGgY7xRUJJPkSnpkCN6PhFOLHFBbMcU/ABY/VWD
 dzUMcKcFMYpPNMRM0iTIjOzxypSjSHJpWPh/Zm75IwPFZGoQRKmZx5A+NeHhdqfbE0Gl
 pKNzW29hLjRF2h4HSDRh5ILcEp+Q+vJCtl/3ihMbMv5A9ALOsMetEo33SPGiIzPtrPEt
 IeUh7IIiNjRf+YosNF9NYLCbHuSlrKhLCz+CnOCKdGJRQcAMHqg+3XHNKBQSR7lfEMz2
 IhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lk41ArAuEXf0HR0zWPv1erHT5ww9FT/SgZgBBAvHYSs=;
 b=IuCpFBSk4+DQFYNqjysxTL/BZt6qjYfTVEzZSKvHQO/LJvGB2g8uadj8SCrvDX6yZF
 yHgvXs1yx4e12Po1q2aWLTP6TIYLBoxWwNaVgRIljSKGw5SeyB1xFNPpejmA7vk9w37M
 L2LfVlHzSjHJ//JU9Zxe8w0Wz0L32ouOQF0VBN0bP0quVWuzaSba/UaSOYfJtSN/vO89
 xJHm1hKe022iwOyGxcDEStDZnleBJZYjWPcJW06jHC2KNUzD8W6lEBZexJn2cNy7JUAH
 i4H4eKOTQz9fCWXduQ6GcxQi3muUjuKDRNBlM7UW0bB76MXOPw8A+q3ZIEbH+ezlMw11
 p74Q==
X-Gm-Message-State: AOAM530ezj1LWg2Bpr1quJ+10c7l1NfAVfwfzDNtEmMC/SJdDkC9p8of
 9JFnX5eyZmT4ezBPTdggzFAxqw==
X-Google-Smtp-Source: ABdhPJxplQQpGlilHx3c4ipayG1tlAd/ZaSQqasyw+ieheSovUU2EA8Jay28gtV4EZpXW3ED+GcuCQ==
X-Received: by 2002:a1c:7206:: with SMTP id n6mr998726wmc.77.1611868953690;
 Thu, 28 Jan 2021 13:22:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z14sm8447487wrm.5.2021.01.28.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 13:22:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91A311FF7E;
 Thu, 28 Jan 2021 21:22:31 +0000 (GMT)
References: <20210128201831.534033-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] gdbstub: Fix handle_query_xfer_auxv
Date: Thu, 28 Jan 2021 21:21:54 +0000
In-reply-to: <20210128201831.534033-1-richard.henderson@linaro.org>
Message-ID: <874kj0u57s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The main problem was that we were treating a guest address
> as a host address with a mere cast.
>
> Use the correct interface for accessing guest memory.  Do not
> allow offset =3D=3D auxv_len, which would result in an empty packet.
>
> Fixes: 51c623b0de1 ("gdbstub: add support to Xfer:auxv:read: packet")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Fixes a number of check-tcg failures, which are transformed from
> proper failures to "SKIP: PC not set" by the test harness (bug?).
> But the qemu executable has in fact crashed.

I wonder if I can tighten that up to detect the failed remote end in the
scripts.

Anyway snarfed into my queue. Thanks!

>
> I'm embarrased to note that I reviewed the original patch, and
> should have noticed this.
>
>
> r~
>
> ---
>  gdbstub.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index c7ca7e9f88..759bb00bcf 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2245,7 +2245,6 @@ static void handle_query_xfer_auxv(GdbCmdContext *g=
db_ctx, void *user_ctx)
>  {
>      TaskState *ts;
>      unsigned long offset, len, saved_auxv, auxv_len;
> -    const char *mem;
>=20=20
>      if (gdb_ctx->num_params < 2) {
>          put_packet("E22");
> @@ -2257,8 +2256,8 @@ static void handle_query_xfer_auxv(GdbCmdContext *g=
db_ctx, void *user_ctx)
>      ts =3D gdbserver_state.c_cpu->opaque;
>      saved_auxv =3D ts->info->saved_auxv;
>      auxv_len =3D ts->info->auxv_len;
> -    mem =3D (const char *)(saved_auxv + offset);
> -    if (offset > auxv_len) {
> +
> +    if (offset >=3D auxv_len) {
>          put_packet("E00");
>          return;
>      }
> @@ -2269,12 +2268,20 @@ static void handle_query_xfer_auxv(GdbCmdContext =
*gdb_ctx, void *user_ctx)
>=20=20
>      if (len < auxv_len - offset) {
>          g_string_assign(gdbserver_state.str_buf, "m");
> -        memtox(gdbserver_state.str_buf, mem, len);
>      } else {
>          g_string_assign(gdbserver_state.str_buf, "l");
> -        memtox(gdbserver_state.str_buf, mem, auxv_len - offset);
> +        len =3D auxv_len - offset;
>      }
>=20=20
> +    g_byte_array_set_size(gdbserver_state.mem_buf, len);
> +    if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offse=
t,
> +                               gdbserver_state.mem_buf->data, len, false=
)) {
> +        put_packet("E14");
> +        return;
> +    }
> +
> +    memtox(gdbserver_state.str_buf,
> +           (const char *)gdbserver_state.mem_buf->data, len);
>      put_packet_binary(gdbserver_state.str_buf->str,
>                        gdbserver_state.str_buf->len, true);
>  }


--=20
Alex Benn=C3=A9e

