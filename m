Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9CB6376DD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 11:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy9rU-0004y1-BJ; Thu, 24 Nov 2022 05:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oy9rS-0004xo-2i
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 05:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oy9rQ-0008EY-E0
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 05:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669287218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YeLVPRzw35wUwODBBXM2MnhAWI52z9503YxADgQOZw=;
 b=GRrSxKSZe3QOJ8xhOUQZMfmODzWijGjikfFO7QKNxDS0UaHzkmBhg/8OHQwK3dswtTQpgM
 8nae2/a0yCy5vouv6LzAQ+Vq83A0YdIplTA4rNaQjgJQ88HbGaVtqUjOXB57MbpmupHyyJ
 uouUY9rL+9YGVFeQiYUz5y+5bGyJtYM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-fQYiviavMr2hpBVFNviH6A-1; Thu, 24 Nov 2022 05:53:37 -0500
X-MC-Unique: fQYiviavMr2hpBVFNviH6A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso787106wms.5
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 02:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5YeLVPRzw35wUwODBBXM2MnhAWI52z9503YxADgQOZw=;
 b=WbHyPqoT8gCtojlfq+6I+3j7W1hjn7EDBo39p8klH1MB7okbq/uF4X64w5W0mkO+NA
 jlTUTvn9+qRcdnVQE7Vw+Hs2n4J0nI2ZwWriTycJvYkQVPDgIe92HHOcRpOYeGisjqp0
 v4ngsmGbSzeAyKvpZqup2K/BpoHWWDbH0GLvWJdNPMOdBYSMM7kA5NYk7OsP1G839ylj
 0mpJ2VzjH/stEqIH4fpw78FnynMmjzrxIBW98G1cVmlYzaSdVMKJ2WYNjCk1vurdwgwv
 2OUWYr0oE/+py0tgUqJyDDg7OAj4X/4bAsEdZvGVHOBbLhbn2pKSW8gheW3OmMcV130a
 oeYw==
X-Gm-Message-State: ANoB5pmx2UD5MhhVaRlSrQii41uec2EeZAK+Nrr90nmc1u6lzg4B8EdJ
 V4Q8xZ8HITInx8qj3JCJB+Wh9YxcaySLchuYV0dKnPe/kaxHrZzEtrEyz6HjrqzTas2ibN4pvY0
 2TxFV6/4gvnM3jcg=
X-Received: by 2002:adf:d844:0:b0:241:be45:54eb with SMTP id
 k4-20020adfd844000000b00241be4554ebmr17063196wrl.49.1669287216069; 
 Thu, 24 Nov 2022 02:53:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Dyad6hMA184CnK7H4wW6euH5uxx5J0KfL2EKIZNEk+GIEiT+MmJIp+RiQT/L+Jeata2br1A==
X-Received: by 2002:adf:d844:0:b0:241:be45:54eb with SMTP id
 k4-20020adfd844000000b00241be4554ebmr17063183wrl.49.1669287215791; 
 Thu, 24 Nov 2022 02:53:35 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003c6b9749505sm5683613wmq.30.2022.11.24.02.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:53:35 -0800 (PST)
Date: Thu, 24 Nov 2022 05:53:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Message-ID: <20221124055230-mutt-send-email-mst@kernel.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
 <877czkbtbs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877czkbtbs.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Nov 24, 2022 at 09:21:15AM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Bennée wrote:
> >> 
> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> 
> >> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Bennée wrote:
> >> >> Hi,
> >> >> 
> >> >> This hopefully fixes the problems with VirtIO migration caused by the
> >> >> previous refactoring of virtio_device_started(). That introduced a
> >> >> different order of checking which didn't give the VM state primacy but
> >> >> wasn't noticed as we don't properly exercise VirtIO device migration
> >> >> and caused issues when dev->started wasn't checked in the core code.
> >> >> The introduction of virtio_device_should_start() split the overloaded
> >> >> function up but the broken order still remained. The series finally
> >> >> fixes that by restoring the original semantics but with the cleaned up
> >> >> functions.
> >> >> 
> >> >> I've added more documentation to the various structures involved as
> >> >> well as the functions. There is still some inconsistencies in the
> >> >> VirtIO code between different devices but I think that can be looked
> >> >> at over the 8.0 cycle.
> >> >
> >> >
> >> > Thanks a lot! Did you try this with gitlab CI? A patch similar to your
> >> > 2/2 broke it previously ...
> >> 
> >> Looking into it now - so far hasn't broken locally but I guess there is
> >> something different about the CI.
> >
> >
> > yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
> >
> > Or with QEMU_CI set to 1 and then run fedora container and then
> > clang-system manually.
> 
> I'm having trouble re-creating the failures in CI locally on my boxen. I
> have triggered a bug on s390 but that looks like a pre-existing problem
> with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
> think that is a limitation of the test harness.
> 
> Will keep looking.

Why not just trigger it on gitlab CI - it's very repeatable there?

> >
> >> >
> >> >> Alex Bennée (2):
> >> >>   include/hw: attempt to document VirtIO feature variables
> >> >>   include/hw: VM state takes precedence in virtio_device_should_start
> >> >> 
> >> >>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
> >> >>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
> >> >>  2 files changed, 59 insertions(+), 9 deletions(-)
> >> >> 
> >> >> -- 
> >> >> 2.34.1
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> 
> 
> -- 
> Alex Bennée


