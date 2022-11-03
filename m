Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD4617BEA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYj3-0006rn-KQ; Thu, 03 Nov 2022 07:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqYic-0006mS-C0
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:49:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqYiZ-0000D0-VM
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:49:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id q71so1426902pgq.8
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JaaT6AL6V4GSHM3aZ04xCdYXCqKPVK5C7p0zfX1D8jA=;
 b=HypRgTJYVOfkTEmo++FQRvYPY7/Y+kRwYQJIsfUBdKFnTq07ODBVlKy/jBDdlh8Bw1
 Agknywkz9440iqbg2MfsAWrbGP0uapwg0WJl1wiUH+ek8KlN86MXYkK/cu6kA60+sMFj
 ByZhMsbFCWb6hFwX3TBEA4H3IZpzlKYlg8DnvV16JOXWX/YrLQBpvnJSIV4LTxSq5Nok
 Ns/qQDexlXNevTJQsmSf0dgmNH4orwBbgFvv+RIYJ4rYcbNMvOcr1Ollk3Z+faa3SNvw
 4NfT4RKdgL6cIPQ0MiQU4y+R69INrpCzbids6txOTMXGBNFhNFNstJqHRRKBRw9O2nyn
 CmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JaaT6AL6V4GSHM3aZ04xCdYXCqKPVK5C7p0zfX1D8jA=;
 b=pEfjqM0F1qwwecPAIWs+2ACHJ+OklWbjlXpdRA9KuoEw3l9JUCqIBtFgrwIuS+yulm
 B+aU0Z3hHaqv70j/kqM4uMQAQkxxONEwqVvyYrePV/z1MX5JEgaXW4FKJpGLQps5CI2H
 KaA0wlm58ONB+cLaGypKpCCrYDV7Eyusc8wdp9GEDoUdMp0/t4J/9fp/BClUhBwJ4eAa
 57ftbjzASzIVrS+nU8jEgD+7BTpCgfQ6LepDpCu2A0BNOVpC28Xn9omQJyHLtMev1a5A
 zsHmqPxk0huEKcUV9Y8JT9rrdtxI4piBX0RLjc1nZR6bHuVDP3/ZQIFEwBQMBT60WSg2
 7ckA==
X-Gm-Message-State: ACrzQf3wZsghdBeSnvXh5Bj5/Y17MwFkUflhHGwY7G5cuYUI0dHZfD0p
 wrVETVZY0lhoQhB32lfmz46J/+S5dUqs51WtNIWkqg==
X-Google-Smtp-Source: AMsMyM4kWIk/lbJYayUZH0dYcHtkmELEclLVbUXPSUQK6dv61g3esCG3n9Iwa7YilWJnbe+3jNu8Kzgc3g9H/73EgZk=
X-Received: by 2002:a63:84c6:0:b0:46f:f8b0:ba09 with SMTP id
 k189-20020a6384c6000000b0046ff8b0ba09mr10186227pgd.192.1667476145363; Thu, 03
 Nov 2022 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221102202258.456359-1-sw@weilnetz.de>
In-Reply-To: <20221102202258.456359-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 11:48:53 +0000
Message-ID: <CAFEAcA_qLBPvn02wGcAuyQQObgF0PVb=V3OtnG+C51N69xhCjQ@mail.gmail.com>
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2 Nov 2022 at 20:24, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> The configure script fails because it tries to compile small C programs
> with a main function which is declared with arguments argc and argv
> although those arguments are unused.
>
> Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
> configure for a native build does abort but shows the error in config.log.
> A cross build configure for Windows with Debian stable aborts with an
> error.
>
> Avoiding unused arguments fixes this.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> See https://gitlab.com/qemu-project/qemu/-/issues/1295.
>
> I noticed the problem because I often compile with -Wextra.
>
> Stefan
>
>  configure | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 4275f5419f..1106c04fea 100755
> --- a/configure
> +++ b/configure
> @@ -1258,6 +1258,7 @@ if test "$stack_protector" != "no"; then
>    cat > $TMPC << EOF
>  int main(int argc, char *argv[])
>  {
> +    (void)argc;

I'm not a huge fan of this syntax, and it doesn't match the way
we deal with "argument is unused" elsewhere in the codebase
(where we either don't care about it or else use the GCC 'unused'
attribute hidden behind the glib G_GNUC_UNUSED macro).

I am surprised that this didn't get caught by the check in
do_compiler_werror(), which is supposed to report "this
configure test passed without -Werror but failed with
-Werror, so configure is probably buggy.". That's what's
supposed to catch "your compiler warns on stuff our doesn't
in the test case programs".

If you're building with --disable-werror then configure
should be OK anyway. This is probably a good idea if you want
to build with extra warning arguments in --extra-cflags.
If it doesn't work right even with --disable-werror that's
also something we should investigate.

>      char arr[64], *p = arr, *c = argv[0];
>      while (*c) {
>          *p++ = *c++;
> @@ -1607,7 +1608,7 @@ fi
>
>  if test "$safe_stack" = "yes"; then
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if ! __has_feature(safe_stack)
>  #error SafeStack Disabled
> @@ -1629,7 +1630,7 @@ EOF
>    fi
>  else
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if defined(__has_feature)
>  #if __has_feature(safe_stack)
> @@ -1675,7 +1676,7 @@ static const int Z = 1;
>  #define TAUT(X) ((X) == Z)
>  #define PAREN(X, Y) (X == Y)
>  #define ID(X) (X)
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>      int x = 0, y = 0;
>      x = ID(x);

No objection to the cases where we can pass "void", that's
a neater way to write the test anyway.

thanks
-- PMM

