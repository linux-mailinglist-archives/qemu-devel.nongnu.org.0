Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796D6A5663
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:12:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwxL-000435-Hm; Tue, 28 Feb 2023 05:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWwxI-00040L-Ks
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWwxG-0003VI-3s
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677579089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
 b=HXCDNtSvV+KZqaW2g1+Oqe7XG6BSmWX7uQZyA9KvuFHmPQfcn1bPBEO6GO4N9AFNk5p7sy
 gb8Unr23fX1t5U9iLzi+4k6l7yJOieHfMguRIA1FCiP/6JLeaWN8ilabM98HLSJcZXPJUB
 /jm0PSRmbk/1ZxE98YSXs1dGiVICVnc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-g2YUg_X_NFuXsV9sOs9qfQ-1; Tue, 28 Feb 2023 05:11:26 -0500
X-MC-Unique: g2YUg_X_NFuXsV9sOs9qfQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a0564020e8d00b004a26ef05c34so13159530eda.16
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579085;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
 b=NdqK6wCwPYK18OKP3qYCr3fOWL4UQZzBJJpCD2gxqaM8+IvMXHtORRGfHz+yEi/F9d
 T9o07q1PnZyFF+ukCebpOK+NKviP7XdRIqs10aLNMvNFoUCffdqw56RaTMmfMAW4O8OB
 f0wWZHHRjZzUrH+rez/QeZz2UbHyoTeIzBtf7JTWxFISU+LEuq7yFRHZwnyctm/AR+3l
 GDPTkWBUpXJ6x2BDsC9f3YU62+qsYIorsRsj6BGPLZCrYR06sqYl+dzTvwhr+NXpLgB+
 9IKphxP2ZtqkjE5NSBxTnHtjwpEpbvm+MLcyS0p3YqHjej8ORrZObyuizNRyuJTu2Duh
 uhjQ==
X-Gm-Message-State: AO0yUKWjpKlU61KngFY+Gds03RpZ4i+5K1qF4dx/EidzSey+rw0Fzxlg
 6qzet9OYcub0e53fmCo3PPgN0mfqIDXBbxipp7SMQZrgVG1EmSjxOctO9YqBlYpupKwQaUXcmB0
 IcdjlCNo9enrglj4=
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id
 un1-20020a170907cb8100b008b0fbd11a61mr2776603ejc.52.1677579085770; 
 Tue, 28 Feb 2023 02:11:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8xTF/bnD+AxesQL3OArWO5MlnXAcPheJM7sgj7/8nBceO+OQxCu+BpM+tstcL3jw1NyHbFqQ==
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id
 un1-20020a170907cb8100b008b0fbd11a61mr2776557ejc.52.1677579085382; 
 Tue, 28 Feb 2023 02:11:25 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b008b1779ba3c1sm4349246ejb.115.2023.02.28.02.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:11:24 -0800 (PST)
Date: Tue, 28 Feb 2023 05:11:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228050908-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3MIUDRBUSNg6C5@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 28, 2023 at 09:40:49AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
> > On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> > > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > > > > I feel like we should have separate deprecation entries for the
> > > > > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > > > > although they're related they are independant features with
> > > > > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > > > > can explain the impact more clearly if we separate them.
> > > > > > > 
> > > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > > > > a superset.
> > > > > > > 
> > > > > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > > > > and the maintainance overhead is quite small.
> > > > > > 
> > > > > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > > > > someone is still using QEMU usermode emulation
> > > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > > > > 
> > > > > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > > > > I think 32 bit x86 environments are just more common in the cloud.
> > > > 
> > > > Can you point to anything that backs up that assertion. Clouds I've
> > > > seen always give you a 64-bit environment, and many OS no longer
> > > > even ship 32-bit installable media.
> > > 
> > > Sorry about being unclear. I meant that it seems easier to run CI in the
> > > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
> > 
> > It's still doable ... but for how much longer? We're currently depending on
> > Fedora, but they also slowly drop more and more support for this
> > environment, see e.g.:
> 
> FWIW, we should cull our fedora-i386-cross.docker dockerfile and
> replace it with a debian i686 dockerfile generated by lcitool.
> There's no compelling reason why i686 should be different from
> all our other cross builds which are based on Debian. The Debian
> lcitool generated container would have access to a wider range
> of deps than our hand written Fedora one.
> 
> >  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/
> 
> With regards,
> Daniel

... and is closer to where 32 bit is likely to be deployed which is
systems like e.g. raspberry pi os which until recently was only
32 bit.

-- 
MST


