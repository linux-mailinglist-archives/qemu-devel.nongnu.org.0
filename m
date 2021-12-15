Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8932475BDF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:34:48 +0100 (CET)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWIp-0003vl-La
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVRn-0007uv-3M
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:40:00 -0500
Received: from [2a00:1450:4864:20::42f] (port=36745
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVRl-0004tD-5y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:39:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u17so38628132wrt.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HYUpr+ZCUjaXlRRZc71GVH2KyVU2L02De/egvEnsaso=;
 b=u6zfGHNCwyDuaxr3qWQuD3CQpRO7YaejPQpc5CyOg7vBOck1JFX9zeb6JqF757WIBz
 f5ALjUrWIDegYFUESkqKDoEGqKfrx3qHsQkFYCX4V0M+7pOhl94S+y7B/9HDjHkIlLoP
 To4DQRXDZcCRckV8r44LnPsYvFaqWTTnvnkhbN2WWVk+lKQSXGo7Lm7oJWp13+CbFKgp
 774pL03zSBiT6b29XbgN13lMS8SF4wT3TY0H7/KvS62knK6XZjL3ufwhSAYRlOXfxRF8
 s7VS5kB4NkKRsQXDJhhOEQr2Cun6+6O2gHsVkGe1/8IIbsSTtg47PW2Qvn0hvTXz5bIL
 JDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HYUpr+ZCUjaXlRRZc71GVH2KyVU2L02De/egvEnsaso=;
 b=t92jNxXKAK3VXDb3fptfNEgeVAz04SPli/VTBcGJ2Qmdy+ON+Hx7eWPg92uDUcISC/
 WiuGiMgWn2yHiD23cYUsupLOX9QkKur/RQ8cbOOl0c0v6NrzjRKHUbayTrPJGAlQGEWV
 etBBy/9b3c91MWqrL+rLcTWYgHrRjovShrXfPnHnUHN6soXcJYmJ08HEieCHczK/G5FF
 myeu2H7lcRvIWBHrP47RxRVzv5fcZJis55+HAW1ZtsjWrQ28LEPEdDsv7/pLELrqy5xj
 Pnk/Q+ctLpaw8lc8aEFP8QOomT2EoigFHgsms3MLnErDYWE7ok7TYiw/gep2C1R2k7w0
 96qQ==
X-Gm-Message-State: AOAM531sJNorBHQT/40JpoWdwJBL4r6m8FFrDUSgEc6pqINljOGC9oJI
 xCfrAiShhr5HNCXRRlO6CwasOw==
X-Google-Smtp-Source: ABdhPJxvO61H22aXd+DF8f39Jft+1fGfVr/Ooj5GGOsd80tyCNZSlR6hb2sf+Gkkf1FcW4YmFCUbTQ==
X-Received: by 2002:a05:6000:1a8b:: with SMTP id
 f11mr4697451wry.409.1639579195820; 
 Wed, 15 Dec 2021 06:39:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n14sm2674541wrf.69.2021.12.15.06.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:39:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79F261FF96;
 Wed, 15 Dec 2021 14:39:54 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <f64cc438-eab1-6409-3d7c-18b0b49fb65d@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 0/5] docs/devel/style: Improve rST rendering
Date: Wed, 15 Dec 2021 14:39:25 +0000
In-reply-to: <f64cc438-eab1-6409-3d7c-18b0b49fb65d@redhat.com>
Message-ID: <87ilvqextx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> ping?

Done - bu don't forget that Darren added a r-b for the whole series the
day you posted it ;-)

--=20
Alex Benn=C3=A9e

