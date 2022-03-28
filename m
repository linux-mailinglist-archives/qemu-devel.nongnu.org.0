Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0D4E9B33
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:36:04 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrPX-0000vC-8e
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:36:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrOY-0008UX-F8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:35:02 -0400
Received: from [2a00:1450:4864:20::531] (port=33414
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYrOW-0002xj-SS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:35:02 -0400
Received: by mail-ed1-x531.google.com with SMTP id r23so17418230edb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+5HTsyRDEowb3xQE8GJrMrG4biHBaV+tuKKge6LbmQM=;
 b=ILnq0rrpaPQ8d6buIHRSSFqeUg9znZIQhO6zD6oT8MBlIXQ0yPMtcE7mcYkKj36yXx
 oRWwGzp0g0eqGslgiuo6TrhKdEdlyconyKbqi39aKa2V5SDfkuJNozxTcNGQeQ01+Q0b
 iT/aFRfDmt8gQo/ZzTP0LDloy6IISZNGJMu68dU/Vvp/VBZejB+iAc0tpkphQtH2gf7j
 6hcA6AHzXWKlzWl3Wun97nolzOw4HobRX9SmcvNg6MTVeJgS5rCADjHWPbLxu/fAM709
 NHon6aVtmbCIq6JkqmlHecIkTl0c38DZE0Eo0yaGzhQKvn+3Mxq2wjkD8ZC9HDT5acOh
 +pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+5HTsyRDEowb3xQE8GJrMrG4biHBaV+tuKKge6LbmQM=;
 b=4JPefJGcSHEOiqv0PvvE85WuVLwzJ++kmH/MFvp3bpluw8BEP1lhl6FPOzRJiuG+JY
 3Mtot6sI/WVqENPruTOK5AVv0DpnszA/Pgj5Xa136DiI9j7pZqo6tS9lWXu1uUyUFdU3
 TMdocRmlgecpkCI+ZwdDxTSduyvRcLuLmxI2gPww4EBH/snVrb7DrHz0n2Rt96Ad5y2w
 5VHv2Ra3AOWzWlr7MFu/1lIed3HbiALpbfB3Zlo+nCjeHpU2I7Rp9g2Y+X532SOxnd8j
 eAp3jhR/x3y62u6stc+sdwWz+s2wfxt2v3qq52ZeUj2dEgRz4b1mb27Mz3JxDs8KDWEp
 6YIQ==
X-Gm-Message-State: AOAM531IJN23Vs3lI7wAbzqFglMDIx/DQc65TbUqZ6vD5IURvaCK80fl
 6uZ/6JLOssibB6BXwRWFxnhNSg==
X-Google-Smtp-Source: ABdhPJyql6yXSHn5ei1IHUjvTa4LCOHA6rmFzPDGnSpcvUtJj+Rr2XBBLXx99VyBs0hqxK19CUMe6A==
X-Received: by 2002:a50:d90f:0:b0:418:8a5a:14b2 with SMTP id
 t15-20020a50d90f000000b004188a5a14b2mr16890595edj.241.1648481679629; 
 Mon, 28 Mar 2022 08:34:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a056402049a00b004197b0867e0sm7106382edv.42.2022.03.28.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:34:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD7161FFB7;
 Mon, 28 Mar 2022 16:34:36 +0100 (BST)
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugins Not Reporting AArch64 SVE Memory Operations
Date: Mon, 28 Mar 2022 16:30:32 +0100
In-reply-to: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Message-ID: <87lewuxf8z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hi folks,
>
> I see there has been some previous discussion [1] about 1.5 years ago
> around the fact that AArch64 SVE instructions do not emit any memory
> operations via the plugin interface, as one might expect them to.

To help I updated one of the tests and extended the exec plugin. See:

  Subject: [PATCH  v1 0/2] some tests and plugin tweaks for SVE
  Date: Mon, 28 Mar 2022 16:26:12 +0100
  Message-Id: <20220328152614.2452259-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

