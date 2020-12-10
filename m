Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8072D6685
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:32:55 +0100 (CET)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRgM-0001bc-1E
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1knRdG-0000oZ-PU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1knRdE-0002gE-0j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607628574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15ZhoAsiZeE7ILsMhjmOBmxj8K6mkbFuO/Z+ODAazdA=;
 b=CZly8awvlPYZgjkkdZ+U50qbTQmf9Kowvq0uvqZxRTvxfaEnqkDn/sJWgqlzFa4sQ3w+Dp
 p82Ts5/6oR2WX5U30ymqiob3kWK4UeDlayqPrRa24G+gSbf3LUi/1OoeOBHXhTU7NGoIDT
 i5gAZ9b0jsGuesgcs4eri7ITht3gpDU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Ja1L4jFyMXWbjfP1DOVAEA-1; Thu, 10 Dec 2020 14:29:32 -0500
X-MC-Unique: Ja1L4jFyMXWbjfP1DOVAEA-1
Received: by mail-qv1-f70.google.com with SMTP id n5so4568269qvt.14
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15ZhoAsiZeE7ILsMhjmOBmxj8K6mkbFuO/Z+ODAazdA=;
 b=TQa1VZvHiO2+ORWL7bNfMlygVqzTx+HZq+v8+hw9NWA395Vh7lr9Y/55kJzu1T1J0m
 MWW8ETwaIuwWbhfWYu4BhHn9cPpJ9foFVnwQqF8iEZsGoTkiVV/ofCk1vvzf31OFhvCs
 1J0zWDb/Yb4LNq2OMyhHQoduMg2Jr3xk2MzvyXEh1ML6vJvcjIfF6XTxh0itMVW3l67S
 HDYN2lefRgqj72JbVNpE2wd+4BUbtuj3uD7fWDoPquw+nldDNYkpsaTUM496ymZuYTHw
 393kWbF5yEri96Zb5t4eIBzezKewJQwY28loHz1Daw17njGAY3LghTnp7v/RE+3v/Ql1
 KLJg==
X-Gm-Message-State: AOAM533ppPvIL+HWfukkIEVpc888kMW9u2XN7Pugw2SfoGqrzy6vObZj
 Hqiu4HMh08uHdvEFfNwys9T5mndXjP5f3W3nNqKiLanenbO+ha2bRgTxYN1zc337WZ+sZbhA+ya
 1FMa29/I8Jz96wS4AgGEk4lMiDAEXKWs=
X-Received: by 2002:ac8:4688:: with SMTP id g8mr10808118qto.119.1607628572238; 
 Thu, 10 Dec 2020 11:29:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsIso+0pkrs0+fklcnVbOAQAxIeG79tg2N8hP3gDKWUBNU8YVDCiFNs+h0bruK2IJEPrUCyC/Len9dJtt6msE=
X-Received: by 2002:ac8:4688:: with SMTP id g8mr10808103qto.119.1607628572011; 
 Thu, 10 Dec 2020 11:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20201210161126.GA125438@redhat.com>
In-Reply-To: <20201210161126.GA125438@redhat.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 10 Dec 2020 20:29:21 +0100
Message-ID: <CAOssrKcKaosJo1W+sek0AOA3CdyE+ZUWzx8KPsn=Gz3Nor+_iQ@mail.gmail.com>
Subject: Re: Some performance numbers for virtiofs, DAX and virtio-9p
To: Vivek Goyal <vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 5:11 PM Vivek Goyal <vgoyal@redhat.com> wrote:

> Conclusion
> -----------
> - virtiofs DAX seems to help a lot in many workloads.
>
>   Note, DAX performance well only if data fits in cache window. My total
>   data is 16G and cache window size is 16G as well. If data is larger
>   than DAX cache window, then performance of dax suffers a lot. Overhead
>   of reclaiming old mapping and setting up a new one is very high.

Which begs the question: what is the optimal window size?

What is the cost per GB of window to the host and guest?

Could we measure at what point does a large window size actually make
performance worse?

>
> NAME                    WORKLOAD                Bandwidth       IOPS
> 9p-none                 seqread-psync           98.6mb          24.6k
> 9p-mmap                 seqread-psync           97.5mb          24.3k
> 9p-loose                seqread-psync           91.6mb          22.9k
> vtfs-none               seqread-psync           98.4mb          24.6k
> vtfs-none-dax           seqread-psync           660.3mb         165.0k
> vtfs-auto               seqread-psync           650.0mb         162.5k
> vtfs-auto-dax           seqread-psync           703.1mb         175.7k
> vtfs-always             seqread-psync           671.3mb         167.8k
> vtfs-always-dax         seqread-psync           687.2mb         171.8k
>
> 9p-none                 seqread-psync-multi     397.6mb         99.4k
> 9p-mmap                 seqread-psync-multi     382.7mb         95.6k
> 9p-loose                seqread-psync-multi     350.5mb         87.6k
> vtfs-none               seqread-psync-multi     360.0mb         90.0k
> vtfs-none-dax           seqread-psync-multi     2281.1mb        570.2k
> vtfs-auto               seqread-psync-multi     2530.7mb        632.6k
> vtfs-auto-dax           seqread-psync-multi     2423.9mb        605.9k
> vtfs-always             seqread-psync-multi     2535.7mb        633.9k
> vtfs-always-dax         seqread-psync-multi     2406.1mb        601.5k

Seems like in all the -multi tests 9p-none performs consistently
better than vtfs-none.   Could that be due to the single queue?

Thanks,
Miklos


