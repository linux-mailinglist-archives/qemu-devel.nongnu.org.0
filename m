Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502830D62A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:22:27 +0100 (CET)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7EMk-0001f2-Ar
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7EL4-00014B-I9
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:20:42 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7EKw-0002Ox-Gp
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:20:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so4751893wmz.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 01:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eIeugaRcguh/jP5zfu+bVQ/sFW9QfocCRem9foNWKjo=;
 b=NRxzwgdsKLQRZ4rktC8b8rnbzND4l43cO+wkVO2RUkREHxEl15kXGc9atCCrwC3Dql
 zDM1rNwbo6iQJjcvm3Bfe56GvLZXBRLXHVdaiTPnRZA/WB9DrVXuodU5HWzjm5jfkbfz
 7RseIVY9zINu2W97ZqwSTWJvow5nFK04DSOCzXlqUuIUI4aOZiEa3CmD3FcTalnlMK3u
 R1+jn2Ta0OHnjsIGxbOjLNqSrG0+j45RBDo34x4WgfPtfcN3RVCEX86Z980f/gkTeLt/
 fPo1s+tgHczT2DxjsEMIV3iKIBFD5d56pnvubGOs7VzWsyz0Dtw/+1NntnUb7k+cV6GW
 7kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eIeugaRcguh/jP5zfu+bVQ/sFW9QfocCRem9foNWKjo=;
 b=JvQxXefCzEIJmSMz5ovqbPLsSg7I20GxAklHzL37prXuMzH6ELFlK+3C2z9uok1u+X
 62mPQCfizw4wpFTT9mC3Tdr4qq1z4CaO9m+bRyy23IWd2DSz6O/VYEs9hvMkx4SOP9LJ
 D9E99zechC09FCtkXiT2hYYmgucwzZLEQZPoD8gi6W1bYg2DzSM9Aiv3XiMs49OTkYAz
 OaLvG+QPVxxxUnbSu40YDWKL5gw1CfF2+GbvOVPXiRkAhJtlNd24Re6mE9EfNpNlz8oS
 O5phbF4qk9CrMeAWXBNL2g7uelGsr8XtQfLtoAwbC5QhRgS+OGmKYFuQDOBvOWc1pfey
 pQgw==
X-Gm-Message-State: AOAM532pMX4bBjfLfEanEP3bhQdMF8C+UsZ8fkZh4D5N0xHWxUQQUejV
 F3RlU8eX5v60q0WVRYLnKZnzJQ==
X-Google-Smtp-Source: ABdhPJwTWJ4n/8hAoSrh+zWqjb8Ft6JRfANitVZeMJwGAWih7SJinM5xpa/yqCdKAsE8X9sNOVmwDA==
X-Received: by 2002:a1c:5a54:: with SMTP id o81mr1920368wmb.50.1612344032325; 
 Wed, 03 Feb 2021 01:20:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a27sm2398417wrc.94.2021.02.03.01.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 01:20:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B24041FF7E;
 Wed,  3 Feb 2021 09:20:30 +0000 (GMT)
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-12-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 11/12] tests/fp/fp-test: Replace the word 'blacklist'
Date: Wed, 03 Feb 2021 09:20:25 +0000
In-reply-to: <20210202205824.1085853-12-philmd@redhat.com>
Message-ID: <87tuqtse1t.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
>
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

