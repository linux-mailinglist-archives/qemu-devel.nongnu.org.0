Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5E4E2E86
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:52:04 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLGF-0003Mi-Pu
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:52:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWLBn-0005he-1X
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:47:27 -0400
Received: from [2a00:1450:4864:20::535] (port=41590
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWLBk-0008Rd-NC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:47:26 -0400
Received: by mail-ed1-x535.google.com with SMTP id x34so17417787ede.8
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c8Vb/3J2WmBC8JPmtAVXIjJB8FG7kuMrPClGrDve0es=;
 b=nw7pxVE1sVWnYvbwJE/jBZPvC3OEgisiXXM6OJWbuRe/E45gCkoECbdOk1qVBlYQtK
 z5LHnjXaGfncy1NsagQIyrKoozyGiuYQwtxLXxgSbhbOQRXCNrnas0CnNerxFXpivuDf
 WMUWgQzV5UqdHM381nonnxNByUyiFzFj2cu4HDtMpvNuDgGJpPsVhZrUjGi07i3i1e9z
 IO6NweQoL9Eo8OGzAkhQcwvnIduTpfDXUxeebJCKiTySY5fmVbIAGsHYzUHT0s3JOClG
 1tLdNWTWMYWdnJ0/b5RfKlRL4gvBnVP7nRWEfs8w9R/HNsTIK/Y3OHQ97fgzy7X/5xFU
 KPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c8Vb/3J2WmBC8JPmtAVXIjJB8FG7kuMrPClGrDve0es=;
 b=RdVx52UZc47JtWPjUa2TFutXuFcFgXLAyhzX0mmm/MDoJtu343l0KcOVwQXJQ0ZGen
 JZa9Odmt1Prw2V2hK17YoJinZQZeIMrd0SbpsxQqvrR1TBB0pVDaEJ4uOvmOcKdeund9
 GM/cUbqwgPjS+CrgthpKDst7MW1eUOWT2oBQ/Qs6xIFgfI7T0X+DNaNWsfAKzon1txk/
 gIppuHkZSQIfD2jMbnyaoN0vq5oFr8BEPpsxo3sFlh9ba/Ss03Pkmt6/gLHOJFtCFJMG
 vxDNjtD7dmyxixe6qNmzXu9Ak15dn6fFJVLH4rrRA3w9ybxsdEPiHkCba1XwdCBuKkxF
 JqzQ==
X-Gm-Message-State: AOAM530PhvRY/LWAkaJQwu3oUMFfxTVzvJT/x96RmOpcgOTH0Xo96gYD
 JirhSKi9sUgCA9s0U7GaZq8oSw==
X-Google-Smtp-Source: ABdhPJwUobR/yrdY2HIGxERfWCOL/dn1tKpBdSPnVZjllaNnyd+yRb/Lj2EEeyC4GfQmC6SU4fawWA==
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id
 ek18-20020a056402371200b0041613bf4fc5mr23994991edb.115.1647881242980; 
 Mon, 21 Mar 2022 09:47:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm7095379ejc.78.2022.03.21.09.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:47:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D716D1FFB7;
 Mon, 21 Mar 2022 16:47:20 +0000 (GMT)
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for 7.0 v1 0/8] misc testing, i386, docs, gitdm, gitlab
Date: Mon, 21 Mar 2022 16:46:52 +0000
In-reply-to: <20220315121251.2280317-1-alex.bennee@linaro.org>
Message-ID: <87a6dj45if.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> As per usual here are the collection of random fixes and tweaks as we
> go through the release process. Most of these patches have been posted
> individually before although the semihosting and gitlab patches are
> new.
>
> The following need review:
>
>  - gitlab: include new aarch32 job in custom-runners
>  - semihosting: clean up handling of expanded argv
>  - tests/avocado: update aarch64_virt test to exercise -cpu max

Ping? Any more reviews before I generate the PR?

--=20
Alex Benn=C3=A9e

