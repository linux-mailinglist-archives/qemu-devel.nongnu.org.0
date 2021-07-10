Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037963C3471
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 14:12:18 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Bq9-0007P8-Lg
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 08:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m2BpD-0006f0-Nz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 08:11:15 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m2BpC-0006ZH-AC
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 08:11:15 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x16so5586500plg.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g8zsFu5rW5azZAh0KkZmLRtLk/zohaM1eAdPEwtqz6U=;
 b=Gi3Ohac2yIvB6cOBkGycp7PenLUxDj7HRLEsJgdNhXrRPwXIHiI42eeLTE7I370m/5
 CjzfxfMF+5dgi76S9prnGTTvQS3BZiKeKILT/r1Ez7t6UzXQdjjrnQ7Ox6P0BdhkI/KQ
 7KDU8hXa42XdHWY1Z3MBxwAsA4/qinOc2Gvc97EJ6R1Scb4baKifunZWeiKhaY3ZZ5xR
 Wl5qiaP1hJTbWmM8Ox8xLTI4dyJj0qrMm3hR0uqZtS1cxDJpJ+a0eqi1ixkB7NpYLGp/
 nNGR5bCGOv5sil5h0QduPf30OjEbfOXfAhf8J3kR2xudpB/r2xLSwgSUvJhu6BYT2guf
 zQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g8zsFu5rW5azZAh0KkZmLRtLk/zohaM1eAdPEwtqz6U=;
 b=ZRXJlmocwuDDvbw08waIQpB3rDWgbaPnZQK78fFBhHB98sTIuEqiYV0bFU3Z/ScMS3
 OfbkDduLK6ZEIS/EsGlibHLFRmHKocVQ1rWpktiU9ikYGzh6whiVJahXzc93iEltnKiS
 YlLzoRF1+JJ+kajU57oeFNb0qpENIMmylHzDLhXjAqUKhYE+dGxsVkIeC09w90JRhIjJ
 5JmS6xX4S1y+Ngog3oGJ06U41sVa7J7PIJ91VSDef5pY+ifeDw9ufCqYF3dzn+dTedKf
 ypfHvR9r+ZM+EbFJObpb2bu2a0BuNeXXlbjK9Av9TOJsUhzI5nbmNUKF8Aj4x2ecC7EA
 dAQw==
X-Gm-Message-State: AOAM5305u9AZU3sh3umpwR3szL9uWOHuMRk1ur4fnCIn3EKy22xJ+FWf
 ecF1dL6/JZypwlR9B6cm/eY=
X-Google-Smtp-Source: ABdhPJyqBld7tPgEcw+tcvh7jnmcshvfels6X7wyaA5yLSuwQ5wyb2RvdCRxPY5yEFc/7JHQIGUcJQ==
X-Received: by 2002:a17:90a:fd93:: with SMTP id
 cx19mr4114727pjb.65.1625919072772; 
 Sat, 10 Jul 2021 05:11:12 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 p12sm9677459pfo.94.2021.07.10.05.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 05:11:11 -0700 (PDT)
Date: Sat, 10 Jul 2021 21:11:03 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/4] target/openrisc: Use tcg_constant_tl for dc->R0
Message-ID: <YOmOV6gJSAw+dTmL@antec>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708213754.830485-3-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:37:52PM -0700, Richard Henderson wrote:
> The temp allocated for tcg_const_tl is auto-freed at branches,
> but pure constants are not.  So we can remove the extra hoop
> jumping in trans_l_swa.

This is nice.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>


