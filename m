Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351B4AB8D4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:39:06 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1QH-0004vO-0r
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:39:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nH18a-0001yr-VY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:20:51 -0500
Received: from [2a00:1450:4864:20::436] (port=38432
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nH18T-0006fj-Es
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:20:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id s10so21217396wra.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+dxwU5fck146Df7Y2u19/HrEO+4gGr87S/lNsJrFUbM=;
 b=AAE5XSckpBzm6oeY4QKSNq+iWf/+KfprqlE3xVTAemeYqsGYoitEngpBXlnAEXnybv
 GiJuy6XRJI+3hSMwDiUfD2/ez7W4eemx7D1EB/nThhmsWASp3E5YIWrTxwe3cQwWO6qT
 /SsMl6pvjQVB50Ob84ZrOjthSIePKWnILrykKLIoxWbRbfEi6f8tRhuJa6hqrX7g5ICA
 V5vb/wBtIxt5mjJgDz0Xx9U6pbYXAqc97AUxhm3gc6RhpWK0aVfPv8p73V8v2pZl1XUf
 VJNp5FK+hlDy/SxXv3exVfLuAII1rkf5TvKIYwNNJICkiOsO8R9o1vGDFhmvhiaQXhkR
 70ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+dxwU5fck146Df7Y2u19/HrEO+4gGr87S/lNsJrFUbM=;
 b=pIuIIB7IdjXSyOXjQcVaE1odJ6h3lWtQQvQwXdfJt1WX/+b5vnN0cA7TzxNezPSuNf
 6+UMO8f6PQDFMY3OXYc3iP1Hhf39qMXa8SHY/4xjUe8JIribstKYv/j4HwiRe/xB30cV
 8jAxsw/U8YNGrkxoviqjp3PbeYAwRVvsV2kWPmBoZ2dL5heKTBuwz3dbsOrkw5zBEJVg
 oyoqxleh5Vm/X12c3ZlzAS62vY2DSWm/UEJCIL6mu8wgR7BL2WGInZwlsNh5Bz0W3+MC
 uYPR4e9hN0k5twnQSQcO0ni+jdehKTj60J+2fyHeTTCck1MgsP0z5Io4JQiK68keFxaw
 qQ/Q==
X-Gm-Message-State: AOAM532ucrIZ/hwMRS5E1opxvhgtxaCv3jVL5eGqerlWwQj+RRa5Zt6f
 Brudn0pDNoXWnS+TOImbVACDgg==
X-Google-Smtp-Source: ABdhPJyGgYmJGcrwmIKXGXjOCnIgBk3lA8Kc7x0W5DAstPqO3ssyyYc9TK42IPcyBthcQ3MctMgIlg==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr9692581wri.434.1644229232335; 
 Mon, 07 Feb 2022 02:20:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm17876739wms.8.2022.02.07.02.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 02:20:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6FBB1FFB7;
 Mon,  7 Feb 2022 10:20:30 +0000 (GMT)
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
 <20220112112722.3641051-32-alex.bennee@linaro.org>
 <2b8db685-ef24-cfd7-6942-526152cbe166@redhat.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 31/31] linux-user: Remove the deprecated ppc64abi32 target
Date: Mon, 07 Feb 2022 10:20:13 +0000
In-reply-to: <2b8db685-ef24-cfd7-6942-526152cbe166@redhat.com>
Message-ID: <87leyngeq9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 12/01/2022 12.27, Alex Benn=C3=A9e wrote:
>> From: Thomas Huth <thuth@redhat.com>
>> It's likely broken, and nobody cared for picking it up again
>> during the deprecation phase, so let's remove this now.
>> Since this is the last entry in deprecated_targets_list, remove
>> the related code in the configure script, too.
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
>  Hi Alex!
>
> What happened to this patch here? Seems like it got lost in v2 of the
> pull request?

Looks like... I'll include it in the PR I'll roll later today.

>
>  Thomas


--=20
Alex Benn=C3=A9e

