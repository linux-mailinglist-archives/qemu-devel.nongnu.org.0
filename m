Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402C4AA845
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 12:10:14 +0100 (CET)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGIxI-0007zW-Vj
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 06:10:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGIuy-00078X-CI
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:07:51 -0500
Received: from [2a00:1450:4864:20::434] (port=34486
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGIuv-0008Me-UR
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:07:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id f17so15963600wrx.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 03:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsPNMHJLH8imATGSV8VGxBDxjYXkw4EGztCs0DwaSIQ=;
 b=k8tilXsqsvJ0Lb28eo1vo3wnZGVXgktskOnlO0MuOvyFAuGKpk0fLqnypPhtbprbq3
 Qmtoue+oCNAHAB7wqQXlWn+qFlzy0HCT+JaeLOViK1XWkNDCbkIBSvZGwFLhat7OlmE/
 xBmGyZJ8795cMtKuTwUHtMABXHwc/TTNTk2UtmnpBZtYskJ/FhiRj5cDS4sOJxEC/cMK
 6sJB16EbbYFIk8tWyRTZ6Z4PzfRdW3rpshGtm+ri6LzhyRG5pgVe9eFbDOpkHXrJI/fr
 OWqUB3MNxsvUsGuXCtue2/ioakcXJ6+vp8wcboOY+gIMmgtWIDgEMXJ2UXlaii28/O80
 ZHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsPNMHJLH8imATGSV8VGxBDxjYXkw4EGztCs0DwaSIQ=;
 b=hYDE7dGOkWlF4ogtDANJ8nMg0YmiAZyt+k++27g/1QTz4zWJCfPeb4Dg4C3nujAv+B
 gfgmyv7Or04UxcJxtgFZOcnRybJv7bR1danJvXEyVCTr28obzIygn5GEHEdWHFPgW95J
 QKeNvlmoI6dLlxDDQQwA7NxTrK2b0L9+JaQRyh/Q8htgXOCZUU2H0sy43jXaZb5gbqxw
 ceIrf6Up1VBtvRzwB+irAIk7v8Cwe1yeG+qxYv9L05zfLBXkfhhUv7Fea59AubaDM5m5
 JViCsdN88RS35n2gKb88uzgUiK34udpxJW1GFagQKMk5bFvBTTvvZbmiv0P8tI3vAztt
 bkNA==
X-Gm-Message-State: AOAM531fk8YNLw2NPeul11R9RdBJF29aIsjhwesIQsQ+vX00UvhLFWyc
 xqmMFOnk1dQ6nW1K4HUzN260voCW0eTcgwJ+3NbwUA==
X-Google-Smtp-Source: ABdhPJy2WLq0DOVLNsLqqWDEnIQ/yOdVKq8kF1vmsLFo96QkfiOUBuknDeElF6hHzxszcCgaIyffl96B3VU+rK82XxY=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr139887wrs.295.1644059264109; 
 Sat, 05 Feb 2022 03:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20220205014149.1189026-1-mst@redhat.com>
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 11:07:33 +0000
Message-ID: <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 at 01:42, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
>
>   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 593a84174b09f0c8ae4d35ad014f93d1fb7cac00:
>
>   util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-04 20:16:59 -0500)
>
> ----------------------------------------------------------------
> virtio,pc: features, cleanups, fixes
>
> virtio introspection commands
> Part of ACPI ERST support
> fixes, cleanups
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Fails to compile for 32-bit, Windows and macos because of format
string issues in hmp-cmds.c. Here's a sample job with the errors:

https://gitlab.com/qemu-project/qemu/-/jobs/2058116754

thanks
-- PMM

