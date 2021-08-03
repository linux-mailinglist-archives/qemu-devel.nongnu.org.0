Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC23DEE0F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 14:44:18 +0200 (CEST)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAtmL-00035G-9J
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 08:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAtlA-0002M2-0K
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:43:04 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAtl8-0004Xf-Dd
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:43:03 -0400
Received: by mail-ed1-x536.google.com with SMTP id g21so9529193edb.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=x5es6414UeP5XIgwAYsw6cjQbw1dLdXlbcQilZlvrB0=;
 b=JsaxFSH5teOSYy0SHSetg/ksoL3IV46d+PTIVWcQNpviVLtfo5oqpZypNs7+KDP9es
 qmQXlQgMfjxaRSwIAF5DktAkpbzOc8If+oNB6AlEbX5YYTntzrCSuPQqcgU8JJtS/8wS
 RV6dtYplf0dhpodLyeYJ6JIAK6wmkwYWG2eiNHaOclR6l+oY6QFPIbinxQYyoPU0zrdG
 1rG+iyf6vGCySdS9YOXXg3txAC7n9HgdSFU5hVQfEXEKd7MyTROQymP017NPvp3u5JVe
 +QxdgUQBgUcwXXaaSgPOFJ8gBpea4KQqmxtmve2rVxvvBpyzXMrWDzKSXL54rwWaNWqV
 24rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=x5es6414UeP5XIgwAYsw6cjQbw1dLdXlbcQilZlvrB0=;
 b=uB1R/4z0d66xysLgr+AK9F/Q8zJGwDz+WwKZeK48ek2urjRk7gEXb9i+/STIbxP4xc
 T2qZfFxXS/h9ukeExZvhtZDoXCV1rTQ5r6UtHnpqpKGMkkMfEnS/3bxlu555gR5in5XN
 rmWxncgY0YGYLA+EeMo5Zr5pEAtKrAw2j/SzQzU8gwlax7h3kimRS/HmgLp8yCTD2Amf
 BeMntNYTDJp4cOwVASPAtYzzwn0SHaBsVp1yc3vvkKivAky2VNw2X/HvNySHq+/KZF/7
 632qnMHs8yLooETzBU6st8JCPX61wB7M1wlg8QeqxBgwQuyDZH/kzRXHhL/hYOFKPHYN
 Wg7g==
X-Gm-Message-State: AOAM530PDoDUAvpijLbZAnvhMygfsxPIcnAg0/xLNVbogsJE5fkbPTHZ
 oKST3lMksx8ViyHkG7RyJl8AHPULWgMdflYO4rCSHX9I4pUfDg==
X-Google-Smtp-Source: ABdhPJzW/D/sfLLxWzxGgRLwkHCUgudAZqCRjo8mxvUAZD20Li/6ZEbmrl2C18bge2FZPX3BgTc4dpYqvV1A5MrPBBI=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr13939448ede.44.1627994580049; 
 Tue, 03 Aug 2021 05:43:00 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 13:42:16 +0100
Message-ID: <CAFEAcA_g8F26bV6wHFRUt7TSZMjt8hs6Pip8kHw=s4-WXy_AXg@mail.gmail.com>
Subject: 'make check-acceptance' eats lots of disk space and never cleans it up
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It looks like 'make check-acceptance' creates directories in
build/clang/tests/results which are huge and which it never
cleans up. For example one of my build directories (configured
just for arm targets) has over 350 'job-[timestamp]' directories,
many of which are 2.5GB or more in size.

I assume most of this is artefacts (disk images etc) needed to
rerun the tests. That's useful to keep around so you can manually
run a test. However, we should be sharing this between runs, not
creating a fresh copy for every time check-acceptance is
run, surely ?

I just freed 72 GB (!) of disk on my local box just by doing
rm -rf build/arm-clang/tests/results/ ...

thanks
-- PMM

