Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200084C9E86
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 08:43:51 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPJeH-0004CZ-Li
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 02:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPJdH-0003W7-GN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPJdB-0007k4-Vx
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646206960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r54KECS5Ta4+XfMPrM9TZqlD4g6ikpj26D7X7GFm2xk=;
 b=cw8cEjwtKGHOv3OYdt3dcxaE388U8YaebEfjyft3HLQk52+f8kLk5SLlNFFeMf4ZvgclRa
 tWekZQ0R7LxzRrqrtdT6aggY98zMpN/rVK0QFQVRrTKCcCz/n3R1swauxIrkfLDAU6NRJ0
 LNqE3aucoohIPvbMj1/nvKQxqXki9vo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-PsUQqfi2NC2QQDiTjVmFyw-1; Wed, 02 Mar 2022 02:42:39 -0500
X-MC-Unique: PsUQqfi2NC2QQDiTjVmFyw-1
Received: by mail-wm1-f69.google.com with SMTP id
 az36-20020a05600c602400b003811b328ed5so228602wmb.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 23:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r54KECS5Ta4+XfMPrM9TZqlD4g6ikpj26D7X7GFm2xk=;
 b=PnWY1DzUryVN7vrTgeBn8GtMHN4jx0mA1NcFbZKhMnCN+LXETVO2h21nSJy9qt2vg7
 YGfaQDF8aAESy9pUGjJ3pECOIid8ECncf5jh+JxThn51qLS9dCWRK7ZKYG9Yi80Ld9HX
 7zTgvuo4kg9U4LUbGuAWB9em9BpEuD9N82brKXFNsBVwKmcL3qbPOvW8xyNijVqJe0io
 4qZNG0egR/VBxx9PdFIV1+rLsSzDRjwDeloeFiAUC6UWtn0vVMYg6Xay3ggYdna6bkzG
 lpcxGYSrUJXUUKf0hnUGnAdYHIsgkmjGRd6D+1TTWtFTg6OfgR9iis8/La6cFk5DGkAR
 HWug==
X-Gm-Message-State: AOAM5339QOSSzhm8cjPFSl+n5XHYZzfioySu0iEAZVXlSIu6vJw9UKDo
 EafSf0VNHBglJWc86Mo/ph/hGrET/nX+a4QGsp2Yq05h9BCJ4C2jdgUzza0ZcLGKBjX9AH4uDzI
 92slZdYDSKf+yeps=
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr19550329wmq.156.1646206957643; 
 Tue, 01 Mar 2022 23:42:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrhIny0LTz+oAiVJdVBdcw7M1SyuYOvWiCd108UgZKej5mVsXb3i5PRUQLI/CVYzNAxiQ1tA==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr19550301wmq.156.1646206957345; 
 Tue, 01 Mar 2022 23:42:37 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003842f011bc5sm1040455wmq.2.2022.03.01.23.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 23:42:36 -0800 (PST)
Date: Wed, 2 Mar 2022 02:42:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302024137-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 07:37:06PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Tue, Mar 1, 2022 at 6:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > Hmm okay, so it's a performance optimization... some batching then? Do
> > you really need to worry about every packet? Every 64 packets not
> > enough?  Packets are after all queued at NICs etc, and VM fork can
> > happen after they leave wireguard ...
> 
> Unfortunately, yes, this is an "every packet" sort of thing -- if the
> race is to be avoided in a meaningful way. It's really extra bad:
> ChaCha20 and AES-CTR work by xoring a secret stream of bytes with
> plaintext to produce a ciphertext. If you use that same secret stream
> and xor it with a second plaintext and transmit that too, an attacker
> can combine the two different ciphertexts to learn things about the
> original plaintext.

So what about the point about packets queued then? You don't fish
packets out of qdisc queues, do you?

> But, anyway, it seems like the race is here to stay given what we have
> _currently_ available with the virtual hardware. That's why I'm
> focused on trying to get something going that's the least bad with
> what we've currently got, which is racy by design. How vitally
> important is it to have something that doesn't race in the far future?
> I don't know, really. It seems plausible that that ACPI notifier
> triggers so early that nothing else really even has a chance, so the
> race concern is purely theoretical. But I haven't tried to measure
> that so I'm not sure.
> 
> Jason


