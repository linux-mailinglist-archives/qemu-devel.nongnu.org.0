Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDF63638E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxreO-0000JB-Ib; Wed, 23 Nov 2022 10:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxreL-0000Hd-Vw
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxreI-00082e-F3
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669217213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yu5FHBqQ4oIJs0Gdn8h2BnF2QgMMKhAU7vDCRSeEZVo=;
 b=btfhvsA9hrX14GU/kawHUUJD8IEk6Dp5azbf/BAIPjnkrCexLLDTuT12/EniNO/d4ENhg9
 CqLfj6VNS1pbrIBQ75W/nVeLs90v9o5FMcIAcbQjISnGh0rD275Yb9J1K/GY1vtskXXrDw
 nddnjG1DOkcUCgjUoxI4NWDaND/2IPM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-TQA1oEIiOrWCNGd7ctstUQ-1; Wed, 23 Nov 2022 10:26:51 -0500
X-MC-Unique: TQA1oEIiOrWCNGd7ctstUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k7-20020adfc707000000b002416f2e9ad5so5105379wrg.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu5FHBqQ4oIJs0Gdn8h2BnF2QgMMKhAU7vDCRSeEZVo=;
 b=n2dG1MPv7U5oWpxbsIW1nJtbm+mCoOJEY/kD93cgLAQC32nUeUpim0nOPvO9AYmhtP
 z7Acfzzvte4cqn5YHzFvIJUOWmfSrWktZdc1X4E7l4CtzwE5H7QQONcfvZoLGtAis7wi
 zfCA1y7csUby55aJGIET9lRj99cIFnFLlFL/ZZEHc6scPH1qYmwgW8QEh9o0Zx3XPBG0
 dmURrP24gB/lt+26bvNk/vvQI61tiCb1PJHfyJ3v4eVh3WxJtMBxXtvMaUqX1+C6VSOl
 60zoI4A/+GfBch75Rvuq4uOX2GbdqEzEHf+srypMLBAMTBrSdhY2iGwpiJLeh0aigNne
 MykA==
X-Gm-Message-State: ANoB5pnuFChOJFm5FOHf+frpPJT3GzRT2K4PCGnYeVLjSt8mbO+Dqaxi
 yTFA9x/h+M3L7uRsiuzPaXuLhd4UN7J/KSXOhwh7L9BOZhyk5pRZQNpWzF6SXfCx77IiXyVeD0/
 NATbw2eOmhl7jzQw=
X-Received: by 2002:a05:6000:156e:b0:241:cbe9:78a9 with SMTP id
 14-20020a056000156e00b00241cbe978a9mr11527934wrz.529.1669217210446; 
 Wed, 23 Nov 2022 07:26:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JjkpKXbO4JtNRYGqywpVQ3+qSAMiyJw3qE0mGOH4vHb8PAykqYFp/uWw80No2r4cttz2r5g==
X-Received: by 2002:a05:6000:156e:b0:241:cbe9:78a9 with SMTP id
 14-20020a056000156e00b00241cbe978a9mr11527918wrz.529.1669217210170; 
 Wed, 23 Nov 2022 07:26:50 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 bo22-20020a056000069600b0023659925b2asm17498602wrb.51.2022.11.23.07.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:26:49 -0800 (PST)
Date: Wed, 23 Nov 2022 10:26:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Message-ID: <20221123102522-mutt-send-email-mst@kernel.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123152134.179929-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Bennée wrote:
> Hi,
> 
> This hopefully fixes the problems with VirtIO migration caused by the
> previous refactoring of virtio_device_started(). That introduced a
> different order of checking which didn't give the VM state primacy but
> wasn't noticed as we don't properly exercise VirtIO device migration
> and caused issues when dev->started wasn't checked in the core code.
> The introduction of virtio_device_should_start() split the overloaded
> function up but the broken order still remained. The series finally
> fixes that by restoring the original semantics but with the cleaned up
> functions.
> 
> I've added more documentation to the various structures involved as
> well as the functions. There is still some inconsistencies in the
> VirtIO code between different devices but I think that can be looked
> at over the 8.0 cycle.


Thanks a lot! Did you try this with gitlab CI? A patch similar to your
2/2 broke it previously ...

> Alex Bennée (2):
>   include/hw: attempt to document VirtIO feature variables
>   include/hw: VM state takes precedence in virtio_device_should_start
> 
>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
>  2 files changed, 59 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1


