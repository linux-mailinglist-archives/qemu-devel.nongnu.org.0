Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DD204D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 11:09:11 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnevW-000158-NK
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jnetv-0007ZA-Kd
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:07:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37867
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jnett-0003ce-4g
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592903248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ewh11NkAt1vxijOPsDw2gC659VmFWnVa0/7d4edZN4M=;
 b=AmuwnYwEGAQOYwL95VOICxV/7szlRK6y6aEpdAQy0VLGcLEzSMDdbu4PkqDMSKOMoUWSUm
 gzKeJDXI7qjwOrMX5W0JxO+7Ydw40hoic1vTxI7SfGu5mZeO0r9QG+Hb1emygAJU9DYkvq
 UM7uJvceM+7m+/YkOH5M593k5dBHwek=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-i6qRMFjuO72Q8MNnAGYFbg-1; Tue, 23 Jun 2020 05:07:26 -0400
X-MC-Unique: i6qRMFjuO72Q8MNnAGYFbg-1
Received: by mail-wr1-f69.google.com with SMTP id e11so5046069wrs.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 02:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ewh11NkAt1vxijOPsDw2gC659VmFWnVa0/7d4edZN4M=;
 b=gg1urH4t5EL7iTB19S4SHlypTOn9fyPjY0s3PqngfjmTw61Jsk43jmi4v0Wym/KXDc
 odz/LHHUOCBtgnRcAioUXtxfTG4aydxZz3K2XCNHAhoC4EKqY5vNjO2ph7DDcJHEMnBI
 8/jsioXPFEuQ/8IJ0cpwiABYxDeTB2pdFCqjSepWYiRhUQkxaPLVJxQ9jw7yVist+w1I
 kd0VFFfXkJ8MOa4gNHR0tcMW0xaiatlRuOiDgU86BNVjiAwGNPd0yRU1ygrIXzyoZcAc
 SuIHAOOOow2E5ae+TVuD/0jqFkkYVHkBwA6vredrIiqH+oL0VdnT0iSfzTUJ256Qz8PB
 csCw==
X-Gm-Message-State: AOAM530nWs1+YOODzVtww7NHuWJr9XkstX63dCu241etVyDsGDaN8e2c
 /mWkLj30p6PrbQ6nqg3oCvGJ8L0BslncN5F0ETyn2EUB2asHKSLqGVqop6CHuTJ1Y+zeXKAU4yj
 QvhWMdFZhAV4rltU=
X-Received: by 2002:a1c:c357:: with SMTP id t84mr24462144wmf.155.1592903245572; 
 Tue, 23 Jun 2020 02:07:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5efUCvXkEslaLpEKWD3clNoBIPZkH5panxpoB2OIJy8MDdNw82bKzaaJzXAD7NREsW2FNqA==
X-Received: by 2002:a1c:c357:: with SMTP id t84mr24462127wmf.155.1592903245365; 
 Tue, 23 Jun 2020 02:07:25 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 v20sm21986273wrb.51.2020.06.23.02.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:07:24 -0700 (PDT)
Date: Tue, 23 Jun 2020 05:07:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] Stop vhost-user sending uninitialized mmap_offsets
Message-ID: <20200623050715-mutt-send-email-mst@kernel.org>
References: <1592650156-25845-1-git-send-email-raphael.norwitz@nutanix.com>
 <CAFEAcA90x+7LgSgwkSs2Ah+UwKv+Wouq71K690sh9j4AROhxdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90x+7LgSgwkSs2Ah+UwKv+Wouq71K690sh9j4AROhxdw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 09:58:23AM +0100, Peter Maydell wrote:
> On Tue, 23 Jun 2020 at 00:50, Raphael Norwitz
> <raphael.norwitz@nutanix.com> wrote:
> >
> > Prior to this change, the vhost_user_fill_msg_region function filled out
> > all elements of the VhostUserMemoryRegion struct except the mmap_offset.
> >
> > This function is often called on uninitialized structs, which are then
> > copied into VHOST_USER_SET_MEM_TABLE and VHOST_USER_ADD/REM_MEM_REG
> > messages. In some cases, where the mmap_offset was not needed, it was
> > left uninitialized, causing QEMU to send the backend uninitialized data,
> > which Coverity flagged as a series of issues.
> >
> > This change augments the vhost_user_fill_msg_region API, adding a
> > mmap_offset paramenter, forcing the caller to initialize mmap_offset.
> >
> > Fixes: ece99091c2d0aeb23734289a50ef2ff4e0a08929
> > Fixes: f1aeb14b0809e313c74244d838645ed25e85ea63
> > Reported-by: Coverity (CIDs 1429802, 1429803 and 1429804)
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> 
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

Queued, thanks!


