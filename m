Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583813987C0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:13:40 +0200 (CEST)
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOod-00028T-Er
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOnT-0001RZ-Q5
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:12:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOnS-0003jW-4r
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:12:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1088323wmc.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PtGJ3wWxNfCyFCGCpn112a92fQ3dB1kmGKhBgEapu2E=;
 b=FaUly8oZ3o/xAfOyBDUsuu0n9sz3lqa+wunFo4InX7IiULOJzQxFhb4uQ8mTpR0d+X
 Kx5Xtwj4/xsekxuV+QzBtJbvf/R+fR+o7xqUOAOFkwG3UK5kLp/ahB63/couW8MCQeYi
 MAwllZjmUoJ3M/zPHGVw7I8FU+jkwBzgJ5mj3Mcgo4fA8o7nvhRshthXOV7T4/GFMwd9
 yu/LoBygL6npnDM7S4bgkzgK5Mvd3Zj7zmrJDDnB/uGy/RenAsfx4dagzf3H+yvvDI5N
 yVHzZoxN0YycFYNBaRXnnIidtyzLDdvk9TD9YIhUYKV8XPLxdV5eMiHta0jZUdOR84bV
 MkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PtGJ3wWxNfCyFCGCpn112a92fQ3dB1kmGKhBgEapu2E=;
 b=XkWf6UukEUHWQiQJTcbc7rHejrvrjCh/zgXgrDaC7SDM1PfZV0E3jvTDB2lHXpidVW
 oXVr+8PllJB5M3RwvnOfbcCyuqL7u67W9xFyYyJeAno4B990PdL2GVZmxYpnDnlAHW8x
 ZNx88VYTz6szd/DTrB9Fm+nxsw90s/eqYK3PvnkDhMwvQdnr/IaGM5Zq7hw9LPhbXYL5
 PcqKtkF0MF7VqoEsQm26x+3GnxuTY2G6MQnrcwRZR8zAjqNdtI/2Ud1hNyXAniT+Fua2
 MK39kIAXy2IuXl1yUOzClNjcDSMUGrheFtvDSI8DwGw+FHjtL5GZds4SxU4uUxBi4Ht0
 yUsw==
X-Gm-Message-State: AOAM532euvZx/7QTVEMMWl3bKDlNSywzQoqXZV9Dbd61h+31qCA0QTVD
 IfsHInJz5MIGvtyWixOf303VbA==
X-Google-Smtp-Source: ABdhPJw+lVhutr/+FFChhdpE4Sv4f/CZ5LonRZ//IgXKgH7SVTFj8AJFEXn0jC7BOS1kO1JCcZD40Q==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr4700460wmj.133.1622632344276; 
 Wed, 02 Jun 2021 04:12:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w23sm2054889wmi.0.2021.06.02.04.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:12:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94D761FF7E;
 Wed,  2 Jun 2021 12:12:22 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/28] softfloat: Move round_to_uint_and_pack to
 softfloat-parts.c.inc
Date: Wed, 02 Jun 2021 12:12:18 +0100
In-reply-to: <20210525150706.294968-2-richard.henderson@linaro.org>
Message-ID: <878s3sbjvt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_float_to_uint.  Reimplement
> float128_to_uint{32,64}{_round_to_zero} with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

