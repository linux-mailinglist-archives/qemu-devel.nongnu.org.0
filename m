Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7875EF7D8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:41:54 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odujZ-0000Ux-IX
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsdi-0006xE-NY
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:27:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsdh-00015Q-2q
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:27:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id m4so1945620wrr.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=TyFhhbLUeVaK4c+0XHU5BFXtfkNb3wHlo/wCyJynsHU=;
 b=Ad7cvTFenkcCsi/5YP969azXGdyHJCZhnmEBiVe8uTxOClhteuRanRiFDNap/UQuoD
 Vs70VowVj2jaj4NCoWa2RRg+gz99JKdfy8F+PJI8IUnStC2NqTEmKZ3HpJBJEsMihtZb
 kJ70slcppxvLSUCXRywzvEefZbblRLoWQgRsdJDr75Pe+UOsOiGb3BkjaRLvJ54OKtoJ
 Y7CWH6GNiHGb1S/lMQ9g08LXDQjU8v7pMwWSj2Spx1Z8HDNt0qOw2V73UV02wQHZJHn9
 pN4wRe9yadegjso89u1bfH8zX0I5OVLlmk86kA98glQIVWSQyurJtgyzoGTSFlbctnxP
 ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=TyFhhbLUeVaK4c+0XHU5BFXtfkNb3wHlo/wCyJynsHU=;
 b=uBJnfEfy9irc0xl+8CengEqxS+2pA5yeQkODU/HAd5IlRNL+7GKT/WFl8Dr/0aNBlI
 /yj4MriI95KOJRKNBq0OR4XWwFs6FtOlGmK/1bNKTtz5+YTe0ecRCB0A42BHS6c+zSFl
 tQMlZfknlGQWD2W5i6ASlhmfrpSVzffFKj8wqOnydVWcrEWDSHqmM4Gqf+Y1Qy2WiDOs
 6hiTktWGIDTjSQ2DZE0B0loJFUT7A8TiOxO52eIjeGv5qu2ZB1Wx4zqkz4+BxqzME/+r
 auoClPfZHe3W0I7VX8aXrwQTFatfqVvZGK107IHA7xXPcyA3El1jWoGiJYHMMr+qyDDU
 y1uQ==
X-Gm-Message-State: ACrzQf1ZOgECpNrwpVARyY5Sg23LH6XYfPmGZ+sU7GU2OXRtN+9o3sMI
 GQuMVzIfssjrkB2Z4BCu4uXMNA==
X-Google-Smtp-Source: AMsMyM6qV0fye32wi4DRxTBQLddxsYpEoii+TYhf7FAyVYrHVtRcpt1jTmhSOTw1Hx+z1Gf0v+CzWg==
X-Received: by 2002:a05:6000:689:b0:228:e2cf:d20e with SMTP id
 bo9-20020a056000068900b00228e2cfd20emr1999064wrb.147.1664454458334; 
 Thu, 29 Sep 2022 05:27:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003b4868eb71bsm4505377wmq.25.2022.09.29.05.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 05:27:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 004131FFB7;
 Thu, 29 Sep 2022 13:27:37 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 10/17] accel/tcg: Remove PageDesc code_bitmap
Date: Thu, 29 Sep 2022 13:27:31 +0100
In-reply-to: <20220925105124.82033-11-richard.henderson@linaro.org>
Message-ID: <87sfkaz7pj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> This bitmap is created and discarded immediately.
> We gain nothing by its existence.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220822232338.1727934-2-richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

