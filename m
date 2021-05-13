Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A937F65F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:06:52 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9B5-0005l5-DA
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh995-000423-RN
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:04:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh992-0004Ke-1W
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:04:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so26521426wrx.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Hls8pyZs9cRKbapX0qG8LiWd9JNPcnqMDbFx1GGDIu8=;
 b=Nbmwac5V2SGYJG3WhDzfI7G8pr8HCVlXsNzoHraTR/yB1iK39vNZYt7CMuVSRBOtvi
 fxJLG2fMIK61J8Il4LDlHyyrjfjALPuqUMElSojLtn9aIw5uVQ9ZV4gDbhKJHrtDIwVo
 HLfjMJteIoqAnjrfyL2P95bD5ZMWcMSUtCroMlMVMQRW+9hTWpn78HgENkTpluuS88Lg
 f+h9y1PfEZrPHo3oOhQKZotaUBYQbXFEBo2mnJNBw6ULHb7NpbIdy3KlK8hfSUhpNS0s
 MqVeFKn+rLw3khNzOLrBwpzsMSn+zauYol+fGNyBOZUwNIF0bSgw46ZPtiNB8/23CgFd
 Wihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Hls8pyZs9cRKbapX0qG8LiWd9JNPcnqMDbFx1GGDIu8=;
 b=cOWPGcUZXkXJUtQ5WL8+JxoQWjK6LphMZo33Oz3jXBiNfxhiXKjZUZ0keRA7JWDp71
 9hXD8Pq5GDY+jWXzRUaJEpGcK2SflYtUBIWW1t/dJngz3Z5LM2cj7X19XPQcUiAoF7ks
 cVZZyqf5JLfaIxKfLlkhK0NkROkny36/c+FU9wKMIfbf1lmOuKReAv+eQfaJu0guGB6x
 VIFYjM/ORkcmnfif1Ec6n0K7YXxQnTevGDa+5iaQ+8j48voLHL+vRmY1GmNXbweTwb/o
 8uuRKsD0rl4udP8DDvViLhMryFXlHkE54e7PDEuFTPTYe+ZQffjIdZB6MwdMDSPOdp+t
 PfvQ==
X-Gm-Message-State: AOAM533N8PITfvjwsGfELuNBE+bgUX9jL4N0+MmuU7sd6V0BwpDBdMNx
 wbMC6Nx4bSOVdJ5qNPG+6Mu07w==
X-Google-Smtp-Source: ABdhPJw+KQ+NuAYOUpgUQpi4QqkmnWGIZPANeq+gHfGHgW+SoIdKnYzfNA7D5lV5YwNBLscpWNpHrg==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr49906194wrx.43.1620903882132; 
 Thu, 13 May 2021 04:04:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm2535349wrv.35.2021.05.13.04.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:04:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40FED1FF7E;
 Thu, 13 May 2021 12:04:40 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-44-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 43/72] softfloat: Split float_to_float
Date: Thu, 13 May 2021 12:04:33 +0100
In-reply-to: <20210508014802.892561-44-richard.henderson@linaro.org>
Message-ID: <87y2cidhdj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Split out parts_float_to_ahp and parts_float_to_float.
> Convert to pointers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

