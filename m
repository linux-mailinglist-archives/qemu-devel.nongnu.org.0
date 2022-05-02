Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C4517B04
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 01:53:39 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlfrG-0001Xn-G3
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 19:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nlfpl-0000ge-RK
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nlfpi-00047a-KH
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651535520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=677X9t1r4Xe7VwAxjOvsN/rEPA5Wsge7L6JJqTey5KE=;
 b=JmyciC4oBZiuwRAJhwj+XSokVE6sRFNzcU6BTJz+2hdWE9FV3FoFTvSGeG/w0K0DKKdNeY
 +/QvFoeDv2JciiFi7kndxLm3vnKuPmg2WUC6uWBlt6w1WjBjvJXU8sw6JBJpNsiRVZY1oc
 brUSitjYwAsFm6EJSsNF+9wCe8KmJHQ=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-QcoZLt0uOum-EESEWEPKyw-1; Mon, 02 May 2022 19:51:59 -0400
X-MC-Unique: QcoZLt0uOum-EESEWEPKyw-1
Received: by mail-io1-f71.google.com with SMTP id
 ay13-20020a5d9d8d000000b0065a631e7632so2894614iob.14
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 16:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=677X9t1r4Xe7VwAxjOvsN/rEPA5Wsge7L6JJqTey5KE=;
 b=UBnnkGOFTEBxIKn0y7Mtm279EtHuA5zWYdbhYVOiJ+8H2+BFIdrOg2LTj1cei/vxLy
 nYmPgGyPbCRYXlpBnomTKcvxuQW/SyRECQjVM+5Si/0zvoBqFIn9zx69PXT2a6pW4Mff
 s5BZWw/xVIQk8Jr1hGB9K+H7hVvMasROM2dP2Y0MMHbhPyBHSYoMR+0MDXQJW0KTMUrQ
 Age0wpQaqztbJcRIZtGbGg/3UrQfC/Vq8sVARRqtNEVb8zfkJw+yNxhpZ+qypr8nCwXX
 PSVyNp98d3gDbZYBB4BbGnB/h1sdozhuPT/31IGXbM37gkaGfuUv/WJaDI6wH3ZHMf77
 lFzw==
X-Gm-Message-State: AOAM532xCDGMvCRg6lOdMxu1WpV4iX+NCY51TlA3fPtwGdw0mVovjOPG
 xxIpGfR6Or3YEBRtccfADPrXThdZifxd1AzmlCo75rMDWa9hQhjwJYW1mVVajIkjeWjQMJR1l1t
 V3wbDsEu8OSkSd+A=
X-Received: by 2002:a05:6638:d44:b0:328:5a32:c012 with SMTP id
 d4-20020a0566380d4400b003285a32c012mr5543112jak.211.1651535518613; 
 Mon, 02 May 2022 16:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydW44p2SSNWVUE1oEqKVJ5d2xF7YZYdILS+7DljZWMccl/9qY2nMVRSbf8ISvWhIgrYYM9tw==
X-Received: by 2002:a05:6638:d44:b0:328:5a32:c012 with SMTP id
 d4-20020a0566380d4400b003285a32c012mr5543101jak.211.1651535518404; 
 Mon, 02 May 2022 16:51:58 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5ea70f000000b0065a47e16f37sm2487123iod.9.2022.05.02.16.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 16:51:57 -0700 (PDT)
Date: Mon, 2 May 2022 19:51:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Daniel Berrange <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnBunLRaqmkZh3Re@xz-m1.local>
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
 <Ymq+5bPaYTyUHF6L@work-vm>
 <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leo,

On Fri, Apr 29, 2022 at 11:40:44PM -0300, Leonardo Bras Soares Passos wrote:
> Does anyone else have any further suggestions, or know how this kind of issue
> is generally solved in qemu?

I've no solid idea why it can't see MSG_ZEROCOPY defined in the specific
environment, but when I was looking at bits/socket.h I saw this:

#ifndef _SYS_SOCKET_H
# error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
#endif

Maybe worth a shot to do a replacement in all cases?

-- 
Peter Xu


