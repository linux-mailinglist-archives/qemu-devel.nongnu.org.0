Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204573AB302
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:49:01 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqW4-0002aC-4t
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltqUd-0001iW-Lz
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:47:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltqUb-0001lX-V6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:47:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so3541279wma.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=97nQg0jygz82rW1L13AA0TgpnBBGpn+/RmGZCsrffS8=;
 b=Ogsgwd4sWwYm+9SxvkVZd9q+dBZUEnao5SMn3TXVcdi7K/RomLeKKtjoekwWrnVj0F
 i6vRTqwpVj0x7dqtMv5lx7pVHpCR3dXLl+C1Ifidf8pjftcs2IAwJLS3lhPzxWK4ggoI
 EOqRJ5t0idNhVwfmfg/+mtViuBGsBbM3aD/+/L6j7RShDuRQYOB9wjtLrICymTpBQv2J
 DKK3Ytgg++9wDtrb7ODFBoE8ZQZ6HJtyjK6sH2w4TPZ1qkBPaTNgMiTSMTEaYodHc7ky
 bKFrVawQ+aAmw8hXHKHkR5cKyQ4gw3u5bLUa2j4g+C9ImiipTRiaBct2+PYrSvjmRt8U
 DhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=97nQg0jygz82rW1L13AA0TgpnBBGpn+/RmGZCsrffS8=;
 b=C9//TA/Nhkjf145PHNwBNJfDyQwBXb5gf93ptecG6keXJEFjcDUHZ7R2h81vvI1Za7
 XmitEWFbdIQ1aAMa/1Wg7b/UO4z5nZi1ebnsT3+fVA8Zvusw1dD70h5p85tvM8YI4foD
 YxbMXDqtO4Q3k2gI19aPh98zcQfgMkAtiRTa+9PWhpgE+9XBeDolAc19vSGgM5Tl9hQ6
 iGl1qKcZCQSYtqzLnvo7XxfhRAJ/+FE3A3/hKwDw0pSP7JU+E3+7FT6b9j5ZLej8Y04r
 oPMXv/3ZEOuYRKTlYBiz/lgRmmZd/6GolgXJztzIdhzj8o2q/TdxWkvJ72qAhbs0jss4
 kHsA==
X-Gm-Message-State: AOAM533HNZUDLldB47P7QkRj2HI9MVscQ4PPZW+zM118whDZHhSKl3uQ
 chUz+1RxtG6mX2rBqudIBIE8lxMPu1ajmg==
X-Google-Smtp-Source: ABdhPJxOTR8UVKbRUhpmf8MP5Ela5EuWFfWSLIwNYyTC68bKKHpbAoVVKhdagxqRY+IfmAk3FV32OQ==
X-Received: by 2002:a05:600c:218a:: with SMTP id
 e10mr3769436wme.183.1623930447867; 
 Thu, 17 Jun 2021 04:47:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k36sm4303022wms.30.2021.06.17.04.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:47:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DD621FF7E;
 Thu, 17 Jun 2021 12:47:26 +0100 (BST)
References: <20210614144245.17660-1-alex.bennee@linaro.org>
 <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
Date: Thu, 17 Jun 2021 12:47:11 +0100
In-reply-to: <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
Message-ID: <874kdwg1bl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 14/06/2021 =C3=A0 16:42, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>> v2
>>   - fix typo in summary :-O
>> ---
>>  linux-user/trace-events | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/linux-user/trace-events b/linux-user/trace-events
>> index 1ec0d11ee3..e7d2f54e94 100644
>> --- a/linux-user/trace-events
>> +++ b/linux-user/trace-events
>> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "=
env=3D%p frame_addr=3D0x%"PRIx
>>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=3D%p frame_addr=
=3D0x%"PRIx64
>>  user_force_sig(void *env, int target_sig, int host_sig) "env=3D%p signa=
l %d (host %d)"
>>  user_handle_signal(void *env, int target_sig) "env=3D%p signal %d"
>> -user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p sig=
nal %d (target %d("
>> +user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p sig=
nal %d (target %d)"
>>  user_queue_signal(void *env, int target_sig) "env=3D%p signal %d"
>>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t en=
v_psw_addr) "env=3D%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx=
64
>>=20=20
>>=20
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Are you going to queue or shall I add it to my pile of "misc"?


--=20
Alex Benn=C3=A9e

