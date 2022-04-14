Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8B5010AA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:52:07 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0pK-0001DS-78
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0nb-00089k-SO
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:50:20 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0nY-0006rL-Tb
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:50:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id p15so10519103ejc.7
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FLLRRwgUrSLYaLhSVunqHXwvAIIMtPQHGCo8dg2hD8U=;
 b=W9cNAQ/Sdfhkp88jj6k9XmDVDHfTI6ilg1FBHWqmitmJAZhYebrFw0KvhkrOZA7I1J
 1DdWmwPjDr5/VmW8qh3VCLJ/2HOAMLMePA4i4E3EgFaW4dIwMCeMy2671MuHqkB4Y832
 G32T8K2mTOHF1RcWh9EvnqWSOTS9N4CkiUFrlYUBohTw/8ZRcC0XRsLcS2yrqWwQzCbV
 Ym6LXpPG1r8+1PYlhZsLAE9WK+KU1/3TDEbUPGQux744bntk7hRf/wQM1bETByXHJ5cH
 03x7DxNZufvNmlO2ND9aYP7bnE9H98QDugREFhhMq4c6PYPcOafOA0bgb1EEWNaEdnEj
 LH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FLLRRwgUrSLYaLhSVunqHXwvAIIMtPQHGCo8dg2hD8U=;
 b=5sKk3DfaW9ZDIBz26epKwJJAvV2R4AYNCJ5LAvlR/GnjVbI2l0Dg24u5m8bK6r4/p4
 CyNau1zJYoIp5pf/IqprtrtsasUonNeG3KDmHP0H1/H9TNz6dV6MUINwOXqu26TVaJQx
 +fxtaELwpPmMiKabru8J8hgJVKQEzcm1EMzRQirP+vrC44AtMQwZWYGXKMgWGAhHaGiq
 GnpDGMImZ+pzaMAHPAv1y/LiOVdzbGgWMjGtdnbvUCSyDM8lm2Ne2VvjYk9rGHp1rw0J
 8vehcMvdy3fWAMqcdsBASo5DPclSv98IFrytiQXSi0P/6D3bzPopb4uS+hX2P2P0Cl3N
 WY+w==
X-Gm-Message-State: AOAM530Az1LG8LN7Y/3p4UKy2EaqPGbVJTdgrbL1n6kMzk4iOtT67RDU
 EEC7A8Ftjr2oD/WhrrcamuNafw==
X-Google-Smtp-Source: ABdhPJzmiv6zZgAtGDHD9XOk8Vy7JWEb/GV+taZcwgntWddBE3VnC3ntMy97dutCAvUjsCYWALru3w==
X-Received: by 2002:a17:906:1706:b0:6e8:9335:d554 with SMTP id
 c6-20020a170906170600b006e89335d554mr2569989eje.111.1649947815493; 
 Thu, 14 Apr 2022 07:50:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1709061d0500b006e87591ca21sm686350ejh.192.2022.04.14.07.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:50:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D66DB1FFB7;
 Thu, 14 Apr 2022 15:50:13 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-34-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 25/39] include/qemu/log: Move entire implementation
 out-of-line
Date: Thu, 14 Apr 2022 15:50:05 +0100
In-reply-to: <20220326132534.543738-34-richard.henderson@linaro.org>
Message-ID: <87pmljvhwa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Move QemuLogFile, qemu_logfile, and all inline functions into qemu/log.c.
> No need to expose these implementation details in the api.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/qemu/log.h        | 38 ++++----------------------------------
>  tests/unit/test-logging.c |  1 +
>  util/log.c                | 30 +++++++++++++++++++++++++++++-
>  3 files changed, 34 insertions(+), 35 deletions(-)
>
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 75973111bb..42d545f77a 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -3,46 +3,16 @@
>=20=20
>  /* A small part of this API is split into its own header */
>  #include "qemu/log-for-trace.h"
> -#include "qemu/rcu.h"
> -
> -typedef struct QemuLogFile {
> -    struct rcu_head rcu;
> -    FILE *fd;
> -} QemuLogFile;
> -
> -/* Private global variable, don't use */
> -extern QemuLogFile *qemu_logfile;
> -
>=20=20
>  /*=20
>   * The new API:
> - *
>   */
>=20=20
> -/* Log settings checking macros: */
> +/* Returns true if qemu_log() will really write somewhere. */
> +bool qemu_log_enabled(void);
>=20=20
> -/* Returns true if qemu_log() will really write somewhere
> - */
> -static inline bool qemu_log_enabled(void)
> -{
> -    return qemu_logfile !=3D NULL;
> -}
> -
> -/* Returns true if qemu_log() will write somewhere else than stderr
> - */
> -static inline bool qemu_log_separate(void)
> -{
> -    QemuLogFile *logfile;
> -    bool res =3D false;
> -
> -    rcu_read_lock();
> -    logfile =3D qatomic_rcu_read(&qemu_logfile);
> -    if (logfile && logfile->fd !=3D stderr) {
> -        res =3D true;
> -    }
> -    rcu_read_unlock();
> -    return res;
> -}
> +/* Returns true if qemu_log() will write somewhere other than stderr. */
> +bool qemu_log_separate(void);
>=20=20
>  #define CPU_LOG_TB_OUT_ASM (1 << 0)
>  #define CPU_LOG_TB_IN_ASM  (1 << 1)
> diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
> index dcb8ac70df..9b87af75af 100644
> --- a/tests/unit/test-logging.c
> +++ b/tests/unit/test-logging.c
> @@ -30,6 +30,7 @@
>  #include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "qemu/rcu.h"
>=20=20
>  static void test_parse_range(void)
>  {
> diff --git a/util/log.c b/util/log.c
> index caa38e707b..8b8b6a5d83 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -26,14 +26,42 @@
>  #include "trace/control.h"
>  #include "qemu/thread.h"
>  #include "qemu/lockable.h"
> +#include "qemu/rcu.h"
> +
> +
> +typedef struct QemuLogFile {
> +    struct rcu_head rcu;
> +    FILE *fd;
> +} QemuLogFile;
>=20=20
>  static char *logfilename;
>  static QemuMutex qemu_logfile_mutex;
> -QemuLogFile *qemu_logfile;
> +static QemuLogFile *qemu_logfile;
>  int qemu_loglevel;
>  static int log_append =3D 0;
>  static GArray *debug_regions;
>=20=20
> +/* Returns true if qemu_log() will really write somewhere. */
> +bool qemu_log_enabled(void)
> +{
> +    return qemu_logfile !=3D NULL;
> +}
> +
> +/* Returns true if qemu_log() will write somewhere other than stderr. */
> +bool qemu_log_separate(void)
> +{
> +    QemuLogFile *logfile;
> +    bool res =3D false;
> +
> +    rcu_read_lock();
> +    logfile =3D qatomic_rcu_read(&qemu_logfile);
> +    if (logfile && logfile->fd !=3D stderr) {
> +        res =3D true;
> +    }
> +    rcu_read_unlock();
> +    return res;
> +}
> +
>  /* Lock/unlock output. */
>=20=20
>  FILE *qemu_log_trylock(void)


--=20
Alex Benn=C3=A9e

