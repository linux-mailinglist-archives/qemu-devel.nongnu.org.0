Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2B65D583
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4dY-0003UW-Iq; Wed, 04 Jan 2023 09:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pD4dX-0003Sb-0K
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:20:59 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pD4dV-0002gN-BO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:20:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso777667wmb.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPQTHkOn/4Wgt/1iTFuJCoOLfa9FFNkbtyN6fNP13cQ=;
 b=YHW7xzZyH5YNMckP3xduJc3OA4zyrbPHGSUsMPNY2kDJIbx09341URZ+ptwPp5ISRc
 sXxlReicTe0dUN4Ot79MBDu/Rku/XbzduQ1HA0buerdTyRg/mcAl+D9ocrLET7qJ5Ual
 KW/dO3Ln+SOrwezOkBmVCEhFravBTYYL1MjNNiTRQYNBJkAnSSEcAJtPdXFuRV16fM42
 x2s1lxRcysfLmT5yzfW5u4x+xfk8nC7FGexeYoXXsJB+hK6ATQcir8cU4Oz1i9Xlo2oa
 lfoSfzkhtwnL99GFyLN8Qkko/aF3LEw7vXLyU20cBEeApIeWtBzyS+8oi4ceC7yPe896
 7huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xPQTHkOn/4Wgt/1iTFuJCoOLfa9FFNkbtyN6fNP13cQ=;
 b=zRuw88+EltQXoESYZ7LTEQcElwNC8h23yrmBKYhLZj81/2Gh5ASEd+JB9W2HtvPc5k
 tWqbMS6p3tV7jPtAgGIdDiJfFljATk1UWVFYet3u9oZ3w2XIsqCUcCnAPD/JQ92g6DgU
 wNymPrrWjgK/bl9fNsdaSWQQ94yqGoWUaZk6DQDPfd8k1IvspBuW5cVLzZgSpeJ0ME0Q
 1T+1jrLu+L5GyHx6bDOnpn8R/YY8uG9q0aOFcqeYJ9QcTQ9A5ioSUSdz0HJ3bDQwnQvn
 4UAY9kFU+C1UEQO+6n+8hGAM3P8ycrevFvsk4syktNhnBpzXCUjIVNf++tFzW3LhaZrs
 sSyg==
X-Gm-Message-State: AFqh2kpVbWbB/TnzsN2PQoBJx8ocPhSTOQa/HX/BjG4v0GdDbtWTZANm
 hfv8UKpgFvt91QAio/vXujxT0Q==
X-Google-Smtp-Source: AMrXdXs621czgN6DlbzcjX2dRY4J0mIX/NCPPEHpQxVPl72tTVwh87J+9bhupYCClQgNKPBXvOBXEg==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id
 n20-20020a05600c501400b003d3446ab46amr36666668wmr.38.1672842055224; 
 Wed, 04 Jan 2023 06:20:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b003d998412db6sm26915062wmn.28.2023.01.04.06.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:20:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56A121FFB7;
 Wed,  4 Jan 2023 14:20:54 +0000 (GMT)
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-2-xuchuangxclwt@bytedance.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, qemu-devel@nongnu.org
Subject: Re: [RFC v4 1/3] rcu: introduce rcu_read_locked()
Date: Wed, 04 Jan 2023 14:20:02 +0000
In-reply-to: <20221223142307.1614945-2-xuchuangxclwt@bytedance.com>
Message-ID: <87zgaypeih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Chuang Xu <xuchuangxclwt@bytedance.com> writes:

> add rcu_read_locked() to detect holding of rcu lock.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  include/qemu/rcu.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index b063c6fde8..42cbd0080f 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
>      }
>  }
>=20=20
> +static inline bool rcu_read_locked(void)

We use the locked suffix to indicate functions that should be called
with a lock held. Perhaps renaming this to rcu_read_is_locked() would
make the intent of the function clearer?

> +{
> +    struct rcu_reader_data *p_rcu_reader =3D get_ptr_rcu_reader();
> +
> +    return p_rcu_reader->depth > 0;
> +}
> +
>  extern void synchronize_rcu(void);
>=20=20
>  /*


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

