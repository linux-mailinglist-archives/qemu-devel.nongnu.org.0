Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAC3EECE7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:57:25 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFyei-00065K-Jp
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFycI-00040Z-19
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFycG-0004OC-7r
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629204891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mu3/XqlBMe2gxH0BqGe4+/sBVM9QVDKKh1CawSUF+z8=;
 b=DDB56s0gVxiINbhcWwereZCAHKq9UT81Xq0mj/sABkqFPqHdPEPGw9TzzZwPLjSSasGEtL
 4zHryyy4270BJ891/Qf9ucbS4l3On+2PcbFX0l8u41NlaH6qPEAcBH0KrtDp2r8NFhz3+M
 He0p+B1WpVylpVIPZOBj9DT3gEjHb08=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-8EL60BlrM_WihShA8jcbDw-1; Tue, 17 Aug 2021 08:54:50 -0400
X-MC-Unique: 8EL60BlrM_WihShA8jcbDw-1
Received: by mail-ej1-f70.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so5986751ejj.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mu3/XqlBMe2gxH0BqGe4+/sBVM9QVDKKh1CawSUF+z8=;
 b=BmCH/DYQ+4z8PeKlXI6dX5DRDtvWJ0SkpFkuGs7NRQACa7NHe57Pk5HXxTQvbdAlwH
 n4HThOUyWAyjdF+p9CiyXpIN6En/0/Bc1FZQfsdcyi8+tCTQdw29i5knxYzRnopk6stn
 D5T62LzfgPWTjrcvIFwJlbky8fOj8Mj1qtXAOFsdY+0BeU27Y2lTvfIAq9ifx0CYR6FX
 qDXwKZxiORkhrmgkAIf/m9ZeoUbWPLSE9OFIzv62CRQCSMoZaqcTZQXnX/PVRN/QD0ee
 plUuHd+Df7Fcnoi1BNonPeKGSmIOSfYZRc5qQCoiml52+1eDYNoXf76xrXKSQSx7uOH3
 EYog==
X-Gm-Message-State: AOAM5305F9GifJR05o2gS5dFDIFHYQNYII7F6odyQ/9D6TXbsHoWKHV2
 CqRjaE2rhpkjW4rHav2Dc1uVo96OBnod5zqyjwMnIAtqRWshMEJQj8yfVJ/7doSlgP2Z1/+H30h
 8q4UdO12icufV+ig=
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr4018202edw.17.1629204889186; 
 Tue, 17 Aug 2021 05:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJqlY1pWidiFD7XVJnwtc8HKX8vfLAHyFOm7cIK3yqw8z6pPS8/7ps27FqHZXIiaugDmFgPQ==
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr4018182edw.17.1629204888994; 
 Tue, 17 Aug 2021 05:54:48 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id k19sm755386ejq.42.2021.08.17.05.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 05:54:48 -0700 (PDT)
Date: Tue, 17 Aug 2021 14:54:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
Message-ID: <20210817125446.o6jkavj5n6wo3z5b@gator.home>
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
 <20210817120250.fdpujloefaqtawwo@gator.home>
 <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
 <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
 <CAFEAcA_=+YuX99KWUS_KqJB1Snadmx9WKUAVpZQQAAcGBPtyAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=+YuX99KWUS_KqJB1Snadmx9WKUAVpZQQAAcGBPtyAA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 01:37:15PM +0100, Peter Maydell wrote:
> On Tue, 17 Aug 2021 at 13:22, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Tue, Aug 17, 2021 at 01:06:19PM +0100, Peter Maydell wrote:
> > > On Tue, 17 Aug 2021 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
> > > >
> > > > On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
> > > > > How do we know that no one has ever used such configuration? The conversion
> > > > > was meant to be bug-compatible.
> > > >
> > > > We don't. But we do know that a zero input value was never documented
> > > > prior to 1e63fe68580, which has not yet been released. Can we claim
> > > > that an undocumented input value has undefined behavior, giving us
> > > > freedom to modify that behavior until it is documented?
> > >
> > > Dunno; I definitely don't want a behaviour-change patch at this
> > > point in the release-cycle, though...
> > >
> >
> > Can we replace this patch with the following one for now? And then
> > discuss this further before committing to supporting a zero input?
> 
> If you can agree on that and send out a patch and get it reviewed
> within the next three hours or so...

I posted the patch. Agreement/disagreement can come in the form of
ack/nack. Hopefully in time...

Thanks,
drew


