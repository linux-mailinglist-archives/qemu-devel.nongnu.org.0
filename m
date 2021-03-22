Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF83452A4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 23:56:05 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTSu-000445-3o
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 18:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTR2-0003C6-JY
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTQz-0006eC-HB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616453643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rsmbw1OP4nxU8Q9gICCcWEb7Oz6gZJJGaHwGRf//8lk=;
 b=iep5hZZ8wqgAM5sE0d24LfbzgZdLE1P+jzBmGMTZbpp2Kk0SurAu9JLtbySvED9Tf+8jjK
 iCSG9sah+14G9sc81BOSyRW4GhvGXz/YIfDMDjSyvDvV1gA1M8QY7k0scxvtgt5fTaKv5v
 Tz4SYkt53HRnGaUbfWCo3XqYB6ZVEqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-0OIkRQgyNvGI8eZW_dW9fA-1; Mon, 22 Mar 2021 18:54:01 -0400
X-MC-Unique: 0OIkRQgyNvGI8eZW_dW9fA-1
Received: by mail-wr1-f71.google.com with SMTP id h21so135246wrc.19
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 15:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rsmbw1OP4nxU8Q9gICCcWEb7Oz6gZJJGaHwGRf//8lk=;
 b=RFn1XMwBzpJKPMqiYBL9AMuNuOTy+L0caylMqi1w+5nQUCSThXYCYNZxjF5/R9UaBE
 yBF7sTWpkS6Eofx6nA7+/APf3bzpIAQOaqP//QEoU+diaSBOXfpIvRawwhx7khiobZEN
 Sw5VfGU0x2Y5renmNQQ/iZFJJ5GKMi7NrEW+sOUI2ogEZR+hfQjq8z5xQLFNoom6RloN
 srRsWpNztkFe/XG5JW0fCfv9JbwU4DCIx9aiWzr0Z7lPWHcG9QL3btdSAytMf0RJcs/X
 2Kfaje0iEXBPNdWdobKyyF3p+8eLhDKY/VB50FlZbJ+O4RMlzBOS2XiIlLioEPyndN6U
 AlFg==
X-Gm-Message-State: AOAM530CUFaZLma0CGFXkcc2qb8rlte841vsdEVoCDXNoLv0xYHrtDpv
 ACXR5g5qgdY9LR1vW0UgDsxMXA6/Kbgk5Qy+U7l9UFr1sbYFQlQiJomb2x6uI+qcF3PuR/m1dVd
 IA8xEJCGyegOjTu4=
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr837135wrq.54.1616453640736;
 Mon, 22 Mar 2021 15:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp5bdOHtqBmkGdhsJ3GGpqwoNLBDA0dUFIZ05CnKb4DKDQG7tOdGsGXY7Q39qDw8zcxBpLqA==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr837124wrq.54.1616453640575;
 Mon, 22 Mar 2021 15:54:00 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id i3sm22418599wra.66.2021.03.22.15.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:54:00 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:53:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
Message-ID: <20210322184943-mutt-send-email-mst@kernel.org>
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 04:41:01PM +0000, Peter Maydell wrote:
> On Mon, 22 Mar 2021 at 15:44, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:
> >
> >   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 5971d4a968d51a80daaad53ddaec2b285115af62:
> >
> >   acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 11:39:02 -0400)
> >
> > ----------------------------------------------------------------
> > pc,virtio,pci: fixes, features
> >
> > Fixes all over the place.
> > ACPI index support.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> 
> This triggers a new clang runtime sanitizer warning:
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
> PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
> PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
> PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
> PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
> PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
> PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
> PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61
> 
> and similarly for eg
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
> --tap -k
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e
> 
> thanks
> -- PMM

Weird I don't see any related changes. Something subtle going on.
I'd like to reproduce this.
Which clang flags do you use?

-- 
MST


