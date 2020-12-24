Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21F2E25F1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:30:31 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNt8-0001p4-Dv
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksNrf-00017n-Ji
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksNre-00089U-7a
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608805737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS1F0GgOGv0bRd4d23LHPE/8dM5xCwKpqC9iCaaBKYg=;
 b=CzL+NaE/MRiqbkKcUYBWxHFSBes87lIeLQBZQlPRogRVqQjDJATyq0OnmbZ7wo9qopB198
 mnGObC4dKZ4Rmk4Db9ITYWmt/69+7TGkGBeYTvRji4rO6zPIfCojvpW9Win+brzdk41iR3
 eBh7Rqu1IkK4r1li9lryZqSD2+SFdKs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-zorBs91UOzOqui4uYq24Sw-1; Thu, 24 Dec 2020 05:28:55 -0500
X-MC-Unique: zorBs91UOzOqui4uYq24Sw-1
Received: by mail-wm1-f71.google.com with SMTP id t134so575315wmt.7
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 02:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iS1F0GgOGv0bRd4d23LHPE/8dM5xCwKpqC9iCaaBKYg=;
 b=TjU8x6dxeBklPEyAsbQY4oMJxBv5LpxyCRG4iF2c0X3hF6qi0w6t3yfF5/UIWHizmf
 uBFJshdVT+jgzuEJBhLYFycUBA5eWHtpfGFtoc+WsSbHRBTTK1Iu0xsyiJzNe3KtwYdq
 Nz/8v7oLFxJ70Y1S+RKq2bZJ8Z56rsziHKsbLCUGeva+8EchowByyHAQyMJnBTq7BQ07
 OKz4KU7hpm1ZMRDBDbc6t0SKFxoQfKgecnQeTKMpTIaA8IzQW04PMIBzH8kEYMcoI/eO
 GlQ4NjJq3b0Pwuoj67WC8Daj/kmNJz3FOMnJkvvn3Cc7fQ0wpCp37hnPA4xlxoiJnqHH
 +oIQ==
X-Gm-Message-State: AOAM532LXAel4IiS/Wz3K+O+7fMZmM3kPIk4KY02DmZ/RWPBW8ENXyZZ
 PwBH+yrJ8LqM0YSP3j6zPzDWZvkDgCinw47MM+aEn/gPMcHgyAc7BvKGyJfNtQOfX2MbzCbY5zb
 rwfN4FFh9qlQ5YRk=
X-Received: by 2002:a05:6000:1290:: with SMTP id
 f16mr34291886wrx.298.1608805734379; 
 Thu, 24 Dec 2020 02:28:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/oGC2eeZfJLf9u37lFxOl87Vcx1xbyARFNK6V/sn5fdx93pc3AhYdmw51oTMok5Vbxdlsww==
X-Received: by 2002:a05:6000:1290:: with SMTP id
 f16mr34291872wrx.298.1608805734186; 
 Thu, 24 Dec 2020 02:28:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm36645905wrt.96.2020.12.24.02.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 02:28:53 -0800 (PST)
Subject: Re: [PATCH v2 2/2] pnv: Fix reverse dependency on PCI express root
 ports
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <160875161547.98237.12463124171004809427.stgit@bahia.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b1bb3ee3-3c51-d34e-ee9a-81ca0dcbe313@redhat.com>
Date: Thu, 24 Dec 2020 11:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160875161547.98237.12463124171004809427.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/20 20:26, Greg Kurz wrote:
> This is done through a
> new PCI_POWERNV config in hw/pci-host/Kconfig

Yes, this is cleaner. Thanks!

Paolo


