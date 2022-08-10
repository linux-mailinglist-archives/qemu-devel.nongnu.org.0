Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CA58ED71
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:36:10 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlsX-0006bk-KW
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlO9-000103-Kv
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:04:45 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlO7-0001tN-Pb
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:04:45 -0400
Received: by mail-ej1-x630.google.com with SMTP id uj29so27712528ejc.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=l9xcb5nqnvVaoa3ncH7SJdk08IiBFaFsndOHlDjlHGf/RJPQ7OcWbtlH3+TzVw1Q5z
 bEieEwDPab0SuIqEmDEEhOy/yJRng3lPID5g30Bf5ahn8N29HLCaPtokpEwNs8qJYtxu
 nEbj10XzleAdbcl56WqSi5+ALH/NHZgwgWj/+nWSn3TZAB+kvc2po2Dblru6WhRFDAAG
 Kgax/6Zu5AgC+xidXFpbAosjp7+tgcFN4KEhD6BGobMV29WD7qVNXEwON9APdW5xY9JJ
 1qcXT3jbrKjBKWUGDGtLskMlH97aLu4NIouhXMfUWcuEiWH74CuQ9nQIfhkd09aikGd9
 iO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=7PJNFiKbwdGjDVWOlVqLv6FrAOJ2K0Ty4u5TJ6unzdsIz7uWVJTyHfGn3hVQr2HjuN
 G1Y+kR0jWqD9f3HfZZ08gEu+YnZXoNaW4x0Q560al2xwogoQ+6X3gsrnX/zXjs+cu37r
 26eXSqi2sd6Gilc7PeJuu85ZrjoDCobTyeuHudrVfwMFCikd/i/PkzDoMXQ6Fe2bl2Rj
 z/xUaOR5rle8AJgkNpDwEe9YsjNAwdzGRZZdQc3f8yBF34CDYU31XOtO4B0+ttMxySH9
 njnMMkxde1BdLjyX9P4FgFJgBStyaFy3+xsYDc+O0FYHGZdMiWkKqiRmT/fuW/O5WbG4
 dCsw==
X-Gm-Message-State: ACgBeo1TI4PBXTdxxAwwe8BauR88oSPL5K/oR42AzelttErTjOkdpZkr
 mAi1gth9iWFYU5MaOw/fo3rN3A==
X-Google-Smtp-Source: AA6agR4k7vNX5XK8dOsmxFogSd+qPd8iVjU24ii5cIIg1zacAc/ts/q30aDH7Xo5QLZ6gYHldbMIkA==
X-Received: by 2002:a17:907:a0c6:b0:731:87ce:5289 with SMTP id
 hw6-20020a170907a0c600b0073187ce5289mr6467212ejc.465.1660136682044; 
 Wed, 10 Aug 2022 06:04:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a17090615d000b006ff0b457cdasm2282950ejd.53.2022.08.10.06.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:04:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 061021FFB7;
 Wed, 10 Aug 2022 14:04:41 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-11-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 10/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_lpae
Date: Wed, 10 Aug 2022 14:04:37 +0100
In-reply-to: <20220703082419.770989-11-richard.henderson@linaro.org>
Message-ID: <87v8r0meqe.fsf@linaro.org>
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

