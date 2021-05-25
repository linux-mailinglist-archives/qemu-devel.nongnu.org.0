Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474838FFB6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:06:43 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUtV-0005fS-To
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUsQ-0004sb-1H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:05:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUsN-0007ML-AH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:05:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n4so5822799wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PJVWKjvv7H8rvLcmlCZgP580qufnO8NsSIzTUHZE7Rc=;
 b=c+kbCcMN76J1dq5c5kftJAcPF26ZzfRoBCYk5GiUcRv8uYD4nckXc2icgIvYBmxTuy
 pWG4VEOiszu3TeGf76NLjRJyP1adP2lgasU12OsJ8VxlnnN52XXv6mQWalmOLR+CCOum
 xvq3S7DFeX6HjikwSkNITP15v1eJVbnm52gfI0O1yHUi70DEeRHJ+JpQUoVm9/Ng4o6G
 RD5C+/mwmyw6oIfNUSnJxMe2Uf3zYwC6VPZwrEu3W8SzLkyo+iF/Io+oV0A0ZSYTN4b7
 aYIvTieXZflA8bjqVIpZTrl8zwdTJSCW7scEMSdfeIiHJCtM/klg/HsDbe6ZDri26zXT
 u3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PJVWKjvv7H8rvLcmlCZgP580qufnO8NsSIzTUHZE7Rc=;
 b=EWkWQ8DiqWp1JNod84fxsFdSb7Q5K/Jnhrij1we+2FiKp9wtEnqFxuvLmGOhHYAA1z
 phQxmD9J1eSHIJDYtqkHoPM0Q7DxouNGvTU+Nm/1IQkNjKLqpa24mZAnui2h1rGTflp8
 t1W8oeHATjyjVIP0RGQuY2Vg/k5wDGZhUjhUVKuWNJ2MhAw4aqApsLVJuUejQGbyqRvz
 Gi47A/SrC/F74wk2bJbpT19wQxZSk5TCGQ3G98PWKAIWkUHYWsnIYsqAEOz12eUyjxtj
 Ztq0n+DE7X0girzZ0B9eHoIh8+aSm2GCdwiCTvF1vTSMRvZ7/bPD3dHQX5NzDpVPZmyt
 t7AQ==
X-Gm-Message-State: AOAM533AgBDhyEV+Zit7RB1gXmN6WGcPpijYtsnpY/2zI0BaiSSakNs0
 ctWtVRR78oMw3kH2RIfRMbX2Ug==
X-Google-Smtp-Source: ABdhPJxnTGpQcwOvvvFQUeWeESNCqOnzevWz2fFS9p8FlmgV0DOzehJqsCREqniHd5HC5HzRLIt9XQ==
X-Received: by 2002:a5d:4e0c:: with SMTP id p12mr27300743wrt.268.1621940728137; 
 Tue, 25 May 2021 04:05:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm15652191wry.55.2021.05.25.04.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:05:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A4A51FF7E;
 Tue, 25 May 2021 12:05:25 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-2-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/9] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
Date: Tue, 25 May 2021 12:05:20 +0100
In-reply-to: <20210525082556.4011380-2-f4bug@amsat.org>
Message-ID: <877djn3wga.fsf@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Extract the build/test jobs run by default on the mainstream
> CI into a new file (buildtest.yml).
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

