Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE03687F00
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:43:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZrW-00036N-R2; Thu, 02 Feb 2023 08:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNZrS-0002y3-66
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:42:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNZrQ-0000o3-4w
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:42:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id mi9so1925048pjb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RURnHhbbumovAu2Z1QIxvDriboC6z3dW+7UoiI3myL8=;
 b=eXyK/mIvyLB7KVXPDfYMNcctc4rJeSKXP4IusaDu2ac9POU6j4JDDnvN45zYsZ/UE6
 Z+dusKWtGZWpE6L/kcPkPDmC7fopMsT7BV1HCFei/682XceufCevTbkD+E7JG1ZrozmJ
 Xxx6cCiDtRMSGs4aMhYLte4OW2yuSkFPdstO7/nn5YUrEgyGbsCKda7GrK6iEdRD25EP
 02xfTVAJ7qjqBMIG8ckduM3bGq98lwdC3n7JlurJL3vKCAToCKMMxiJy3RGejN9RYS9C
 XneGDLaPd20U33rTWSORYw7VqxKzNIjCqD9I0YMuiNi4eYXflf07VDnwTmF3Zz/+JjG4
 TJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RURnHhbbumovAu2Z1QIxvDriboC6z3dW+7UoiI3myL8=;
 b=EbInX0Xi8YULV7wU2ttHJtdafa8OJarxJhTb97bYM7EHFaYktyR6mHGwjbveN60lzQ
 xj2xzPfnijf0ahppAU87nEfTOZTpWRWsK/f/F0MALnf2bzWXdzJHidatvOhxvVJHm0C3
 URfY9z8EF5vapLAEMuTqSQsVoJ/7YzxuRm66nFAdNihWmlFLVYIpb93e5tHuv3RflLyf
 gpMC/F/J+y7iDcd+bBLAoKx6A7nJDIQKV7E4b/A+xTapoij99mKY/B/0jEoWQu7Cus0r
 U6+dpaD0WWIx3p6gNelFTDp+AnEh8lAhjmKlFaJzVs0Q9FCSWN4h2c7JrZaerGD/JNxB
 Abfg==
X-Gm-Message-State: AO0yUKXJf5vrguUDHsU5XqrKbImWj3ny0xuFPnlhfUBgkC4XUa+W4yMj
 CikB+OAUdxc7O9jfFAFDkeoOm8YJQTGQLB7sgrLF2g==
X-Google-Smtp-Source: AK7set9QU3vorQ/jen36v3ZItm81koFWt2RjRISS70Ff46AMKBtVIgXLujdYlg6yR3OW3sPif0y4DUzTX635BW+wHxE=
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr1582858plh.28.1675345361331; Thu, 02 Feb
 2023 05:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20230130201810.11518-1-mst@redhat.com>
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 13:42:30 +0000
Message-ID: <CAFEAcA_KR-LBw1UFQ=p8dVE-+YD=LJr7j0PHC+T9fFUHfX6Wxg@mail.gmail.com>
Subject: Re: [PULL 00/56] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 30 Jan 2023 at 20:18, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to f5cb612867d3b10b86d6361ba041767e02c1b127:
>
>   docs/pcie.txt: Replace ioh3420 with pcie-root-port (2023-01-28 06:21:30 -0500)
>
> ----------------------------------------------------------------
> virtio,pc,pci: features, cleanups, fixes
>
> lots of fixes, cleanups
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

