Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199750697A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:13:04 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngln5-0003k3-7h
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglkr-000253-AT
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:10:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglkp-0002Kl-OU
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:10:45 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y20so11989674eju.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xB1qVKk1nh3FCktb8soSC5gREMmnmiZCi+9kbOvACEw=;
 b=oESEuwWZofR6Bd3aRwPZ+Y2M6Jk2BEkv8DJPfL2HRwHl6VdnwU68dZIDhOaFde8zSf
 W93D4JAWHjV3ReNzUGoZCrniPuEt6xsWNO0510mPV+h4N3yafOWR0OnTKS/WoQd4Ygd/
 UIOD4q5dMcdPMFFJ4I1t+aCyipiL76iQr86m76RXY4pWvFbrg88iMUpCzO6gmG9UcEMl
 zSDK38y52jBFhDJ9t8FbQe3qVJSCC31jweNAbY/MHYwf9Om1IJ5w5ZL0rimUiWiGpeOT
 1VX4Fdzx0zEnP8gb34gKE3IDMxzedDTqTfj3GVJmKSkx847rDaKnA6LMFj5xFVRmvc5k
 sa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xB1qVKk1nh3FCktb8soSC5gREMmnmiZCi+9kbOvACEw=;
 b=XUsbJpu3IbuANySlEOCpYV4rkW+WGGd15VOVm0owXVf6Zc/4D60Z9mlBcnvr+msUDa
 i/uQxrVDFr25MO+J4DJA60AudbgzAfRBdThver4cTS/ikfEq2hkH5hzZoqBUM5CxA7eH
 T/nSIJgqll94mpjV2yUPYqkmBBgu8UE/BJR+6dfcaCAAN80e41VJFrwiSY5DZ/nxpIAH
 BCfXtwd51vrpUQJaOnJ2Y76cCphn34P7ivcuYR5O7Xkul8Gg8wR1owRD/sHKenS/CgLt
 k6IAo9z1mAT7mViKx6wRG3wfmzNNz50RW+qjOtqj1n/YI3NwbY7baetVBAcPrPXxFy64
 mIcg==
X-Gm-Message-State: AOAM5330hhKas1xAC0Uc/fKDUHYSNwHtG0VOIUoccJcUs25Zf9Ih6Ig0
 WZwtbnjYhsRhxUzPu0ITW7xfIw==
X-Google-Smtp-Source: ABdhPJz/dC9M73/GOwNHQBDSRUiOy5ZcZbqYkviKSZsndwHuqXsZvz+KFFDx+Nu42JzkXXdyXLaV1A==
X-Received: by 2002:a17:907:6ea4:b0:6e8:8f2e:e29c with SMTP id
 sh36-20020a1709076ea400b006e88f2ee29cmr12778050ejc.225.1650366642243; 
 Tue, 19 Apr 2022 04:10:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056402238200b0041f351a8b83sm8260222eda.43.2022.04.19.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:10:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 690191FFB7;
 Tue, 19 Apr 2022 12:10:40 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 02/60] target/arm: Update ISAR fields for ARMv8.8
Date: Tue, 19 Apr 2022 12:10:35 +0100
In-reply-to: <20220417174426.711829-3-richard.henderson@linaro.org>
Message-ID: <877d7lxr9r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Update isar fields per ARM DDI0487 H.a.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

