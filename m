Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6D495FB9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:22:39 +0100 (CET)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtsE-0002uT-B7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAstf-0007Ww-Cj
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:20:05 -0500
Received: from [2a00:1450:4864:20::529] (port=35837
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAstd-0000dz-IO
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:20:02 -0500
Received: by mail-ed1-x529.google.com with SMTP id n10so26707525edv.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mDgzD4KOVb6EEJ/o1sE/UCdZZ0DjjcM5yypl4GTRkpE=;
 b=AuG4rXGOJVJI3JLuxkM4v04G6fM7TXNl0oUXn1Zn/lBCWB9NIhu73hjP0eE1GmJ5C4
 GPZrIpneKFgj2nOOt3DB++9F/cM+ncV3eg/96KlbJzDtDUAPWfIym5XcCSo+ahMHtAjw
 6l4g5o8mSubME5wNBiV231airyh/aSSqRS8U+VLqvYn7E/dUWrkmQlnBPPUiIN5lhuOg
 Hfp/+THkqUPy0I3T1/X0yA4EWnrKCn+sxv4tEJ8TR+Dk9GMibXwc135vx0ZgxTFlQD9E
 Z4UJaQEBDvRe4H53sem2GEUguG/pPK0y2yc/mJwenEOY/cp69O94rCFwReWEXxmeC2uM
 zNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mDgzD4KOVb6EEJ/o1sE/UCdZZ0DjjcM5yypl4GTRkpE=;
 b=XVpfTlCRd0lEg4tU+8TK7Klk24AI3mtjRfYJLCcHBjQtOIb+aA5Iy8HSL6dLtv4r6D
 gVLpuNVHPvv4vK4UdF5OGtJgeh7RbOWR2ZyC/tHR7JvzAcykFk8tILHuocRxlEDvQYGq
 tM59jfts4nnpBNPUfC8PD5mSAOspg8BGZyUSav70X1SkYJJ8FWL4KEzUUvbxgUPt2Xum
 E2zqFW17TBPLr7mk2yp5ZqTILy9f69tvV2ZfM1BFQ+3N2bHW5wrPOWKGzTGpsymlQ9OC
 iTn//hs0gP6VBOnzyUeNU+lQCd+Ixi+PpSkDT+2f2U6pwmTm30XzstQl0nw7PvqWAbqL
 jW/w==
X-Gm-Message-State: AOAM532/ceTVixgW3AXFTgVke83yIuT0l8PuwJUECNnwn0SkgUY0tjC+
 NfJlaIUMwpBuUj2vq5/89SHrdQ==
X-Google-Smtp-Source: ABdhPJzg6lu23dTuciPMNuTpQgi3IxQZ8ppNR3a+XDfazQLnM69k047vZBZUp8gTGPf4khtMBVVnNw==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr3953527edr.311.1642767594442; 
 Fri, 21 Jan 2022 04:19:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z24sm827912ejn.101.2022.01.21.04.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 04:19:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8AA3D1FFB7;
 Fri, 21 Jan 2022 12:19:52 +0000 (GMT)
References: <20220120151609.433555-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/armv7m: Fix broken VMStateDescription
Date: Fri, 21 Jan 2022 12:19:46 +0000
In-reply-to: <20220120151609.433555-1-peter.maydell@linaro.org>
Message-ID: <87a6fp702f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit d5093d961585f02 we added a VMStateDescription to
> the TYPE_ARMV7M object, to handle migration of its Clocks.
> However a cut-and-paste error meant we used the wrong struct
> name in the VMSTATE_CLOCK() macro arguments. The result was
> that attempting a 'savevm' might result in an assertion
> failure.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
> Fixes: d5093d961585f02
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

