Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D80575135
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:57:34 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0HV-0003Fm-89
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Fc-0001A6-Jq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:55:38 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Fa-00068F-NU
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:55:35 -0400
Received: by mail-yb1-xb30.google.com with SMTP id f73so3599702yba.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 07:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MF5QBLsJoRUzRKP7lOB7cM5bA62ZVBoaqxX+YzV7m7A=;
 b=iaNozfGJGMtUJHYcCIlF209+i7CjFiYz3QRI8Yi4IlDozUn+aLEfYagN+8ey4e5DFK
 QZA63Gg6nguFv9172y2FQQ8p5849K1Ypo/tmz14NFMKQUg8MQ3Jv00eOCur8MS2wZvpD
 8mzYyPgu0DAegBSDkScGeGDFbY2rjVBPXrXgr6U40PTw7rpr1KmW3lee3CZmujcj+gK9
 XpSc1EJk5T9wIdrvTqKyWiNoDytM60iVQcK7Mia01pzOKLBV1JXBZDKbWhV2Kyp732E5
 ckH+9f5LuhDMqhT4CD2k1wJl4DzRLHyyR54i99qhdAkxtsGkNY1QoTKIROnhuFibVVXx
 IcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MF5QBLsJoRUzRKP7lOB7cM5bA62ZVBoaqxX+YzV7m7A=;
 b=E1I+w7xhlIFZvvsfKGB+0pmhvx1dpc5lavF+vJQWNGmZ0aLf8+ZBATbneHPVjAy3Ba
 JmgUdSYQNSzdTYQvYyRwd4TaWcu4z7eRq+thYbd7xiaX4QYr8HMfaJPMKg8JK2koXGts
 Dc7Q/e2YpTkfeqUSQ8ely/0MI1WYUcQ39W8IrERfsZd5Hgubeeb2kiA+1ZWzaEm7a2Gv
 jExv+VqCrioubDDd/BJO1pwuWJKUVFw6O1p84D15v7GjE2PWeYIbTmqxXF3NK+9E9+ZZ
 nVTP/Ao6YUEwwMwLNZVUsRsRoVUl/QNJstLi8NZtUGuRiZZbIEzrjW1co8cFji5B9IgT
 FTMg==
X-Gm-Message-State: AJIora/QawOzJj7wJwc8Za2r7NzhcCeUNzFF2AGxhaxlgeNtf7dAXV7C
 kIH2mD8cpw+CEia09AMx9dbtBSoFI5sH139HgAXAsw==
X-Google-Smtp-Source: AGRyM1uV1dGUUxgmD5wm2EmYBujuIBVLxI6XQeXtdsl9VGDPG5+Qps5pp/LdDgrC5ShE0oZCH3hBp2OZCAsRYSI3mic=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr8978176ybm.288.1657810533357; Thu, 14
 Jul 2022 07:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220711031420.17820-1-richard.henderson@linaro.org>
In-Reply-To: <20220711031420.17820-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 15:54:54 +0100
Message-ID: <CAFEAcA_E_DFixo95tSTFqicuJv9CMEZVDKtBE1QDeVy03R-3WA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/aarch64: Do not clear PROT_MTE on mprotect
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-arm@nongnu.org, 
 Vitaly Buka <vitalybuka@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 11 Jul 2022 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The documentation for PROT_MTE says that it cannot be cleared
> by mprotect.  Further, the implementation of the VM_ARCH_CLEAR bit,
> contains PROT_BTI confiming that bit should be cleared.
>
> Introduce PAGE_TARGET_STICKY to allow target/arch/cpu.h to control
> which bits may be reset during page_set_flags.  This is sort of the
> opposite of VM_ARCH_CLEAR, but works better with qemu's PAGE_* bits
> that are separate from PROT_* bits.
>
> Reported-by: Vitaly Buka <vitalybuka@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> My initial reaction to the bug report was that we weren't treating
> the other PAGE_* bits properly during the update.  But auditing the
> code more thoroughly shows we are -- it's just PROT_MTE that's not
> up to scratch.


Applied to target-arm.next, thanks.

-- PMM

