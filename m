Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EA494D80
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:59:03 +0100 (CET)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAW5m-0002aH-8S
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:59:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAV8j-00082J-Kx
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAV8Q-0000Rm-TY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642676260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K28vfFUKwlO1uQi747WNmYTr3VmFzW7mcdKUde+GpjU=;
 b=heSRlHDzWP7fZX2zEGhRpzfGCUQeI3LyxO/Y2evlS73GR0hMG0uFL8I99k2/Sj8jhpmw2Z
 qu0zLoDjuDN2kyKaxq8fSlbKWzaPVhap24J7fZ4Hd+Uo+Ahh8HmR8NSKG0leKTjQQgrhkb
 bkA7LsbWmLVg2yEDUWUl21GuMZHPrgY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-G2Oqp8huP3mozHvni8f-5g-1; Thu, 20 Jan 2022 05:57:38 -0500
X-MC-Unique: G2Oqp8huP3mozHvni8f-5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso6514145wms.8
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K28vfFUKwlO1uQi747WNmYTr3VmFzW7mcdKUde+GpjU=;
 b=OE1sVjXDDfINmvoRbTXE2uKwo4kZJ6/Ub4tiLADqsp+Q2GEin8oQx0I34z32ZmYq8s
 dNyQs0XTzZyfoIxEFKySRe99dHxmDsKXOs5h9hcDz+6V4BRS6MA5JcuCyj+jtwbAmtJk
 PyPQ4JcWPGwl+kiWvlJigs4pDKJAdTwcX+aoPIvT/HqR8FIOhvRixU7t4V3lqWjkR15s
 6M5xkMmU1kWnDB/NPgegofZgxOhRDHXVz6Dy8Ss8QmnCDJDurIaQYOUxtJqpMpZly/6J
 iiJPsh9F1F6m23h/f7tTdouniM6k5VXhxHtffQz676rkQpIYZCWb4xmiriKz9z3F1zlg
 7ZVQ==
X-Gm-Message-State: AOAM530h8EcpOKRXYa1iN9uoyc4CZ/xg3R/+IuMSJqxK7qYQWeKJWa6q
 N+HiVvO6jsNv7gFx/E5/YvjhNka37ryYAa33mJxl5saqr8BcJKhRNXAhITAnZHMBmCnEdTu/1vX
 pa4Bzf/xZmULDJCQ=
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr34254162wrw.435.1642676257298; 
 Thu, 20 Jan 2022 02:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0ch2ieTUu06QYcwl8cB1/h97TfVNhiZr4yfvchNgkG/rTcUqPQprgAOxcYYcZ4LP52tC0fg==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr34254147wrw.435.1642676257031; 
 Thu, 20 Jan 2022 02:57:37 -0800 (PST)
Received: from redhat.com ([2.55.158.216])
 by smtp.gmail.com with ESMTPSA id g7sm2313560wmq.28.2022.01.20.02.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:57:36 -0800 (PST)
Date: Thu, 20 Jan 2022 05:57:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220120055543-mutt-send-email-mst@kernel.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220117034606-mutt-send-email-mst@kernel.org>
 <871r16br9n.fsf@linaro.org>
 <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
MIME-Version: 1.0
In-Reply-To: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 09:32:34AM +0530, Viresh Kumar wrote:
> On 17-01-22, 10:11, Alex Bennée wrote:
> > 
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > 
> > > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> > >> Hello,
> > >> 
> > >> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> > >> same has already been added to virtio specification and Linux Kernel.
> > >> 
> > >> A Rust based backend is also in progress and is tested against this patchset:
> > >> 
> > >> https://github.com/rust-vmm/vhost-device/pull/76
> > >
> > >
> > > I'm reluctant to add this with no tests in tree.
> > > Want to write a minimal libhost-user based backend?
> 
> I actually have one already, that I wrote before attempting the Rust
> counterpart, but never upstreamed as I am not sure if anyone is ever
> going to use it, as I am not. And I thought what's the point of
> merging code which I will never end up using.
> 
> I am not sure what test I can add here to make sure this doesn't
> breaks in future though.

something that executes with make check.


> > This is going to be a problem going forward as we have more out-of-tree
> > backends written as a first preference. While the first couple of vhost
> > devices have C implementations in contrib before we worked on the rust
> > version I think we are getting to the point of skipping a first C
> > version for future devices.
> > 
> > However I notice we have qtest/vhost-user-test.c so would that be enough
> > to ensure we can instantiate the device and a basic vhost-user
> > initialisation sequence doesn't cause it to crap out. This obviously
> > won't be exercising the virtq processing itself but does that really
> > exercise any of QEMU's boilerplate anyway?
> > 
> > > We also need some maintainers to step up.
> > 
> > You mean more reviewers for the vhost and virtio sections of QEMU's
> > maintainers?
> 
> And I too was waiting for replies on these. I can surely write
> something up if you guys feel there is a need. I just want to
> understand it better.
> 
> -- 
> viresh


