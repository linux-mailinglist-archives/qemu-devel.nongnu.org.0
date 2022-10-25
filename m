Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43060C708
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:57:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFiB-0001PW-UE; Tue, 25 Oct 2022 04:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFWI-0006uB-OF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:42:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFWG-0006En-3c
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:42:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id bs21so3736553wrb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVK4dvIaoIDivKMpUrr/VPjAD/PBVF3uAn924FX2j2I=;
 b=A0HrkcqhdaZObHftmU5vEO6UQEO6SUMGQ7pW0esy60yQAzKZCQ7T+f5tGum3OnSX9b
 7JsYTWKvn6+H2FZ9WL8r6SkOHaSGCRcvw2kOABvhrL6ERalrOn5GqE7sni6LGXUkRKqb
 4OP+myizPE/GdepNmI/JvUGf6CR358O6hzEdUkTt6YvyLVrFyMVPIat/FMnOcmMxvq6v
 bgPASRarFyecLBN21gkDJcSqFNOK6ls8Qua2RdlzwDtZj3kOQ5iCq959e3+8wjepnQ4c
 Q956n5rnmWi+yINJSXIHF72Ue+Bf0i+Npw2Fws3Rt9bcPh+HdiCNWWahvEMztzLW6lbt
 HWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AVK4dvIaoIDivKMpUrr/VPjAD/PBVF3uAn924FX2j2I=;
 b=8O1RvTSsSZ4j1p2khj8hucP03o0yRd+MdvtUcJyJ4JrKSSE91SN0OA617x4XQTCpWD
 i8p36ICkrskvP999IKj+9j7cnoIHCg2ZHpkBt0Q6QVzUtvMOZtP/goZLJ/UOzhZCiP9j
 O1nW+z0xNFbBvfc9Ca8EsS4NNHT0oXe3c0lnWoflzJXGPyCzQlHsPb92EgjA5PlC3MR5
 wBsHsA2q6pYTp7v0+xoo2hZyNgPYd4NNQliN9eBz/rFz3iuiXgDoKmOlw2lB+TU5jt8W
 Rts/6kcBv+MXKWFzHQjKaY6viaiQvJGCj2fqknZGLWAoP/iEeixtAuqwHvYYYI8VXRNf
 Nv3w==
X-Gm-Message-State: ACrzQf0KmvXtmga8JdJ3OuIbO88zXRzknPsk6fIHlAsMHWTxTyMhyuju
 w6W2j+r7P0dJTL4FLNVzn0c7+A==
X-Google-Smtp-Source: AMsMyM5H1EO010lkFbv0kN7WIjS6UCgnGnlewfKR3f/x86pUmAjcUHel9qV66oFjY6XwQe+l6222Jg==
X-Received: by 2002:a5d:498f:0:b0:236:55e9:6c16 with SMTP id
 r15-20020a5d498f000000b0023655e96c16mr14312550wrq.331.1666687361451; 
 Tue, 25 Oct 2022 01:42:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adff7d0000000b002366d1cc198sm1908877wrq.41.2022.10.25.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:42:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 503A51FFB7;
 Tue, 25 Oct 2022 09:42:40 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 01/24] util: Add interval-tree.c
Date: Tue, 25 Oct 2022 09:40:35 +0100
In-reply-to: <20221006031113.1139454-2-richard.henderson@linaro.org>
Message-ID: <87tu3s8fb3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Copy and simplify the Linux kernel's interval_tree_generic.h,
> instantiating for uint64_t.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
> diff --git a/util/interval-tree.c b/util/interval-tree.c
> new file mode 100644
> index 0000000000..9578c05830
> --- /dev/null
> +++ b/util/interval-tree.c
> @@ -0,0 +1,881 @@
<snip>
> +
> +#if 1
> +static void debug_interval_tree_int(IntervalTreeNode *node,
> +                                    const char *dir, int level)
> +{
> +    printf("%4d %*s %s [%" PRId64 ",%" PRId64 "] subtree_last:%" PRId64 =
"\n",
> +           level, level + 1, dir, rb_is_red(&node->rb) ? "r" : "b",
> +           node->start, node->last, node->subtree_last);
> +
> +    if (node->rb.rb_left) {
> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_left), "<", leve=
l + 1);
> +    }
> +    if (node->rb.rb_right) {
> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_right), ">", lev=
el + 1);
> +    }
> +}
> +
> +void debug_interval_tree(IntervalTreeNode *node);
> +void debug_interval_tree(IntervalTreeNode *node)
> +{
> +    if (node) {
> +        debug_interval_tree_int(node, "*", 0);
> +    } else {
> +        printf("null\n");
> +    }
> +}
> +#endif

This seems superfluous especially as we have unit tests.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

