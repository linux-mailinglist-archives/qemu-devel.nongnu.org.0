Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4B6BEA6E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAPy-00069J-Jq; Fri, 17 Mar 2023 09:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAPw-00068J-Bb
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:46:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAPu-0004cr-LB
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:46:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ix20so5346261plb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679060805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aI5/+qbhXbb9yXfNr6krILKSD+1O4FNP+tPqZ99lLPc=;
 b=a84BR6tNGq/qAjsfekCdyNBec5bPstuYRnQlJCBURRUjIQ+9CCQp3zHgG9tDTt+3w8
 eRGepkEv7q8N1XOEMlFIhvQ25xEGwcTC1gweT8GUffWD5OUO1rQt9zjvGt4SgEkpK8NG
 v5P05W/rVL9zTXkJkGyWRsgH7JohrhAKg7a77tgMNZGapJrObCul/pNL25AcoaYV52kA
 PEq7NKRRfYF8+BxvVgfWiplNZsJTtYLeBLUTPvYSjMk7UueGd4AolafRx1EoiATH8TTx
 0jESGf6uvQEWUpW5G1OUPh8+299840fG4DYWueASHJgEV5a3/Vi6XV1LLf3kZLfEo5oJ
 Hz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679060805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aI5/+qbhXbb9yXfNr6krILKSD+1O4FNP+tPqZ99lLPc=;
 b=4NhqN/z6WZjpdrvUJ+cCUS8xy0kkd1Z25wewKMVkF+UI9tDgyrPdphGzUnUfNEotb+
 mkW3hDoEowGeN61mKHfk+/8GLhpfrxYUnf8Dd3cyw2oIPSAK1vWyCfl7sNzdeBPePofb
 DBYXUy+Utsyfl3qqoCwYvKsmtIBLFz/z2neue8S1Oo1nBLnv23KiMosNSD1s0faM4ADi
 ARPkYlEw1y5swGSFHh50n0MWxGiIMkL15HYn3GGxWheL//JRObHwIbuNDp7joGh+YYh0
 UGaPOhtKdPCTPanJM/HO7iQd53lCcNJD9qE47RLCfIMFNhfmNxSgpdpoDVxeAt2n9BdF
 OgwQ==
X-Gm-Message-State: AO0yUKWLpMra83l7XiHfwNxOsA9bpgbrzjTHKZyQ8/fPrwPw48r6/coq
 KKC+o2k28SDberc/WRdvbrTcm6U2xaezQwPHn+Y5XQ==
X-Google-Smtp-Source: AK7set9ycZu5ta0xbpcYJMF3sZwyM7+SFRcmCQjrNb+Iw2T0oLxCeP6qqW/YLGOFx+UkY8T8VyggSzoyRUJ7XpCisSA=
X-Received: by 2002:a17:90b:3747:b0:23d:2de7:717d with SMTP id
 ne7-20020a17090b374700b0023d2de7717dmr2378550pjb.0.1679060804891; Fri, 17 Mar
 2023 06:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230316234926.208874-1-linux@roeck-us.net>
In-Reply-To: <20230316234926.208874-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 13:46:33 +0000
Message-ID: <CAFEAcA_jcAaSdfF1CK=EW1XgzuFBiVvK8t1dGjobRahQWkw64w@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 16 Mar 2023 at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The i.MX USB Phy driver does not check register ranges, resulting in out of
> bounds accesses if an attempt is made to access non-existing PHY registers.
> Add range check and conditionally report bad accesses to fix the problem.
>
> While at it, also conditionally log attempted writes to non-existing or
> read-only registers.
>
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
> Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>



Applied to target-arm.next, thanks.

-- PMM

