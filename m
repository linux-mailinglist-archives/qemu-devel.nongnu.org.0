Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B28E2B092E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:59:13 +0100 (CET)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdF0C-0003bp-HD
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEz3-00031R-7O
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:58:01 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEz1-0007kr-Dd
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:58:00 -0500
Received: by mail-ed1-x543.google.com with SMTP id y4so1023260edy.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dgzR0FNzYU8Db1ZhtxNFdgZIWBl9mUtEf1xxSWdtczk=;
 b=JIfHS+Ix7zOpeMpu2T9yLXUicZ/6Yz4udnpImmGwjgeGRXaX9u8dVYWW7HKZKcJzcH
 F3Sf1lOI7LjR7UV+Wi7JgTcw3Plg1ekGDiCK7iIEAkT3QPL/VX+tza1zriT1ljMiye5w
 v3xN3VvKPQozopniHZezwPNikwTow3iqBcUA5A7A8FF/j8Hz0YUmr9idnTHgANgQjkOX
 bX8+PETBbA4Umnsq4B8EhsYsPrFBvY+JW4IgzWHgTMIm5R/T8FrdcRj7p9VvbvKUNYEE
 GZ1rd62Df+w/NXgHnrVaZs1vYV9zRoGI+ypWGSf75vR/Ib9C9BvNpIilXqc9KSut2w88
 QZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dgzR0FNzYU8Db1ZhtxNFdgZIWBl9mUtEf1xxSWdtczk=;
 b=hhBn/l/5MOw+IKBoTbg1/A1bh6+2qeHRCi+3N2KUEz1eyNC1pVR+ujS0jnPwGU5Otf
 su0ExNiz5j0ZxvQhuxtKJfBo64ikCTECNtuyItBMzthJgRxKk6R1ff0FvuoE0KMxvK+4
 fvjL0Pit9RklnU9uXl2BtagCR0n9kprnl73MRHBu7uG9URHITCOl5OCVXs+uBe+l5ib1
 GkTE8Ny92L7lYmMORUF0l098zcem3LrcNY35oK16j0SCL9GkkNH8XpjfGfGEtNy9OTc7
 byeakSxVqeOXdmEY4ssFm+352UXaYXuldCgpmGdwZssW8VzEbXLDcoO9qZBQOFfu1I78
 Q+ug==
X-Gm-Message-State: AOAM530JaMqIBOcDmWj6Jgk958bPtn2UbzoLyHupNFXtFsCjXgCLz6RR
 5EAgMugIzG5WyYBD+vO4Ph8SeQtPd9vChLbvdXc1Ag==
X-Google-Smtp-Source: ABdhPJz+hL5v39XHIRKuoMLeoq21HkySBHVLexRLdqA5jTEZQQnMoB4kctNPm0JPHHMQV+mBKcOKYfRU+SWg1qzoJw0=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr477393edb.52.1605196677707; 
 Thu, 12 Nov 2020 07:57:57 -0800 (PST)
MIME-Version: 1.0
References: <1604685744-25125-1-git-send-email-kwankhede@nvidia.com>
In-Reply-To: <1604685744-25125-1-git-send-email-kwankhede@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:57:46 +0000
Message-ID: <CAFEAcA8orN-NPghL+LW1jmQ0bjjQbGYctCc2_1S1q+Mcy=rEtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix use after free in vfio_migration_probe
To: Kirti Wankhede <kwankhede@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: mcrossley@nvidia.com, Alex Williamson <alex.williamson@redhat.com>,
 Neo Jia <cjia@nvidia.com>, QEMU Developers <qemu-devel@nongnu.org>,
 dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Nov 2020 at 18:35, Kirti Wankhede <kwankhede@nvidia.com> wrote:
>
> Fixes Coverity issue:
> CID 1436126:  Memory - illegal accesses  (USE_AFTER_FREE)
>
> Fixes: a9e271ec9b36 ("vfio: Add migration region initialization and final=
ize
> function")
>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: David Edmondson <dme@dme.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Hi Alex -- this is a fix for a Coverity issue, are you planning
a pullreq with it in? It would be nice to have it in rc2 next week.

thanks
-- PMM

