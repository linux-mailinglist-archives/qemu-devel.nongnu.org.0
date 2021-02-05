Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8E6310C11
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:46:28 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81RL-00034k-7X
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81Om-0001qY-MM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81Ok-0000Y5-Qo
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612532626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bX2i7rILP95x6Vz2HLUUAi5wnV35TybORxt2ovEJctA=;
 b=RgU1gyQJhAVKkF8VS0PFe6SUQHRD27VNYUIdUWvDZj40OgIB8YmjbDpZfEWtEaBWBs/JLF
 qUAE11VSq+GukXHHiKPPv5/op+Bi+2hME/j/Ip7T6Oc9N4/hENyQv/8bqWtQbxSerZ2ng0
 m2Df5Q+xd5+HKfoR3l7PcCTqQ6i6Cok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-UTYIM4iOOdKqzndJnv-w5A-1; Fri, 05 Feb 2021 08:43:44 -0500
X-MC-Unique: UTYIM4iOOdKqzndJnv-w5A-1
Received: by mail-wr1-f72.google.com with SMTP id x7so5337957wrp.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 05:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bX2i7rILP95x6Vz2HLUUAi5wnV35TybORxt2ovEJctA=;
 b=kAZ8alCFjq2AZJf/41EAv0jTfGDwLpQpIlu6QECVGVkrl3yeisyQPOwtSShChKk31C
 cbcnmYsz+WKIJDeCLnwL10Go8rfs7jddGFlF2H4vf4CGYCsX+c+j444AkycLb6ggtldH
 w+3FbOe0ElSciqBTOWXdracIIaoIni0/Cs9/gJzgu7YPgPpuTGqfX18hhFLv5RbgtWtU
 rxGvrKHEL4Aj3aA6WM11xMgbQNl8ns7leoPYfXy7dMGpWzLeXoLRX9PO9KsoZ66KbcMS
 iS1BM107yz4nChfVaJ2XusanKokIwh++gVDJTCknX5EWjpDbEmLzGEMi2z/mmeCTgHDG
 0czw==
X-Gm-Message-State: AOAM5332Q6SW2S0/cKjkleUVCSZHbV7PTmGT31C/rfOy5PIvbHntd75P
 Eed4hcjfptI2BSsH+KXHugHXBr+31iUO81Sp7Kbn+7/Qav6fuTvWx1XRprqeA0OG0Ne6fgmVnX5
 fUvxkKBS420g29RA=
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr3565958wmq.67.1612532623439; 
 Fri, 05 Feb 2021 05:43:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGxgxjE+sD0iHvbnDT2eHiNNVXLHOzluj3E8UYWFipzVW4ciHB8+vpRANCY9h7+As3Edj26A==
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr3565942wmq.67.1612532623273; 
 Fri, 05 Feb 2021 05:43:43 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id l10sm12298522wro.4.2021.02.05.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:43:42 -0800 (PST)
Date: Fri, 5 Feb 2021 08:43:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
Message-ID: <20210205084018-mutt-send-email-mst@kernel.org>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <20210205083742-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210205083742-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: yan@daynix.com, jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 08:38:49AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 04, 2021 at 10:29:15PM +0200, Yuri Benditovich wrote:
> > Currently virtio-net silently clears features if they are
> > not supported by respective vhost. This may create migration
> > problems in future if vhost features on the source and destination
> > are different. Implement graceful fallback to no-vhost mode
> > when some acked features contradict with vhost. The decision is
> > taken on set_features call and the vhost will be disabled
> > till next reset (or migration).
> > Such fallback is currently enabled only for TAP netdev.
> > 
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> 
> 
> Sounds good, but I don't think we should do this if
> vhostforce=on is set.
> 
> Also, let's document this behaviour with the vhost option so people
> are not suprized.

Here's another thing that bothers me.

At the moment we easily add new features, enabled by default,
as long as kernels are consistent on source and destination
everything works fine.

With this patch first time we add a new feature that kernel
does not support, vhost gets disabled. Given lots of people
update their kernels less frequently than userspace,
lots of users will start running with vhost off all of a sudden.

Don't have good suggestions yet.

-- 
MST


