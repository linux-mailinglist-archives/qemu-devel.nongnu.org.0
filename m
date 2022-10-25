Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AC60CD61
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:26:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJvu-0007UP-0L; Tue, 25 Oct 2022 09:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJvW-0006pW-DW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:25:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJvS-0001qd-RL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:25:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bp11so20403452wrb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhuvwNy/UamIdNAbdYrkiyGjQI2PNSkJ8iJsSau2b4I=;
 b=n71bIyomF71+CISB0cofbpE91nw5T40fF5YqACr5XAimuU9f/3/+p2OsxFoO1n1nc+
 Wg4ekbsaDZ+mSRqyujX4vRatKTU813zwUCdxMutcM9D86Kana1DdGP4AikgIxSLsICZB
 jjZnyS+vY1kkkMcYn4XGbk1DyNQxK8Ss60UtxFRuiN7/c6SG0VhTDKpUXi6JAjttHrUw
 +SzKg+JNF28SNaCNGtskbO/p6Z+Kje13DQJ777QeEA+T9MJGA9OBp6POtikgpnSuWeWY
 1E3ZLCETr6jDrqkL09X3LVm+W/h+GS5H5xZk8kHc82H4IJRxqgf7zCaf3w24rVcnaAXv
 MZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hhuvwNy/UamIdNAbdYrkiyGjQI2PNSkJ8iJsSau2b4I=;
 b=ZIhTNlaesHttigtpCYxU9EeO2OkxZSSZn9YVQr0wgcr5hRyuWg8kC4e2AXHyPJYR5A
 qvFnh/ONC/m+1QbPTStkKrsU71ZuvqynwFQkNXKAnTBVOxVTiaznkEVMtz+M8G3xnmd9
 9tVtwWFmvlWtM81XgmFlMFsKB0sXM6TD/HI8WelufmtpW6gtwa4lbTd2VZKX3tJ4fibC
 usBdn9fqisH0AA5+vWhKgnhQsmDsqdzVnYMl6tAJWAsw6RisOqdeh6nbUv1SOckoQels
 NlitehW/rbOH/pg3R/CJkzrN7mkiGmuJ4Mw7eGIUTPNie+Fdl9xup3CesfIFAZYp+cvt
 tXjA==
X-Gm-Message-State: ACrzQf2ehhyCmW/xWIsl75ddHKJobirFW23kfbJbb7YiGChNQTY9pP5L
 YPwm2GM0ivYqoqR6wb1HDaWQ2Q==
X-Google-Smtp-Source: AMsMyM6iS1gybrPAyMtQ+5fuADRGTTp4A605yflxQTdGrXsUGxhEDeRYvMIDMejdYxeDSkn5iwWQlA==
X-Received: by 2002:a05:600c:654f:b0:3c4:271b:6b35 with SMTP id
 dn15-20020a05600c654f00b003c4271b6b35mr25159419wmb.182.1666704299691; 
 Tue, 25 Oct 2022 06:24:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adfe98d000000b0022ccae2fa62sm2494721wrm.22.2022.10.25.06.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 06:24:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45E601FFB7;
 Tue, 25 Oct 2022 14:24:58 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-13-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 12/24] accel/tcg: Unify declarations of
 tb_invalidate_phys_range
Date: Tue, 25 Oct 2022 14:24:41 +0100
In-reply-to: <20221006031113.1139454-13-richard.henderson@linaro.org>
Message-ID: <87eduw6no5.fsf@linaro.org>
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

> We missed this function when we introduced tb_page_addr_t.

That was a loooong time ago.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

