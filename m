Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB885F651C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:19:43 +0200 (CEST)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOuk-0005uw-AB
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogOZ7-0003sN-Es
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:57:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogOZ4-0002Ds-7d
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:57:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2565615wme.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4yYX/+zZiGNRXO3H6dR3A+iGMiAy1yv/nFYbyEdzNU=;
 b=rI38d5iBE+wlB6WVeoEjfFvMY1shRvev58ou1I350qebcwIc9idqaNAx1tifCSy5/A
 /gfB0FZfMgwKneG71k/5I8cr8jOmJcQ9n//ShOW5PuZ3Hj+YXS4AV0hIIlAW9n9JXJr6
 A0w2hdYJIH8wxcWZO3Z7+vPFA6dNp3sYX7S7kmbxtycwMOfqx+mJjl6Ol0Th0f3I0qAT
 9Z7RJgzbAwVUM+uMJZBoBRpyHEhHhxhyMHe3/4376RJ3Xm4ucOFLuWYKLXElMmfX/iaK
 JB9NgYmB1Hk0ltgLHJn2hhzJW6z6HGP/cRXfV41jJkCar1oTIzGdpHoI3lfK+HUlMHI7
 msQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=w4yYX/+zZiGNRXO3H6dR3A+iGMiAy1yv/nFYbyEdzNU=;
 b=xGoCFKKCSRMP93IH+coOMWH4je6nXHxFqNwTrNeWdsIS4PHQ1FXePYCBIeKq/A4i6F
 0Gt+HgP8RdK+jrmufOdmzvfwig1AZjM9dkbleJgIvVjWOx/HyreZDvsSPVA1iHlRGBtd
 ziY4BTn5jnGNHzn76Wy4JZgcmnx9PoZjyI/mTV3ut0z6gtjkgFvUxZMDHOfEs7hOhjuL
 2V511q5sai+kMpXIecONbGcVXo8xpfUILDPOkLFQW951C9RIcToJMhwR47u7dgeP6xY3
 RD7Pl2QyQr5Qx7P3OeXEK+LZe1JFMYUymru+NdgKULLFizvv49sN1W52+u4mFUiuhc1C
 YOrg==
X-Gm-Message-State: ACrzQf1NyV32YeFzI637KFldU+5L2sXke0giN2cnxqQRA69thK05McG5
 K5XqBIicCT2Y3JD1vIzaSsBZ1g==
X-Google-Smtp-Source: AMsMyM5ycl0xAL4vnx+0ClOfi/R21NEZ+FagxY7ngfiOoYV94sdM9owEbsmwgzieh1DO40iRHXq3Lg==
X-Received: by 2002:a05:600c:524d:b0:3b4:91ee:933e with SMTP id
 fc13-20020a05600c524d00b003b491ee933emr2826422wmb.80.1665053836802; 
 Thu, 06 Oct 2022 03:57:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a5d4ac6000000b0022e309d35f8sm13813850wrs.12.2022.10.06.03.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 03:57:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8EF301FFB7;
 Thu,  6 Oct 2022 11:57:15 +0100 (BST)
References: <20221005170318.3055568-1-alex.bennee@linaro.org>
 <CAJSP0QUoU+tu6o5qL3eoyYYygukmNA74OONe35RoOjx-QitvUA@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL v2 00/53] testing, gdbstub, plugin and gitdm updates
Date: Thu, 06 Oct 2022 11:55:59 +0100
In-reply-to: <CAJSP0QUoU+tu6o5qL3eoyYYygukmNA74OONe35RoOjx-QitvUA@mail.gmail.com>
Message-ID: <87v8oxi5is.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@gmail.com> writes:

> Hi Alex,
> This pull request fails two CI jobs:
> 1. https://gitlab.com/qemu-project/qemu/-/jobs/3132270506
> 2. https://gitlab.com/qemu-project/qemu/-/jobs/3132270625
>
> Maybe there is an issue with the "tests/docker: update
> fedora-win[32|64]-cross with lcitool" commit (I haven't bisected)?

It appears there is a subtle difference in running:

  make docker-test-build@fedora-win64-cross=20

and what is done when it hits CI. The test-mingw build has been broken
for a while but should have caught it.

I've dropped the patch and sent v3.

>
> Thanks,
> Stefan


--=20
Alex Benn=C3=A9e

