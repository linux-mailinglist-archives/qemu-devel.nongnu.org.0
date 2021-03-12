Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC9339754
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:21:37 +0100 (CET)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnLs-0007kL-AK
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKn1M-0003nb-5z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:00:25 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKn1E-0006m9-Qs
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:00:21 -0500
Received: by mail-ed1-x536.google.com with SMTP id z1so9433731edb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xce/217S+3uw/F3kMvIeNoXlNiGWQQZxZcAWy8z1N0k=;
 b=nqFhVTXGBlv1w1QPpEavmpCgialq1+ZcUT2rzY8TQYC9s+i4bvRUqHWgJCthObLcQH
 Jh3mkzD9mZfAJUn+X1neApJV7tD8LeXOGlVgWu8nRzHyt+yRIto5ajHDPjbDFWtafcWH
 Q0dmAbHFsIcvyssqpL7oAL8Xr9hNLAvCrcGx0glFe/5HSpRahskEBAWrhWgA/mrIV4cy
 WUqJ6AiKmiEuNlTL38BJYyJKZpVsFdRtUYC+Q2AedTIgMwqz1s8B3JAVrpejiDO0bbI8
 zUD6NpyhT3dqx+Ni0my7SLEB9+jYvlLiacshY3D/IRn6QgLEOLIvzBTcUkGmH3tjb2ic
 ceYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xce/217S+3uw/F3kMvIeNoXlNiGWQQZxZcAWy8z1N0k=;
 b=acK0KcGBGql8eGqi+EmeYh7OTpQ8tA4xgQa+2HwY+ac7doEUyetxnokSI5YhfwLTRY
 r/RokJ5u4tJyNiEt0kAFnFSytD5qxTXJoPqBJphv/X6jfuWWSCfEQ/kW5o/RXlvfiqq4
 +GxlYHoAb919pWAWwhdDguItFThsxa2n4JUUf0VfpxsNg8eUeXIn8BRibPSr9ugtI8jG
 n/RU7rOtAEA84kwaLED2qHwVmQtBiYELuazGvuk2dwW/lEtR4o8CO9cgf6AtgzS3HJ3w
 zEHEsIUBODeqJj/YX6RcXI46Dq+xRvpU++sFO7Y4HRtj7eYAk5oCn4ZU4VBjo7qK2nX9
 5G+A==
X-Gm-Message-State: AOAM530kTKc+6b2xb/M4ga/4W9Dy281jxYhkjsCYRwU2t35ZEGgO1ZMn
 c5q6OC77K3Yo8uAr6IlkE5l9G8qvXJWw1scLqVMdB/uHxy1u9g==
X-Google-Smtp-Source: ABdhPJygERAH7ZWqv4x5oq7YC9+YADhLP68TK/ZeWhW08tLrAPy1ZDFwENLKC6E30bdSdf9FEekPV7aNUYkVDFdKZpk=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr15700725edu.100.1615575612479; 
 Fri, 12 Mar 2021 11:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20210312172939.695-1-peter.maydell@linaro.org>
In-Reply-To: <20210312172939.695-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 18:59:53 +0000
Message-ID: <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset
 handle memory aliasing
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 17:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series handles the possibility of aliasing by iterating through
> the whole FlatView of the CPU's address space checking for other
> mappings of the MemoryRegion corresponding to the location of the
> vector table.  If we find any aliases we use rom_ptr() to see if the
> ROM blob loader has any data there.

The other possible place we could put this code would be
to put it into rom_ptr() itself. You'd have to change the
callsites to pass an AddressSpace to rom_ptr(), but really
we ought to do that anyway, because a Rom has an AddressSpace
that we should be checking as well as the address.

-- PMM

