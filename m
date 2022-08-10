Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71558ED2F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:29:01 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLllc-0004h4-Fc
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlPX-0002GW-TB
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:06:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlPV-0002Gg-0c
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:06:11 -0400
Received: by mail-ej1-x62a.google.com with SMTP id j8so27581648ejx.9
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=LrEInEH26IInsaE/Lx09QvNQ0dcmWnrypG9gIoa3vCOz5pl2jgEU84rp9G6SUWI7A5
 2yCbSGZhVN5/TTEOPQtEKB/j3Xv2rTMnvhXcoYB7VAT6NWhx5maHiuA5pJqcdur8bpNW
 pcs3SxHJad9lHX6/40OQLJQeeSnuNkaO7mv8TZJYYWrWSxg4ldVm1oZe7eJqLiRh4aqq
 ca8+MnxTHoHAhoVzXCIKwCRarlPsD8dPSFCbFWtCHVI/bCMxSaqwP+EzDa6ac+pyg8Ij
 FnLajyQGniUyTXmSN1w2FmqH8v9aSExXH/ccqQZZOMds5Pqdzg+B5ovpEnXs0ovRmoKk
 lUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=FGTTUfrz9M7LacuryVeY6sRoTsM4kiXLaC230YwNAoJ+pZtHsRAmi6Ivjw5+/i8+2F
 ThUVDBSR0JL+z4wbGzFZAlsZrBz27n6I9t2IH+VeMe/uv0NFJmrHuiHC54jHTKF4myx9
 YyndNS5mCRgYICN3RdgWm3YxhIM3V2THIwCsOjX5UoA8dRvTeQ8vXbBc9yPPI+oIh6J5
 FaHe7TnWGdnJxzrKDHudaXh49MI6hJ07a0MkbY/JGfZEjg9cONW/LMizbP8+9ey/aljV
 5wo0NiY9Mypq2MIDGo30xOcCt2hrZP7T+8lCyH/CR50Tn65880H6UeQhNHFVQQrgjIkU
 IXew==
X-Gm-Message-State: ACgBeo3lcVP9lCev6FBnC81SU4CgHFqK8WXTu+jab67nTPBrVoP5jV0P
 QoYF9g61XQoc8mplVGleatAR6A==
X-Google-Smtp-Source: AA6agR7V/CmqEtD7/+EmkQaKHcyaqaUhJKAjTsQ3NYmm6dvNP6Itd+GHdYsITGylJLnICyzs0LoDvQ==
X-Received: by 2002:a17:906:9b09:b0:730:9480:9729 with SMTP id
 eo9-20020a1709069b0900b0073094809729mr20559556ejc.588.1660136766564; 
 Wed, 10 Aug 2022 06:06:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 be26-20020a0564021a3a00b00435651c4a01sm7652248edb.56.2022.08.10.06.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:06:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5998F1FFB7;
 Wed, 10 Aug 2022 14:06:05 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-15-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 14/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav7
Date: Wed, 10 Aug 2022 14:06:01 +0100
In-reply-to: <20220703082419.770989-15-richard.henderson@linaro.org>
Message-ID: <87edxomeo2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

