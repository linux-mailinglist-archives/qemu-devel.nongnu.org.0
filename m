Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6B4A2FFF
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 15:12:30 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDoSq-0002Tc-QI
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 09:12:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDnt8-000777-Hj
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 08:35:34 -0500
Received: from [2a00:1450:4864:20::431] (port=34354
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDnsw-0003df-9W
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 08:35:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id f17so16310700wrx.1
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0HcbvTEtMJ5owsValDuXQQK+KcpcGpc0pOeSzl9YUC4=;
 b=wXBLfodTUHzG5LufDJnuEb1wRMRYGB+nA42rxRm1iILTSy9+mEt3qZO7vy5Ww2fUIc
 vfkpMWoN62k0EMUpVyOXsQek7RWK9WBVTqZm0pcAOE+gN4H2HlKIRRMMmbxMtQn/ogCT
 CBnbNSYpxNAoFU9nZflcDGf4i4ogkOJysk1ryrT3c4MMR5LMzqqtJCovW8YcLHqpzQc3
 lzbhaN9lFUSrCb77tGe3ojWWGbzk0gNjdKIeCFrox7nQNFLlK4CLvY18W9hMRAaPzswI
 IZUMhUZa3H4DWBJsB2O2hYlpc4YLqZIIIYG2TAC/feyp20unwJ19lDMMOFKPxArhvWX1
 xH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0HcbvTEtMJ5owsValDuXQQK+KcpcGpc0pOeSzl9YUC4=;
 b=pyAst+yZi6RFWMtq++AqrIQqSYP/VUQXaRuF5NgfvyeJCn7/cmGjN/08bebkSpQJZo
 ITk+G3M9ehvoWPyIU+dB+Nk0vfOoabxtC3GMT9ZcjXIzpcyHIh4yxXRyKXa1G3vAFR6F
 6cHxXhBVjOw3Y9G1MihoGOhGOVR2YI6Kq146C/Z/VgjIOEDduE4X7ZRh5jxf06sHovp2
 r8Bn389EHi4zsvswuHKQEX0VT3W3C/dHJV2MPPUh4DfWGwIcRGh32a/h/0p7yynL8alH
 0EmzDhHLCDGa7jV+O629vgKni+5WilBMuTOCXETv0WjaNU5WKE/S4Va+7xXYt61KQGsX
 a1RA==
X-Gm-Message-State: AOAM530aCVS8MXmfx3RBgkVlfGehOHZsL56kvvjUc6rZjaCtr5iYh0aH
 WideNzmy8KtUN4V7cq0ga4edholbQM/HbGQDYYBL33f10Asd7g==
X-Google-Smtp-Source: ABdhPJwVp5N9ZSvJdWIshl2KBLk0cfOCVhJDPvHATJ1oux2RFsf3omA62oBqkm3/fcMjIZFJc70vGzN40ZhYH9dj99c=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr10983956wrz.2.1643463302636; 
 Sat, 29 Jan 2022 05:35:02 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Jan 2022 13:34:51 +0000
Message-ID: <CAFEAcA8V0jAjv1HS8QRa9AQHCxg=BVVH_jYVMYUVSP-Szstq-Q@mail.gmail.com>
Subject: build-oss-fuzz CI job often times out
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; the build-oss-fuzz gitlab CI job seems to intermittently
but quite commonly hit the 1 hour timeout mark and get killed.
Examples from the last couple of days:

https://gitlab.com/qemu-project/qemu/-/jobs/2030815488
https://gitlab.com/qemu-project/qemu/-/jobs/2029246068
https://gitlab.com/qemu-project/qemu/-/jobs/2029013479
https://gitlab.com/qemu-project/qemu/-/jobs/2024871970
https://gitlab.com/qemu-project/qemu/-/jobs/2022584981

Can we do anything to cut down on the runtime of this job
and make it reliably complete inside the time limit?

thanks
-- PMM

