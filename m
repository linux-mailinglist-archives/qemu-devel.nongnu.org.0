Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81B59E490
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 15:38:03 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQU6U-0003H1-MX
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 09:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oQU4h-0001kM-RM; Tue, 23 Aug 2022 09:36:11 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oQU4g-00088E-43; Tue, 23 Aug 2022 09:36:11 -0400
Received: by mail-lf1-x12f.google.com with SMTP id d8so7326144lfq.0;
 Tue, 23 Aug 2022 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=etxdXJSiqWVGWqlaYS9qn+V1MzNMcE1a9d24UawYB+s=;
 b=Tn6KNKs7/qjIcAtldamvnW5FedQl0MKOzmcCn8GtolLQJ0/b6FJ/fHIE9yQ+DBpBAr
 GXq4FMlaKivu0L8PFlTqNHd+iy5bK82fixGBJ1pSyYkuSBqGjcoI1lMR3uEo2T6bhWRe
 Y3/NAUVZeVIGJMPPqBo5fDBbtyPowXI1lAyexrAmyaEeejSLCOmXqm+V3hWDFKATutxt
 4AewmQA+N0PvazHUqRZR5Xoo3qqrp/7J0w4p/NOfVXWgmJJjzZUtnn80vzfaEZ23OS14
 glrf3+1NIGNURyGhQq5Rb7GzQ1fDpM6yoObJhl+b59+ZT8TwliVwiG1GxOljXZSpY7/9
 EUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=etxdXJSiqWVGWqlaYS9qn+V1MzNMcE1a9d24UawYB+s=;
 b=Oa2LrnoP7SEio/3eXzIm/3HN6fkAEQ/Gx4UMAmigiNJxXL93dpx9ZVq5+X9c+q1dod
 mfBc8w5b//Dj4EdafEaSvJIvZXYH2DZaF7YQg/B4zfH3Bu+dYhiFKl+RpqsT/WC0SE6r
 ATSTnd6Q2xSsCJSttbf5KspwXL7Uz5G2W1UPM89cvyuB4nmu5hU4UkIbnpKjsxPflOiO
 EtNAiYGbW8BnTartivZa3Zm/LxQmxMwDm24peXlSfd2VyKfsTgZKo7kG6WXjqIMmBFt7
 pPxHT1MoDkY9Z7nYtDieeOnTq32eAvjQR2KPMRXa8G6wjVjlMJQ/I7GLKSJNp4KsrKPO
 Tpog==
X-Gm-Message-State: ACgBeo2zkpHW+RtkE5ADIJQnpcIpdgp9Ejw6gbtx3doX823PWNkpAbXN
 GupZwL6QWSurV5zLLF1AViaFmqM6Skcj+JAw6uc=
X-Google-Smtp-Source: AA6agR4m/H8nazomDlAs9y9GuLfHl6WQAZdEykh3eOFcJGUW+hE0ZkUZqiVK7ckouo3Xfp/fe7BepbiDqNhmVtTm0ws=
X-Received: by 2002:a05:6512:22d4:b0:492:e426:783a with SMTP id
 g20-20020a05651222d400b00492e426783amr3331207lfu.64.1661261766650; Tue, 23
 Aug 2022 06:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220822125320.48257-1-kwolf@redhat.com>
In-Reply-To: <20220822125320.48257-1-kwolf@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 23 Aug 2022 09:35:53 -0400
Message-ID: <CAJSP0QXubinqR=Ep4mVwpxD2Rk576aOAnuwHbnFz8Gww+vGYoQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1?] scsi-generic: Fix emulated block limits VPD page
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, fam@euphon.net, 
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=stefanha@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 08:54, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Commits 01ef8185b80 amd 24b36e9813e updated the way that the maximum
> transfer length is calculated for patching block limits VPD page in an
> INQUIRY response.
>
> The same updates also need to be made for the case where the host device
> does not support the block limits VPD page at all and we emulate the
> whole page.
>
> Without this fix, on host block devices a maximum transfer length of
> (INT_MAX - sector_size) bytes is advertised to the guest, resulting in
> I/O errors when a request that exceeds the host limits is made by the
> guest. (Prior to commit 24b36e9813e, this code path would use the
> max_transfer value from the host instead of INT_MAX, but still miss the
> fix from 01ef8185b80 where max_transfer is also capped to max_iov
> host pages, so it would be less wrong, but still wrong.)
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2096251
> Fixes: 01ef8185b809af9d287e1a03a3f9d8ea8231118a
> Fixes: 24b36e9813ec15da7db62e3b3621730710c5f020
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/scsi/scsi-generic.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

