Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12815442A17
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:06:56 +0100 (CET)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpkt-0003GJ-7r
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhpj2-0001ak-Do
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhpiw-0006RK-09
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635843893;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OWn1jESq23FBEgvVe23w9la4woTw6qZGSYQ4ezYIvPI=;
 b=iOaZhEEg+cpduEm9DzzuSANVi2wdffsc0wFt9zMm5sR57qeKPh5NjUDgBJKLkkz8yrxW3l
 aRlat+i5lqr1IruUiM4RsNyKq6BEl3y5Ib4LpTD3XpB6lepI0zZGaJ0FIPJjxoX9kYvIOd
 IZFGU/tD6tNzrQ9pExwc1yoDxlSZYxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Qs2kuYP3MyaSh3UWQ9vmww-1; Tue, 02 Nov 2021 05:04:52 -0400
X-MC-Unique: Qs2kuYP3MyaSh3UWQ9vmww-1
Received: by mail-wm1-f69.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso6634673wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=OWn1jESq23FBEgvVe23w9la4woTw6qZGSYQ4ezYIvPI=;
 b=E6Ixn/TYCghzgR/Hmfp3uwBPm4O+Hn0G1QOaN/hFTLlewe/48jSiNOlH3Gxxtzd2Qe
 3mFsnfZh6aYWdL4sEXPHkPAAbr8VZ7Idd+9XXdw9JnQ/HpVAaGF6wQUj30nd9s86qBke
 k20tv5AkSO3BJDl/WKN6V4KuBkbqhMqMWNYo+PZNl2/Rwpn1Ck9PSydNa8yKiNjzQuXI
 K6GYCYI0SaltZPIaP283GsRzDjCggVi6w6XrVrW1t5FOVjnf5/T5vKtWq9pdjVS71lB6
 TarLL/d+41b/VgDF8KtgL91NuGw9bdD7qqUrM/TIxBvNrLl16OFsk4NLD5kQdewkPKlZ
 gbjg==
X-Gm-Message-State: AOAM532FAk/sxxeufhgLk7ctQ2sOGftpbJOujcwhRsiPGJoTd/jznwk3
 IPf3s+k+kYuxLl9DcEChsYyPCyYDsX56hB+4N3NJJZYT7sFHyTbn4jWSfGjXDt4D5JS+oETCY4A
 4fKTPFwINmuLmrSE=
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr5403584wmr.134.1635843891314; 
 Tue, 02 Nov 2021 02:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYt9v0T6SN9MyV40Rk+9y2lnyW9Xf4qeQM2F4HI9uRgp1aDFnR+SHoBqomJC0bOlvP9tayaA==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr5403568wmr.134.1635843891171; 
 Tue, 02 Nov 2021 02:04:51 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id v6sm19559103wrx.17.2021.11.02.02.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 02:04:50 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
In-Reply-To: <20210929144311.1168561-3-lvivier@redhat.com> (Laurent Vivier's
 message of "Wed, 29 Sep 2021 16:43:11 +0200")
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 10:04:49 +0100
Message-ID: <87ee7zlyha.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> As the guest OS is paused, we will never receive the unplug event
> from the kernel and the migration cannot continue.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

I can't think of a better solution.


