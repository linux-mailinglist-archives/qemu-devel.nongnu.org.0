Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DA37A84E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:59:24 +0200 (CEST)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSuy-0001Eu-1g
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSsS-0005lO-5d
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:56:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSsQ-0001kQ-JM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:56:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id l2so20240498wrm.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r8dVmqHWAHKeRXBaBur+amyGR5QHspG5CU8Z2jF96gU=;
 b=NvldRZ7T5+/9PREHYk5ELO9esty5ci83J9UPRynkovaEI/cr3M//x+2gcG7q0JrXAX
 CS1qxneHCN7jNXRU7eCpM8H1aZ94cGENagieR/27YYkgQyHQx7PuZNFJu2a0cblQgVoZ
 2mwr8nGiJBoyBKILKOVJ1H4tEhyGZATQG5DNKHt+1d7slcLjX66CN92SyBF7dRxmYwnT
 Hwr6F8E3rFEEv2QYQnPJm0wjG9C7SnfPFsmCbTCTTNyHP3F+Gz+r2SQEMijlIcroo5Hv
 p6UrRgbyFZBoOViu5S8H6jMBW0KC/A0SCRQqJKjXnzoTLeJX9NgvO8pn+4o6yi0GjGXR
 bTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r8dVmqHWAHKeRXBaBur+amyGR5QHspG5CU8Z2jF96gU=;
 b=GvWlA5xlwznzGJAfiJPo7rY0WxYHCIpD8xIY2tzuGyT5sMgOmuADP93IdX5WhOvkdY
 LOM9AwkN19XMY7po6pg3en0dyevPRFyLTklx6A3AeZtax6bu2WcMC9KQt5SDYYl/QBgz
 1KNNm8x0vQdHPH4U28e0x/GI9hdr/Nj1aS2FpWz/pxGJn3h/3LigrUWthckozx6XjIoW
 qfLA72yMpwDytnSIHqh44bQISU7rB+YHAxLayGLozqSNtE7ICCuNWcetIXLGkmy7qe+w
 7Y481UMnb6KT8400gd+iDlIOg2B5bVOwZQfDayBsLhUsGfUVdxPENXF5VRMd/N6bQjOV
 yowA==
X-Gm-Message-State: AOAM533Z46MXbkS3IXEcGjEzRLzyY1ZAx82EP6SDr9bH/bgPgizjPvjg
 7KdVp89W3tgtbKAeh+R1QC4MLMWNpU/hXg==
X-Google-Smtp-Source: ABdhPJz+GrpMxcuhqDActeFbnLszJ8BtVfvoiOa0eKWij721TKtfCpzYn7CaVGs/ssHRnMyb1GaPhg==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr11776010wro.88.1620741404259; 
 Tue, 11 May 2021 06:56:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r18sm1833779wmp.0.2021.05.11.06.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 06:56:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEC031FF7E;
 Tue, 11 May 2021 14:56:42 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-25-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 24/72] softfloat: Use pointers with parts_silence_nan
Date: Tue, 11 May 2021 14:56:36 +0100
In-reply-to: <20210508014802.892561-25-richard.henderson@linaro.org>
Message-ID: <87cztxgyqt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> At the same time, rename to parts64_silence_nan, split out
> parts_silence_nan_frac, and define a macro for parts_silence_nan.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

