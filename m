Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9363BBD8E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:37:50 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OnF-0004bU-Su
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oix-0006AS-0W
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:33:23 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oit-0005Bg-Dh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:33:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t15so18766072wry.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OwdU4UKLvygXLRGa9Mdh0LTHVfICES0tT6jNw5W5O0E=;
 b=QI3qKKEDjLci5bPiAzSLDRgaAEMyfynYqQbg8OlfiBVmlaXDSz4FtWOME8jkYy3wKU
 m3psi8BvtK5n1fsusLrz9VZegFMJIoddjj3uz97ps06rfSsRuhMurB1Dg/V1ITQEwZKY
 T1bqWpjp/zA0pq8/7A9FrfYnAuvLgIFbHDqBBvCoaL4Py7CIc9PhDFmm8xKc2H5sqWgZ
 hcBtkEgxgf0DbaWOFhQtrdR60pX+ZMdYe/Ojo1e+mJWrhsBfEmR3VGzLViM89Wm3Wj1Q
 shS/5kLPurBMg2ob7IRe3MRWzGvZsWsjQraERshvx4RXBQdY+LthqNclkCZfuiEBTny+
 C2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OwdU4UKLvygXLRGa9Mdh0LTHVfICES0tT6jNw5W5O0E=;
 b=IUx/4Fn547TuwEMpT45oRz4FAIKfo0a1ce+E8SnlusIriS6s1Yoccpv15lIu5SyJSO
 4Ia7+pJtNPObaCKSRC3eyPnh4TM48B050RkPMWOR6zyYPVXnmVdY6wtPOca7P3EGmNCr
 fSCSitX3nuhV9WP7bkluw6zsuZR7N7Vn6/P14WQbnkQRq8e92vTCk58iRPqII03+wUCq
 ww3TqFTFd0ph3SK+gwlbrauo+Pq/Cj7V02sCbYsH6aZ3zp2KxLsGZAgw55JkpytFEY4J
 FvXbSfudomOUUCNUzD+QjajVMZnkhcwVmYCcc0bHvGzTuF33KrOXn2eaB7Vm/fXdtzuK
 ZTQg==
X-Gm-Message-State: AOAM531xpVGUxcb8BxZa5heSmZ9+ZvjLOnQp0Ty3QrEKmkkQrnowh9Ac
 1lFyD+DVIhBRiy/fuQ+SC6hPfQ==
X-Google-Smtp-Source: ABdhPJxoVEx8/w1VHHqhDfOUuF0wDtm+hXai1uDbgPeOjGLCoWjKRzsVYTRtjJzqOYZk6Hz9jlk7jg==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr15154224wrx.177.1625491998193; 
 Mon, 05 Jul 2021 06:33:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b9sm15802193wrh.81.2021.07.05.06.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:33:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B1EC1FF7E;
 Mon,  5 Jul 2021 14:33:16 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-5-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 04/22] tests/docker: use explicit docker.io registry
Date: Mon, 05 Jul 2021 14:33:11 +0100
In-reply-to: <20210623142245.307776-5-berrange@redhat.com>
Message-ID: <87sg0s51ib.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> It is good practice to use an explicit registry for referencing the base
> image. This is because some distros will inject their own registries
> into the search path. For example registry.fedoraproject.org comes ahead
> of docker.io. Using an explicit registry avoids wasting time querying
> multiple registries for images that they won't have.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

