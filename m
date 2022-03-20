Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55314E1E31
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:54:12 +0100 (CET)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW4R9-0002Bq-Bg
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:54:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nW4QE-0001VS-Ts
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nW4QB-0003G0-PC
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647816790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lbklHsC4p2zDoA9Qm45sY9QvlkWdqqX9EtVTWkPxbLA=;
 b=TcNXjRqi/sMoz/p1eroeIlV8om0e909RmQme1L3vYD7ftn0dINAU/ouGFmIeBdqHCCsFGE
 VRsaV8Es6s2PXM/n2gSWTdphJNFWqBzZnxYmVQzF2YHJrPAij4lVc29ibYl48xVMmUj8KD
 CR2+/7q3Kna6eC9g0vB/Mh5GSrxWL9E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-4MVWJMPWNhqLgT_7wDI73w-1; Sun, 20 Mar 2022 18:53:08 -0400
X-MC-Unique: 4MVWJMPWNhqLgT_7wDI73w-1
Received: by mail-ej1-f69.google.com with SMTP id
 hz15-20020a1709072cef00b006dfeceff2d1so992946ejc.17
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 15:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lbklHsC4p2zDoA9Qm45sY9QvlkWdqqX9EtVTWkPxbLA=;
 b=RHHwGb3r3lbu6xfULZVqMxAJSna/JlWnZdOtUDweCZ5g24iMh/8/KO0RE+4AFBoNZ+
 qYWTllGO1xQZ5YHLBsZa6tPTGWQgn+f/lQmNkp1c68i0rOmUeyNIwQ2I4tR1DS4Zea7n
 A0tZUdNJ5XH9w5Wui94dniZsn9wbGWEotExfkk3lgiFxnEWQBS0UvCvjyqwCndGmdLa6
 Cce2Q9WWp+S1xoUE+Gr1bNtrbTBVmpdVQK0EMvNBYwZNcVVPrA+G0ms8bvq314WErQQ8
 xvXJFW1rLpAPXdrAbt6HPOiLRZhPx1vwtje5RcHA6U1jwKC0wMah1lysLIafZwJL6IrP
 3trw==
X-Gm-Message-State: AOAM533mwEJfes6O6BVWNNpf0pl+vldjT8sQRNyM3hGsWQZAgDxCgfQT
 ObuLjg26/cwfVDfG9otOfpFnKQ29oN93ybp3v36EvT8ecCmQ+E75JT2oOwiTe+ECR5Pel6Zfzhi
 qB6i4aeH2vO96Ysc=
X-Received: by 2002:a17:907:7287:b0:6df:8f48:3f76 with SMTP id
 dt7-20020a170907728700b006df8f483f76mr17022731ejc.411.1647816787650; 
 Sun, 20 Mar 2022 15:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZe9l6Up1iG5LURVWCj/AihbE5iv/oi8hjD6mxD1AXkSiAxFIFKMfPOvm35kPXKaxucLH/AQ==
X-Received: by 2002:a17:907:7287:b0:6df:8f48:3f76 with SMTP id
 dt7-20020a170907728700b006df8f483f76mr17022701ejc.411.1647816787435; 
 Sun, 20 Mar 2022 15:53:07 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm6300968ejj.74.2022.03.20.15.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 15:53:06 -0700 (PDT)
Date: Sun, 20 Mar 2022 18:53:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220320185049-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <c5181fb5-38fb-f261-9de5-24655be1c749@amazon.com>
 <CAHmME9rTMDkE7UA3_wg87mrDVYps+YaHw+dZwF0EbM0zC4pQQw@mail.gmail.com>
 <47137806-9162-0f60-e830-1a3731595c8c@amazon.com>
MIME-Version: 1.0
In-Reply-To: <47137806-9162-0f60-e830-1a3731595c8c@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Brown, Len" <len.brown@intel.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-hyperv@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 12:18:04PM +0100, Alexander Graf wrote:
> I agree on the slightly racy compromise

Thought hard about this, I think I agree, and I guess as a minimum we
can start with at least the ACPI+RNG patch, right? That will already
address wireguard ...

-- 
MST


