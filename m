Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B993A1028
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:34:52 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvXv-0004AW-5Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvUI-00086b-EO
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:31:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvUG-0006Qq-Lb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:31:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id o3so6509167wri.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q6825Jm00lkJHFOMXhq2PL2WrxI9Id34NqjmIOl1Gvo=;
 b=Dt3IGJyBcbOuDUNu4aWaIaFcdHz01+DcKDK1rXxdx9tfZthRF6CUCpwexFVKwyyyko
 JyPKOW+mVN+QPID/BIQZe7x9PkI4de9HUKoGltMmV2UJpN9hNIZkw4/iBdq7p+MKI6T2
 gkguVFbl0ell7NqlrtZTrkMOZZUsrwswz4mejGJ7xhB1nCBH7Mt6uECsCopY2Y6EMNSB
 ypj01TTBaRY3dN0ZpDeRqIPCscAw51074UuF9gkCCHJ80okN2glmYdQDL9cYjSQuvXen
 L0Gggu911ppU4E25Jq6t7tJ8IRBIyHF/nzEtV80L+g9Ck/UHhCVmGuX5opDPMSCUXGGC
 Dq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q6825Jm00lkJHFOMXhq2PL2WrxI9Id34NqjmIOl1Gvo=;
 b=C12t9K8LMJUZR83+wH+CCEAORZqhrDcBcXyE1Uus0ZlsiFrii57kA8nYehpA9YUKjE
 HW8ugec6vvD5KuO5cLr4CCi6M/tMCVbZa2oowaBVsFzAxVe7zcKRGZf8EqzNHZJJeEHW
 guf6i9ixUp57wWM64/+L6pxEd2nklIuY7p4Wc1IF2XdOJBj0g4nVLSceXiWcK2Zi3Ht8
 oZ06jl8WxaT2d+FRy91XoXod6mk+UBDGc0z/y2r/cm8ZdJPVBrg6sxKCNMQThy9EcSCc
 753WxKmtCA471PRHaB3Cg/5PEDIlvHfVkvwdEGvXnBYDIXgH9+TGvSORB1J6tsOeloyr
 5dPA==
X-Gm-Message-State: AOAM532dMxMl0KH1/ohNZd+lmLnpT+FZC9T+Ul7Gr+G+Yio+l4fbJKwG
 f2odEMasXasVJ/zJLPSlsbKoUw==
X-Google-Smtp-Source: ABdhPJwVGVNHdWyYfeALqMEBGkJFjcYbzR0KB/cjCxflc7WlOrU/vFQ/8+ZMETyGUzDMdwPwQUGs+Q==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr27590331wrq.240.1623234663063; 
 Wed, 09 Jun 2021 03:31:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j131sm6049419wma.40.2021.06.09.03.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:31:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87B071FF7E;
 Wed,  9 Jun 2021 11:31:01 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-23-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 22/28] tcg: Return the map protection from
 alloc_code_gen_buffer
Date: Wed, 09 Jun 2021 11:30:57 +0100
In-reply-to: <20210502231844.1977630-23-richard.henderson@linaro.org>
Message-ID: <87k0n3jpne.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Change the interface from a boolean error indication to a
> negative error vs a non-negative protection.  For the moment
> this is only interface change, not making use of the new data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

