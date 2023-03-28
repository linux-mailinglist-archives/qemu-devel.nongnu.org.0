Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330FA6CBD9E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:29:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7Vb-0002i1-5H; Tue, 28 Mar 2023 07:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7VY-0002he-EN
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:28:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7VW-00025H-AM
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:28:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n19so6744665wms.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680002931;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vb0DTSv9wEHNLZijpIORbSppIJNmyE3YOU6O+WGux0E=;
 b=h2z8xiA4BAvpHt8YCGoGagfxlAgNHvIX/uZXc5kpXiDtN5Z+d8vGnpc25lcrtP84yK
 H62NA4mSkvxVywzE2GUXVDmmKyBm8XCXn4GUXzftjKCATz4uj5s8G2vOgH/PKrmZDQPP
 HnpmRcpGILgpwbHDItUujilSlsmBNhlwy0nAk1KFndHLd8eHmp+CYAFR87A1Ph3C9oNm
 pGYWmTgO7EHdAWvXAxw5xIGfN5SLN/nzw0WIhE9KfGAGbm3GB5PXZQYp1TFSym+Cq9q0
 a9vJ9ZuX8fEMdxRKoBcWk8fOlI+q2BpCsbZ/WpzkbVJEvPqPYupyKyrjxFfjtBFpUcHJ
 8qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680002931;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vb0DTSv9wEHNLZijpIORbSppIJNmyE3YOU6O+WGux0E=;
 b=GO2+0UmEMEWrM/IuWomY+QzSOX9165sG32iNA4SlV8TbWdr15plPpNhDBpx6QXI/3t
 xg/9QENFk7TZPLSek6/TVzDwKMFfavW4Tm71iMbhFK6ANK24LRSLYVkX9n2lMVzdWROA
 72MK2AZTUQIOGpoi8/FwHQGRnjw9Pm9gwAQoBjFaMb80O9qAZYLC5jmS2LLiFv9+yCd+
 4vAEEluhqwvLG93iUMVBcDdja/H2DFviX90nVk53S/V133Amo/YCS1LiT7/TefNar8aJ
 865IK2PduNg/fD2FAtzASxyjz3AtDU1uSLn7mK79eO1kLeyTlp4GyABI6q3krLImk0vJ
 2ZIA==
X-Gm-Message-State: AO0yUKWzK4hZpqLa6C6ykIUpUT6Ddls3hEFtp1EO3w0GIw7qjOXZ/cEK
 nEJW6nCKwFfdIH/yGQZaqBEaFg==
X-Google-Smtp-Source: AK7set9dTJkMQYlZNEtMnnUsOG7J832VNvyYYZs/1b3NcBIGkUnLhqbfE5332XP0aXA1RG5zIZ9LYw==
X-Received: by 2002:a7b:ce16:0:b0:3ed:9b20:c7c1 with SMTP id
 m22-20020a7bce16000000b003ed9b20c7c1mr10702075wmc.20.1680002931595; 
 Tue, 28 Mar 2023 04:28:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003edef091b17sm16896279wmr.37.2023.03.28.04.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:28:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5E1A1FFB7;
 Tue, 28 Mar 2023 12:28:50 +0100 (BST)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Liu Jiang
 <gerry@linux.alibaba.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory
 mapping support
Date: Tue, 28 Mar 2023 12:28:45 +0100
In-reply-to: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
Message-ID: <87wn31qfm5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Viresh Kumar <viresh.kumar@linaro.org> writes:

> The current model of memory mapping at the back-end works fine where a
> standard call to mmap() (for the respective file descriptor) is enough
> before the front-end can start accessing the guest memory.
>
> There are other complex cases though where the back-end needs more
> information and simple mmap() isn't enough. For example Xen, a type-1
> hypervisor, currently supports memory mapping via two different methods,
> foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
> both these cases, the back-end needs to call mmap() and ioctl(), with
> extra information like the Xen domain-id of the guest whose memory we
> are trying to map.
>
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
> the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end will send the additional
> information within the memory regions themselves.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

