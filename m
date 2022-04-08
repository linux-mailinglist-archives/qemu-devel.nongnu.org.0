Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D474F9ABC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:34:31 +0200 (CEST)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrZ8-0004XG-Lz
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrXj-0003lD-Pa
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:33:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrXi-00018P-9H
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:33:03 -0400
Received: by mail-ej1-x630.google.com with SMTP id k23so18394137ejd.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=chlFYzs8JomMt4OUAV1mB7oeapLOkaNEWysIUDcLqdU=;
 b=rBt1QnnW+HhynC3+4YJJ/SKaUw2YUT3qOEzT4GFbg5MQXtsbv1UiNumVPZ+RonPzX6
 hFN+2Fl3VU6yaw7WnhmarBQzUIEc5tnW+fZNR7X/1evB0ygZVZAoxethy+dfnavkhkGx
 slwn87gr4nel+Dn0+xFj5yE8nb2bYDgzinDSYPOe/eZ0Mi/DSOkp1zTLNhJzRjw9zoHU
 vT7071ah6/VOg6SCsnaCIfnM8kobnbHSIJ54kTiC2g1L+3PaTRTAOqacJ2tZj3p9NOCu
 xJKWw0Pnu9p8JU8oN9emxBEPhEXtkEgghxvgt6vv55xuOJdjVy339ZsBU+pjzKDmrr76
 QnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=chlFYzs8JomMt4OUAV1mB7oeapLOkaNEWysIUDcLqdU=;
 b=spDRLSh5u5FvCv75koxt+mvmzzJeoiTUWuzqfOehqp+9gQh/mOx9CurAk4yfY1cdC+
 GYuPDbf4Dco7Wv0Eruu38kTlgL+rf5G5H8CwrvA8/D0ZL0B7ovAl7Ymc2az19pFDBtxK
 Kpfy+LJXrNuSSmTOHXyMk0MBhwg8n0SsOruhMU0KIGV/6unauuBjPwKA1O5lyyyNfo71
 ei/XDZuBhwMDfBgC/21LC1o4upFcMOPay4VNbUsXGyQ6L7jIfc/GYriPAYwF/iGWoTCR
 zlj+g7CwfZgkQz1GDKzMJmNRIulrvfiT7LnU9R+JG46D24qM5/kDxnjIooVekWmWunG9
 azuA==
X-Gm-Message-State: AOAM532fNF5kMJDSYCE9oEqz6oko1A80OAV4SEeJ5P3Ss1kN7vzOhyEy
 Lb3XJN3JL0gzL+PaXn0i9t7b3Q==
X-Google-Smtp-Source: ABdhPJzgOWc3C9CYcTRJwuuh/pNWUsDhFTqYkE/1LkmRD2YGZgwQ0mqisPeK1qvelVUCLpGqytT4FA==
X-Received: by 2002:a17:907:94ca:b0:6da:e637:fa42 with SMTP id
 dn10-20020a17090794ca00b006dae637fa42mr19317491ejc.347.1649435580753; 
 Fri, 08 Apr 2022 09:33:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170906144b00b006cf61dfb03esm8801052ejc.62.2022.04.08.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:32:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B42A1FFB7;
 Fri,  8 Apr 2022 17:32:59 +0100 (BST)
References: <20220401190233.329360-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Fri, 08 Apr 2022 17:32:48 +0100
In-reply-to: <20220401190233.329360-1-richard.henderson@linaro.org>
Message-ID: <87bkxbilhg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Coverity reports out-of-bound accesses here.  This should be a
> false positive due to how the index is decoded from MemOpIdx.
>
> Fixes: Coverity CID 1487201
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

