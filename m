Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D62A675BBF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIvMr-0007Pf-Kn; Fri, 20 Jan 2023 12:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIvMF-0007E1-8n
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:39:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIvMD-0000VE-R2
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:39:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id b7so5509067wrt.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 09:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2l3hBLnWs+vux4f5dvuhUR9kIENezqJvzMzamhPAisY=;
 b=QyjQLM+eg/MUC60AjASfQhIyX1LVOOeJUcNYqNWBrcthekZpyvXSRKes1PYVvZ1Wkw
 m2dyaFK+8g5EHm5ct3Iyy7WBCEj3dDjjRQ9lVENl3S3HmQD2ztYKey8O/VYKsZmLpyFW
 bfJvbvrus5Mo9/jtI4+jHGhf6ONtajyH04Pr3LOlgrYhv2EEUso1VGpAZ3+UytUSmKqO
 qI++KpzUd4wP/hu3QWISiWFEjq4oS2d8JChjFQxfdy0OrSOdgc6vgXA9IXztn1VIquR1
 gD4FpRX/E6vhGQiC/EkdfT8zCkDXkaKpZsFWiAjb9y6BhsP4zSqx9DLsv+xhR2xKcOzD
 oNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2l3hBLnWs+vux4f5dvuhUR9kIENezqJvzMzamhPAisY=;
 b=K1osKKT4XijNKe5+cHaxR0Xdo0oXb9BWNsXp4lmJot3n/fYi2sD4dPjGVCbidX3M0i
 0AFQcSeogvC5P2DQ9o+WE4gFsKtN2azBHzX1mTLzaM/R1mCQMayOcotXAeOzxRmNwfOz
 Zkvq3FApE1U00BqBWxMiWlAY71nm6PVR3CAPRrONzT61KU5+uyl7SN9aJiGe8i+0aHyj
 Q9z66AoUvHH0dbBXnAF+W9Y7ha3aMkr1rKcpg0N4oN4KDZLTKXUstSt1NBzdsDmJFt8r
 GOy3boxF5aoGxHuQYeAtbnB3XV4eSnbkljRgwoCdsRtXdv+WQgKOxp9w0Emw4oBGLxhR
 BAgg==
X-Gm-Message-State: AFqh2kqroYA1Hv0jKYV7+v2NScxa0NGeXWiJkQ9jRLesTLGrEtHB1rZO
 +fL2lwS/4axrnkBUqpCnM5YjPjagsoKlLQ8m
X-Google-Smtp-Source: AMrXdXvI7bKNpKOfmLbPxep3E0drp0fnngJYHhTx0l3VvAWmFc/46RmUgxBrPSzm1sayHsQ1/ND24w==
X-Received: by 2002:a5d:4cc2:0:b0:2bf:9473:a6f2 with SMTP id
 c2-20020a5d4cc2000000b002bf9473a6f2mr1669495wrt.21.1674236355881; 
 Fri, 20 Jan 2023 09:39:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adfd227000000b002bdf3809f59sm15963106wrh.38.2023.01.20.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:39:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 070AB1FFB7;
 Fri, 20 Jan 2023 17:39:15 +0000 (GMT)
References: <20230117035701.168514-1-richard.henderson@linaro.org>
 <20230117035701.168514-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] plugins: Iterate on cb_lists in qemu_plugin_user_exit
Date: Fri, 20 Jan 2023 17:39:09 +0000
In-reply-to: <20230117035701.168514-4-richard.henderson@linaro.org>
Message-ID: <87lelxw1fg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than iterate over all plugins for all events,
> iterate over plugins that have registered a given event.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

