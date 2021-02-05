Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823C310FC2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:18:46 +0100 (CET)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85gr-0000ki-8A
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84VM-0000II-Fz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:02:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84VJ-0004ui-IC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:02:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p15so8427001wrq.8
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Iq1m98abrqUb35GkF+sri2Dt6VP8Lij/GnBpuqt9iHE=;
 b=DMa8NxcFQVzCk6lgqk9WPQjgtPJtvznjJNXbXlPmWGgGm+tuEU3I5AOEfyWb/AGvb+
 j6QS2irS4mgDRA4Zzegz8I9Ztii1PjB+nUUG1uffML9Wk/MGdFl+BtK92dSKmSBZZO7Y
 I4xSy2TYd0Allg3pRCJiCmXDISGDmthtmTy5uunC0esGZ9k6VUgEq9HTk/7dvo/hVzlE
 7x9Ex8o7TZ275oMhvKs2M81QlR3tifV/OGb1bEL00tOL+LdzAdbhXcL8eVxMgdgrfeMD
 sEBrTKYPl+e52lm2iZK6V4nL7jJ5q/E0tVmJuPsRfIXSN3blsRTQAjYb14/h4SVDhbv4
 IAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Iq1m98abrqUb35GkF+sri2Dt6VP8Lij/GnBpuqt9iHE=;
 b=orFG9uIaAu849GxRK628BD5NMKsoTMulpvVv99pWucSgFkfvoyocZctiiugH+Hbm4r
 4YR2eSLxxMvFEz8iXcrmq/SVBIHQAldg3KvtKlL7/DGy7EsxmeseWvhtHWQwv4whXvNL
 /gp6hiIW9b31WJk0XPurZhwvqv7tFRvG+jmx8C3VseXjLkM/fGN23vRy5x0OBpw98Vq8
 XlGrPJatKpxC8Q2kQ/pDQQAMSAIQ/XurNY/bxc55NOwYKPl7+VSijCfavnS+2yAmJsjo
 qym/IMDdvalW+CIJgJojR3wsm+Fzd7z2GjOTVuBtbdsErWXiUtbXAvH5ih3ypeoLac1a
 bqQg==
X-Gm-Message-State: AOAM532ZvRKpzSPDfXeCtwFzJQoba9c1yYn9HPkcnXz/RrQ7AvyHL+gJ
 NsDtNy9+e2opWoIYkAm18aZrL3dIMfIUZAaA
X-Google-Smtp-Source: ABdhPJzf4LFgmhZNtjBtyNr2fzvI9wm8LvclMTPI0cjdmjyb9a7G78sCdntMpU3cEHp7wObUK60Qqw==
X-Received: by 2002:adf:80e7:: with SMTP id 94mr5141599wrl.5.1612544563687;
 Fri, 05 Feb 2021 09:02:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c2sm9676368wmd.10.2021.02.05.09.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:02:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 064F31FF7E;
 Fri,  5 Feb 2021 17:02:42 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
 <20210205091857.845389-4-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/5] travis.yml: Move the --enable-modules test to
 the gitlab-CI
Date: Fri, 05 Feb 2021 17:02:37 +0000
In-reply-to: <20210205091857.845389-4-thuth@redhat.com>
Message-ID: <87h7mqo3bh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Simply add the flag to an existing job, no need for yet another
> job here.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

