Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56A2E0216
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:36:56 +0100 (CET)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSrO-0006ZA-IG
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krSq4-0005yS-7Z
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krSq1-000777-UK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608586527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2261QGOiE97FRV2Y6ZYM4DpnXymMtX4AkIdblx5Jb38=;
 b=XBcMzzZEsqnBFJboRp9oFuoYaQhYIe+jjG/FLvbg9TJp2O8MFD2ZsTFpfaQW4/YscqtMfw
 0tS5Pk4Hk3xQp7AKm8lhnm/7rg9NIVOA98NEyfz4+So/CJ0BqXV51yeq7wS89vODa7mnO/
 IjnOsjzDrFIWQkLw+wn3LhX8a4WsXMA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-N0I46l--Mjeqi4l-yTdfWQ-1; Mon, 21 Dec 2020 16:35:26 -0500
X-MC-Unique: N0I46l--Mjeqi4l-yTdfWQ-1
Received: by mail-vk1-f197.google.com with SMTP id n24so5031881vkm.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 13:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2261QGOiE97FRV2Y6ZYM4DpnXymMtX4AkIdblx5Jb38=;
 b=kdEB8ceGtcwGAHqPiucxZB+/iLrWpkKAaFEKn4xoBIhAObza9Ljon7wsTgvXJlBopV
 KMIBDPGIfCpElIQryXkMKGljkX4BqIvzXUS0VeMW2hnKFKCYPBAr8ztvihWpuYeDbXXD
 D//YAVt2TXqMLnoP8w2vBF8dPml++v/bqO8Lfe8IcDi5DmGOstB6z1dsbTCgPyZEbU0O
 hNKwUpgB3aSe4LDWnpfsv+L9UHJfCuQQkoyGqJy0MDYFuq0UzOF/xUtkxzsZ902MGcbW
 7DCpTnxsokEFMIUlQiXrVjA0z8kX0RcAZ3KMUXQ9S2YdzBjFVXftorZiuXug2jNZ5YFa
 5KoQ==
X-Gm-Message-State: AOAM533dGhA3Q6GzQQAAhsj59PEclS6zHvqFOxRnZ95PdtekIu54Dv53
 UhM86GP4f5KHbgVyY4FGyot8o4cXg8G9OTSpJZL0pTM7MsRRGlzVYO4yTVjaaVY6SNkYneP+jcd
 +DIlFiWkGV2+NxSDwIlE4VS0I3u0M9jg=
X-Received: by 2002:a1f:4ec7:: with SMTP id c190mr6712536vkb.11.1608586525993; 
 Mon, 21 Dec 2020 13:35:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD3SFuTBOGIbi4fqdUCOUjlwMI8MXU7iZtJGLlmFaR/NCj3BhTsyicIwdUJZhRNB3v7oagU+PPLPiMnY2v3GA=
X-Received: by 2002:a1f:4ec7:: with SMTP id c190mr6712525vkb.11.1608586525800; 
 Mon, 21 Dec 2020 13:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20201219072326.40157-2-jiaxun.yang@flygoat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 21 Dec 2020 18:35:15 -0300
Message-ID: <CAKJDGDZ06E7YyHGQukxTZu9C6hMvXsEwS27CWkvyT8g7jwFgyw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] tests/acceptance: Test boot_linux_console for
 fuloong2e
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Cleber Rosa Junior <crosa@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 19, 2020 at 4:30 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> The kernel comes from debian archive so it's trusted.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


