Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E055E566
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:42:35 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CQE-0001qe-NE
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6COz-00012z-W3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6COx-0007uS-0E
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656427274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvHP7UKogGKhMzeBJSpNoIIl19AL3XuIVgias5OUIR8=;
 b=hACcXeLxabgOPckkZL1biDGJW4fd/aHIGVPS4WT2t2ti9N4exoDOLdne2gUe+KvKxvdWZi
 Lhh0C3Q4A2UWX4ZwUIY4GIT0wvSHKFOizUmLql7jrKniEiI8D7Uo2WfHEdj+cvSYEHQtbZ
 0e5vrARdUSb3moZAcvBKWM6eAwVMkHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-B9zq6RGWNIyRTYQMjrA9TQ-1; Tue, 28 Jun 2022 10:41:13 -0400
X-MC-Unique: B9zq6RGWNIyRTYQMjrA9TQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso5189998wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PvHP7UKogGKhMzeBJSpNoIIl19AL3XuIVgias5OUIR8=;
 b=KFiWjG7tA5Gpn9BOY+DNn4pjyr15AU5xN+2OujtUBINg8ld8MJg+g9s54CTkE+1FaD
 uq53RUqHtJNcYGvu7JHZmSIkKwLwyE5t/BS7gGbZM5unlBPlOm4dSz4V7nD3BM8MBnP/
 DzgAbdj96hV34KY7Rs3nhcKPvDmoj+aU6Z+w20dp7pZBglwHudD3/dj+H/drBMy+YiCr
 QL6rnZIKeMyTkm5svTYxPOt/5Ps2M8u93eb6yGvFsN6ALgB524liYHuD63xUkpdU0Xev
 tAcohOROZcrfJBrcmtTFecYHxktTrqz182n+Gjxffl6urGIvgqBMmox7EXiouJwdekrD
 Nl9g==
X-Gm-Message-State: AJIora91aGHuzttacv9kujecqa8AR4lotWHxkE+IORQDvi+is/fXkqld
 lwA/aSGB/hquty2101qHxLJC9jb25Hz+3YkfXImG+cxyOp7FkPbwbMmktRQG1BUiRJvO5j+2XYY
 B5vhGUiQr4u3Kx/4=
X-Received: by 2002:a5d:66c3:0:b0:21b:994a:a6fa with SMTP id
 k3-20020a5d66c3000000b0021b994aa6famr17649472wrw.15.1656427271852; 
 Tue, 28 Jun 2022 07:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvWH/TcpmavAvmp86FsCz4Lh27+Vssv2ui1tELHkCYdOAyARY+ichyxWe6/jn8PYPxQKIO2g==
X-Received: by 2002:a5d:66c3:0:b0:21b:994a:a6fa with SMTP id
 k3-20020a5d66c3000000b0021b994aa6famr17649453wrw.15.1656427271601; 
 Tue, 28 Jun 2022 07:41:11 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 i1-20020adffc01000000b0021b5861eaf7sm14201874wrr.3.2022.06.28.07.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:41:11 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:41:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628103938-mutt-send-email-mst@kernel.org>
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
 <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 06:52:55PM +0530, Ani Sinha wrote:
> So why burden everyone by having bios-tables-test when it only affects
> acpi/smbios developers?

No it doesn't. Any change in qemu can break ACPI - it's enough to
register an MR overlapping the ACPI registers.  So we have a basic test
making sure ACPI is in expected state and have everyone run it.

-- 
MST


