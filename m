Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E016A56BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxC3-0003PO-AQ; Tue, 28 Feb 2023 05:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWxBo-0003Ji-K1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:26:33 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWxBm-00071B-K9
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:26:32 -0500
Received: by mail-wr1-x430.google.com with SMTP id g3so272017wri.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzevNVM6+qMYBVc5Qk1P9nYOKfAAxPN/zxc4KZBZeNg=;
 b=HdDBvEOd1d5pECekO1fLCiNlpaSBPedwsEjUiUmH68EqINwk95KSHDz8RutdEXWL6L
 +Z3eEalAdoqLUTdUgHat8eVnI5yJ5Aa3rBDhg0Tr/1DhwIfmzkvWHBfJHRo0S1XbzL/P
 vG2ivfKkU4qCzvvuwPQlMLzJz9epMzwAA041hYFT8Y3N3kvYOoXo46jhNcnk2pgLg7Y4
 PEX3rg0IedslWzk3rAZPz7RzLGM5hiLvnrwQzfMEvoDqAi96oRl0Ot9FR59yMqpQVFsm
 8/PetmtCiimXvxbwmD59VgS3Oj/EuNxkqzHo+VOkxtc5GZ49ttVnacsubjvagIdWleI2
 wIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zzevNVM6+qMYBVc5Qk1P9nYOKfAAxPN/zxc4KZBZeNg=;
 b=g38+sshShU0sa8OYRzuApd3a/9PaR6iT6FbdN4ad5+XzfL1Y5kFCR6DO/6X6GvvLnC
 vNsg6z4dwB+FxO0Ou3IVo7V1zpgtYY/ZAPi+ImFMwwD0DXpITLrCeKU6fpswTcgwTGA/
 o577e2bTCd+IfE500f85dgWYOAwBiulY5Vv2sN6V4Uki5OgOYWfU0lrFcFx3UdN5Hbvo
 30KYonrZlWkwuUzg/qKFLQBIfMqJDc6lEZ80HSluM8feHxtWRhn8wlbiGNefARM98RDE
 DIy03XdBeDvlV99VIeoQKQ7wIA+derH/zQlzKR1UjxLFmMAj0sr89w04DZ2pBKhcJtCH
 jbdA==
X-Gm-Message-State: AO0yUKUZ5myq7iHU8nLGU7kLhh7DTqxKpiBdw93RlxTYeDiLvDZAb1/Z
 b8DxNMcKB5lVev6uO0xzPJ46og==
X-Google-Smtp-Source: AK7set+wuB/yWry5WHQxiHHg6zu+GVWu9YActxhRFhhFTnO3Vo097Wm6mWOyu2R8p+HGE1ZEAafN2g==
X-Received: by 2002:adf:ef4b:0:b0:2c6:67eb:a9d7 with SMTP id
 c11-20020adfef4b000000b002c667eba9d7mr1863515wrp.27.1677579988074; 
 Tue, 28 Feb 2023 02:26:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c028200b003e9ded91c27sm15474407wmk.4.2023.02.28.02.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:26:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A9891FFB7;
 Tue, 28 Feb 2023 10:26:27 +0000 (GMT)
References: <20230227151110.31455-1-farosas@suse.de>
 <20230227151110.31455-2-farosas@suse.de> <87fsargc9w.fsf@linaro.org>
 <87lekiyfr5.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] gitlab: Use plain docker in
 container-template.yml
Date: Tue, 28 Feb 2023 10:23:27 +0000
In-reply-to: <87lekiyfr5.fsf@suse.de>
Message-ID: <87356qgk6k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Fabiano Rosas <farosas@suse.de> writes:
>>
<snip>
>
> There are issues pointing to some general unreliability of the cache:
>
> https://github.com/moby/buildkit/issues/2274
> https://github.com/moby/buildkit/issues/1981
>
> What is your docker version? Mine is 20.10.17-ce and Gitlab's is
> 23.0.1. The issues above are on 20.10.11.

Ahh Debian stable strikes again:

  19:34:42 [root@zen:~] # docker --version
  Docker version 20.10.5+dfsg1, build 55c4c88

Bookworm is only on 20.10.23+dfsg1-1 and others

Maybe it's time to enable the docker repos again? Debian does offer
podman but I had issues with mapping user ids between container and
volume with it. All the user files appeared own by root.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

