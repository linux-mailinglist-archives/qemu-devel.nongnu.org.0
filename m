Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDF4C42A9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:44:20 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNY5D-0000F2-3I
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNY1m-0007EF-5r
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNY1W-0002PO-Cm
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645785629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRwx65i57jRl4bCHTSkVyWCFjWZQA8Tr5rcxePhpjvg=;
 b=QotQqYph9ANHhruxRZ2w42A20WDDp0bJX2AC4ceK7oez6jGZk2idbNKdWUd1QwQOZk6qlZ
 Pu+GBgb5PuGcEF0vqo7AB4f8O0o8xOFfnRRA4IvPMG50k/yYniiWuJ4ghBiMGCHClEHI0Q
 /Ckl5FcuqNirEY+xthziSlKIySrkBfw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-LbpZOccCNCW-AVatULM3HA-1; Fri, 25 Feb 2022 05:40:28 -0500
X-MC-Unique: LbpZOccCNCW-AVatULM3HA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so1138138wms.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 02:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lRwx65i57jRl4bCHTSkVyWCFjWZQA8Tr5rcxePhpjvg=;
 b=lc8ZPdtJVRUZeVxAvPM2tJbON+7nWujtzULBefDkhKIURoOk+oYb73gAL1JXZ+r/Gh
 7INdMnKnALzLtEoJtf9Ou9DRMg0rTx+r56xlnbWeh8GXnxlUzmA1sOYRrgOxuCqWmUZq
 HgsOhuP/4Un7luYbqqzd9mu44b/D2Lnd94DleT7DyCt1ZPiFIfFrsvrE1ystzlmxlDZH
 btcqrVxc7EcKsWD2MDR+lE4au+tg1V07I9wwV1ehgfsf8jQnIvlAxlPQv1eRxJLW2Kpn
 cZDHDhwdrCA6EzGpZ0rwXZq3GdR+gsaz3eJVZdNemPeNQqufQxldl+PwnAP73MT7nCgQ
 M/4A==
X-Gm-Message-State: AOAM5308fsIx+RuVkcoQvt7bgd5mEZGp19QQ8cY5P6+DYynJPH2l3OxI
 Juk+QraPZ3Du4DggHsEQY6iiN0q5oH8mM65x4Q7jqpr7bBejQ2r7GTyFrdCI5fS5RXa3UGqyOBU
 zmH06q8K03pOO3OM=
X-Received: by 2002:a5d:5584:0:b0:1ed:e423:18f4 with SMTP id
 i4-20020a5d5584000000b001ede42318f4mr5268164wrv.509.1645785627519; 
 Fri, 25 Feb 2022 02:40:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+suvh52UL+yxQwZMYSZGg0of8oD756hKzab+wp95qXtMVPTn7Je7xnvr6hZRVfR9ly8TmQg==
X-Received: by 2002:a5d:5584:0:b0:1ed:e423:18f4 with SMTP id
 i4-20020a5d5584000000b001ede42318f4mr5268127wrv.509.1645785627288; 
 Fri, 25 Feb 2022 02:40:27 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 p30-20020a1c545e000000b003811f9102c0sm3167339wmi.32.2022.02.25.02.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:40:26 -0800 (PST)
Date: Fri, 25 Feb 2022 05:40:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
Message-ID: <20220225053937-mutt-send-email-mst@kernel.org>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
 <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
 <YhdkD4S7Erzl98So@redhat.com>
 <CAHmME9qRrLHwOjD+_xkGC7-BMVdzO95=DzhCo8KvDNa0JXVybA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9qRrLHwOjD+_xkGC7-BMVdzO95=DzhCo8KvDNa0JXVybA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-s390@vger.kernel.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 "Singh, Balbir" <sblbir@amazon.com>, ben@skyportsystems.com, "Weiss,
 Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>, Laszlo Ersek <lersek@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 11:57:34AM +0100, Jason A. Donenfeld wrote:
> On Thu, Feb 24, 2022 at 11:56 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > IIRC this part of the QEMU doc was making an implicit assumption
> > about the way QEMU is to be used by mgmt apps doing snapshots.
> >
> > Instead of using the 'loadvm' command on the existing running QEMU
> > process, the doc seems to tacitly expect the management app will
> > throwaway the existing QEMU process and spawn a brand new QEMU
> > process to load the snapshot into, thus getting the new GUID on
> > the QEMU command line.
> 
> Right, exactly. The "there are no known use cases" bit I think just
> forgot about one very common use case that perhaps just wasn't in use
> by the original author. So I'm pretty sure this remains a QEMU bug.
> 
> Jason

Quite possibly yes.

-- 
MST


