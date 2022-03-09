Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB24D2D2E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:35:40 +0100 (CET)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtfP-0005fh-3e
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRtdJ-0004wR-74
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:33:29 -0500
Received: from [2607:f8b0:4864:20::1132] (port=46603
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRtdH-0008CD-LI
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:33:28 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2dc585dbb02so17130887b3.13
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qlMQee7sCQhXPzwpoYR4hLkRtqkDtMRSQCE+SeqOTvE=;
 b=zmNQsUGUshvBVG9GNHIilIVn5h6C1R5HYqM26Tig0pN7hnYyP/fRkh6vDqEPcwMqtr
 szEjiZcRsDqWLKLuFzpK4EuSI8iB+Zo0yDMKTUKoFy/WxJ0UEgUSLQEIBvcNsGosC6ZO
 FgaPVY3cuHHpT0zn7KLj+5FAgF6mXn+tuaoOqzYRtCcDIKSe2ig73Vwzlmj87BttgtQB
 a406K6NW2+7ikjN11Yjs/EDFBKCsdosYN0/zUj5QxAywv8Hzs1Cd/bIH/1vO/WUab04P
 6dT94507FebYHeLLhvM+VpjBAwYYEPAUhdhvCMXU3OZhtLE7SNpEfGiNoO1iUlv0usoH
 uW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qlMQee7sCQhXPzwpoYR4hLkRtqkDtMRSQCE+SeqOTvE=;
 b=XnsRsXoI0OTu+BFSSziqkswsrBvEL+m2+rdQ+rShR6B6i20qlbTbKNzxbH5DI8g8r+
 njhnTIQYQRWvMTmrqzhudiTHPOlnjkaPpeVi2wK9j80XsWRrXBlqJsCnOn56nCRAYu+R
 bQY0V/S10bMMgAMHlbA3fpKsdE8gLcA/G2Rb9+YdWQ4uuaQZtMRaTFLVRlG8zHi8sdYX
 t9zU3ji7bSH7QYw4wLjp2mYOp+3zipx5kAS9SsuJlKXvK8mdIGxg8wDVmaJsxJ6ERIZt
 3z7Ul6By6yNtyYsVHLvMn4s+Ga9jXQZQmmYnn6jSkV5CMrg5xE8GJwLIoOAefxyzMGMg
 kGPA==
X-Gm-Message-State: AOAM53365ljWLRZoqB8ulmpIAdLZaOY8w93arHpJxcbYZcztKn3vwfYA
 OcmLUTscqUcjoT/E2VNfFkWEmhafkXE5xltgxALYDKYwv6qutxK8
X-Google-Smtp-Source: ABdhPJy7VFo4kFZBfDuK99ZN2SKzsSRQq6cJLRVYttV8T9hT3iNEKAfUQ2xQO2XtD1WsAY/qDqy+KYkKf9LjPwkDWv4=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr15936781ywh.329.1646822006561; Wed, 09
 Mar 2022 02:33:26 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 10:33:15 +0000
Message-ID: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
Subject: QEMU device refcounting when device creates a container MR
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; does anybody know how device reference counting is supposed
to work when the device creates a "container" MemoryRegion which
it then puts some of its own subregions in to?

As far as I can see when you do memory_region_add_subregion it
increases the refcount on the owner of the subregion. So if a
device creates a container MR in its own init or realize method
and adds sub-MRs that it owns to that container, this increases
the refcount on the device permanently, and so the device won't
ever be deinited.

As a specific example, the usb-chipidea device does this in its
init method, so if you run the arm device-introspect-test under
leak-sanitizer it complains about a memory leak that happens
when the device is put through the "init-introspect-deref" cycle.

-- PMM

