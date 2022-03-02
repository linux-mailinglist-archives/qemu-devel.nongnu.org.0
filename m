Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721DC4CA8E4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:16:39 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQiU-0006sG-8f
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:16:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPQhC-0005xu-Pu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:15:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPQhA-0005KY-JR
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:15:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23951B81FAA
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 15:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84742C004E1
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 15:15:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SnNCQQP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646234109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c2+g9iY2kmOPNGlwq4HTp4cL3j+BBDr1ikH+kZn25AM=;
 b=SnNCQQP+glGabYKcZF3VTMvm+PWDc7IMjmh/yac4BOVfUv2WDW2dBrt/Nti1sn5lZitSC7
 5nNFJOR0o3Br5LcXEsCUAmN532MVUCchFdmvmAX/scVt+7cgcZ9lAm515EWb7KZdadvwtx
 SlciQEFpTZ0aU0e3BDMgRdelFLiXqxM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1cb5d2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 2 Mar 2022 15:15:09 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id t7so473681ybi.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:15:09 -0800 (PST)
X-Gm-Message-State: AOAM530wlaa9FVf753eRJgeUsC6jnu02z227kVh5n3CDjGaPXMg7xF8C
 +n/QVNl0ifWdnSB0X0kyf8Izlye/43ktLQ53GO0=
X-Google-Smtp-Source: ABdhPJxC05/AAXh+YCK7fweN+Ucl339GX4StItE4YIRyT3kzm+lXQKWGnocyrzXFrNcMQt/oaChmv0FlidEIh2Gaffs=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr29389927ybq.235.1646234107996; Wed, 02
 Mar 2022 07:15:07 -0800 (PST)
MIME-Version: 1.0
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com> <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org> <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220302092149-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Mar 2022 16:14:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
Message-ID: <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
Subject: Re: propagating vmgenid outward and upward
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
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

Hi Michael,

On Wed, Mar 2, 2022 at 3:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> I just don't see how "value changed while it was read" is so different
> from "value changed one clock after it was read".  Since we don't detect
> the latter I don't see why we should worry about the former.

The "barrier" is at the point where the plaintext has been chosen AND
the nonce for a given keypair has been selected. So, if you have
plaintext in a buffer, and a key in a buffer, and the nonce for that
encryption in a buffer, and then after those are all selected, you
check to see if the vmgenid has changed since the birth of that key,
then you're all set. If it changes _after_ that point of check (your
"one clock after"), it doesn't matter: you'll just be
double-transmitting the same ciphertext, which is something that flaky
wifi sometimes does _anyway_ (and attackers can do intentionally), so
network protocols already are resilient to replay. This is the same
case you asked about earlier, and then answered yourself, when you
were wondering about reaching down into qdiscs.

Jason

