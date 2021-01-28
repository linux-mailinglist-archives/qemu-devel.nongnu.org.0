Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBAA307AAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:25:53 +0100 (CET)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A7E-0007qY-6m
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2Z-0003hK-B1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:21:03 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2X-0003iy-MI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:21:03 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so6015539wrx.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=zvEVwwH77NAsrtSc9xZK/b+hC8x8jwaor1Z9iUZxGDfqUCvD8utpfqM7TuMzqUi2L3
 uSCY1AcPx7WkMAGpKWdEZA/bgL3aOc+Kvgplry/4tyjLaJbrMb8/OGguF0ybkNRaE38p
 yew7wMSw+3LIG1+aK5z8t2lsVRRZqZ50Tb74bK5JQe+vXgalDGaanIEyaZhJhMfCjYPH
 7BJU7e6SDPLgP/oGm1DvDFxf/wvT2DcAxsBcWj3y3zNfbMoPqZShu0VQQ86BtGcwQ3CA
 t9FnFrMQ/kvy3ypTQsei87o4bActm6NUtTtNckW52OHonJY881TCsVx1R7o9nDxHvLG/
 6XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=ckB75kP5D/jywjxA4RSwU2rSDY1LN9pX3Jr5jaI3fsm5aYsQhNelIULbLKzKf0cWNV
 k4HU9xSFBBVO3wF5QO4ouT2vua7A9J6+gn2f03BJ5rO1+WV/Xjqs8rIKlQRx/84jdGhl
 AwBl4I6utr/8ADZcKEq7zRBErhFN6C7BRAnRtuYf538SHDdXJXD1Xq59g3KoF406T+kh
 3XkabuMH3M24Bl35yhKNJLrDssy2I0H3l3xNURjYpjUcHDW0GaOnl/NISn2G0oRTm1X2
 V1DDy+1knEe1DMmcKdyFw3NVXJaxFmRMpxLS0w+bHl0UfYXdjdBXQD1AyLivDvyEocuj
 8+cg==
X-Gm-Message-State: AOAM531t1W6QFmo/rNzDfhoSmMEDIwKpve8tSyLezXARHfCEVgzdPvKs
 qNxOF7pqXNuK0slQWgkrVmWerg==
X-Google-Smtp-Source: ABdhPJwpDTpf/jFKhruqbYzUdPOsI4hSbNtiE1qlZL3hnGHI5YOhQjpW4BJocO543v/te0zHF0f5kg==
X-Received: by 2002:a05:6000:104:: with SMTP id
 o4mr17122881wrx.419.1611850860386; 
 Thu, 28 Jan 2021 08:21:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a27sm7599806wrc.94.2021.01.28.08.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:20:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8581D1FF7E;
 Thu, 28 Jan 2021 16:20:58 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-18-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 17/23] tcg/tci: Merge INDEX_op_st16_{i32,i64}
Date: Thu, 28 Jan 2021 16:20:54 +0000
In-reply-to: <20210128082331.196801-18-richard.henderson@linaro.org>
Message-ID: <87o8h9t4lx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

