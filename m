Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EF305BFB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:48:42 +0100 (CET)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kFV-0008Jn-BV
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4kEP-0007SU-S3
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4kEN-000544-2P
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611751650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aOdVU2S1wjLYeAxjDzo6QAJ2zlJ7GdzXTsTuzIEKa+g=;
 b=c7Ct+IyYgPHfzBDOTFQ5lG5aQ9SJBuQBxiklknT0GvQW+DH11iv5PT0dOFVDVW+LzGezes
 Hhmfs/l515pepRMNHQuKgq38oyHBDL6ZxaUyua6UDwxfalX9/RGcgtj+cAVrEC+nWDTLfJ
 2Ep7sGZdO1Gdt7D4Vy4zShd3uCCMKaA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-iMu0WM0jNEOgT7Lscc4ONw-1; Wed, 27 Jan 2021 07:47:28 -0500
X-MC-Unique: iMu0WM0jNEOgT7Lscc4ONw-1
Received: by mail-wm1-f71.google.com with SMTP id u67so834193wmg.9
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 04:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aOdVU2S1wjLYeAxjDzo6QAJ2zlJ7GdzXTsTuzIEKa+g=;
 b=JCa4WsBH0FYqSf7osEDsA6o1/saMcMa2bd9sSJj7KAap85GT4BgVPjfdD5LK2U8BeD
 EMiIKyolVeHvgwZqxl28tnLBDZtcUlqgM/uuh33wz4YJJScBG0ztR07T6LeQgHttpyfS
 GYDIf2EonDXWxQVV0A2YiPgOze1ELoilXd1o4B7uawe1YuL1PktC+CLf1x9vFtH2woSP
 Zqxc00eYOLupUcwfo06Ifqgkzye21GvC8WUUmnndGZpceWpaF0mAiMQLfGKyOW33dJmC
 ks9FbeRbcnNOWWQm5vpNTjvb1cmZ09Y0I0klmEpbB/Gsj3MCHQRjxcpX3tVGqPPdnuoZ
 qOsQ==
X-Gm-Message-State: AOAM531EWUdm24ihOxPcVFJrhd9lOfg+r5QaFqdREuyoR0oTk/QGMC0c
 5zMsYPlPwSUeYx2boUy9yqnyaZuSb9rJAkLLebXAr/AMAMLVqqZ3QP5eV5BGv0L6sCjAKEQdW5T
 jDkPRjk5mRlivxl8=
X-Received: by 2002:adf:f849:: with SMTP id d9mr11193453wrq.349.1611751647701; 
 Wed, 27 Jan 2021 04:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6jR2V5MwJgGPqAttIKU4Cs/88SOEleQU/qrmSqPY0rvKN4j1E3jKNjiRR/h96bE2ml2/b8Q==
X-Received: by 2002:adf:f849:: with SMTP id d9mr11193406wrq.349.1611751647520; 
 Wed, 27 Jan 2021 04:47:27 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id z184sm2618398wmg.7.2021.01.27.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 04:47:21 -0800 (PST)
Date: Wed, 27 Jan 2021 07:47:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Subject: Re: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Message-ID: <20210127074549-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <20210112074658-mutt-send-email-mst@kernel.org>
 <9952EF0C-CD1D-4EDB-BAB8-21F72C0BF90D@amazon.com>
MIME-Version: 1.0
In-Reply-To: <9952EF0C-CD1D-4EDB-BAB8-21F72C0BF90D@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Graf \(AWS\), Alexander" <graf@amazon.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 10:28:16AM +0000, Catangiu, Adrian Costin wrote:
> On 12/01/2021, 14:49, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>     On Tue, Jan 12, 2021 at 02:15:58PM +0200, Adrian Catangiu wrote:
>     > The first patch in the set implements a device driver which exposes a
>     > read-only device /dev/sysgenid to userspace, which contains a
>     > monotonically increasing u32 generation counter. Libraries and
>     > applications are expected to open() the device, and then call read()
>     > which blocks until the SysGenId changes. Following an update, read()
>     > calls no longer block until the application acknowledges the new
>     > SysGenId by write()ing it back to the device. Non-blocking read() calls
>     > return EAGAIN when there is no new SysGenId available. Alternatively,
>     > libraries can mmap() the device to get a single shared page which
>     > contains the latest SysGenId at offset 0.
> 
>     Looking at some specifications, the gen ID might actually be located
>     at an arbitrary address. How about instead of hard-coding the offset,
>     we expose it e.g. in sysfs?
> 
> The functionality is split between SysGenID which exposes an internal u32
> counter to userspace, and an (optional) VmGenID backend which drives
> SysGenID generation changes based on hw vmgenid updates.
> 
> The hw UUID you're referring to (vmgenid) is not mmap-ed to userspace or
> otherwise exposed to userspace. It is only used internally by the vmgenid
> driver to find out about VM generation changes and drive the more generic
> SysGenID.
> 
> The SysGenID u32 monotonic increasing counter is the one that is mmaped to
> userspace, but it is a software counter. I don't see any value in using a dynamic
> offset in the mmaped page. Offset 0 is fast and easy and most importantly it is
> static so no need to dynamically calculate or find it at runtime.

Well you are burning a whole page on it, using an offset the page
can be shared with other functionality.

> Thanks,
> Adrian.
> 
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


