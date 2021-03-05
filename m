Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155832F27E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:28:17 +0100 (CET)
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFBQ-0006SA-B0
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEbJ-0007aZ-0u
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:57 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEbG-0001ZZ-Ek
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:50:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a18so2973620wrc.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iZLNMbXKNm+AkvLh3emkyA03JjdBBwTnmCj4gYwmkSY=;
 b=NQ+ML+EKmJPxtokt/OepxKAChIxFVjqJaNxfutIDjvIsFU/+I5UKIn824cHcYEUH2V
 TmQIkJvajWgbMH0KpHKjHWVamE4FHJjvjO9Q1zyLiy+6Ml2kWxqvB9YlIyvBeMRd7rqy
 C1w8V0QUcqHs6/R16l0Veltqe9MUrDkl2bS1KzNz8nbhPWXdK2Z+hV5SmE6FkttF+9K3
 BJewiOJHtaDbGi1iOifbnOVE+BnLLICQtwikUFPRPUs+1c+keFFYptag3/WcmB9AnIfE
 u//vbQd8131FmzdT0n4/g732sA7WhxFZXGCGhsvRBUjhjnJWFYy6Lq3sIj+vSh1kw0K9
 6rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iZLNMbXKNm+AkvLh3emkyA03JjdBBwTnmCj4gYwmkSY=;
 b=eJd1BCBykvD7XltzLHj94qcragaoZulAC2NsXBTBIqlrbxpVYqAX42jOSeo/T9vJh2
 gehkUro9NvtX3IxpKC3Be0+maOUuUuz//NWfKotYw2+/Ws95TnGbhP6nzBrP79Qatu4w
 HTK3G3F/PJdz6Hx8ChsHTkLFnjpaLnp6HS3BojmVl1FOSycSE+1UnGbI/5lZwQdf5tZH
 ZXGPjIYYxpA+PT7KSzRRu1osQf9c7dxbXkX6K3H/z4keD88wEh1l4mF+FPIEPktE4VxJ
 ulFbwbmRNNevmbOzrMLYb3eo6Aj3OHT+VRtoS80DlI4ZMoBzj5CbVCii5qdvmBj5Xwkg
 n9sQ==
X-Gm-Message-State: AOAM532mDzs0Xomb7qSR+RyLEMLEdUsv83W/izy/aHfHbCqja4dadTdL
 2hXGMfzPbZqSJdIIrjegCRzN76ZnFBDS1Q==
X-Google-Smtp-Source: ABdhPJwcuv0LARRYxVPXmfGdosb8mURAL6YaFD/WueVD0WShKHAFjTSech9QHVZXTB4wIX6RGvC+Vg==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr830951wrg.180.1614966653120;
 Fri, 05 Mar 2021 09:50:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm5428332wrs.16.2021.03.05.09.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:50:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7E2E1FF7E;
 Fri,  5 Mar 2021 17:50:49 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 12/27] tcg/tci: Remove tci_read_r8
Date: Fri, 05 Mar 2021 17:50:45 +0000
In-reply-to: <20210302175741.1079851-13-richard.henderson@linaro.org>
Message-ID: <87czwdebgm.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use explicit casts for ext8u opcodes, and allow truncation
> to happen with the store for st8 opcodes.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

