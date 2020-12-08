Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2602D3540
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:29:45 +0100 (CET)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkYK-0004Q2-2d
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmjZL-0001c9-2l
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmjZI-0004tj-B5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607459197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27RipfwcpDurrOH/XOd1yiu5AHKEebbXW/QEm6f7bro=;
 b=LCMuTz85yJmWJxNtUEXv47ufbIWawB74rlGur3tlYwYtOhArD0mS4+J4ZRyvgTcwbF2TTQ
 RjFprEH8FPstobwrrGUVynxZXcqGlR0KWlSQ3MSEa0MEo/fHh9Ao+7Rk3Qk4WJqyGe1Xe2
 e8ozMhKle/IFOW9xh0IwteaLDOaFgec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-ckarZKMjMpSqjmK0F8dzwQ-1; Tue, 08 Dec 2020 15:26:35 -0500
X-MC-Unique: ckarZKMjMpSqjmK0F8dzwQ-1
Received: by mail-wr1-f69.google.com with SMTP id o17so91612wra.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lF5gUc8ieKQe/Bt5EchxHT7jvwZjt5avS7tmA74wBuw=;
 b=Cz8J5WCvOoL59wX2ZlD5ueo6wPJ3UBFKiwHjCzY+7hxgdKa5UmdzDxdJy6ewGsw0tH
 8f+qijyLxQP3Zqbw6SWers2pI/0wxtryk2th+oczDH5loAbPxbSEpCSw67i1j0M9Xji+
 EDXM6lAhf4+HqmGZ3dQmuVfsKIrnxnWqbuwv13rkPUGuf96dUIyqqY4bA1sO3/aopN5L
 RnDjqcihqqUBpLCEGpF/ujZqetapFYpWHWnBcnPq08yCXbddsP5tLlGILCm8Ct0lAOTT
 6BD6ayFILOpao8a3DBcDvKhnJpzDPYoILFd5fH2Uz7bjBRh4rUhhdPsBVkTaL0Gk2Dio
 UlZw==
X-Gm-Message-State: AOAM530tABtBVQTgEcYb2w3uz2YQAQjci64p+19H7ryZE7auc/vyIsRW
 1qGV88Vqy/EC7Cecww1beFtjqvemAIrdKUeprMXZXHtT6tXou0Iu+F7H+/tlUibI1uXKKgIxYqU
 wu+Y107tOrLJivio=
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16922786wru.200.1607459194365; 
 Tue, 08 Dec 2020 12:26:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyDn1d1FQYc56JADNPeK68m7E2z9cwKOBxaFjAo9PMFsrxXitm5OCaTKpDNvBjDKTE4LiG+A==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16922770wru.200.1607459194178; 
 Tue, 08 Dec 2020 12:26:34 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i9sm16315786wrs.70.2020.12.08.12.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:26:33 -0800 (PST)
Date: Tue, 8 Dec 2020 15:26:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 00/66] pc,pci,virtio: fixes, cleanups
Message-ID: <20201208152406-mutt-send-email-mst@kernel.org>
References: <20201208193307.646726-1-mst@redhat.com>
 <8cd05a00-b4ea-1515-43e2-8a56a08e2149@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8cd05a00-b4ea-1515-43e2-8a56a08e2149@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 08:53:19PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/8/20 8:33 PM, Michael S. Tsirkin wrote:
> > The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
> > 
> >   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > 
> > for you to fetch changes up to 023e57b93a24f2e7901cf460a45cb5058fa23549:
> > 
> >   hw/virtio-pci Added AER capability. (2020-12-08 13:48:58 -0500)
> > 
> > ----------------------------------------------------------------
> > pc,pci,virtio: fixes, cleanups
> > 
> > Lots of fixes, cleanups.
> > CPU hot-unplug improvements.
> > A new AER property for virtio devices, adding a dummy AER capability.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----------------------------------------------------------------
> > Alex Chen (1):
> >       vhost-user-scsi: Fix memleaks in vus_proc_req()
> > 
> > Andrew (2):
> >       hw/virtio-pci Added counter for pcie capabilities offsets.
> >       hw/virtio-pci Added AER capability.
> 
> Something got wrong with Andrew patches, as the S-o-b tag is:
> 
> Andrew Melnychenko <andrew@daynix.com>


Yea I guess email had a bad From line. Fixed up.
New hash: 46018ba26c794bf7b9113b0707b9d420c30c56a6

Same code just a different author.

-- 
MST


