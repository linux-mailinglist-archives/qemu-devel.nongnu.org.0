Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFA4CBDEC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:37:53 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkiO-0007pF-Ic
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPkgV-0006WF-44
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:35:55 -0500
Received: from [2a00:1450:4864:20::530] (port=46918
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPkgT-0003mq-L2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:35:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id s1so6380212edd.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s3iuDPI+C7CFzS1QKTXUsw7916VjE+RCP9v8irkZ97Q=;
 b=wBtG0Hd4h6PYEDA5NHaYt4s9LUvAJ7f1b4+AFufSjQ5gBU+F7Fwd+8i3yUOwrIhgeU
 W5J81cmAPpL4uTfDMpJ34UAnomGweYEj9Tgu8zKz4IVN/qPHlXp2NwJ7Xeo8QygNkuWL
 q8FaASOs9Z0LsdmAbr0E4FJXzaqkjp3zo9QIrN8A8+CYLpWSo117nC/MmcTTUwr9sldS
 9EBk/ygvlvlnnsfsP+qZoJ4FshAoGwSq+b0Lx8KoW5jhidj/gR0/vleALsK4M7q0AKEp
 vwb8pYhVDytTd4wuzodcOGSzzUiYrldtkDZ3t5+siuxKJ0QZM5EG02btxcQSk2zAqw3D
 TDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s3iuDPI+C7CFzS1QKTXUsw7916VjE+RCP9v8irkZ97Q=;
 b=X3q/Rnnr3/JM6ogfbiBJvQ+BlFkYT8KkfjxM4aDkBbctvwT9YD0cpSzOFAu5RNwWaD
 k18OllFT7LKldi22c84Ahct3PP3tuJmwUs60UVTjo5hlr4DqxxWCDRjNZX9rnWiZfNKz
 N+PDABVnMEgHFsDwBASl9WKUsFRmfFa/Ryn3YdqybCzbqOnlHr0pXVn8bakhCR9Kpvsr
 Jl5lqqFnbtpln5xRb/BI+lBbXpeolYf7KdgAhkaeXLSMhKtBTOs7XXeSAfrx4d0WpZLW
 pIIinQn2KHGKDbw0xTGA6G4k2tasNSNW38UX84gOS7wp1tbIHoqIADRrGkdBC/2D3dbW
 qTkA==
X-Gm-Message-State: AOAM532O98tW4w5mG9iogtxs80XHl1GhaGATpycz3FWjdhsbmYPx+DAt
 mH4U6yJbDKh83Z98gf5y2Ul3Zw==
X-Google-Smtp-Source: ABdhPJwd35WZMZ0aS334c1tjtkLRkdrxth9kaMsbg2JQgUE0Ae1Yr6aeF8pHS1DpD1YxwQpLEUdIww==
X-Received: by 2002:a05:6402:3549:b0:412:b31c:5509 with SMTP id
 f9-20020a056402354900b00412b31c5509mr34544649edd.224.1646310952000; 
 Thu, 03 Mar 2022 04:35:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm636150ejc.120.2022.03.03.04.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 04:35:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19EE01FFB7;
 Thu,  3 Mar 2022 12:35:50 +0000 (GMT)
References: <20220301085900.1443232-1-thuth@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/Makefile.include: Let "make clean" remove the TCG
 tests, too
Date: Thu, 03 Mar 2022 12:35:45 +0000
In-reply-to: <20220301085900.1443232-1-thuth@redhat.com>
Message-ID: <87ee3ji57d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> "make clean" should clear all binaries that have been built, but so
> far it left the TCG tests still in place. Let's make sure that they
> are now removed, too.

Queued to for-7.0/misc-bits, thanks.

--=20
Alex Benn=C3=A9e

