Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715403B44DF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:53:32 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmGx-0006BX-Hd
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmEj-000492-2J; Fri, 25 Jun 2021 09:51:13 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmEh-0006Oa-3j; Fri, 25 Jun 2021 09:51:12 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id t8so4720483ybt.10;
 Fri, 25 Jun 2021 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0IMeOdGsZTCCVrUxz4sju9pUsR52oH5+BxHo/THMcnc=;
 b=sFpuHT/kLfM9ql/jfZCe2DXMwXQGuxhJKexJBda4HAbA+doJU+sdUC8IFu2zFgnja5
 7g+5D1Kuxr68O2JCO67LIORn6t694mglJo9c1vPy5p0q4Nte5NdI70XX9nXhGuBnxFia
 w6rE9mKjxrK5HnKRW78JeJhwuissBdJ2LmLN7juM6pfbH8lATgZnIeDWN4ESnIDLIR4E
 frMfyR3SJlpL8s8trfdgsjcvoNXrXcbJ6p6tzWoMAQNTd6vWPq4dbVQ95/Cca+xbsYDE
 b9+ICq1BXbbKW8jL0rGSTEPXHTV6cUUyHTXwN9na7/p6AsAvFkzBjS9eBI+2TKxevPZu
 nncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0IMeOdGsZTCCVrUxz4sju9pUsR52oH5+BxHo/THMcnc=;
 b=m4sqsJ78c3LDwoUfobN45eN1k66TJpeECywwahwQmpNG5E2A2q2xxtMNRpUP/PmHuq
 l5WNn8XKrW3UQ9U0bwEt2Jn9+sZdPVpnGJZfRgoiuTglIK3gRLZ4G39A6+UI1Hmgm2PZ
 aAsaJPThDVOF3TEcF/k6xrJOSMO9+r3ckWEmJBzgGsZqtiq62VcX0wNf2Ufe1LpKv6mc
 6Pj0qbbQ7PXrOc/39rNxAqk0g1yLMxcrXRzCmIhqWJLzLiUS717ADTOn99ghMO0alM/3
 LLqJ3RFhNBRGby5aY/U5zQtiH6QOOYPi3z5WwMFXg/GOMg37LtBOxRrMD0nRPoHQIfUe
 ZuvA==
X-Gm-Message-State: AOAM531Q4oL+HxzJjkOaOvTYYkmQ2XsHwo7lztbHuWltpGssPx2u/YT+
 YeP2bLUuxoD82wy9byGUi2pEMVAUArJ1nhg660Y=
X-Google-Smtp-Source: ABdhPJyHYRid6ras7s8XLNSptY436A3bFzg+uWsFjkJXwm5pSZtdh55WKKBmGDY3H89L9q8y6epAJc+2SYpsknWtazY=
X-Received: by 2002:a25:ac86:: with SMTP id x6mr12128221ybi.314.1624629069158; 
 Fri, 25 Jun 2021 06:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-10-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-10-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:50:58 +0800
Message-ID: <CAEUhbmVNzLm7JfzTLs9XLK5H94PNyn=bo-4ywaxyJM697ZuwNA@mail.gmail.com>
Subject: Re: [RFC PATCH 09/10] hw/sd: Add sd_cmd_ALL_SEND_CID() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

