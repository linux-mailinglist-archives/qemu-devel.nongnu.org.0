Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6B4D0577
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:44:21 +0100 (CET)
Received: from localhost ([::1]:47792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHPA-0002DH-86
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRHNa-0000rn-26
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:42:42 -0500
Received: from [2a00:1450:4864:20::32d] (port=44029
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRHNY-0008QF-D4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:42:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so6899907wmq.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CD2S+nw2YJ6SYDw4lu99/ukH8oT7EbT0NuRU76J0fHc=;
 b=HJpVCVcNDHk2m6JOh0k3mOgf1gQ5WCP+EbTgfBLtCCDXxOYCkWPEccjmAChP38YpYm
 DeMNm8jR9E1szSNfZuGmJfqTIXLK7niYm1KrkBBODMeh35lZw53ETMG89WKVpFJloLkL
 TBdcbsaDb7+tyh4PKndL3eQ0RtHW7DVEgSAmoLh4jes2gy2MhDiim0egx4NfwrhERHSv
 TqAyNA+gFNkBBanI2pqyciNUYDwf8VymyJI+ilPR8/3YSqL75nvFOTHvhn3HiHKoEyYq
 pVo8318fGHCOV1+OHnTu0GiESuFc7MeARYrbLI/Rn9u1mwBYUEI2o4cdKk3yJArJGpGs
 8QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CD2S+nw2YJ6SYDw4lu99/ukH8oT7EbT0NuRU76J0fHc=;
 b=VKlXeec3taFYfMYxzrSTohtt4HmnbEyV6k2ChcDwCBEAZk9sdRfUvs0kRzCJDnSyQh
 zJh48G8bceM/RhE/+7mDtIVUJohuN392JxXyvnQFCe1IdceHcQTnQiXuib0+5ClQuT20
 gf6gc+sglFEjyvkM0+mzgT54udorKU48NxN9rbkQe3FkzCOfVBBwJwxS3+S7+D9+HZU9
 +3WKb0z+aVZOF4ZpbSNkZCxEGB0yTpRo/ZoxnP0guXuYR44bilLJeJZbB0ME8gA3qMsS
 gdZ+NE6tTW48MpE8K4xNoc3dWMbzui88sQc47v6zYvfT42IGVJRsh16Hg5ThfR0TL98J
 B7Hw==
X-Gm-Message-State: AOAM532pZNxZ0DSZ8W/XpLEuzb2GDSixm66fEc4Ch7EaMrkNK2ZUgTT8
 fdnF84aPNflTcPXlt0yt6CrYLVmu62/8nQ==
X-Google-Smtp-Source: ABdhPJxeCajxOqMpQp1MA8cGfOQDNHMmLbNx1BY7R+3S/d+57YFT3lW0aYPihGABXz9il/2fMmjphw==
X-Received: by 2002:a05:600c:3d0b:b0:389:a525:7b92 with SMTP id
 bh11-20020a05600c3d0b00b00389a5257b92mr37612wmb.152.1646674958377; 
 Mon, 07 Mar 2022 09:42:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b00389a826abd3sm2935036wmq.42.2022.03.07.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 09:42:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9AC61FFB7;
 Mon,  7 Mar 2022 17:42:36 +0000 (GMT)
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <ponzini@redhat.com>
Subject: FR: Patchew Atom Feed for searches
Date: Mon, 07 Mar 2022 17:35:40 +0000
Message-ID: <87o82hfylv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Something like:

 https://patchew.org/QEMU?output=3Datom

Returns:

<?xml version=3D"1.0" encoding=3D"utf-8"?>

<feed xmlns=3D"http://www.w3.org/2005/Atom">

	<title>Patchew Patches</title>
	<subtitle>for project:QEMU</subtitle>
	<link href=3D"http://patchew.org/QEMU?output=3Datom" rel=3D"self" />
	<link href=3D"http://patchew.org/QEMU" />
	<id>urn:uuid:60a76c80-d399-11d9-b91C-0003939e0af6</id>
	<updated>2003-12-13T18:30:02Z</updated>
=09
=09
	<entry>
		<title>[RFC PATCH] tests/avocado: update aarch64_virt test to exercise -c=
pu max</title>
		<link href=3D"https://patchew.org/QEMU/20220307172249.3125779-1-alex.benn=
ee@linaro.org/" />
		<link rel=3D"alternate" type=3D"text/mbox" href=3D"https://patchew.org/QE=
MU/20220307172249.3125779-1-alex.bennee@linaro.org/mbox"/>
		<id>20220307172249.3125779-1-alex.bennee@linaro.org/</id>
                <published>2003-11-09T17:23:02Z</published>
		<updated>2003-12-13T18:30:02Z</updated>
		<summary>[RFC PATCH] tests/avocado: update aarch64_virt test to exercise =
-cpu max</summary>
		<content type=3D"xhtml">
			<div xmlns=3D"http://www.w3.org/1999/xhtml">
                             The Fedora 29 kernel is quite old and importan=
tly fails when running
                             in LPA2 scenarios. As it's not really exercisi=
ng much of the CPU space
                             replace it with a custom 5.16.12 kernel with a=
ll the architecture
                             options turned on. There is a minimal buildroo=
t initramfs included in
                             the kernel which has a few tools for stress te=
sting the memory
                             subsystem. The userspace also targets the Neov=
erse N1 processor so
                             will fail without additional v8.x+ features.
			</div>
		</content>
		<author>
			<name>Alex Benn=C3=A9e</name>
			<email>alex.bennee@linaro.org</email>
		</author>
	</entry>

	<entry>
          .. and repeat for next entry ..
	</entry>

</feed>

--=20
Alex Benn=C3=A9e

