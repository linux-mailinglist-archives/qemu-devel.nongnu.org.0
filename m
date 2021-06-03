Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE039A327
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looKT-0006T9-HI
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looG4-0008U8-Dq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looG2-0006HP-Un
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so3809092wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=PpoVGMEy+lb5zyy5kuZMbIWR2Q5AzrmtxLDsU0zUTNYFEF2OteQpIGSaM91xVnypgu
 3VX8PIORQi+ifFB03A68BCYusF0XQVc+NxGfL98Oyk8QLyXbnkYBFyNXPstupj06at9U
 p9fUC7MaKdzBD5iZPuxvi97cDF4OzBSwfCQAmCUgA4qIU+5ouV8wM5TcQwwMcstZXumW
 PbJLOdpEqF3LezPOKGGrGKOhap7ICRgcSYMK4MbzPKhqg7ZRo3A/ax0suT2VzxcORRwG
 84pyzAXUzD/SzPlHM3Fd5AskFGwYM8WnDu9nn8Ra0k5OVECSPlk1yRyfXxFY7RXl+xHK
 ZJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Dq7EPGkJ9fMmbRasTILGbaUnwBWLJzu6AvAunSa7nVMuIWhmhdMAPK0txBFlGdK/xN
 y4ZFRKDYjYMSs4LAYJBjZCIACCjdS5SzH59+X0gmNKxwxuAiDcXtjvilA+GRlrAB4GH8
 VCP4CsJJ/tpcb7bWNW244XXDXwR41Ewq/oW8avS54JCA9vVwXgmq6fsJYA6TjP6ZOCo5
 t/LYUDIFKet93S++xVHA+V7N/UDB1a0S4CEbcoR7rSq7hvb3nRJ3T3Rm7AOBwSXHlHCm
 nEb/mU8dsF6hcyfl5VpNakhUFqg9sY2uSMndjtWYOUKMFL1ucTpWaHm1LfZjKzeNTZv5
 8Wzw==
X-Gm-Message-State: AOAM530wea6UrkGzfI8pG/1HAuZPpSpdc8RDy0KHrs4OK1iIPXlMkzWA
 woVvhEIKkWHYzvbrnUQxBbnkvw==
X-Google-Smtp-Source: ABdhPJyxyfpZmS+nH/Ez6gZBODyMWgfXqmE8T9lus2N4myZQrFwvso5jY4Bigg4u6gZnQDAwFljqAw==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr15795112wmh.149.1622730217586; 
 Thu, 03 Jun 2021 07:23:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm6027339wmj.8.2021.06.03.07.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:23:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7D7E1FF7E;
 Thu,  3 Jun 2021 15:23:35 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 14/28] softfloat: Convert floatx80_mul to FloatParts
Date: Thu, 03 Jun 2021 15:23:30 +0100
In-reply-to: <20210525150706.294968-15-richard.henderson@linaro.org>
Message-ID: <874kef9gd4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

