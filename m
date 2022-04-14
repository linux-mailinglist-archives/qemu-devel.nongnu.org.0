Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E550139C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:21:20 +0200 (CEST)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1Hb-0005Wb-EQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1FO-0003p7-4c
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:19:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1FM-00036c-JJ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:19:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id w4so7349107wrg.12
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7PE1o30P7Z3ZXOSLSPlS2ATX6zc/bBQrTE4iV0jjFrI=;
 b=HCimNvd5XoVHCXff2fPwWtDpPe2VIuy8wIou0bBfHb6E+vuXVEYu5ke515k98wYFsn
 EzlHCr9buFbbp/pIxNCSmLhePnP9Lc6LPZZIVXOnVizuWq65NsJlphOvfxwRG9deIM63
 DQleojA0A6WvKkBPteGY140uW54+ydM/VdaOCDEEHLptWPr7xKnlCfRu+cK/yXAUtJbz
 priwdLnwOxSveNrhrZ/itLjS7T8G3jRDUYdcvVGpRZh2HoLOQPlzvRUNNCxa3oqtgA4S
 vmClwaMgqe7bxvK/stox3tQkgGS4OW0AweuE6zKiw0XKdvdpaGec1stcVl43g06MKzdJ
 0FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7PE1o30P7Z3ZXOSLSPlS2ATX6zc/bBQrTE4iV0jjFrI=;
 b=HPZdbJ3ivmQpHEw3pE8TDlDh89E3NW7bO0IH3bmv7Mb/GY+F+EunaW5vM05FHjDC04
 R7Hm4+lA7tkSN3n5UMBTZuPyQdcM0SVYI+HNpnjnrfGPvHv+G7tzW6Hmi5j+p38ZXmpF
 N90QxWC5SXVIS31pVSeBsqbdJ5TlT/QhiD/fZQlgy1BcIVn/MoG1fHZ0igJoJaRRP9sX
 2vwYuEBqZ+7T+k70mMBvgRN6K9pSMh/ISPlEe25wJ8D/H7p8aNV9cWu7cfaYH2bgQm78
 3ZlToeYJALu8/WydhvcmDW8ycmH1a9gZpfaagQExMmLuEe5ID8AOH9OMBiZyTcxs8Let
 TLyA==
X-Gm-Message-State: AOAM531kO3088inw/FphkA/9VRAHG1ffIcU7cGkMKEm66/jlo7IE74C4
 HsTxaODa5HGv3uF4wDkKaWIU0U9MPjQ1Jg==
X-Google-Smtp-Source: ABdhPJwrwKUNU5Rll/kh67BOqfAgORKHOgAK6agYPe80jbtyzhRNecGkILRVEEOmDVNQpQeq2Y+EHQ==
X-Received: by 2002:adf:a2d4:0:b0:207:bc3a:b2b5 with SMTP id
 t20-20020adfa2d4000000b00207bc3ab2b5mr2411815wra.223.1649949539029; 
 Thu, 14 Apr 2022 08:18:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm5657477wmc.28.2022.04.14.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:18:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7511E1FFB7;
 Thu, 14 Apr 2022 16:18:57 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-41-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 32/39] util/log: Rename logfilename to global_filename
Date: Thu, 14 Apr 2022 16:18:07 +0100
In-reply-to: <20220326132534.543738-41-richard.henderson@linaro.org>
Message-ID: <87sfqfu1zy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to emphasize this is the file-scope global variable.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/log.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/util/log.c b/util/log.c
> index 491a8f97f9..b3f79deb6c 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -34,7 +34,7 @@ typedef struct QemuLogFile {
>      FILE *fd;
>  } QemuLogFile;
>=20=20
> -static char *logfilename;
> +static char *global_filename;
>  static QemuMutex qemu_logfile_mutex;
>  static QemuLogFile *qemu_logfile;
>  int qemu_loglevel;
> @@ -151,8 +151,8 @@ static bool qemu_set_log_internal(const char *filenam=
e, bool changed_name,
>              }
>          }
>=20=20
> -        g_free(logfilename);
> -        logfilename =3D newname;
> +        g_free(global_filename);
> +        global_filename =3D newname;
>          filename =3D newname;

I guess there is no conceivable failure mode in which we get a torn
pointer without qatomic_set?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

