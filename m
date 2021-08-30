Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B73FB912
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:36:53 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjL5-0007wv-2o
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKjKA-00075L-LD
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:35:51 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKjK7-0005gD-1K
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:35:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id i21so32089671ejd.2
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=VYUB5TR5pS4Ue4VCIJFSTFxErEVrcPIjGvJDgfoiVKI=;
 b=TzYJjblV1cAjTmxcXl7rRVFDnQ/owkvUnGD647jMwcnAkCG4toUl4A7aFs8JFKWet3
 5Bxd0XzX+GaA88xteBQImng8BPFr1eQaKRLR/Ymol2cKZZbrln1Tq5XoRNDaaztB05hN
 J6IxD4uxsPq8gRYQywA3XArkHf44BHiE1HWm2iFBYMyGIdO4IsF1mzmZrhgqAKPtXzY9
 3LPHrVXlFt9YQn12pofvoa9zfqlSSiijmF6uakNSK3vDhyk34/QJKuLqNtl8H8hWtjpR
 zhKe7orV11dN7aErpSQhWFnauqKTcJNzpjWBZnEAtsp2IzjOu+z783jDr8uMI3kHHwxA
 XBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VYUB5TR5pS4Ue4VCIJFSTFxErEVrcPIjGvJDgfoiVKI=;
 b=XQ3Xu+RyO988lCBrtWMt8xEfx/TZ9oefZGpwudHLeV/u3AB4qR5O+08lskFBWiFLa6
 ZvL5UpSYKLXbrZTT6lZ80Oa6Bd3zOtMJzShDHZ5CPxvd9R2eX4ffjy+QFaUJIkW8JTbS
 FYJdx3ZiDg/G19PI8UwNVCQ2FrBCRGXvkuNgIRgMZ1KJm0UOKregT0tJJrb6n+suD1mX
 ucHRSO6u5YHeD01kfF9Io3s300rQmD6Xvy7sB8zoeShEO+y7I7dlR9qVEe6VX79pZ9QL
 clgHEhzVElxSfoD2no/ldNUSCwTEAlmsy71l18I/nR/nO88b2a+PDREiYbP49M6JheTr
 yKOA==
X-Gm-Message-State: AOAM532Ig9+NwErYzwbE07yDv9Nt7wuV2vf0prahb2la7h+YHjhTi2Jg
 1d2zJR/dV3Yf+UgBfrZDPCKdzT2Ei3ctsKDmYznsFDzHdpDmFA==
X-Google-Smtp-Source: ABdhPJyb6lHRZg4JrvckeumkUtT3eBlKDiKFjJWyIrENj+ykwcvSivVgGUpLKjne35uq9S3eAk+sQH0Ryqh+UHZhNiE=
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr25905143ejb.85.1630337744611; 
 Mon, 30 Aug 2021 08:35:44 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 16:34:56 +0100
Message-ID: <CAFEAcA9YCwrm43JfFE_oenTYnj+vfOHD+Bw4mTHAqOnBgpQX-w@mail.gmail.com>
Subject: block/curl: should we be checking curl_easy_setopt() for errors?
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity complains (CID 1460331, 1459482, 1459336, 1458895)
that we call curl_easy_setopt(), which can return an error value,
but we never check the return value.

Is it correct? Looking at the libcurl documentation, the function
does return an error status, and there's nothing that says it's
ok to ignore (e.g. that it's guaranteed that the library will
safely accumulate any errors and return them when you make the
subsequent curl_easy_perform() call). On the other hand, neither
the libcurl manpage example nor the handful of example programs
at https://curl.se/libcurl/c/example.html ever seem to check the
return value from curl_easy_setopt()...

thanks
-- PMM

