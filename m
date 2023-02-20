Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D669D0A5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU884-0001pj-Rg; Mon, 20 Feb 2023 10:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU87w-0001pA-Jk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:30:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU87q-0005hw-V3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:30:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o4so1622677wrs.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPXezUJ0WrFZ6lnorBOAxD5lcQv3X4p5q6iao6uV9cQ=;
 b=FKWdP97/VgRZ4rvWezXtMqi6aEFYuCNI9wxUladYHT2sN2lB/GUAgW+W/3Jiqg6nK0
 SGescQ6mY7lpC7QBNZlZzm2FMPpzOkIh7HD8BjNdP3ROHtruekJ9iU2TrmlLS0tJcg/M
 gYAuuju4e+MCk9r7bWWwUxuoLZ+8FuU2Myb+sYNBzBeQ5rhoozdN5vZp9+Z9zvCPM2C6
 bgxM0U9YmpX1n4g3M/JppM35KGpC033umXDo0OpB8f41E3m+iwIuYIy52R9W2fhiMm5l
 0z5Noh3MPlbWAfslOlQ2uuOf2TPr7Z9dqjubHK/vqqjy8IIGQ+g1UontYPqe8M5pe/cB
 Ub0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OPXezUJ0WrFZ6lnorBOAxD5lcQv3X4p5q6iao6uV9cQ=;
 b=7OmX0aH9E3oWmcrC0Y27Zorg4ZeACP9s4KvYPA1+CtHHP12WT89cN6fBM4OGP5poEl
 frj80aLoH/gE4ApqcRAnGwDtFd2zm7KjP7BXFns5QU9Ua4XLM/NGOhBPKa1CKyWR8YqB
 POJ9j3eSWIP59JrGangLBFgzGaP21VJyl7drfLYOi0Hdn0zgdqA+U9XVvDGMO3CST7Fl
 7GNeW/smhSuVFSWx5+MPD+APx6cHnV2gqDyoVnO5YU0e0gO9RObQEZCC99N6xxt3cJ0P
 AJmhQVFuL0TkPw+g8u/AqisWFu0X+pIns6OLgNoueATSS3/ef0/3d0gDFU858jmBOaJm
 AjTw==
X-Gm-Message-State: AO0yUKXRyMJwUBL0lMK/PHJQhPICtqST1kqExcXd3rKDsp8USY/gxXzq
 AXjR+z7KxRVHt415em8T35gG/A==
X-Google-Smtp-Source: AK7set9jJu6x6btJlzGhj+3aS4iYFYWwKCiojlPwjEvXIfQwNx7RQNXqXUs7xCvjV9RlS1CYY0owzA==
X-Received: by 2002:a05:6000:170a:b0:2c5:4c9d:2dab with SMTP id
 n10-20020a056000170a00b002c54c9d2dabmr860089wrc.10.1676907045018; 
 Mon, 20 Feb 2023 07:30:45 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002be0b1e556esm2733222wrq.59.2023.02.20.07.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:30:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 464111FFB7;
 Mon, 20 Feb 2023 15:30:44 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-3-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Date: Mon, 20 Feb 2023 15:30:39 +0000
In-reply-to: <20230220115114.25237-3-philmd@linaro.org>
Message-ID: <87ttzgs6aj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> pl011_create() is only used in DeviceRealize handlers,
> not a hot-path. Inlining is not justified.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

