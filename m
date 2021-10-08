Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72388426CFB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 16:49:34 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrBl-0002kW-Hz
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 10:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYr8o-00010y-BX
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:46:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYr8l-000626-D4
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:46:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v25so30546322wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A46RgzRLjsqZjcBRK2bZVk/fE1RVdkWowsdnr+K9aLM=;
 b=ejywRGpJXuPX3TEQJzeJqp6Wn/Ke6ZoFiOSPHEsTjTaGfyHnVJYrtHuaIyRWqr5rln
 aWbo420sOQ2bGTG1/q9UjvWmJTrHCYS5KvWXMaQKmVCEsaljVME/IXGRqLl+ljpDCbDl
 HTW+3ReXP26mVtr+V4Zybu1men9u6guK4crFrVhQK36yFZzom8oS1+nOnAZ8KrMBNrZt
 saMJRMkQeg1/hUVMHyEGGDNwg9K6CKsRgrHrfnrfcmKr0GgN5Miq34XvCTljs+S7RxXe
 pfbk7HvMk0qrY0kUSFZDrtYm+kCbWuZyJXtjYDt6cFHbf4OkZUnnztprcBSIQOVXYQEe
 8sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A46RgzRLjsqZjcBRK2bZVk/fE1RVdkWowsdnr+K9aLM=;
 b=MW2xsiGjgqGtt+2BuZWtsb/+2vdybxTYRUUjULwVRFuqwfB9g3a2v5/fS0KMmaotfU
 RnQ2yvncE3F98G97QSMiBLdFQXb9Cs3aZW78P+4fNMdapprIcPNl/a1tAnodcg+YsffS
 Q4mobGw2dg1kJM9r61N9C84h8hEvrr37am0zsvlJppErbMmMvHxe6pRLC6CkdL8Je9Zg
 b6PEejoX74S3rRC312+bSqw7hIqkRLPfk+YMwvxKpmPyJsBgWLW1iBH1QFMdRtNCZqOW
 ai5S4UeA1Umpqa7deoc/Y5OworRMqksCCzKVJBZY+TjVeHr3TisLPDG1xPllPjAY2TJs
 +tUA==
X-Gm-Message-State: AOAM531TX9phJmHc+kXdzBPb2Uq1bBEn3eXntjqVK+jJQx5LITn7l0N+
 M6nebeAqQ2SD0lrMlIxqo6fegQ==
X-Google-Smtp-Source: ABdhPJzXzYODiX2ydjCjtXpk1iWI2VLrLXf/1thIOGM1rBGTDgNRTTOUBhv3ro6QdTgFqERAmnz7kA==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr4595489wrs.14.1633704385667; 
 Fri, 08 Oct 2021 07:46:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm16402546wmp.26.2021.10.08.07.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:46:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D7971FF96;
 Fri,  8 Oct 2021 15:46:24 +0100 (BST)
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
 <20210810134844.166490-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/5] plugins/cache: split command line arguments into
 name and value
Date: Fri, 08 Oct 2021 15:05:59 +0100
In-reply-to: <20210810134844.166490-4-ma.mandourr@gmail.com>
Message-ID: <875yu7d16n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This way of handling args is more lenient and sets a better framework to
> parse boolean command line arguments.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 57 ++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 27 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 908c967a09..ff325beb9f 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -11,6 +11,8 @@
>=20=20
>  #include <qemu-plugin.h>
>=20=20
> +#define STRTOLL(x) g_ascii_strtoll(x, NULL, 10)
> +

Why wrap the strtoll in a macro here? Also do we deal with signed
numbers, otherwise strtoull makes more sense.

>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>=20=20
>  static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;
> @@ -746,35 +748,36 @@ int qemu_plugin_install(qemu_plugin_id_t id, const =
qemu_info_t *info,
>=20=20
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
> -        if (g_str_has_prefix(opt, "iblksize=3D")) {
> -            l1_iblksize =3D g_ascii_strtoll(opt + 9, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "iassoc=3D")) {
> -            l1_iassoc =3D g_ascii_strtoll(opt + 7, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "icachesize=3D")) {
> -            l1_icachesize =3D g_ascii_strtoll(opt + 11, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "dblksize=3D")) {
> -            l1_dblksize =3D g_ascii_strtoll(opt + 9, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "dassoc=3D")) {
> -            l1_dassoc =3D g_ascii_strtoll(opt + 7, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "dcachesize=3D")) {
> -            l1_dcachesize =3D g_ascii_strtoll(opt + 11, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "limit=3D")) {
> -            limit =3D g_ascii_strtoll(opt + 6, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "cores=3D")) {
> -            cores =3D g_ascii_strtoll(opt + 6, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "l2cachesize=3D")) {
> -            l2_cachesize =3D g_ascii_strtoll(opt + 6, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "l2blksize=3D")) {
> -            l2_blksize =3D g_ascii_strtoll(opt + 6, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "l2assoc=3D")) {
> -            l2_assoc =3D g_ascii_strtoll(opt + 6, NULL, 10);
> -        } else if (g_str_has_prefix(opt, "evict=3D")) {
> -            gchar *p =3D opt + 6;
> -            if (g_strcmp0(p, "rand") =3D=3D 0) {
> +        g_autofree char **tokens =3D g_strsplit(opt, "=3D", 2);

I think using strssplit here is fine, but we don't seem to to take care
that there is a valid tokens[1].=20

> +
> +        if (g_strcmp0(tokens[0], "iblksize") =3D=3D 0) {
> +            l1_iblksize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "iassoc") =3D=3D 0) {
> +            l1_iassoc =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "icachesize") =3D=3D 0) {
> +            l1_icachesize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "dblksize") =3D=3D 0) {
> +            l1_dblksize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "dassoc") =3D=3D 0) {
> +            l1_dassoc =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "dcachesize") =3D=3D 0) {
> +            l1_dcachesize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "limit") =3D=3D 0) {
> +            limit =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "cores") =3D=3D 0) {
> +            cores =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "l2cachesize") =3D=3D 0) {
> +            l2_cachesize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "l2blksize") =3D=3D 0) {
> +            l2_blksize =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "l2assoc") =3D=3D 0) {
> +            l2_assoc =3D STRTOLL(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "evict") =3D=3D 0) {
> +            if (g_strcmp0(tokens[1], "rand") =3D=3D 0) {
>                  policy =3D RAND;
> -            } else if (g_strcmp0(p, "lru") =3D=3D 0) {
> +            } else if (g_strcmp0(tokens[1], "lru") =3D=3D 0) {
>                  policy =3D LRU;
> -            } else if (g_strcmp0(p, "fifo") =3D=3D 0) {
> +            } else if (g_strcmp0(tokens[1], "fifo") =3D=3D 0) {
>                  policy =3D FIFO;
>              } else {
>                  fprintf(stderr, "invalid eviction policy: %s\n", opt);


--=20
Alex Benn=C3=A9e

