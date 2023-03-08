Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023B6B070A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 13:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZsrX-0002Ig-BQ; Wed, 08 Mar 2023 07:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZsrU-0002IP-Tz
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZsrT-0001wo-4D
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678278337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+1SGXQZKOIqpJ0OuSenr4a5+tOF/7Mo0dp0tOhAS8M=;
 b=elI8DEeampxjpScw3xcPaPLEiHAQElGvXUkJMIRWS2ZrPZrFd3zKUlQJ6knf7K7Ps9ESCe
 uOsvjgR9vbpNt6iVzajQygwAgeWhF9ekmoulXoL6gVEbzqUN+032zysW+3X0Q5qoaMUt2d
 csPlUs+RGqKqs/w5qzjUJ83vPoUNYn4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-EMWMoSZBNI2m7BmDzteirA-1; Wed, 08 Mar 2023 07:25:36 -0500
X-MC-Unique: EMWMoSZBNI2m7BmDzteirA-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso23610737edb.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 04:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278334;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+1SGXQZKOIqpJ0OuSenr4a5+tOF/7Mo0dp0tOhAS8M=;
 b=37mjOedDjREB6Wv5jdU1yh8FQJJKn1nVQ/y42uvYtySYPyJX+8557ftvljmJYKnPK7
 Iq16w6msaSPtiN1UlXrGlmFZokA3Uv8kG+0/PIMLicCnHL+XvCyQQYwsHVzoQ/s0qYCb
 rdwmFKl2UxGbArNxXQwyxw2nKSI1vf6yiw68JhomLdHR5SLUAazTRcmQYmSEF1lighZ+
 qoYtXx2R2zug/7y3L6b36HAQicgXAGC+OrEiVnOp+7MdQtvh1DSKW1sER4voeh5tZ/b0
 XPQvU7BkA0tOC0uw8mnsKl5PVUMtVf2JtuwGzgMGKeKkkhMGxn9udaFEI/DXo7CvnhH3
 L9pg==
X-Gm-Message-State: AO0yUKU7+yQ4GefstokeETxlq7TZJ3k9nEIJmnuxyQBuxWl+JMp5+pKO
 UP57F9Nh7xie6yKIxL18/HWqqKIO+LBTxFTImwomvX5vKatTSP1kEzzRjW2UoRGwEhILfj2t9Nu
 H3SUsIJVoMQFVEUA=
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id
 g17-20020a1709062db100b007c96e0e1427mr16062701eji.6.1678278333921; 
 Wed, 08 Mar 2023 04:25:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+WYs+pfDGAey5uUCQ+GNBymPXdKzvZVj+SNc9IDlQrNPvtF012pwZYa9PpeUbG3IbodV2fTw==
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id
 g17-20020a1709062db100b007c96e0e1427mr16062686eji.6.1678278333657; 
 Wed, 08 Mar 2023 04:25:33 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 k20-20020a17090627d400b008b17ca37966sm7480982ejc.148.2023.03.08.04.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 04:25:33 -0800 (PST)
Date: Wed, 8 Mar 2023 07:25:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 00/51] Net patches
Message-ID: <20230308072348-mutt-send-email-mst@kernel.org>
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
 <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
 <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
 <20230308071628-mutt-send-email-mst@kernel.org>
 <197b027e-1bbf-bd44-f78b-e01d535f3ac1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <197b027e-1bbf-bd44-f78b-e01d535f3ac1@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 08, 2023 at 01:21:52PM +0100, Philippe Mathieu-Daudé wrote:
> On 8/3/23 13:17, Michael S. Tsirkin wrote:
> > On Wed, Mar 08, 2023 at 08:40:42AM +0100, Philippe Mathieu-Daudé wrote:
> > > On 8/3/23 07:56, Jason Wang wrote:
> > > > On Wed, Mar 8, 2023 at 4:43 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > > > 
> > > > > On 7/3/23 18:01, Peter Maydell wrote:
> > > > > > On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > 
> > > > > > > The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
> > > > > > > 
> > > > > > >      Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
> > > > > > > 
> > > > > > > are available in the git repository at:
> > > > > > > 
> > > > > > >      https://github.com/jasowang/qemu.git tags/net-pull-request
> > > > > > > 
> > > > > > > for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
> > > > > > > 
> > > > > > >      hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
> > > > > > > 
> > > > > > > ----------------------------------------------------------------
> > > > > 
> > > > > > build-oss-fuzz failed on something involving fuzzing eepro100:
> > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
> > > > > Jason, please drop my patches. I'll look at that failure.
> > > 
> > > Before "hw/net/eepro100: Convert reset handler to DeviceReset",
> > > e100_pci_reset() is only called once from DeviceRealize _before_
> > > the device is realized.
> > > 
> > > After, 1/ it can be called multiple times and 2/ it seems to do
> > > stuffs that really belong to DeviceRealize (should be called once),
> > > in particular pci_add_capability().
> > > 
> > > I *think* it should be illegal to call pci_add_capability() _after_
> > > a device is realized. Auditing pci_add_capability(), there is only
> > > one other use before realize: amdvi_sysbus_realize() in
> > > hw/i386/amd_iommu.c.
> > 
> > Calling pci_add_capability when VM is running is likely to confuse
> > guests, yes.
> 
> Thanks for confirming. Similar pattern: msi_init().
> 
> While trying to fix that in hw/i386/amd_iommu.c I realized this device
> isn't in a good shape, almost unmaintained: 2 bugfixes in since 7 years,
> the other commits are generic API cleanups. I'll post the series and
> we can discuss that there.

Absolutely. A mix of VTD or for that matter virtio iommu and AMD CPUs
seems to work well enough that most people don't bother.
I vaguely remember spec review showed some things were hard
to support correctly with shadowing, but I don't remember
the detail (and our shadowing with VTD only works because
it matches what drivers are doing).

-- 
MST


