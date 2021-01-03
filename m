Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9322E8C1E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 13:24:14 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw2Qf-0008Cy-W1
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 07:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Lu-0006M5-Nz; Sun, 03 Jan 2021 07:19:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Lt-0005Wb-7c; Sun, 03 Jan 2021 07:19:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 3so15262005wmg.4;
 Sun, 03 Jan 2021 04:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LaNvVG/SlLmYkzmJn17HaiUusaZCNoWU1tvNcJsiMrQ=;
 b=uCGHKSs4DDtEK66bGwI24CL0/ZhELPlUoaKzYafegQiTgdZvCbEIwDOuogXINC+eNV
 X6VSP9+Y6dUuibvBM1Plqi4ycVT5HUyOtRl661uNWLT5LbpDYks6/Nqtih1eGa4c9guw
 wa7JwKDupsPTPTZ9HkHPaTzR4WevZ/lCs3zKLd8cDfw4TVA6LAVkbcvzoTg2V4TDAl4r
 Cl6vW/RVvZb2vQj97AwGFDct/qumWjRYc4zf2+/6Ua8g3kLGWZGAql8y4+RmDSpEN7jw
 EV7KW0O8fPpHXodZGy9guU7D10mAge+LQlqvuNt32XZ4Y5xFNFSPWX9bSVRWZhUNp7UL
 Cz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LaNvVG/SlLmYkzmJn17HaiUusaZCNoWU1tvNcJsiMrQ=;
 b=fh+Q58xynWRBkH+fx+W+ID1zBoD2p86nS+axy5GzCCBjIKCFjuUUOlNgjIn/PdV23q
 pWnPT7/5eO+1FPiAau1+gN1bBas2cLzE5beHbtcANRV1Oo3hwFFP4VZwjZwtuDfN0Cx7
 oegOw09nqN7wjWp34l7XgQhUWPfd9A+XIPdnMr/ORT8pwJxIuGUvqhBBjjOx0Rtyspp+
 Bn/9ZEQJajQ7fBlkDqeb1P1PSlJUtinNDjksFrvf7zbapdCJPXclmZdbiZrA6ISUkQMJ
 IEIDltudqdLWTFzEKwE9R+BMHmWHRGL9PCqKXFsaY0ukwlle6vwknZ+au4RHjtL7Lj2o
 R/YA==
X-Gm-Message-State: AOAM533RhcSEQMC+9Og6D9Nd3MRc4osz5wA+UxCsHT00pCUHDdITfuu6
 MzhJ4iFqN96X1X2iDHXK9bU=
X-Google-Smtp-Source: ABdhPJwM15loWlYxW++ggtFz+KfqRUSIi19hTsKSuEFiqyr9XCZarc9M0+wJ7s5NlFeQQSbQQE0PRw==
X-Received: by 2002:a1c:e246:: with SMTP id z67mr22771709wmg.166.1609676353605; 
 Sun, 03 Jan 2021 04:19:13 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id k10sm80608938wrq.38.2021.01.03.04.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 04:19:12 -0800 (PST)
Subject: Re: [PATCH v3 4/5] ppc440_pcix: Fix register write trace event
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1609636173.git.balaton@eik.bme.hu>
 <a6c7dcf7153cc537123ed8ceac060f2f64a883cb.1609636173.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <90e6af74-026a-19b2-c4c8-e263598541e9@amsat.org>
Date: Sun, 3 Jan 2021 13:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a6c7dcf7153cc537123ed8ceac060f2f64a883cb.1609636173.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/21 2:09 AM, BALATON Zoltan via wrote:
> The trace event for pci_host_config_write() was also using the trace
> event for read. Add corresponding trace and correct this.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/ppc440_pcix.c | 2 +-
>  hw/ppc/trace-events  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


