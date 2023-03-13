Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627416B7499
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:49:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfic-0007WO-DS; Mon, 13 Mar 2023 06:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbfiZ-0007W4-Gr
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:47:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbfiU-0001bQ-R9
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:47:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g3so10844899wri.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678704464;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcgxOqqRNQq5oDBpmhT0FkP8TkBYbZR/2coCn8YAXgI=;
 b=Bt9xhHjXknrFGJ2RdBq8HZntHavPq2ZG1dZV0rs//TxNyy866lQGiE/n9LOp3JQD8W
 hvjRvXK1FoSPKB4tgfzIp4r4z4de1TaTn3oSzLqKxEUazGB5pKedRrVdpY4/r8o16zUM
 WwKsak4d2+cBApb00RqrCOUZU2fkvT58lPW02bHDYWw5oyJS5ye0wqli6d1L264jc33m
 IADHTJt5EPyewmAumM3qLustgpWId3hQuFZqbq4UMXFW41NGtxUg5jdYxz1/M38w/KK0
 tRveOM8tFQ22PrBD9hOdovCIDjOvc16eGo5gLykssR2c6C9z530l0RMOOMMc83xlKjBv
 RZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678704464;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PcgxOqqRNQq5oDBpmhT0FkP8TkBYbZR/2coCn8YAXgI=;
 b=dzXUcUunwWD0/TBpgdn9azmuRDSBOc6tUygt2DQP6GTS5rrX95QSUhUunlvJMf6Udz
 Ui/okr+15unuiQ9nse7RbMcFIxbtm6MRo+mkY9mydGPkN/NfxSq60QbB6H6c949zcXSI
 Oj96NhNyn8N4ZEjtlnMJ4yWTp7YRfJskZu+vowHcRrA1xrBlS8VrBJDPImq97lLeOCg0
 yjWJfBCI/Vx2MWZkHSayRcrBqLMrcNQ3tVTC3hWquqlWusR5A5fHYKF/FkOMjdNcGnbo
 iEiI7ZsRumob4cRF1r6O660SEkLLwxIlxtJMw4bKkvmLQ2O80aPDZBn1OEAViCaK2UYy
 OpgQ==
X-Gm-Message-State: AO0yUKVe71kYphhI1COfZNsFS4G689yu7ygl3jOBqMVHz9PrBy927Xv9
 MiAwJ/OoRj04Lcx8H6YkHDWTjw==
X-Google-Smtp-Source: AK7set8AdNdVP/qYQ2HnNXjr7mBelYu3EZKbAJVeU+TCiUCvaRHMySXFrGh2jW/c1C7mYX9z+LdnVw==
X-Received: by 2002:a05:6000:1ce:b0:2ce:4fe6:db01 with SMTP id
 t14-20020a05600001ce00b002ce4fe6db01mr9042982wrx.28.1678704464590; 
 Mon, 13 Mar 2023 03:47:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b002c5691f13eesm7510745wrr.50.2023.03.13.03.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 03:47:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC8451FFB7;
 Mon, 13 Mar 2023 10:47:43 +0000 (GMT)
References: <20230310195252.210956-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org
Subject: Re: [PATCH v2 0/7] plugin: fix clearing of plugin_mem_cbs on TB exit
Date: Mon, 13 Mar 2023 10:47:38 +0000
In-reply-to: <20230310195252.210956-1-richard.henderson@linaro.org>
Message-ID: <875yb59bcg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> Changes for v2:
>   * Use plugin_gen_disable_mem_helpers,
>   * Remove plugin_gen_disable_mem_helpers from tcg_gen_exit_tb.
>   * Break include loop with hw/core/cpu.h and qemu/plugins.h.
>   * Inline plugin_gen_disable_mem_helpers.

Queued to for-8.0/tweaks-and-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

