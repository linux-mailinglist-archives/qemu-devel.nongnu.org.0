Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76204628EB1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik5-0004sf-NK; Mon, 14 Nov 2022 18:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouieq-0002E1-MI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oucSa-0004DQ-9T
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668443843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kx9qo4i7+SQ44WJxdrCr0m34Bz5yVQReSG1yAzwGCuk=;
 b=Rg8yiUki0mQSMo9h50k+9SAzjbkBDF52yVG5yPjnojbyrxZkxojq88eQaU+MGP33QbGqjg
 o9+0rRBvXkg0/cBproFx7vKRofpMcWGv3/19tLvDSF3U6lHWf0L0+C/hKrIdoAaK8Us3Dd
 6dNo7l0s+0RKVtJ6VhZTofm8iHmoQA0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-hfLQkLyQOMSETy5ZGq7MXw-1; Mon, 14 Nov 2022 11:37:21 -0500
X-MC-Unique: hfLQkLyQOMSETy5ZGq7MXw-1
Received: by mail-qk1-f198.google.com with SMTP id
 w13-20020a05620a424d00b006e833c4fb0dso11313476qko.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kx9qo4i7+SQ44WJxdrCr0m34Bz5yVQReSG1yAzwGCuk=;
 b=Nmo5Acp85phVAlsLR1e5Sz7L1YjLvfgKWJ9KA3qS72uaVQdGT0VJ2fwcHgsbRP+j5Y
 k+NXrkAObHIEH/TTzav62MQPvX/jOZ8P/gXLG/81AlQF8xSD/TyHk/JaPJz9yymjlN6E
 bEld72dYBS0QUz8a6YtQzcnFQIcPsltyYdSWsLptH88FOVqrBesAJs2APUJzrEpqKkYr
 cxFlSHpUPplVcG5yga+0/qIjC6aif0JV6UzuAZJswFsF+ARWcDvd6msivfrQ5g89Faqc
 o5PUiF19yzvDaUvPELReRh2YxQvAnMhVUBQ7ZQpgLN+32oNhlX6tto0NK3Mo2kW+upTK
 z7mQ==
X-Gm-Message-State: ANoB5pnL27pQbFldQukMcjjbGXyENluY0ML1kq2KNisAI8PwEe3kc+NR
 8dC3LYuJbh794jjPiooxXrW0XfRmK5E/TrTW2NaL3gh2uBbbROKzOI3+PFqKlxacW45Wt5U2xQs
 bldtivjF/sxmh8QM=
X-Received: by 2002:a37:aec3:0:b0:6fa:2ff9:e9ca with SMTP id
 x186-20020a37aec3000000b006fa2ff9e9camr12054375qke.29.1668443841309; 
 Mon, 14 Nov 2022 08:37:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67F7JFxZvxrsoeBAE3w+RfnhcUF4ZOxFI6+30dKfUOyY6GqjFwEOm5U4qcjihaUuC2WGvfVA==
X-Received: by 2002:a37:aec3:0:b0:6fa:2ff9:e9ca with SMTP id
 x186-20020a37aec3000000b006fa2ff9e9camr12054346qke.29.1668443841056; 
 Mon, 14 Nov 2022 08:37:21 -0800 (PST)
Received: from redhat.com ([37.19.196.93]) by smtp.gmail.com with ESMTPSA id
 n81-20020a374054000000b006cf38fd659asm6641072qka.103.2022.11.14.08.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 08:37:20 -0800 (PST)
Date: Mon, 14 Nov 2022 11:37:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221114113518-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
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

On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
> Am 08.11.22 um 10:23 schrieb Alex Bennée:
> > The previous fix to virtio_device_started revealed a problem in its
> > use by both the core and the device code. The core code should be able
> > to handle the device "starting" while the VM isn't running to handle
> > the restoration of migration state. To solve this dual use introduce a
> > new helper for use by the vhost-user backends who all use it to feed a
> > should_start variable.
> > 
> > We can also pick up a change vhost_user_blk_set_status while we are at
> > it which follows the same pattern.
> > 
> > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> 
> Hmmm, is this
> commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> Author:     Alex Bennée <alex.bennee@linaro.org>
> AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> Commit:     Michael S. Tsirkin <mst@redhat.com>
> CommitDate: Mon Nov 7 14:08:18 2022 -0500
> 
>     hw/virtio: introduce virtio_device_should_start
> 
> and older version?

This is what got merged:
https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
This patch was sent after I merged the RFC.
I think the only difference is the commit log but I might be missing
something.

> This does not seem to fix the regression that I have reported.

This was applied on top of 9f6bcfd99f which IIUC does, right?


-- 
MST


