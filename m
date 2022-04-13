Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5D84FFE15
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 20:43:28 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nehxd-0004Wk-C4
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 14:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nehvT-0003Um-Hb
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:41:11 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nehvQ-0007On-PU
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:41:10 -0400
Received: by mail-ed1-x52e.google.com with SMTP id t25so3493041edt.9
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=htw2MGvlzLnUOXHR81xug9PMcqeI7Kq/ZzxvizAkr3Q=;
 b=wmGUE1St7On/dV5Pvv9Rv2msx751pd3fScxCWDSW7Kp7KKH6upck9fiASn5uD8jU70
 Bly0YT5A/+lMCdPL/4fYFmfHAiez48ItTelnYgOwNZZnqOzQM3VrqXk9tv29ofKyLpVk
 L0ptJAnriwKkEQ8ftVCG5D8bc9URSLdX/D89ULXqSe0MUmqi/5wpd0YviYOAgK7fFI5S
 3fGxaROqPAuqH4BXq85YJlvjCVJHOfJS8qj+Jodw82rDb9vi/zTpCzfwBtF7FwYsbBR4
 Dp/Z3JWgYZSnRBQGy4oEfSzP/ajgz+SaTd6TcYUtrNv/AJOIeZhX675obTNmkdEGTn2f
 JukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=htw2MGvlzLnUOXHR81xug9PMcqeI7Kq/ZzxvizAkr3Q=;
 b=K/yImQ4QgHKpfSrVH5T94QiF1gjwqz8HTR7ykUMH38OAzDRv3FvrBE7gvxxgkeOkal
 1IbquavunY/Jw7wp3OfRoOMtP05NqQZaa+svEsnz0+528HoL/Ri1jWfwl0daqKpRGCb/
 jusxOdAoIMNQpKDtszwvftWy7sGUopB/Oeo2zx7Pz5NCv5si0JdPki1gQnwNpYF30Yi9
 hR2gmWYMsdpHGpyD1XEH2HtxvrGA3slkQ2KxGddf6NZtDaZiRCYWx2VmSGRN3CWJyele
 dIGQn+NZKgq+4BlZl2eIZ/NNYry72e3I+QdNIB4R5EPMIxQlFQbS1Zs2qJ9/wZRj64Bd
 0D3g==
X-Gm-Message-State: AOAM532bg8czBRFRBMc80Jq5g8okuZJNjzVo86Pv4/q0WhOnGPCM27Nc
 COfXkIhy3Hd301Je2qgOPcd8sg==
X-Google-Smtp-Source: ABdhPJznrOq1sz6EheE9gwL/Y1OMbvXT3Vkntu+zjbsf+85+dsiT+/9N3GGfvWfBNm4I95rxY9r3tA==
X-Received: by 2002:a05:6402:3549:b0:41d:95b4:e546 with SMTP id
 f9-20020a056402354900b0041d95b4e546mr8840281edd.33.1649875266940; 
 Wed, 13 Apr 2022 11:41:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170906654700b006e886beb300sm237394ejn.164.2022.04.13.11.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 11:41:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 381A21FFB7;
 Wed, 13 Apr 2022 19:41:05 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-22-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 13/39] exec/log: Remove log_disas and log_target_disas
Date: Wed, 13 Apr 2022 19:41:00 +0100
In-reply-to: <20220326132534.543738-22-richard.henderson@linaro.org>
Message-ID: <87a6coygfy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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

> These functions are no longer used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

