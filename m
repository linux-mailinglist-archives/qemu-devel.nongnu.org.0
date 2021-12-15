Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3D475B0F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:52:12 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVdc-0008AD-0V
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVRG-0007Wk-Hc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:39:26 -0500
Received: from [2a00:1450:4864:20::331] (port=36862
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVRF-0004nz-2y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:39:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso18661476wml.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=C6R9BpiEbdAwfa4Yiyvji4g9qZy6ZY8ri/2gqr960ShxDhP5iWRKdNoP2TSVaJRLaA
 /4hEYVUr7kv/GrngaTHNl3KYrXK06lJmFOJs4Ngro/VpotsmZJxKDIhBgNOYpEuzrEKk
 ijIDdy0AsmREgW6UzCPyszahZybktzOjEVSVT0mHGXU+emW61d3ieKGMAXPpHxrqH01V
 c9jxAAd5ZVaqMG+JNTzTXMpHepQAdSxZSwqiDuVDbsmG2SXDYaUSyoc+9jBayWPyYzmU
 xH9ZckuILVTjK2P+Hlpl7EuE37GJUtEJOvW0g2IexbnLhYOjsfk52KSRO6gRVHA8H+Ba
 zwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=jplur4WOTi1MIlKNFaCGLk/tABPp42D+gmTzRIQzkLpBTCCZ1Kzb8E3n5Fpxlh3edB
 11lgL/vJGgT9gxvE2ggafIVvw+VgJP9j69+xcxdmrH2hjcE7ILCURnHuS+upNi4+cXM4
 f4VgB782W3bKgo5H1cfQZZrZscx4sCmy8R+X6LjEHc3X1rJQfFNe2Y38UU4PQp4ZToUT
 R3Fbgz0iAY5qacQJRr0vl7MEo3rxNWgFKCYy0YoePid1ug0f42BJQ7vS2/G5rRPaHH0Z
 cLdpLiPtE1SasjGn/Th7PIdXzGyFkZi0Xcql4tuC3rpBEEoPSwF5Gs3dmHG5rl3nSPWR
 ygfQ==
X-Gm-Message-State: AOAM533fNc44qaoH5/ypWI15GDakzgYiVOhU/b0ixJ6kBUVyDWV4jXUw
 81Mam6QGvzFett0PoRv6fOZGFQ==
X-Google-Smtp-Source: ABdhPJzM2Z7e8h4cuHl8ulk9rk3xU+C4G+O3WqGTpbnIgDaRh5N8TGB2ef3NvAlQLuDdYYplSEGPzw==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr80112wms.144.1639579163413; 
 Wed, 15 Dec 2021 06:39:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm6562630wmq.18.2021.12.15.06.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:39:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDBB71FF96;
 Wed, 15 Dec 2021 14:39:21 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <20211118145716.4116731-6-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 5/5] docs/devel/style: Misc rST rendering
 improvements
Date: Wed, 15 Dec 2021 14:39:15 +0000
In-reply-to: <20211118145716.4116731-6-philmd@redhat.com>
Message-ID: <87mtl2exuu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

