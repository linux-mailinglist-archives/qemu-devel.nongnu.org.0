Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDF30C224
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:44:50 +0100 (CET)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wvB-000556-2x
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6wjq-0007lt-P8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6wjo-0005fa-Tv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOfLz2ooS1YVxqAqeLs03INDucXpuqKyLYasthASKR4=;
 b=fkp4KvtsAwTJnW0l8wYhfrP42SJuWM8LFePUnV/Bgw8XJKb7fTNRpL3m4qg7+rforVtgM/
 d7XaJOscg1QQaGIfSjHKadrLwEJfXy3ezZWil2BYes07cQHVdTusPXp7denGBIGQT+ul5B
 df2ACjYASuvgOnD3Tc7djSitQNcSzJc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-HXlLADSFPkCHQMzUz6-Xmw-1; Tue, 02 Feb 2021 09:33:00 -0500
X-MC-Unique: HXlLADSFPkCHQMzUz6-Xmw-1
Received: by mail-wr1-f71.google.com with SMTP id m7so1966524wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MOfLz2ooS1YVxqAqeLs03INDucXpuqKyLYasthASKR4=;
 b=KpLaiY/6t44I9IO+Qx2tTiv/ajerztzhiu98nWx/+l4y39pv2cBeO2jWy8HOP196f3
 iFGcfFMDabkg/OOezHm3oVjxgWTOWtJByUGOAtM7U4CKFTn3xqY9WOX7cl+mcjafWWxV
 AUOE5Vyll3jb1EfKNNr5MQMMOjircbIpirIvNRa8n9Mmd1UMMzg+JGSIvds8MxZQXs8c
 V0wD/jC9lwZb+Jfs0wGJJpVNMY/INjs2QLLYy0tDXh8Xtqq4H8aa8q7/rANWtvuCOwYb
 ZckuIzkhy3htX0023prHNelu95kXeQPoeFQkDwXhdizOXNphjTGcWEV09YsMIDXV3T+6
 WRhA==
X-Gm-Message-State: AOAM531t2UaNzWfWQJt/YmAvd4dOhz2wXYPtlKj0YBssbvoKPKIozv6e
 Co9Mf1UaNDCnHkqW94UUrnyUaS9ebnvrn6/UPIqGX9dyVDhXi0ffMm5rX1mJuJIa73YQP2gmCON
 O68w23/hOaqO/bw8=
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr24388412wrd.118.1612276379289; 
 Tue, 02 Feb 2021 06:32:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNlKeX+el7cMOrZK5yq6RtSBJMhNR+o0snQl4QXFgxLrVEgd3S6vtJXgCeHmPNLUWxDwZ7tg==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr24388360wrd.118.1612276379086; 
 Tue, 02 Feb 2021 06:32:59 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id b138sm3242759wmb.35.2021.02.02.06.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:32:54 -0800 (PST)
Date: Tue, 2 Feb 2021 09:32:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210202092418-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
 <20210127221505.GB24799@amd>
MIME-Version: 1.0
In-Reply-To: <20210127221505.GB24799@amd>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Jason@zx2c4.com, dgunigun@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au,
 rafael@kernel.org, ebiggers@kernel.org, borntraeger@de.ibm.com,
 sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de, jannh@google.com,
 raduweis@amazon.com, asmehra@redhat.com, Adrian Catangiu <acatan@amazon.com>,
 graf@amazon.com, rppt@kernel.org, luto@kernel.org, gil@azul.com,
 colmmacc@amazon.com, tytso@mit.edu, gregkh@linuxfoundation.org,
 areber@redhat.com, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 11:15:05PM +0100, Pavel Machek wrote:
> Hi!
> 
> > - Solution
> > 
> > The System Generation ID is a simple concept meant to alleviate the
> > issue by providing a monotonically increasing u32 counter that changes
> > each time the VM or container is restored from a snapshot.
> 
> I'd make it u64.
> 
> But as people explained, this has race problems that may be impossible
> to solve?

Well the read/write interface could be used in a safe way thinkably:

- application checks VM gen id
- application sends a transaction e.g. to  database
- application re-checks VM gen id
- if id changed, application checks the database for duplicate
  transactions

not sure how can the mmap interface be used safely.
Drop it for now?



> Best regards,
> 								Pavel
> 								
> -- 
> http://www.livejournal.com/~pavelmachek



