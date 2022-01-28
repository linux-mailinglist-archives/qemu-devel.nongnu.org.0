Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5BC4A0004
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:23:22 +0100 (CET)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVu5-0006QQ-Fi
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVpw-0004Le-1d
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:19:04 -0500
Received: from [2a00:1450:4864:20::32b] (port=51975
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVpt-00074n-P5
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:19:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c2so5064106wml.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LOWSBzder6+gdhAMEf69rIXZWt3hidfmqVqPOWHw48=;
 b=Ih8EUpPT4MiH6n7Ks7YHdz1TIcTbl5m+n5Q3wgXE3VBIVWkvzw8G3IfQXATMtdMnuy
 ppjOsj60O28FDHkkTQsekFngUwwm6fNilLGXZuimVx+QmMLM7R56P4gWjk4Dw6Kl3YX4
 suu0oATe1QYDt2jm5qGoihIPDsgwyoTktkyJf0q4kFMt4qa4ADjmwXAOj5uabSup8haw
 NwzICLt2ZkF9EbF+FrP4zwQvj1GkzpaxHak7j2jHTLNbcs53u0/5gwHuHRSCxMT+Raai
 LOfzSE5We/3LH+xMGAkT21dGegoj7RXnp2meu8CE/okKRODef4LfEX6Kg2UxLf2ol0IT
 dMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LOWSBzder6+gdhAMEf69rIXZWt3hidfmqVqPOWHw48=;
 b=h0JhXQnryDMEp0V6NGLl0UvOtBedysZx94YFuwUvt3IHKzeFZf5UHeFv9/4H/gWmx0
 lvrMaETrIIwWG9nbsWmV3OjcVxO10Mc+NnsgV+8zf5SLpDZDT8hPD9r8oZXxyBU097Vy
 FS8w6zu2R+T/w5/MRCdrmFCxB3YwO3KgeCoiSuwloUkb5SL6XULUGXK0mmoadcveGWGL
 40AV9WDGlY//n5oy87GAA6fDOLqF2KtZP4uorrn/H0MbTGSKjdINp48nHyzK/aBnL3pr
 Lkc6XWjDy6LxhYhlH7A2JC5ZuhRKbHfUqH8bmma4Hl8GFrJPjbvdjGzUFHLOKrWYyuh9
 i4tw==
X-Gm-Message-State: AOAM5303Kk6naGYPuorpcVTXajtb3UnNaatgDMJeK2Yc2p4tmk9YenkO
 Gq8SIyGATpfcdKRGCgk5AsAp3gTbsQkt7ak5uZwD/A==
X-Google-Smtp-Source: ABdhPJzUFl8D+kvpQbonO9DsnRPO93P+tQe7c4zgejikWX4eTUvlukoyMip3+bYLA81rAVtRf5Gvr/kDGYo884CIKT4=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr17255908wmi.37.1643393939646; 
 Fri, 28 Jan 2022 10:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20220127063428.30212-1-richard.henderson@linaro.org>
 <20220127063428.30212-2-richard.henderson@linaro.org>
In-Reply-To: <20220127063428.30212-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 18:18:48 +0000
Message-ID: <CAFEAcA-SRk=Bf9n2pcEtKg6m89e8Q6nmFrya1hOK5e7BDng-1A@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Fix sve_zcr_len_for_el for VHE mode
 running
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 06:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When HCR_EL2.{E2H,TGE} == '11', ZCR_EL1 is unused.
>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

