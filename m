Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DF6796F8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHkQ-0002Zq-3R; Tue, 24 Jan 2023 06:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKHkN-0002Zd-9T
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:45:51 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKHkL-00085M-9m
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:45:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso12617773wmc.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5ps69GWZKmIjBjkxUxvt7stVq3iFgDebqXTmsHLoa0=;
 b=IZd5DSnr5nUkbmWFmcSXZeN6+lWR7Mn5+qg/9oYRnVg6yl1riX+HWFWgmWds/IbslB
 pIvau5qIZmXgzrctA/tLHbIJgb/MNsQGpEfo6wURJRnjkrMXbenZ1UZh3adcSMCzXRi3
 q3QFdfVnlbUXvNea0NQVAwv7+qjixF97fxaTufYfuh8/JJ0n1NWCyzNTgdd9BFrANAVb
 lvaEegk6d4xoqyiubrB896k4WVfD27Ozv6LbUeXRlPH+IXglqZho35uKqpLHQrDjhXFR
 y6+IS70B3F3EddHHarV14Tm0bStNbLvYr0DfZqLGyhmKF3/0zaen1GzqIRBA7LmsflSF
 +0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V5ps69GWZKmIjBjkxUxvt7stVq3iFgDebqXTmsHLoa0=;
 b=I1EBKw2KTKlsaQ/h2JrQKIHL2VdJ6/peSc+/owPuW+pmN+y+nO7x8kHI0+hCcwtxuE
 XydOFVRSXcNiE6fmNNgl1W4g1UuGMZOJbM9MMEIohkPFeyN/brYAxIPfh35Z31Kz0GnD
 NegSBqZ4xE/eknKokM4f6i6IvUyXyYBPyi7H+4mfF7baXBze1rg95Q5985rUhmNHsRsS
 LDIx9jVCWz5i0IgElSCyGhgowW9DDdEG3zndgDuxWS32kbwcS0ixC4alLJzLVK3YbMLw
 nxELENT5UJHpYwo3imKFbScVoC4dzDLum0puJ0pzSxfnuLk78jEiDbdgqmzOJz0r2O3B
 Mqvg==
X-Gm-Message-State: AFqh2kpr2a25wDMWEq4dE8nk0adIbHUTqhz/vsl7HVwiL4e77GhhJ/IS
 ZDbi66A4Yfcg9exrU/OrvGyLiA==
X-Google-Smtp-Source: AMrXdXul2MDtghdcZNmIJuciNJgE2AbsHuM3bJ30FhujqXlRYXnKFx01yCGWycb1EViojj/Daj6FYQ==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id
 he13-20020a05600c540d00b003d9fb59c16bmr24555627wmb.36.1674560746495; 
 Tue, 24 Jan 2023 03:45:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm14054202wmq.44.2023.01.24.03.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 03:45:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EBB91FFB7;
 Tue, 24 Jan 2023 11:45:45 +0000 (GMT)
References: <875ycwrx18.fsf@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org, "stratos-dev@op-lists.linaro.org"
 <stratos-dev@op-lists.linaro.org>, Viresh  Kumar <viresh.kumar@linaro.org>
Subject: Re: Looking for examples of vhost-user backends using
 VHOST_USER_SLAVE_IOTLB_MSG
Date: Tue, 24 Jan 2023 11:44:40 +0000
In-reply-to: <875ycwrx18.fsf@linaro.org>
Message-ID: <871qnkrw9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

(apologies, empty reply to see if qemu-devel accepts this)

> Hi,
>
> As part of looking at implementing vhost-user daemons which don't have
> complete access to a guests address space we noticed the vhost-user spec
> has a definition for VHOST_USER_SLAVE_IOTLB_MSG's. Specifically the
> message VHOST_IOTLB_ACCESS_FAIL looks like it could be used to delegate
> the mapping of memory by the master/frontend so the backend can access
> it.
>
> As far as I can see no backends currently use this message and the
> specific handling of VHOST_IOTLB_ACCESS_FAIL in QEMU doesn't do much
> more than report an error.
>
> The VHOST_IOTLB_MISS does have some handling but the commentary seems to
> imply this is needed for the in kernel vhost kernel support (perhaps
> when real hardware is filling in a buffer being forwarded to a VirtIO
> device?).
>
> Can anyone point to any backends that implement these messages?
>
> We have implemented a Xen Vhost User Frontend:
>
>   https://github.com/vireshk/xen-vhost-frontend
>
> which currently uses a lightly hacked Xen privcmd device to map all of
> the guests memory. We want to investigate using the stricter gntdev
> device where buffers for individual transactions can be mapped into the
> backend domains before being released at the end of the transaction. We
> want to keep the hypervisor specific code in the frontend so the backend
> can stay portable between different hypervisors.
>
> Thanks,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

