Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B781314202
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:39:39 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EFu-0000Kd-86
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Amb-00069J-Nq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:57:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Ama-0003rd-BW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:57:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id g10so19592415eds.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3hJ9hSMJjK8nAz66egGtcysgxhTiHZu0jEot1Jddpk=;
 b=nAncrx3tgNAe6MX+SU85Wpa3+liMNI3zOusx8u2ssh3OOzZPQ9lGk1nCK+9eCpf/4a
 jTB4d162KQ/H4jHOduxQP1/Be5Pu9h05YBRY7/90D6xrOUbz8Dx078bISiqNLNKpuaTh
 wHUhIIxp11H2/uJSZc1F8NgzywyhSI93iFfe2L74/ya3qiOwq8Ud1eAvHQHURVHm9Boe
 EhWsZDpail5Oim+0FNo3AGRTgoKa1xCy9VIrRjafKkW/7J6Ucy2V5IVjm0FiMOl8iACT
 oEkBqiioQmcjh5GxEYiIfxBQltBL8dJjNktkDQAWbTfY+o5ILTagIXptVXhAHnT8feGJ
 KsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3hJ9hSMJjK8nAz66egGtcysgxhTiHZu0jEot1Jddpk=;
 b=tAXK/eEXVpfADQXZy5/J1RLAIqECPzXJALtou79aXFUr3ldruKUyOpnUdPbs7doQvR
 vH3mHzcfWNC8KBxOpD79BFsYgQGP6SGH8Ojc/69o+7FAbzsqbjbwijdlfOx1sKTKYqjd
 +kkUbSO+nfat9ampWwtcQH/ncl/C1HY1fuS/2AucbRfzBC4EKOkw/Ntyk/Wbz3ANcXLz
 XXlwOLv8xPdKIJkUn2pxwSjzgN4EEH6UIrWcL7+iIzmH3cQtrerNpXqCfk5pJbIXbkA/
 0ojRjRpP6T92tGgzobP3AOhg+LVKrdqHgjKdPFYMktFXFoL31eD6y2y6NOBFJ8UPAipo
 Mt1Q==
X-Gm-Message-State: AOAM531cgad7zEp6QorVxdnlrlYAZQ4iW4S/iH36NpS1aleTLcbxthbc
 NA2/aqITtlHu+S2v2BKk+VW6V3AU6Wpb642Oc52Fag==
X-Google-Smtp-Source: ABdhPJwsbyWabGiTuM0ywxjqAoW1cJSeLPisF9GQMn7IOK8Bfgk8ShzZGhH/3Wwgd7U8MNFsCStwgQovPpvPKMcqWas=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr18188657edd.52.1612807026569; 
 Mon, 08 Feb 2021 09:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-4-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:56:55 +0000
Message-ID: <CAFEAcA8xFLgsOmFyfo+n1bwb8uR0S17C78biGsOGR3Tng=uN3g@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] tcg/arm: Implement tcg_out_ld/st for vector types
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 64 insertions(+), 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

