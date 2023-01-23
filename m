Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2067866B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:34:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2YY-0003I0-Ql; Mon, 23 Jan 2023 14:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pK2YX-0003Hn-6r; Mon, 23 Jan 2023 14:32:37 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pK2YV-0000wz-Py; Mon, 23 Jan 2023 14:32:36 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-4ff07dae50dso141820857b3.2; 
 Mon, 23 Jan 2023 11:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fyu7loh/4S0RtxnBPpU5tf2ttu1n/1GeQWJGnBAEVUM=;
 b=lYYFDSqaSabk/mD38mrAE/be6JooOs/Np7lnMl3i+D5pbzY6tOfPZ+nuRl+Yxsyucw
 sDhAJ5ENOlAOTI+E8JHiAnBa6N74LRSVTIWiZxjntxgec19y7YpqNVoYt9sFCF59gge/
 vyN8coKFR/yuYDk3XwOWgo5S506PvYKAmC3EKYL8qXj0/aRP3KUbMnq7jbPLAUw6XPcO
 YJKkAsi9Ivx1OsB7OIJTobDf11UDMPTg8Dfkx7D8AM/HeZqq0J6u4z5lon7dzoDRlesa
 RHe7Yvu07HH1HGcvU/QUrIkQd9llwQWnkhZZEBIrZ733yfULbGpDCuNzLOLW0fVBAdAQ
 +aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fyu7loh/4S0RtxnBPpU5tf2ttu1n/1GeQWJGnBAEVUM=;
 b=SZszlFm01oZu86obozHErM9QdBiz1wlOLPMJBMp40OEx4cmXfS452smVM+laat2deQ
 Q5eBEwHb8CD74SSSy+aHZYOQ+02BtfBkMFdzTZvkfpctQNAFykhKStcg6AwS19yx6qry
 FrJphgst6vQBsQ1AcECvaJGAD7lTK4pvNVR0Ql+Ga0ksAHOX08gAOUOqPsfXmmqyfDK5
 Ecal30iFvSKhwjtpfnCAyrXg4d3XQsnU+NRY+Gvqu9OdYdxFnsVZtH0ElrBPo+fMOcKo
 Y5sF9XKz7mnw0LNcfxc5Kn34Tdhs0Tk+0G2NBHEdGftvQRW3ksfTVeWXUdYnNN0bWvSR
 qGgg==
X-Gm-Message-State: AFqh2krpLCbEiUia7SgmJ8Do3wmwuZUWdApjvBhYiWg3pUFng1tn0r56
 VLyz3A/DsqbY960X3REcmOnzyOL05ilWiaVlMko=
X-Google-Smtp-Source: AMrXdXtg02f228Al4WoRKjFI2jgcxJ7ExQq7KW1gjpPT/PhVuvBVt9T6cuLZCLR1PY5LBYzsGw3qaLd8rSS8ehvBx44=
X-Received: by 2002:a81:250f:0:b0:4ff:dbb6:158e with SMTP id
 l15-20020a81250f000000b004ffdbb6158emr1483723ywl.0.1674502353832; Mon, 23 Jan
 2023 11:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
 <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
In-Reply-To: <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 23 Jan 2023 20:32:22 +0100
Message-ID: <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, dirty@apple.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Are you running the Linux guest on multiple cores? If yes, could you
check if the issue persists also when using a single core?

Thanks,
-- 
Francesco

