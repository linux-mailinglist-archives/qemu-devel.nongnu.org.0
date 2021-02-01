Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6D30AC28
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:00:31 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bcs-0004yZ-Nl
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6bVk-0005xE-AE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:53:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6bVh-0000u7-Qp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0I6X1Nnkt5dpnyYyQsMXNh0So54RZK/bg33t3v3zCt8=;
 b=GsWe5Z83vuyLszwUblHzvRkLEoavCFk0IoiyGlE3cAWoHusMJcMQo5Y9S8K1oqMivwCgCv
 /ehC22lBS7PIIDxrSqzMf18/+LjySIDrl3EWgk5dcZjnumdGRf9duC9oyGoCjFB0asYtWW
 JuxSjpECk+qjUZpPHjGeCqNoMNBbdFY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-d4oE6zb1Ore9jNWRR2ZagQ-1; Mon, 01 Feb 2021 10:53:02 -0500
X-MC-Unique: d4oE6zb1Ore9jNWRR2ZagQ-1
Received: by mail-qk1-f200.google.com with SMTP id s66so13556015qkh.10
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0I6X1Nnkt5dpnyYyQsMXNh0So54RZK/bg33t3v3zCt8=;
 b=uIz4yEGzBgBSo5htb2iQYkWBL+OkM8vBH8P+d3aopXQfRN9Amo7Qq5xV9IgjE8V31Z
 KQgA53l2rSKWtKeyTY77gQ/TP8LsUTtlIPFCt/lpAptXWrLUUN/pLyKHpIGgD4Kuac/6
 yxmHC5UHQsfzKGy9gKdDQQA9jMZ8JhWawMqTG8szHPT9A5gPYLzSzI8Xz2ib7fC0hubL
 iPD1TydwjowBwRAUuArzMtBX09GHlf54uDsaywy698Ui9jdAi5iQUZ9uUH1IuUDd3Ny+
 IuPs7T7EQOsLzlVNFnHIAbktgAVqVs9Kls4S9/R9Q6kA9TlJP09a2M4uXMGmv3OAzbz2
 T+YQ==
X-Gm-Message-State: AOAM531QC6RPDkan3a06wW8vL0i8toviCTYMjuWrawsmnI7IweANQzqc
 6pXV8bjDect8QAAcgOwSnujHVoYfmrRXQPV5s2PuXrprg/okaAijTehYPGdPO0yllxNKqDMe5AR
 LKR3wnkNbkLs47c4=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr1920457qkc.291.1612194781333; 
 Mon, 01 Feb 2021 07:53:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrm1cdvwubYzWhLzBr1vuTWDaKGGiXrfmkIsbnjMWo88TN0QCxUWu0Ycx5Xab2QeMf3wxHIw==
X-Received: by 2002:a37:7b02:: with SMTP id w2mr1920427qkc.291.1612194781009; 
 Mon, 01 Feb 2021 07:53:01 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id 193sm14484270qki.28.2021.02.01.07.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:53:00 -0800 (PST)
Date: Mon, 1 Feb 2021 10:52:59 -0500
From: Peter Xu <peterx@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/2] pci: add romsize property
Message-ID: <20210201155259.GE260413@xz-x1>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
 <20210201075632.lfchwzrzr6aiuplu@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210201075632.lfchwzrzr6aiuplu@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mst@redhat.com, lersek@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 08:56:32AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
> 
> IIRC we have a DEFINE_PROP_SIZE() which can parse units and therefore
> accepts -- for example -- "512k" or "1M".

Actually IMHO there's some fair point to make it uint32: even 1 byte would
matter here or migration fails.  Hence, we don't need to worry about things
like 512KB or 512KiB, for example.

Not to mention that I bet 99.99% qemu users won't really use this parameter,
only if we'd migrate across distros.  That's rare, we'd copy the exact byte
value of the source ROM size here (e.g. via "info ramblock", or "ls -l" the
romfile then round to pow2 and specify on dest) or we simply copy this param
over from another source VM.

Thanks,

-- 
Peter Xu


