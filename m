Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3A60B486
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:50:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyrn-0007N8-U8; Mon, 24 Oct 2022 10:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyrk-0007Mk-2t
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:55:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyri-00031P-Io
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:55:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z14so3157631wrn.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0Q2mEVIkA9rbXqhs59XDkKglzq3QA0FKB3e2lZPaCQ=;
 b=y+B9mEPc3NHfDXgDzP8oaUBRQpwjcyBxOL4870XuEx6GYk/DmHsZSEqL4ldNOLoEUI
 Xvgdmj2J8cxQkWpU8uTlWBjGeARrK+nN2dTbeOCPadjCJf1LM1wRruBIbx7RmPE2XXQm
 +LvqsJcuOM4ynkUP5504g7/q+liuZobmbxPqH4ICQoPO05Yh/MMes23i17lIFY5kikps
 oW6+dewNI+FnwESQCfCq/W2ZIP0dPzzfQfRtux3YxiwCgUgvcoTelgcUOikLD6+q3Y4E
 ho10UsLY/lQ2jNbrs+h9IXZqD7NdDVPR4FYi/HKg5ZIyJ0H1fHxyhLP6o9tSNZSsFs6q
 vBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L0Q2mEVIkA9rbXqhs59XDkKglzq3QA0FKB3e2lZPaCQ=;
 b=sIMQYCJJ2QFoTAWIWVeu/mmtbKGD4kJKaCW5LqcJdN41R/Vi05luRHFUkG6HFjT+0D
 pDzn/P2O3JZYQQVWbJgPYA4QbNKUoD6DjiSgwoEnQwqzXQV5jHIoj04hV1YXJXWfGNFK
 1eQYVeKw3vv3NPbPxss1iBspGQU3Ssg2xYqmdLgQ+M2t0PcAipKfmtV9q5GefiqvxVni
 yQcqhu2fos5OKr4ljtWuZQMQGlEEzQ8LrE/3i2CNTL9GzPa0RvToY/5dVHbYVIm3QUbR
 5kX3AP4GQTppYZLgB47pooM/Kl84cwGQOC0gHDrMYkIi4dPUg+SztxzqMtkf35mqtn4O
 WfvQ==
X-Gm-Message-State: ACrzQf3ldot3IM3GYyDyN1/kdNVubizc/QqNWoWMNka3/8ksVOzSWYMt
 +XlsGgIUq3fc9ZvAaxuOSBeJHg==
X-Google-Smtp-Source: AMsMyM4TTFxP7pDOE6FWPzmYrHMZ4FePxalIdB9yzqVtH3Vh0CDAihvC2Dj7iCx+TwCnoJORXasmTg==
X-Received: by 2002:adf:9c87:0:b0:232:a0fb:ea5f with SMTP id
 d7-20020adf9c87000000b00232a0fbea5fmr22363303wre.473.1666623345084; 
 Mon, 24 Oct 2022 07:55:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b003b31c560a0csm149555wmq.12.2022.10.24.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:55:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C91B1FFB7;
 Mon, 24 Oct 2022 15:55:44 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 08/14] target/arm: Fix fault reporting in
 get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:55:39 +0100
In-reply-to: <20221024051851.3074715-9-richard.henderson@linaro.org>
Message-ID: <87bkq19spb.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Always overriding fi->type was incorrect, as we would not properly
> propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
> Simplify things by providing a new label for a translation fault.
> For other faults, store into fi directly.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

