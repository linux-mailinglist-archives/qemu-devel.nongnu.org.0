Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526096E46D2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 13:51:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poNNO-0008A2-RD; Mon, 17 Apr 2023 07:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poNNN-00089r-5b
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:50:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poNNL-0003d5-Lr
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:50:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so37432f8f.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681732224; x=1684324224;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6D+S8cdJTKrHl9SKH3TvoEODOOhtMlr8HA2vdGCTpE=;
 b=aeRKUi3F5iGF5g0mxEkTfaNHCeKw1McAL7gPimgMcu5gbGLaAx+lv3sZ4gJd3Y2OXU
 gXhMLE96peO9UF1AxkoDvAoGKIoWVMGpTvUQg6MAj4YvuvQNM3S+jvpe5oTDlg7Cl9Tz
 xrjj8CKIZgy5xkEEbcJzvlGUzyKHYkbhtNozXcH7AMndUq2iM4Z1Ql2w+cL3Nx0LKGHc
 8qycMCFdttrdlNANjyqOFK0hh81uT/pMqnileY2BN+NYJfDqiPOWv3Ve0agi/Pxf7PUo
 gKzWOqPyz/V1tX73eMEvS2T8RnBFYoD9k90sYJ6+kwwbOzNV3LenZRuNch8TxVOLSHya
 BWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681732224; x=1684324224;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U6D+S8cdJTKrHl9SKH3TvoEODOOhtMlr8HA2vdGCTpE=;
 b=DJsz60UJm/lnuQaubxBZfftCLz7uVV8se6oNZrRNPeqwegEhpEP7XcX/skdM7Ws554
 8HK4ml1rVrLEsh/7FhIEjPFzpKlX6dJKSarO60brcxvmlPrfI3tjhPoUJCohrZhl6FIp
 ww1LNnRA6qr4Q2h4iyrUVgBifXnNPiSkButnlL94yxqJtLDw59SBUp2icx5rbDWxiO34
 r2PMZNfququmkqdalNfFpW3/iwQrfX6N1IfdyC2YaT5lZd0DpvBpwsg+ue8HdyY8a9d5
 Z+6XWZtpHCXxr08OCsZmB9uz3xzbbwawf7YTKojzA5prGH5lIEt+7WMXOKCoxIeCXoLU
 26WA==
X-Gm-Message-State: AAQBX9eeZ4lU8ax38XR1rXPrHTt6250/uus0anJwrDqB77KamnVO/KcC
 O7KGPoVZrO30BgWDLoJa3x+SCA==
X-Google-Smtp-Source: AKy350aQFnMM40XXz/S0XqkJS7/szV0VkJ3kS5s2kUMdoJraboz4MR2QJov60nahER/GFBPFRxQeUw==
X-Received: by 2002:adf:f505:0:b0:2dc:cad4:87b9 with SMTP id
 q5-20020adff505000000b002dccad487b9mr5932428wro.68.1681732224047; 
 Mon, 17 Apr 2023 04:50:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a5d55c4000000b002f74578f494sm7959381wrw.41.2023.04.17.04.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 04:50:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6771F1FFB7;
 Mon, 17 Apr 2023 12:50:23 +0100 (BST)
References: <20230414145845.456145-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Eldon Stegall
 <eldon-qemu@eldondev.com>, Camilla Conte <cconte@redhat.com>
Subject: Re: [PATCH 0/2] Improvements for the device-crash-test jobs
Date: Mon, 17 Apr 2023 12:50:16 +0100
In-reply-to: <20230414145845.456145-1-thuth@redhat.com>
Message-ID: <874jpe918g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> Improve the runtime of the device-crash-test jobs by avoiding
> to run "configure" again and by forcing to test with TCG only
> (instead of testing twice, with TCG and KVM).

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

