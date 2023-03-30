Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B566D07BB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:10:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsyD-0004Du-5K; Thu, 30 Mar 2023 10:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phsyA-0004Dd-KD
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:09:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phsy8-0000W0-Qt
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:09:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so11871753wms.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680185375;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+C1/aghJFCKhZpdRXeYOv16xpBmcw2+wIRUzboa2hs=;
 b=R/jUY877W2Mld3RLZXB1xcUJKSB2sraWswpEVBV1cx5DGjddgL4nMVUZWPGV79FBPA
 eN41IHN4543jUhdBRSS/osOqTjVyVLwxKJ85c99IeGcWLs0hwvQDr7vaaHweu0pvLZ81
 pFui7wolW6KMS6ZB5oU5eQDZvVPMzzjQY1tS0ejF5RXHhOn92sgDhE14KZzRV+JKhSqv
 FHzQ3zkDPVHqT0eSzRky4kekr3OMwMLWtdRA07VpKwVIpotOmQSntpRVUk0Izx7XbSAk
 eH6ZWafxdxGqNEOgxArstFI++YqM+ygrGqAVX5QIXeIwnM9ltwGLET40kSNfYGi9gemS
 1jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680185375;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l+C1/aghJFCKhZpdRXeYOv16xpBmcw2+wIRUzboa2hs=;
 b=Y+B9GHCq8znGQvWIpx09g/v7lw+3dG/GkfnN++LDIvpGgITzRQk7lSth8qrbzRzE4k
 TiOKw1Nh7x3yUshuw63Tgrjhtf77+X8UeKstLs2Pj58lg3Hpa40EJ66T9pHSReLl5L8M
 E/Z6YsDe9iCJnVU2W3/gbKQKli6rt8vRXtg+P52azVnFvIJSY20sk2ummfQ5dz/Gz2pq
 W/UH8YKuppXpuBmGSCRgexE7A4Hlj3Kr+WIdkvLHWGqOJNqT3fmzX/SR5+F+PDyCNg0F
 PysCAlXsoDAYZbV9LDC8oSP1FuLTddfZaRmL6B6QAowf6dhiL7ttFrj4GJb7KH1fB3G7
 5ZJg==
X-Gm-Message-State: AO0yUKWqCumFmkdZO4O/p5H6rxVSpuy6R0y47TkXjrdYi65HnxTDfZ1G
 JhnDQYPRXbVpOC9tlZD5SysgWAA0RWy9HyD50sA=
X-Google-Smtp-Source: AK7set8gkwK7CQBDcxgapack0tqfZoStjrswpQrvxajseybRIwNuiv/VfuoxrQ97UFBg5bnkQO/8jA==
X-Received: by 2002:a7b:cb95:0:b0:3d0:6a57:66a5 with SMTP id
 m21-20020a7bcb95000000b003d06a5766a5mr17385483wmi.0.1680185374928; 
 Thu, 30 Mar 2023 07:09:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a7bc4ce000000b003eae73f0fc1sm5871318wmk.18.2023.03.30.07.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:09:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 493701FFB7;
 Thu, 30 Mar 2023 15:09:34 +0100 (BST)
References: <cover.1678770219.git.y-koj@outlook.jp>
 <TYZPR06MB541876821E3AD1306D6DC88A9DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Yohei Kojima <y-koj@outlook.jp>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 2/2] linux-user: replace strerror() function to
 the thread safe qemu_strerror()
Date: Thu, 30 Mar 2023 15:08:59 +0100
In-reply-to: <TYZPR06MB541876821E3AD1306D6DC88A9DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Message-ID: <87a5zunxep.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Yohei Kojima <y-koj@outlook.jp> writes:

> strerror() is not guaranteed to be thread-safe as described in
> (https://gitlab.com/qemu-project/qemu/-/issues/416).
>
> This commit changes files under /linux-user that call strerror() to call
> the safer qemu_strerror().

As mentioned on bug tracker I think you need some more patches for the
other uses. But for this one:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

