Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F34029C7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:35:17 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbFs-0002z0-DJ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNasZ-00082Y-D5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:11:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNasX-0000nr-43
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:11:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so13429659wrc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zSWHDI/J0tba1iIwegQEffJC/UcI1vvELOjPpqPN3A=;
 b=hmCggyGZJgfO0/nGAAO4runvTgqGDZ9sVbkH70I/yEPV/DrYwAe+QaKljXst5R2beG
 I5gqy0D0qFctAGX6/HL/L28EBl6PuYpDYun943ACONvq9Nypg46K5ho5xHVLFLN7WKt/
 srGqrgHAOum+wGsKdGpCnldKGvkjfzctLx83aedy9iuTFWPG5tD/VncZHYvFNjvh84+a
 fWjh+FsocMBIEetahvz+CfDpBSKB/CkgE9DSjTGBISwW7pW8VBJhLIQYmdLy7elYt8ve
 cWduA2+HqXVi7tEPRhjLvt9K5d4lZ8pttICBANQjqGdVp7lCUx6nEGSz/PuTDD6RGiQ+
 Q1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zSWHDI/J0tba1iIwegQEffJC/UcI1vvELOjPpqPN3A=;
 b=F/eEDZwvWB3ebqwgzUpIzMfUe7WL98ikbrqCwoiSeJUpIlcJeKmFBs3hj9QDHXviPE
 k/+zk3PafuQDSWIRnms7Gp1+l7Eiaxy+yEV3VuOWce1C8r4VolpClA5PPyRErpNVRViF
 NGhY/vvnt6JQngeMzMmcs9WSjVyd+8CmQuuJohMEd9FVcvtY4ks47lMuL/BwVdvkDiOb
 uFzSLAWuX3HqdUKIIOuDltAWoM8SqmlJ0uTOfrsVr2dDfHrvUlHKUwMKzNGnlXzV4AXo
 jt0gDsSnyHv34pw466fU2HhiJPQLCOJzFFydvPDgokxh6QqoBxxcDr24i9+f3KpACzEL
 8coA==
X-Gm-Message-State: AOAM530NW5Eg2xxsBeSUnzltbtuHx+RFzWYS8l9u38jPuCUBkaITAWD2
 bfip9PuH3I3g2G8yILb8bXzvFfoB/RMi/grrkf9uoiaIJv4=
X-Google-Smtp-Source: ABdhPJyumrCRsa2BLfgBChB/Q74KKhTrsPOQfS8YN3EduD8uuAnMKqxQqz8/4+7WPY2Py4+xBTXpL5GpeliVZFk9EoE=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr18541255wrq.263.1631020267547; 
 Tue, 07 Sep 2021 06:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-8-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-8-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:10:18 +0100
Message-ID: <CAFEAcA9B-YmiFrM-Ph3Vk_vbKmio18FPuPP_TArhz-2KGUeG-w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] escc: remove register changes from escc_reset_chn()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 12:52, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that register values at reset are handled elsewhere for all of device reset,
> soft reset and hard reset, escc_reset_chn() only needs to handle initialisation
> of internal device state.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 25 -------------------------
>  1 file changed, 25 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

