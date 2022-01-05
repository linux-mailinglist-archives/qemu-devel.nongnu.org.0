Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB34858C9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:02:00 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BXp-0008Q0-F6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BT9-0004J2-EN
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:57:07 -0500
Received: from [2a00:1450:4864:20::529] (port=46985
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BT7-0006Cs-O3
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:57:07 -0500
Received: by mail-ed1-x529.google.com with SMTP id k15so111221edk.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Dk6Ec8wI3I6ZAkWJoaIJ5Uw+PQwVZUzVQVni2WxNSwc=;
 b=IoD8pDWmMpjtUTSAGrNIw0p+Dx+p5IMkS15irtlTQVTnh6nj2YwgTakbSBIMhJrTc2
 1vM3Su/SmGQIe5TwzAEhbhulvyYTV/KNjlI5PscLhq7iYymaJp/kOkNIRJuhNGxEEXvT
 uljAl69/j7/AlVMu1ZcV7+GOpyREh9Ggd2e3YfCZnC0+xpI76uw+TtNcyGJZlfmu5fYX
 njOAE7hTzE1CAAQuTUz5+zOQCEL6lN+YAbtMVIJD7Q67eOXTeQGU1+me/3VTiqSMw90h
 w0joE4W1Yw3pVDQkzlnyT+kYqt9pVUyGF+a68uWqUFQUeoH7Hhv2/+6NZ5wvoRup+Dwm
 Fy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Dk6Ec8wI3I6ZAkWJoaIJ5Uw+PQwVZUzVQVni2WxNSwc=;
 b=24cs/PbdAdHEWLAAE+vqtC/LyI8/Hhc4b9WkZ0kBQVev6IQcY5LlMOpdVMIbsJYwDc
 FtF9C/wrupLc5BbndKCRAZ5riWQoGNa19rZvj0nDdE5wc2gMoNRizMUcuM6s5OaL9Rrh
 +c4zWz14Bh2hlPq6PXOpVOAqnaYWy95VTLrDhQ2Xz+6ThNkkw9PyFP5b771/MM3bAWVy
 JI7fI8EO4G2lv6MakI6AsjHYHh9LI7dUVjXYX9YOQsSISQxG28iTPYnmnVqSehwP61AW
 61ao93Tb5sy2HACxR9Dk0W9OXlW+w1TmjnfFgwVYkH2TrOemmmMvmbGVRWG8ehwvDCz+
 KDTw==
X-Gm-Message-State: AOAM5313/2fUsphVq5jHypCyVghj7yKWvpoGG1zSAlJ4Q8mUWyGb1tro
 suYwwsr7msbCqh5p3vXAoDDILirkfqG5EQ==
X-Google-Smtp-Source: ABdhPJy8Iva3YHZWswBmnak4yFku/4pn1HUuP/DIOmFgd//6RwUAETjAsK8zLWWaCeHcgkeWaSUjxg==
X-Received: by 2002:a17:907:6d04:: with SMTP id
 sa4mr46774715ejc.526.1641409023607; 
 Wed, 05 Jan 2022 10:57:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm12405285ejz.34.2022.01.05.10.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:57:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16E8F1FFB7;
 Wed,  5 Jan 2022 18:57:02 +0000 (GMT)
References: <20220105185720.0d4fc159@orange>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>
Subject: Re: CI for qemu-hexagon
Date: Wed, 05 Jan 2022 18:53:50 +0000
In-reply-to: <20220105185720.0d4fc159@orange>
Message-ID: <87zgoahuyp.fsf@linaro.org>
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
Cc: Brian Cain <bcain@quicinc.com>, tsimpson@quicinc.com,
 Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alessandro Di Federico <ale@rev.ng> writes:

> Hi Alex, I hope you enjoyed the holidays!
>
> We're trying to upstream idef-parser (the automatic generator of the
> Hexagon frontend). This introduces new dependencies, specifically flex
> and bison.
>
> Attached you can find our patch for that.
>
> However the CI fails:
>
>     https://gitlab.com/carl.cudig/qemu/-/jobs/1939950230
>
> AFAIU the Hexagon docker image is "special" since it's the only one
> that needs the cross-compiler to be built from source and, therefore,
> it's a process that needs to be triggered manually.

It's not that special now - we have the same for microblaze and nios2
(and more are coming). There was a build that moved the hexagon
toolchain to using prebuilts hosted by QC but it ran into problems and
I'm waiting for an update to that/

> Is this correct?
>
> If so, what should we do? Make a pull request despite the failure and
> then it will be taken care of, or should I make a separate (preliminary)
> pull request just for that patch?

Just include the patch to update the docker file in the series that
introduces the feature and mention it in the cover letter. Users can
always build the container locally and we can ensure the binary image is
updated once it's merged.

--=20
Alex Benn=C3=A9e

