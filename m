Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFFE475B82
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:12:50 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVxZ-0007uk-8I
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVOE-0002Ov-Ot
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:36:20 -0500
Received: from [2a00:1450:4864:20::32e] (port=44657
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVOD-00048F-8B
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:36:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so16119860wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VdtzLQ3LLKQT44SERyXxuyjeFREqonfyxCH1Xvq9oZk=;
 b=tHqIaYEjJUzKKiCynYmE/xF1r+6DeL+WmxFJdDeHUfltAW7zADiTGaW6gsBn5b6zAm
 pTmRjw8P1Fik+gvrcffkRT4QP2jUAhL4TAWJNLWEYenQRHG4IJ/xs6xEAdgsMpzd8skf
 gb04ChgyVgdbNPcFlojfeQyq26GhgasEY0F/rC+Rg1+dj2Rifihmvp0qC8876+O05qOn
 92yEomkuQjeHsGLRnGGEpk9NZwtKnMvvIEvbAU/ohyVksaSM6EoYMW1LOA/rH8RSzSSA
 8chtSOMeJGxXd8HrMGkFqiCIW6qDEdTXerq5ID66K21dBOIIQPqXBDa62XlCO3ugnbTf
 xryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VdtzLQ3LLKQT44SERyXxuyjeFREqonfyxCH1Xvq9oZk=;
 b=Aqf8gfKp/lLliLI6eglYlEFXdbl4TCpaGebRHS1C/W1oyZlinha/rwl01oJkETX/++
 Pf7IqTkFbiz7c7GUmXxzgHab00+SMnkaUVxq6gxEg4hjEZDzwWnM98OqYh883/R5kGMz
 UIAJH0DmRxawI5hA2A+/W36yFS325cQKPbS6Cura+ePt5M91260sPZcri0GrSAR00fl6
 Zw8FF1JE2NFrPIulO9ke2YKjG+MdlzwTG/37lhVy6ztUWr5hLhn6ERHjcYLwE72b0WCB
 bVed124KxAUfho2ykk93bDNJK9ZPgzz0PgsSuZPhxViOYzt87aUEe7WKlrvjZ3UMmixZ
 cZNQ==
X-Gm-Message-State: AOAM5305D9BSbBMNqO1WWlPPe4mY6N+A0BVdOJscPv8+zOGGHHghZ0/W
 BiYxF0YrktiUzC5sgifKUdQKqw==
X-Google-Smtp-Source: ABdhPJzT5ffU4M1c7f4Ka6zWzVJovfqagcKRQ4HYG6mNCkQzgm9BrZ/JWpBjgPs/rrKmINlj+FktMA==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr26925wmf.185.1639578974897;
 Wed, 15 Dec 2021 06:36:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm2126922wrt.14.2021.12.15.06.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:36:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F67B1FF96;
 Wed, 15 Dec 2021 14:36:13 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <20211118145716.4116731-5-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 4/5] docs/devel/style: Render C function
 names as monospaced text
Date: Wed, 15 Dec 2021 14:36:09 +0000
In-reply-to: <20211118145716.4116731-5-philmd@redhat.com>
Message-ID: <87r1aeey02.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Add trailing parenthesis to functions and render
> them as monospaced text.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

