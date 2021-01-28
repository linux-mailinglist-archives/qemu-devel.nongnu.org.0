Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B693079F6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:43:39 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59SM-0001Y8-J7
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Nl-0006zF-1E
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:38:53 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Nj-0002sW-2k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:38:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id z16so2363846wml.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=ZdvyOXnYKjJbgF8w+USzYougIySgKF6Ypdxbj+QwRcC65LetlF3qCHjSuG7h1ldqFR
 3NVF/O2l5IA3Fmu+TEbT2o5GwDNHwjcqXz8RvI1hqqxYcaRXtBioqd8kf/LEFFtnauzj
 QNR5p8ZLayjbip/iotdpdMc3WgfI2U3/Ol15I9Omoy3XqVXxl2JmbPPsIAna/0KjAuRg
 Iv3n66XI+kv5PTe9GHqF6KB3z+24FINcEOZGVHcJiY2zYz35FairvDyGt0hMNqGeshP2
 q72ZKF3iamR0EjbxeL8NDwndtNOhqnl5b4rKaaCKiVZNDVpz4ookKXFcT0rv/mLKyAF7
 2Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=YPDyOic9ndlrYyR+eb5Blzd6OKdmvHT/zX4AN5lbBHymtcTqYt812kkwQAztOWrLs4
 SbDqy/DT8ECJAw+GG2zLqlgQ3U9yUFnFnRTa+Gp2eraKMNvOdCB3dNnkzC8nVF4wMj58
 QgU7JgiQLBdiPZsqPGWPGpHE5NZngV1//0+Ffu5U5JdCmeI+2SAi8x7sBw9S2+Wos7a/
 mh6UCGeFAKplWa+08LuKyFUiyvTvZvLKhkJgugTRO/aVxHWM59c3P8hZROSbg6XsZ+Rz
 6EdIfeWSAChiApAZd64l4q/iwLZNWkro5eQ9YOaAasEua+owA2CWtEW+9lplk1niSIh0
 2eoQ==
X-Gm-Message-State: AOAM532hkPCfiDUiejvOTzz+bYwV+8W9Y9ZeeKQ1Rla8kVObzMKppwMg
 bTTlg4kVCKpFwpXFpR3mi0dOvRFRhcWe//gW
X-Google-Smtp-Source: ABdhPJz+NYL+Veci0Z/YV2BSv4ntKqILi04gXsEPOFg/FCyRiIInqPDoCIcyHsLvQapGsFmEtR4Zfg==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr4063478wmk.98.1611848329201; 
 Thu, 28 Jan 2021 07:38:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f4sm7425950wrs.34.2021.01.28.07.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:38:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 216E71FF7E;
 Thu, 28 Jan 2021 15:38:47 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-24-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 23/23] tcg/tci: Remove TODO as unused
Date: Thu, 28 Jan 2021 15:38:43 +0000
In-reply-to: <20210128082331.196801-24-richard.henderson@linaro.org>
Message-ID: <87h7n1ul4o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

