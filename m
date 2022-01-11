Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962D48B1B6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:13:44 +0100 (CET)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JmJ-0003k4-4B
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7JdN-0006QJ-Sc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:04:31 -0500
Received: from [2a00:1450:4864:20::529] (port=36593
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7Jd8-0004hP-Hu
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:04:20 -0500
Received: by mail-ed1-x529.google.com with SMTP id 30so67500797edv.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Nr3XQxF2up1FeSZMeykunzEh8A3YCk+7xyzi7Rt2Z8I=;
 b=Zq43F9zBBx/SMtmcnHDgTAl0VI1W4x1EiQ4bVEChYPOMbcX9aL263QMFelSz/bT18r
 Vt882QPhKvtU6AC7Wu4+zUSVQcplKUvseVcrH2QA2wQjVLvML9cis39yk11htwYmXPGY
 cGYgujWuOD8MMM1qeGMiFAYKNeLk7C5R9cUx8N/zSjWUN6eGDHfpf1fRHBlb2uW0ewX2
 rf3iHi6Bx3Ex4WeAF9qRdWzugQcHGUjbaHzeVmiynfz+FBJV7hPwxZ6EocymIK02HFPw
 MxhZp9Z1laQxxn2ke9z075zdTEJB780yiGLjEpUV7QYC6xqXzoGll/QdyLBSwdVEOrJb
 /PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Nr3XQxF2up1FeSZMeykunzEh8A3YCk+7xyzi7Rt2Z8I=;
 b=VvC+t+gMlvno2+KiHssAaR5iBBmmKoEBV+7A6FPlJv3gvoESWfQKctTOm/8o1fCBOB
 ryI+pqNvZ2GRZD4Id4THGo0YGGxTKBkItmQdvtq/hzCpa6pwi/UzxFtgJLQjWFEZlICO
 OdwJFQ1F8rsgbltioAv68fIoAmq40RJl+9NLn4qAh+GQoQwlCUTAQGNN7n1ORWfo29d5
 H0o53+ch7QN/pvrVH+zA+7e5hJpQFmXGuv356lIrsUdSBm7z7fQAm2Odom3TE2fjRiht
 bo17JTrBEl5TUz0Y+1HIB9CF+eSJMjQ33sSZfIgF3qPQ9UeQ6ko090NcfWXZZ9+0Y1uh
 gpJw==
X-Gm-Message-State: AOAM530GjtDfHdhIMFJi5FzRZPIPx4A6lbNQJ7ww6ybgX1q3Mtj5epVW
 Iv+07qHvPxEdZqb8G8MB5trHUw==
X-Google-Smtp-Source: ABdhPJy+5LE9PSN0zGyvD3ZD66jCffyAm4qrIv+qfdNSgf1CbqvhfT+vXVZwBK3vbItu3uOW0aDEag==
X-Received: by 2002:a17:907:1606:: with SMTP id
 hb6mr4493251ejc.606.1641917050259; 
 Tue, 11 Jan 2022 08:04:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id kw18sm3701465ejc.9.2022.01.11.08.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:04:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE4191FFB7;
 Tue, 11 Jan 2022 16:04:08 +0000 (GMT)
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-5-peter.griffin@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 4/8] vhost-user-video: add meson subdir build logic
Date: Tue, 11 Jan 2022 16:03:15 +0000
In-reply-to: <20211209145601.331477-5-peter.griffin@linaro.org>
Message-ID: <87sftub6o7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Griffin <peter.griffin@linaro.org> writes:

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  tools/meson.build | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tools/meson.build b/tools/meson.build
> index 3e5a0abfa2..3314b5efc5 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,3 +24,12 @@ endif
>  if have_virtiofsd
>    subdir('virtiofsd')
>  endif
> +
> +have_virtiovideo =3D (have_system and
> +    have_tools and
> +    'CONFIG_LINUX' in config_host)

Following the convention of cece116c939d219070b250338439c2d16f94e3da

  have_virtiovideo =3D (targetos =3D=3D 'linux' and
      have_tools and
      'CONFIG_VHOST_USER' in config_host)

> +
> +if have_virtiovideo
> +  subdir('vhost-user-video')
> +endif
> +


--=20
Alex Benn=C3=A9e

