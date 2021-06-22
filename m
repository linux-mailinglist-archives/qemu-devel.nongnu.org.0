Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E173B0804
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:58:29 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhrA-0007yr-5Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhqK-0007Gh-Bg
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:57:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhqH-0007OY-Uf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:57:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so1352145wms.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uSJUiKZ7fl4TbbMguHh3D67c9mBtrtJRSo0o+6u0FME=;
 b=K2nkPSylgVTCRZ6Hvwe/QdGx+F9qtLUJHjErDy9qF+yEYvdg4VLaHrHmdhiyJoFEmW
 vK/tzYcClE6YYPxX7XOJUzM0vTmwLsMcamQ/cPkIWTHhoESCaHhN7L6j3/szzmnx9NS6
 xWv8xWctdkOCdbDhRMAgVaqYq/Oet5Hwc6aMmaB+KVQ2Ymv3YJqB6AXYUqO2+W1AlzZK
 ecz2QPzhNw1umjBJNqwkvhdUCRQfi6s34gdX4vK55rTktST59b+B4N2DYUpN8W8/On6/
 D1nik33g8QutpVg7rG50fpAZV1qN3ohP/w/cT/MxRQCP5qca3nrRwEwJr42KXfe/9cel
 g4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uSJUiKZ7fl4TbbMguHh3D67c9mBtrtJRSo0o+6u0FME=;
 b=cUOcHNhzgwH7y9X0MkGvIuMPQC4Ju6G3CIrmrjQx5L1rJt7HUSbWIjdjUG/VBm97ki
 I6kO6VfyPegwzAoFX7d7lxjXQ6su9xaRmkj+T0UA0toJQ7+tl9ZPe/jyqrbg1t05KT1f
 cdXalAHiHEu3pI8TUA3HZBZsCawl38kWJzFP6nJhudPctUyi7rULas1iOTB/ZzaSU+jw
 DNK5vTOj0K7lT1rjG07MUcGu8DmEwsowElTAW2w/NANievRy9v2nuyLHZvhfSq1VAN6C
 ARSVaW351C7udArF9FW9Wt4zziuGnn8KOpig+35l5Zo6WLusBG71hn0BAheKvgH7pNZW
 F+3w==
X-Gm-Message-State: AOAM532MYMq+LdaWOriGGPstnSEy2lcrgIImOlqK5rJqElHVoVPh97Gj
 SrNdJC3mMqSlaWCTbz2jmDSCZw==
X-Google-Smtp-Source: ABdhPJzswD7aWK+ZixOdV9G18uGQcVLzrNODDUg5yMT/ut4EIgq2ol7NQVJxV+9AUD56BTNEJdA5Ww==
X-Received: by 2002:a05:600c:3223:: with SMTP id
 r35mr4760501wmp.80.1624373852449; 
 Tue, 22 Jun 2021 07:57:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm12736311wrv.24.2021.06.22.07.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:57:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACF7A1FF7E;
 Tue, 22 Jun 2021 15:57:30 +0100 (BST)
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
 <20210608040532.56449-5-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v3 4/4] plugins/cache: Added FIFO and LRU eviction
 policies.
Date: Tue, 22 Jun 2021 15:57:25 +0100
In-reply-to: <20210608040532.56449-5-ma.mandourr@gmail.com>
Message-ID: <87sg1arlph.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Implemented FIFO and LRU eviction policies.
> Now one of the three eviction policies can be chosen as an argument. On
> not specifying an argument, LRU is used by default.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

