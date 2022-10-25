Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39260CD2A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:15:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJkS-00041O-Ly; Tue, 25 Oct 2022 09:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJjz-0003am-3i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJjt-0007p6-Kd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666703583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaNicNcBgylp8LrLfqL/97FlX2kFPYiyBy9AN30OHOg=;
 b=jNUUnuDLaC++LW8KgdBLvnrfk97xdX2heaVDLgD8ozBbQRAIJymPIJXitaSX5Qj2CftYno
 wX6/hhs/C8h5luZIWJM5Hnru30vuPvCbpUHpPjSYPMY3qrqcauYFza+pT7u2ck0kImtn0u
 CtkG3BgV7i1uviStGv/83azcj0e/EX0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-BBCKb8OdNbuRv569sbVLog-1; Tue, 25 Oct 2022 09:13:00 -0400
X-MC-Unique: BBCKb8OdNbuRv569sbVLog-1
Received: by mail-vk1-f197.google.com with SMTP id
 r16-20020a1f2b10000000b003b69c62fcb8so1026761vkr.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JaNicNcBgylp8LrLfqL/97FlX2kFPYiyBy9AN30OHOg=;
 b=oRfEv5bYuky9EYikTJvzfbgZGCwnGOaphNjmr8IDn1fMcEupfGpBtoa1Jmby6WJ8tb
 oXImrcNCprVSosuOCIssMuR0IgnnDXYzJ954wkD9S8qlDDdGo/OjBXvEwRnrjgEJ3hWU
 IxX0Vyp8ou6+PblI1II+xQUScJFToDUHKhe+8HAvj6Lze3vpU8Nw5/i3whlmrNBbBiRo
 1G+TPKxE0jf22wl8zMcKx75170d5BXWbmNmXjZuO/hnVmttsEIUh1dRa4ygYqaapn4GD
 AcnJNqCKuqEGLHrdK6tvlcyRfHiPe2pCgaMRUjbFf48Kew86Ycxnk6xh60Ew2WZHKh0F
 Zpfg==
X-Gm-Message-State: ACrzQf1ba8q9XCKo7sz6M6zV9u0EQOm3U11Uf7Va6m7RDlkZg0BBsT5N
 Mx3+GnAnzKHOkZTPJ7cDsM/Md0dfYbgidMEbhCg48DVA39E8KUcMn6xL+wuw4zXoMI+Bou8B4Jm
 AyNf0+sLv7qIAQznhUGnFNYLDRom0gts=
X-Received: by 2002:ab0:6592:0:b0:40c:4374:3aa4 with SMTP id
 v18-20020ab06592000000b0040c43743aa4mr4431260uam.42.1666703580090; 
 Tue, 25 Oct 2022 06:13:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5prOdVh1qJgrvRbZ2q/Y7n28JezybsPWk9tqih4liwZmPjVstnrW0H38cU5POpvsUmiK8/QjjLXBKtAGrMJOo=
X-Received: by 2002:ab0:6592:0:b0:40c:4374:3aa4 with SMTP id
 v18-20020ab06592000000b0040c43743aa4mr4431231uam.42.1666703579836; Tue, 25
 Oct 2022 06:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220812133453.82671-1-imbrenda@linux.ibm.com>
 <c60fa9e2-b5c4-6765-da23-e6cc31746f53@redhat.com>
 <Y1fb9OAKTgUXC/w6@redhat.com>
In-Reply-To: <Y1fb9OAKTgUXC/w6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 25 Oct 2022 15:12:48 +0200
Message-ID: <CABgObfaDjYJX2GjUne6pMEZh6KDN0d0H=y_aX0pK0U9KMmvJhA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org,
 david@redhat.com, 
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com, 
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com, 
 alex.bennee@linaro.org, armbru@redhat.com, 
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 2:52 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> If doing it in libvirt the flow would be
>
>   libvirtd -> fork -> fork -> execve(qemu)
>                         \-> clone(async handler)
>
> In the latter case the async handler would be running code from
> the libvirt binary. When the parent calls execve that will load
> the code from QEMU, and because of CLONE_VM, this affect the
> memory mappings in the async handler process too. I think that
> will end up quite explody, no ?

Oh yes it will. :)

Paolo


