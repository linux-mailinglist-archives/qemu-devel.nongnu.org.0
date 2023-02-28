Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692D26A5E36
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:31:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3nR-0005PS-7P; Tue, 28 Feb 2023 12:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX3nP-0005OS-Af
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:29:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX3nM-0007hL-NT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:29:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so6344940wmi.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFu8Bk18v4l7Jt0JdGbiRizsWONj5KXQ1ScWYd6O3Vo=;
 b=Iih72F4Qa2c3KOP7PYX8hIk7jGckmLVYR9kZj6NxQXq2W7V/p5xFtWWjfZ99Bllwnz
 gz2ggMSjb57AWvX4T8cxVVt1IMrajYHYJoxaVEoyJtN9IjviVEF/3yl2L+DW8bF4vJRo
 AQi9J5iDocxjiLCTfmRoWP2AC7Vwuu39Zp0tVwxaQmAYWb1HcZ0V7vdXdGR10kn4aR4b
 AUMQqnaSwiBbM78N25/Lk5DOJg59hPaWWJ9zVQy/DAd0bRnSN74OtwNl9xc2ZlyQn/me
 5wBnPeK2kHNqzk5fo/w+EkTOCHr30+Th2N7anTZYT+wBSGwY79uGx8Y/kVnROZsJyDqM
 rMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NFu8Bk18v4l7Jt0JdGbiRizsWONj5KXQ1ScWYd6O3Vo=;
 b=T266uVTfwiqAQDf2y1rX1tksVx+RGgxWBserxiPamg6gnnWxLxeQQU1Yv56HNd2O5m
 ZEJTacqpuG8OrjdgyKUNB8LhC4vu9U+OCuRWH+l+KvxU7/VvqGrSW0LUOUEDBM6ublCw
 E2MlGhNf783gtUp2d/8M7hz2QYdqtn5Mwyl0PindE7MPV1P4RMkl7y1lsbo7YsyOsB4h
 gd9F7yRE9How+dxmMsdShrzs1ihEQMBGZitFwu9IQJ9Sy3zFr3Gw6Zz/F86YvuVzxQyI
 V7LcCDVhBoYznoRZVUJiSTbWIGV+AYnjZhNWAszaqKicPYQRoOHPli3nappLnZYm0l8r
 uGpg==
X-Gm-Message-State: AO0yUKUCuEfADrIVKiUgsYpquOtZtPvs/RLzDIhMltjTIpaTKgkee9Po
 KK4CYZpCTZK0kUsfZm3SNNGfPw==
X-Google-Smtp-Source: AK7set/dP3ecKzmKuDKl2wnmDXr/7c0imSvVAcIa8EIna8Itnw1bfFQMtIp6DdmMZMZabHuaOT6NLQ==
X-Received: by 2002:a05:600c:4e06:b0:3eb:2db4:c626 with SMTP id
 b6-20020a05600c4e0600b003eb2db4c626mr2839135wmq.38.1677605382828; 
 Tue, 28 Feb 2023 09:29:42 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b003e8dc7a03basm17256919wmr.41.2023.02.28.09.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:29:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0AC191FFB7;
 Tue, 28 Feb 2023 17:29:42 +0000 (GMT)
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/31] tcg: Add liveness_pass_0
Date: Tue, 28 Feb 2023 17:29:37 +0000
In-reply-to: <20230227053701.368744-8-richard.henderson@linaro.org>
Message-ID: <874jr5g0l6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Attempt to reduce the lifetime of TEMP_TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

