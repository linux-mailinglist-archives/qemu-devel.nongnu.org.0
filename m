Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1E5014E1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:33:55 +0200 (CEST)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1Tn-00023z-43
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1R5-00084Y-NH
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:31:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Qz-0005MN-Fd
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:31:06 -0400
Received: by mail-ej1-x635.google.com with SMTP id k23so10777941ejd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1GKsl5NzIhn2QulvAyaxvFMDPr36ljw4vuBQVGMmSjQ=;
 b=PwhDsyQoz6ffQrwwSIU7ROgHPTrRQFEFUnDLWj5DOHTt9DszbghlgtSiVrCGHKKSso
 iA+VLhWI3Y6H/MiapBPgiFzznUmNIDm53ld3sJNLU0cH12SgIP5XYWlXaK3K4kcdC18S
 qjpbj0jM/8PZwbnWd82S9qUK+0B26YaqN5J8uubud+qL3FuaqyUIIdkHM9sj24KoFtr2
 rQyjkf3GC89izc3L3aIZL4pnOjwwv4c1C91u9nETiAa0DJi/cRecWStLWkM2Dmr2Wg7l
 vpQndixth5FEndM+8PA7f+vwI0a9fwxAGFzAu1kNe/f3wcffZ5NSHBn4i8PYBQpOVLAo
 eRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1GKsl5NzIhn2QulvAyaxvFMDPr36ljw4vuBQVGMmSjQ=;
 b=YELW4PS5SwpvMloSxa95B7EmIZZXXW/Pl6XBT6AOLOv2q3NxRRaE0HYUwc5FL0GUS1
 z6SyFcijKMHHOs55EErQ+YMBlD9eXbt9mD9xdCfoPyiECg28fUW14RczC0grxNoOtpsP
 Sp2Ycn7G1Aph3fxfpqnBM77F9QQuw//BzjTuM3jGhfDWlmV2YABlgthxk9RDiMUfdqh0
 rOQOTTpdBuQsCEZD8gxBGVN3UfL8kXDNiODxqdIMwxrC0JHWiKADHjG1i5DSXaiEeS9H
 JClegG2OTk/mqGnTgHp4VcQkgwcKCZChysVUQv+/uoLDruBkmV/Tozr2YON8XHqmTepY
 oqgg==
X-Gm-Message-State: AOAM532tbUoRatfaK2XJ9/ub6fJoX+D7qFfSHkkZakMmAKYxG5HJkZSq
 lQSR5EGQrV/myos+1ENwtW/Teg==
X-Google-Smtp-Source: ABdhPJx3C2LcUinDbV96uaX5xoAhszOo2XspvS3MGQ5dzwqO/Mlvh77SK2Gp09XpRkXVnxSo8LAm6A==
X-Received: by 2002:a17:907:96a9:b0:6e0:db4a:ba8d with SMTP id
 hd41-20020a17090796a900b006e0db4aba8dmr2871419ejc.87.1649950250734; 
 Thu, 14 Apr 2022 08:30:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 jl28-20020a17090775dc00b006e05cdf3a95sm727624ejc.163.2022.04.14.08.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:30:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0064A1FFB7;
 Thu, 14 Apr 2022 16:30:48 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-47-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 38/39] util/log: Limit RCUCloseFILE to file closing
Date: Thu, 14 Apr 2022 16:30:42 +0100
In-reply-to: <20220326132534.543738-47-richard.henderson@linaro.org>
Message-ID: <8735ifu1g7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

> Use FILE* for global_file.  We can perform an rcu_read on that
> just as easily as RCUCloseFILE*.  This simplifies a couple of
> places, where previously we required taking the rcu_read_lock
> simply to avoid racing to dereference RCUCloseFile->fd.
>
> Only allocate the RCUCloseFile prior to call_rcu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

