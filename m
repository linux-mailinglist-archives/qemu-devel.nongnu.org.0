Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F1F68DBCC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP89-0006vK-Ih; Tue, 07 Feb 2023 09:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP84-0006ud-2A
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:31 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP82-00010H-Cm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:39:27 -0500
Received: by mail-pf1-x42d.google.com with SMTP id ea13so1621482pfb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xov3D//lbSttj/dl7w5xfGQoQm7oQvnujndYV+lF4nM=;
 b=XgWFOnfhjImgQV6G7eTKgaN3UTz+u00/5bdBLGUIOQmkBC6Vj9dQZrvejWaAdwMDU/
 MAXbG13o9FkG7cKZOIAI6XPUD7fC48GhvCdvNnzXUgWP3uIUTUFiS9n2B6i8umS8kBNI
 LdI0M5ec/cqOeuwo+DI3dKD0gW0SW4thvB++yQqQvWArb9HLf8LWcZEXOXNdQgqaRQVO
 NdI2Wy9PBLNipGGd3lI688NGznL62qkcRpaFkUk39/6r5u3O7H04iUKXZZcwem8h0OXM
 ZSFVXp4ABEGsuLqvH8zwlb1q2BXZ+GujqUn5boGxEUSqn95aJTiBpEad+mAOGo5/UhGc
 imbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xov3D//lbSttj/dl7w5xfGQoQm7oQvnujndYV+lF4nM=;
 b=xAajVtS0cDmnYwnwABn7VtQWUeWQjrN+OkpIcbXFzNTXt2v5YHdwE+mnJ9BRxbU/Lx
 UEeWeJaCG+5UVRbcahCdCDb4LV8E+rLnKTOe/bWUfZGfl9T16Zj6cPfLG6D+NIX3j65L
 7AgMU9Sg0NUZ29j7nU+743KmwhrouLaH+Tsrjm/1HrzIpiMMmyXtbIVQ+2eYomSnkzAZ
 oths6wzVet+pGx7+deAAZhH03ep2gEVjm8ehVLm3GUfekd3lBShD32snzogrb5vy1TbY
 1edJ/gCpfhE3PH2EsjjGJepQy0nrQ5wkcHo5RGMtmEX/TWCXz3O9TX/lL+b4CymtYTdT
 dJ7w==
X-Gm-Message-State: AO0yUKVWOJyVUX6aTgEQM58mgVu2CagniDnFlhZGWIIjTu7HmdUqz6lu
 P1ptHJoT+uuZAwktHsF7JQASsfXcQjJ6APDe5u1gHlNxyFs70w==
X-Google-Smtp-Source: AK7set9Uo9o3XtksfdH/m+cBO71lMXmohx/KSHADMuZEztOhUAzJ8tJrLkpyf5TNnOCVRmWvccSMHUVdjjpK90sfMGw=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr310934pfq.23.1675780764864; Tue, 07 Feb
 2023 06:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-6-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:39:13 +0000
Message-ID: <CAFEAcA-Ehp0NFqM3m8m_G1E22THR0ojTmRrnoJ7dB9vUsRvx2A@mail.gmail.com>
Subject: Re: [PATCH 05/22] target/arm: SCR_EL3.NS may be RES1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 24 Jan 2023 at 00:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With RME, SEL2 must also be present to support secure state.
> The NS bit is RES1 if SEL2 is not present.

I couldn't find the bit of the spec that says this --
could you give me a page reference?

thanks
-- PMM

