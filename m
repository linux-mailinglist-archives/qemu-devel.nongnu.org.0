Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7126663D0B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFAdY-0001nN-7n; Tue, 10 Jan 2023 04:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFAdQ-0001iE-Uf
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:09:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFAdP-00083e-8C
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:09:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w1so10995526wrt.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 01:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfW/sAEPn0rJm6KxrRyVzn57OjLrNc7Fdi1FUW/dsOE=;
 b=diXcQM+uJlYjLmyLDJ/OzgWW5PKfOrFekO0CeQiJ935FLngWa7gGDfOnb2y2rwRm6G
 4vndqX/eXbu48ng2q1og//ZlyBShbG8pWQ9JFKdHG6mrk9RjpDT6V08/JOeA5s/mjqy5
 9PblS2tU8l6QQB7xmGCV+/geh7cnoXnlqlYKj6K4s/YF6C9omTpget2k/PyCGNVSYeLH
 8nJgRXAKiTpZwqsIxCd0IqeyQ598LykSa5+p+oZ32ANtztXTdImp7C4DJXB2YCbVTqLC
 x/O765PvUBr6LsDKy2awZ/ZJpXiw31BFy13+nqR/dczslg45e79J4JinaJqqUif6o005
 1GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dfW/sAEPn0rJm6KxrRyVzn57OjLrNc7Fdi1FUW/dsOE=;
 b=hoJ1WCIUCbffSCZkUSQPTO+X/xdmEBytamR9+CMkQMlcFyZ0N9lBIj2kUqo8YHw6yB
 BlkN7+UO9itw+Mx+q48U0vxD4AZ2l0XJQ+u64nzLFp5ew46ywjdk3PVnwAsFVgO2XlCz
 VKHDNoG+Nd5X279aZQOIYqDgjbp2i9/GjIF2AL3MB5JdLhWHq0C+Fhaq1FVpefBDIIOn
 j86dduqhEmJvsAKAGocShywP56KfYFjOM+FanMEhchQLphf9BmUYpBo4/rHHhij64vWO
 FgF7aAPnJq07fde9RSwTEeywQUpoow5RlAL5en8LBfu9iF3sgL19wOL5GpCYj3T4thGH
 sxtQ==
X-Gm-Message-State: AFqh2kqaIFA/SgRepskigCCYag5VO+lQjoxPZ/OqoE/5q6uwhJr8/JN+
 E7h9HIu3jTaI7GOV8Ek2n4Z2XA==
X-Google-Smtp-Source: AMrXdXsdIS1Ga3jIqedc4eONURhWzkNcytzTtnRQ3pc/rgp9BpRAF6mVBxeEpdw9YMIouiB+sBU+7Q==
X-Received: by 2002:a05:6000:1f98:b0:29a:e549:2b98 with SMTP id
 bw24-20020a0560001f9800b0029ae5492b98mr18296712wrb.41.1673341768743; 
 Tue, 10 Jan 2023 01:09:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002bb6b45ab57sm8723184wrm.85.2023.01.10.01.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 01:09:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E7B21FFB7;
 Tue, 10 Jan 2023 09:09:28 +0000 (GMT)
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-4-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/5] thread: de-const qemu_spin_destroy
Date: Tue, 10 Jan 2023 09:09:22 +0000
In-reply-to: <20230109224954.161672-4-cota@braap.org>
Message-ID: <877cxuoiwn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


Emilio Cota <cota@braap.org> writes:

> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>  include/qemu/thread.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index 7c6703bce3..7841084199 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -237,11 +237,10 @@ static inline void qemu_spin_init(QemuSpin *spin)
>  #endif
>  }
>=20=20
> -/* const parameter because the only purpose here is the TSAN annotation =
*/
> -static inline void qemu_spin_destroy(const QemuSpin *spin)
> +static inline void qemu_spin_destroy(QemuSpin *spin)
>  {
>  #ifdef CONFIG_TSAN
> -    __tsan_mutex_destroy((void *)spin, __tsan_mutex_not_static);
> +    __tsan_mutex_destroy(spin, __tsan_mutex_not_static);
>  #endif
>  }

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

