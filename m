Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF05E7FD8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:33:34 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblcK-00009s-JY
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblQ9-00051l-NT
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:21:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblQ5-0006mN-RN
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:20:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t7so728599wrm.10
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=YbtNibdoTPC7M9/qe+RO8L0VKcinkzfGYY9gGjtvNR8=;
 b=MsJ0bvTkdREWcGVkS5EynzLzisOytJXwGoqVA5MI4ipyWVrwcBJWpubXE7U4fSOC0I
 tFX8g7ugPNlU0vv6lkYDGcpeptPmo/UPL58VsUhsO2rj3g/BbNgVH8mA0yY081dqwPrv
 LWplVHw4JYV+mKWI/VHaouHQDq+HoNvactD+n7YZxLYC5aLy7qR/Mjj9TwWys2XUhiVB
 ZGI5GGMMsaQtjxilOMfr+JtEJsZbT9OWuTU3070dl2yIp+WQ+3piQGr8ZqCkFb+6izYC
 FBeDNt4rr2OjtRgN9UcNpVkJSSd6YQTCPqkovDG2qlc89a3raJAyu3ZCUyRnMktPr4R1
 mbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=YbtNibdoTPC7M9/qe+RO8L0VKcinkzfGYY9gGjtvNR8=;
 b=wdbH5DMQDIpVEC1NVQwjKIxJ/Jl32Ghbc6L9oKVvIhcwti0GZrvqabU95yGZhI3Lm4
 X/mov7RqHBATq1hD+qKwspDs+rUYHn2sryXquaDx+LaIM4nLQrV+XBunsL5RzKdiX/Bo
 ninw/JZgTtQtWARPNRR9kbTj1qTK/+KAUbyD8/N3Y1uQI/eGLJX6iG1dBmAN9KRVJgaQ
 mTY86Ko/U0CNgSygv6caVhhtMb1eQ2cQMH0eVL6BYnH0BhNy1eBUwjkYmyw5QmYqTk5f
 CEFIfze28ZPjUpAv/GtSaoxiGlU20d3h7D7BdS7jt8/aVliJTs4VsHdK0ghMuWAGMqfN
 trRg==
X-Gm-Message-State: ACrzQf1PboQHaOmi2h8acMCGwuWoRRRHqPHVRVCLEiZe8hgwRbuxICe9
 OpY9GN0ubMt63pd/HU7hISlZzw==
X-Google-Smtp-Source: AMsMyM6e1ZI14BdC4w1Ser6+ufmurEXBd9inS2R5T7YAxrnhI4WePfBffYZf2ZhAtxMrEZjcj3DDhQ==
X-Received: by 2002:adf:db03:0:b0:22a:dd80:4b45 with SMTP id
 s3-20020adfdb03000000b0022add804b45mr5621772wri.111.1663950051663; 
 Fri, 23 Sep 2022 09:20:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff510000000b00228c375d81bsm7833752wro.2.2022.09.23.09.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:20:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5321A1FFB7;
 Fri, 23 Sep 2022 17:20:50 +0100 (BST)
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-5-bmeng.cn@gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2 04/39] semihosting/arm-compat-semi: Avoid using
 hardcoded /tmp
Date: Fri, 23 Sep 2022 17:20:45 +0100
In-reply-to: <20220920103159.1865256-5-bmeng.cn@gmail.com>
Message-ID: <87y1uauknx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

