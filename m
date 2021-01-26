Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BD304189
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:08:38 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PxN-0008A3-B6
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4PVt-0006RA-BN
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:40:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4PVm-0003za-UQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611672006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRuknFR9hnNHNyAevU0aMwFSiomQ/rA6kRJdRwtoRdA=;
 b=FoG1hTQbRvHVc5/qwKECsi30wA5imTntU1xjVXqnZkso8G6Za6cspreO+FwWC7/LPOVylx
 WakgJvUt+Cnd/Cz3j95dy13EGJg5r/nuOm3adSf+3hFybUvezwd61iTEvTftUSIi/nJcvy
 Fg9tnpuQ+NnWSyVXvnf5BwUNW93rBtU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-okTkgqrnNlaHR249BNh4Ug-1; Tue, 26 Jan 2021 09:40:02 -0500
X-MC-Unique: okTkgqrnNlaHR249BNh4Ug-1
Received: by mail-wr1-f72.google.com with SMTP id s15so6748840wrt.14
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TRuknFR9hnNHNyAevU0aMwFSiomQ/rA6kRJdRwtoRdA=;
 b=eRZYOiaCAkTnoldg/5Z8bYxa0mKekLTwhERYVd6OA8cYHIZiwZTspXEZvMHrzevj6K
 a6dFq3ooSDdby8tR6hNKSqQ1q3FpNSRsV0mr7LZFK6yLjC6BAO4aPimYmEkbKPt4b8MM
 OILkdFNmMoOjJ9ryvLQ36vHphfWgvNI+nAiFSFuTl8FkAjvir9oNsC0060GqIoN/l4Dj
 nR9Whr5VCpzGJGtHJVOMe8I5JAEY/2OLIpWX9+VNaDivZOGBJ69dqN0d3+lPqK2sPlhY
 5blOzUJ32uuhi1oZE2r7bjshm20tYTdZNplkx5gomUy4h2ITO7Y/raG8Oa1JQUtd/bJB
 LVww==
X-Gm-Message-State: AOAM5320z118AEPR33DyCukGkgLv+pT+ATQ1OjkBF1Y5ydO4PGcB8R3V
 6Cjnnal3eiT7so5I1UnP1/PMH03XXEA2OGg9TlKWuzAQu/iSI0o8MRLdLf/rXkkWyNKB7AhzTx8
 2yP78EPFpLoq2kPM=
X-Received: by 2002:a1c:6484:: with SMTP id y126mr51975wmb.45.1611672001272;
 Tue, 26 Jan 2021 06:40:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiI9t2pzkjfskmrDQZPU86+nUT1VJcOZvdlq4y135V1IPxVCwIS648bbyPFemUx4HDXUR+Eg==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr51955wmb.45.1611672001054;
 Tue, 26 Jan 2021 06:40:01 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id r25sm27802607wrr.64.2021.01.26.06.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:40:00 -0800 (PST)
Date: Tue, 26 Jan 2021 09:39:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Leonid Bloch <lb.workbox@gmail.com>
Subject: Re: [PATCH 0/4] Introduce a battery, AC adapter, and lid button
Message-ID: <20210126092549-mutt-send-email-mst@kernel.org>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
 <b866c8ad-9336-5305-131d-5ccd63be2166@amsat.org>
 <CAOwCge0Qxh6hQiqrko=Mos3WM2jZXhirhCwxdq7N1Kg_e0H4Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwCge0Qxh6hQiqrko=Mos3WM2jZXhirhCwxdq7N1Kg_e0H4Pw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 07:38:46AM +0200, Leonid Bloch wrote:
> Hi Phil,
> 
> Thanks for your feedback! Please see below.
> 
> On Wed, Jan 20, 2021 at 11:52 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > Hi Leonid, Marcel,
> >
> > On 1/20/21 9:54 PM, Leonid Bloch wrote:
> > > This series introduces the following ACPI devices:
> > >
> > > * Battery
> > > * AC adapter
> > > * Laptop lid button
> > >
> > > When running QEMU on a laptop, these paravirtualized devices reflect the
> > > state of these physical devices onto the guest. This functionality is
> > > relevant not only for laptops, but also for any other device which has e.g.
> > > a battery. This even allows to insert a ``fake'' battery to the
> > > guest, in a form of a file which emulates the behavior of the actual
> > > battery in sysfs. A possible use case for such a ``fake'' battery can be
> > > limiting the budget of VM usage to a subscriber, in a naturally-visible way.
> >
> > Your series looks good. Now for this feature to be even more useful for
> > the community, it would be better to
> >
> > 1/ Have a generic (kind of abstract QDev) battery model.
> >    Your model would be the ISA implementation. But we could add LPC,
> >    SPI or I2C implementations for example.
> 
> It definitely feels that it needs to be more generic, and I thought
> how to make it so, but so far it is what I came up with. I'll think
> some more, but any ideas are welcome, cause nowadays I'm doing this in
> my free time only.
> 
> > 2/ Make it a model backend accepting various kind of frontends:
> >    - host Linux sysfs mirroring is a particular frontend implementation
> >    - mirroring on Windows would be another
> >    - any connection (TCP) to battery simulator (Octave, ...)
> 
> Well, it does accept an arbitrary file to represent a battery, so this
> covers the battery simulator, does it? As for Windows - indeed, it
> would be nice to have.

Poking at sysfs from QEMU poses a bunch of issues, for example,
security, migration, etc. Running timers on the host is also not nice
since it causes exits from VM ...

So I agree, as a starting point let's just let user
control the battery level through QMP.



> > Meanwhile 2/ is not available, it would be useful to have QMP commands
> > to set the battery charge and state (also max capacity).
> 
> But the battery state is determined by the physical battery, or by an
> externally provided file. Do you mean introducing another source for
> battery information which will be controlled by QMP commands?
> As for the max capacity, as with an actual battery, the "QEMU battery"
> has it set "by the manufacturer". It is not passed through from the
> host, for simplicity sake, and only the percentage is passed. How will
> it help if we allow to set the max capacity? It's something pretty
> much transparent to the user. (But if there is a use case, of course
> it can be done.)
> 
> > Ditto QMP command to set the LID/AC adapter state.
> >
> > > But of course, the main purpose here is addressing the desktop users.
> > >
> > > This series was tested with Windows and (desktop) Linux guests, on which
> > > indeed the battery icon appears in the corresponding state (full,
> > > charging, discharging, time remaining to empty, etc.) and the AC adapter
> > > plugging/unplugging behaves as expected. So is the laptop lid button.
> > [...]
> >
> > In patch #2 you comment 'if a "fake" host battery is to be provided,
> > a 'sysfs_path' property allows to override the default one.'.
> >
> > Eventually you'd provide a such fake file as example, ideally used
> > by a QTest.
> 
> Sure! I will - it's definitely a good idea.
> 
> > Another question. If the battery is disconnected, is there an event
> > propagated to the guest?
> 
> No. I definitely need to add! Thanks!
> 
> > Thanks for contributing these patches :)
> 
> Thank you!
> Leonid.
> 
> > Phil.


