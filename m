Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E658ED04
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLley-0000xN-IL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlPk-0002W3-1x
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:06:24 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlPi-0002M2-JH
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:06:23 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z20so17069277edb.9
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=XAvXvPwh72SelFq1N7DbaJmGP0OyHwDsfJ2owl46WmBulR7qi8KZf6FD4YeMn+jT/m
 1wV3HczumqfvruflQTEVj9FdLCqR67HXOa/PgNf0Alo11u2i/Ek1I3WFJJUn5XjJTk7Q
 top5KZNtvJWUojz8R9Pk33JHGJFbk6BXi9vfiIxg1HlTdUDSQmyeCxWXd+D1k7XdyMps
 rNQkh/59kEkxu0/5RqXTblC5WaN7mRpcK8qYsXCtLkkqN0cLbFsyyFl1HJ6shVMSeiMR
 q81HedvCAO1Xts24l8QOEQwfJryA3NtV9mQYSkx+cInEaac+c+qUygj3Xn904jpUspuf
 leiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=dnMbyzK7hOGuuybwKe5ioHqRaDzgsJ2HyX7EIPCLYo34VngY+Z5BacVi/Wiu1e47iL
 MTM5n4pNmpGnZz004D34FlqB+So2mv+D1pPNe2GwTCYLGzT4aTmUumZuEk1NwE1ohRN+
 J7mo1C4x2tmKDn2cbl89N/F7HJDWS4tsVtHPHX8FumjABRB4WALlxz+WUj7A1D/non4M
 lJWhPqV73nwF5KCttxi+EQaTUuC0KXwREpS/+vc9bLllH7UkWJSjE+Mz5LrR7JwN6EnZ
 UO5cF6sbd4rd5+WQywRh5nLSS3VjQpVryyiBxzeheYWy+pXUb7xneKANXf2MEaNf+g4G
 9HvQ==
X-Gm-Message-State: ACgBeo1MCMn1gZRRa1hHJfAVZnyww5Dm28ECJ91BvieoNtfKR026clE8
 rvrfrP4qAe4J6I4pTVkBU//plHLeElG6Ig==
X-Google-Smtp-Source: AA6agR5w1h5Wr55ltnO6GG9i5tX5v2HrY+B1DXasbtRCQ3Dw+GCC2kbgQkhBKStelTC4b/h5tDn4wA==
X-Received: by 2002:a05:6402:3222:b0:43e:49f9:11e with SMTP id
 g34-20020a056402322200b0043e49f9011emr26758127eda.426.1660136781214; 
 Wed, 10 Aug 2022 06:06:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 kv21-20020a17090778d500b0072b33e91f96sm2280305ejc.190.2022.08.10.06.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:06:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D2341FFB7;
 Wed, 10 Aug 2022 14:06:20 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-16-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 15/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav8
Date: Wed, 10 Aug 2022 14:06:16 +0100
In-reply-to: <20220703082419.770989-16-richard.henderson@linaro.org>
Message-ID: <87a68cmenn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

