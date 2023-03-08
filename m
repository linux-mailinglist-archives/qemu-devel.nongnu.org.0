Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FE6B06C5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 13:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZsjL-0008MR-NF; Wed, 08 Mar 2023 07:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZsjI-0008MG-AE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZsjG-0000Pp-Fs
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678277829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up0uu0sJVHatmNkPQUaXaugaamWfw+hE5FG/AHj6StE=;
 b=U4tgcnWkpQ41lrPJD/Ilms6rIW608dtLnwEbTCe/ateqpFUoLvfhEd+85r9+iMZQYyujr/
 PzskFhiQrOLIeBrZ0O8ZuVCpXxZdFC+JBCRDC9vaXcey8ldLvTQQA+pwjLskMjnYbv+SGP
 R7fwCFNghE8pDfXBh0fJ/LxJJelYdAM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-rVyYv1YhM4a3UpnypVl5zA-1; Wed, 08 Mar 2023 07:17:08 -0500
X-MC-Unique: rVyYv1YhM4a3UpnypVl5zA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so11492177edc.12
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 04:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678277827;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Up0uu0sJVHatmNkPQUaXaugaamWfw+hE5FG/AHj6StE=;
 b=PSKq6L1DyeXGIscqsNI2NHmKHVa9kOOHw1/I/qqwOlo3NEuzCAxl2pQ1w8+v6n+M5v
 luq6/TWrgu6An76+VXLYXWPiW/tgiY4uRJjy8CQbN2+7rGrWS7hXJYtqVxMpdJLzxtIU
 mz7A9GSXBsF6eT1NWztmS229OFnRqnydeAeiS0D5Dfx/hAzgIK+ZnPyDEkpgBxJKzhi1
 uOhypMrXx/0qjVPCdS8ovwQ4/k9EXmvwwWObXDOo87hdO5ppGC7/SAwES1Lae0AHFWQ6
 20RoEyX3VqPkuUFzEc5oBchX21tgw7NVjOi7tvvAu2xVFLnV3a3mMRhB/hdo2OHklrXj
 Gd3A==
X-Gm-Message-State: AO0yUKU7XVBJjMQRAKxyHl4+RV/MxjnnJPh5IUyIo6UZMbfnMUKdAVF6
 OX+tw8M3k5RIPxxACusQSMJ8EeWYGDvctAh4BnYeYYC09/XZK3a+EZNDK2P/nS8OA/6nlDO8D5l
 lc3hevuUU7D6xl2E=
X-Received: by 2002:aa7:d514:0:b0:4c5:7a47:9234 with SMTP id
 y20-20020aa7d514000000b004c57a479234mr16035797edq.8.1678277827423; 
 Wed, 08 Mar 2023 04:17:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+gO4Ub/+gW6IPm+RMlFWN+NmSzLYuDOlJdnvwc+4FfCGe0jtamkzzjOhgmCGx8BECvu+E1KQ==
X-Received: by 2002:aa7:d514:0:b0:4c5:7a47:9234 with SMTP id
 y20-20020aa7d514000000b004c57a479234mr16035780edq.8.1678277827169; 
 Wed, 08 Mar 2023 04:17:07 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o26-20020a50c29a000000b004ac54d4da22sm8136857edf.71.2023.03.08.04.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 04:17:06 -0800 (PST)
Date: Wed, 8 Mar 2023 07:17:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 00/51] Net patches
Message-ID: <20230308071628-mutt-send-email-mst@kernel.org>
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
 <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
 <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 08, 2023 at 08:40:42AM +0100, Philippe Mathieu-Daudé wrote:
> On 8/3/23 07:56, Jason Wang wrote:
> > On Wed, Mar 8, 2023 at 4:43 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > 
> > > On 7/3/23 18:01, Peter Maydell wrote:
> > > > On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
> > > > > 
> > > > > The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
> > > > > 
> > > > >     Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
> > > > > 
> > > > > are available in the git repository at:
> > > > > 
> > > > >     https://github.com/jasowang/qemu.git tags/net-pull-request
> > > > > 
> > > > > for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
> > > > > 
> > > > >     hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
> > > > > 
> > > > > ----------------------------------------------------------------
> > > 
> > > > build-oss-fuzz failed on something involving fuzzing eepro100:
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
> > > Jason, please drop my patches. I'll look at that failure.
> 
> Before "hw/net/eepro100: Convert reset handler to DeviceReset",
> e100_pci_reset() is only called once from DeviceRealize _before_
> the device is realized.
> 
> After, 1/ it can be called multiple times and 2/ it seems to do
> stuffs that really belong to DeviceRealize (should be called once),
> in particular pci_add_capability().
> 
> I *think* it should be illegal to call pci_add_capability() _after_
> a device is realized. Auditing pci_add_capability(), there is only
> one other use before realize: amdvi_sysbus_realize() in
> hw/i386/amd_iommu.c.


Calling pci_add_capability when VM is running is likely to confuse
guests, yes.

-- 
MST


