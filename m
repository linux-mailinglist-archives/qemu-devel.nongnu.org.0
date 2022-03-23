Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3424E53B7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:58:23 +0100 (CET)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1VG-00070X-Jg
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:58:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX1TQ-0004yc-IG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:56:28 -0400
Received: from [2a00:1450:4864:20::433] (port=38720
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX1TP-0000im-6g
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:56:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id t11so2261821wrm.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wRwP4sjDw97Fv/34WbcUSyHzEgbaPbsdazuytrYReew=;
 b=hKdLFC9WZD0T1Ix3mBOf+PP/QhwACps/XDGV/2zVJavMsSUEd74F4CQN/SCq5KHmXO
 +fPvuTFWbFEPQbAdej0cIMsffI4qwhec+BINKXSHPAZjqxl3a7GTqp3XWursB0mb/B3j
 I/qrlcJc3YcVWBcIx2ns2R2mzn/q2Ky9MnAGnYEGNnbxblOPcEh3vF1UZXaxttHOCHb5
 bTbKQHaDo2eDDO8p/3YF1M8bu+6gCVW3Y51K+aHb1PyhC9iFr0XfPVhdBHOo7922vyWQ
 tHjUdcpK8JWroxgqVjwhe/u8MfwrC0xTx2QDgQ81uB/hw/VemWAkftAer0OVZaNn6EQ7
 xyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wRwP4sjDw97Fv/34WbcUSyHzEgbaPbsdazuytrYReew=;
 b=I8I/OOqLt3gh38T9rOm65Fae71+lmuFJSVcEg/wNOcUQu3RyTz84hmrpLxKUsqwPWd
 qnVLR8fGzucFR3OhrBfnRRXfyDGh0kobnZhzxKq38YbbYAHo4SsjGdI1uZiY8J2kHKAf
 4gcRoB9X9U9CDVJwg+VuTgfZTrBymUptd27JsqyMSQY9ccWgl65H9CqgYYB0B7LIzAb8
 VmFutH0Sg4FkKFQiWqwUS3JuD3fu2Z3fozBaBsLF5uU900XOdffGjJm29XeuDFoVK0wj
 Alp7sPosvIFWYqYh96jYpf85AwjFSrnBEocql76tBNZj052eQTXPcwPzSJCWWfdGZe9Q
 muzA==
X-Gm-Message-State: AOAM530Jv7i/LLAjZx2cAPMuZN3jzUT5b41RIIPgjDp+v7vIuUfAAVGT
 8wZJQzfwC4YUj0cSNhbj3Un+KQ==
X-Google-Smtp-Source: ABdhPJy8vfe95XMOrYLZEYB0M6hIy90Hp8A4qA38JqOpJeAN/o1k72AlDq3CWavZ3T/cUisbZDqBLA==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr27330940wrv.653.1648043785760; 
 Wed, 23 Mar 2022 06:56:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g6-20020adfd1e6000000b0020581602ddesm2885625wrd.67.2022.03.23.06.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:56:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 232F21FFB7;
 Wed, 23 Mar 2022 13:56:24 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 02/36] target/hexagon: Remove qemu_set_log in
 hexagon_translate_init
Date: Wed, 23 Mar 2022 13:56:19 +0000
In-reply-to: <20220320171135.2704502-3-richard.henderson@linaro.org>
Message-ID: <8735j86ad3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This code appears to be trying to make sure there is a logfile.
> But that's already true -- the logfile will either be set by -D,
> or will be stderr.  In either case, not appropriate here.
>
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

