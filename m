Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AAB640F84
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 21:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1D32-0001i2-A1; Fri, 02 Dec 2022 15:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1D2y-0001hu-Hx
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 15:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1D2v-000335-W5
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 15:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670014447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iLfJR5a0YZnWo6sXYM4u050t72RXEskKqixcB0/c2m8=;
 b=Wvq4Z8u6rcat3uW6SEcaC7za9JmIIjnX3EhRUCH8mvPQ1eCTYMWFrLE9YkNG15SgV8fwpQ
 +2+ArHdonycS0RyaJvNdUFDam/PdYuUIGJvY/kvtcrIWQo0fzQYfLFXPabjjxsDkWrIRlx
 k8ZXrz6Itr6lEfhFioHENZb99OuGdz4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-6qPDgngIM16Sb6L7zKDYeA-1; Fri, 02 Dec 2022 15:54:06 -0500
X-MC-Unique: 6qPDgngIM16Sb6L7zKDYeA-1
Received: by mail-lj1-f199.google.com with SMTP id
 m10-20020a2e97ca000000b00279c3a7847fso1262985ljj.17
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 12:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLfJR5a0YZnWo6sXYM4u050t72RXEskKqixcB0/c2m8=;
 b=rzDV4SAalOZvO4vyuPcbyjQCjdgRmjg3WhDEqS9FjUHNLp7uaK5fC2wZIywDFMcpIO
 TBFGLR7cI/q9g1ShTt7GRaYCWpWIP3hivvJR8vpiqJcMh05u3zVSzZ9Th/9AWatggvH3
 Op6ewotvXBECoL5e8ZON+SevdoqhcXziS6ehdOxuV6NvVwfqcdMD7LATjRm9LPDHC//X
 YEV9QYDtc29tV3c+i7AcE1YNSH5yrVU14CtFCGsbGRF3aDhpn1Eae2WK3FoM28sga/a4
 b2oHBswp4F16FedfN8SdYnVq++KC6ABJk3u5Gmw5K+OPTH7MUtdUd7gQ9c+cCF/UeJeR
 NoAQ==
X-Gm-Message-State: ANoB5pmaf8bO+JIsfrplmEaWHYvIhZ/6nTAPBuxu0WniJx2xCMqVkA9+
 K6St3a1AVHfgiij0rqql7ET78Q6wmgRLPaQbdgw7ld4lAXTSX2nO9xLf/ts8gbipItE1UaIbTnz
 UoUJc2qKJfZA65zOHfUzMKApwJtpPxrM=
X-Received: by 2002:a2e:80d6:0:b0:279:c7b0:e05a with SMTP id
 r22-20020a2e80d6000000b00279c7b0e05amr3924505ljg.148.1670014445266; 
 Fri, 02 Dec 2022 12:54:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7D3quI8rncHDZd8GOqiMKQsCveR3tL4PC+CCtjXnraPuHyjvl1XCsNgZa/MdYJHAhev/rqkSriEQRMOJZROMk=
X-Received: by 2002:a2e:80d6:0:b0:279:c7b0:e05a with SMTP id
 r22-20020a2e80d6000000b00279c7b0e05amr3924500ljg.148.1670014445023; Fri, 02
 Dec 2022 12:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20221201133756.77216-1-thuth@redhat.com>
In-Reply-To: <20221201133756.77216-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 2 Dec 2022 15:53:52 -0500
Message-ID: <CAFn=p-aHB8A4MqVo9ncHvFOcS8=UVVLz2sT22HqxJBeha=ixyA@mail.gmail.com>
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Dec 1, 2022 at 8:38 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Many users forget to remove the suggestions from the bug template
> when creating a new issue. So when searching for strings like "s390x"
> or "Windows", you get a lot of unrelated issues in the results.
> Thus let's move the suggestions into HTML comments - so they will
> still show up in the markdown when editing the bug, while being
> hidden/ignored in the final text or in the search queries.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab/issue_templates/bug.md | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> index e910f7b1c2..53a79f5828 100644
> --- a/.gitlab/issue_templates/bug.md
> +++ b/.gitlab/issue_templates/bug.md
> @@ -18,11 +18,11 @@ https://www.qemu.org/contribute/security-process/
>  -->
>
>  ## Host environment
> - - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> - - OS/kernel version: (For POSIX hosts, use `uname -a`)
> - - Architecture: (x86, ARM, s390x, etc.)
> - - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
> - - QEMU version: (e.g. `qemu-system-x86_64 --version`)
> + - Operating system:            <!-- Windows 10 21H1, Fedora 37, etc. -->
> + - OS/kernel version:           <!-- For POSIX hosts, use `uname -a` -->
> + - Architecture:                <!-- x86, ARM, s390x, etc. -->
> + - QEMU flavor:                 <!-- qemu-system-x86_64, qemu-aarch64, qemu-img, etc. -->
> + - QEMU version:                <!-- e.g. `qemu-system-x86_64 --version` -->
>   - QEMU command line:
>     <!--
>     Give the smallest, complete command line that exhibits the problem.
> @@ -35,9 +35,9 @@ https://www.qemu.org/contribute/security-process/
>     ```
>
>  ## Emulated/Virtualized environment
> - - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> - - OS/kernel version: (For POSIX guests, use `uname -a`.)
> - - Architecture: (x86, ARM, s390x, etc.)
> + - Operating system:            <!-- Windows 10 21H1, Fedora 37, etc. -->
> + - OS/kernel version:           <!-- For POSIX guests, use `uname -a`. -->
> + - Architecture:                <!-- x86, ARM, s390x, etc. -->
>
>
>  ## Description of problem
> --
> 2.31.1
>

LGTM. I believe the only reason we didn't do this initially was
because the libvirt folks warned that some users might try to fill in
the comments and won't delete them. Fair enough, but I guess we can
fix that if it happens. Using the comments will do less harm overall
for poor submissions.

Don't forget to change the template from the gitlab dashboard, too:
the default bug template is not controlled by the entries in the git
repository, and you'll need to copy this over manually, IIRC.

Reviewed-by: John Snow <jsnow@redhat.com>


