Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC184224F7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:26:13 +0200 (CEST)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiaK-0006Rb-9U
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiUs-000860-Jo
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiUq-0002FJ-AS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633432831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DxNvJPCW0wWRkzK7is2TKN8eqfqYzj6jjWzgoTSkB0=;
 b=O3J0BYrh/6MyaVfuUIqwey05Wno9o4wV0wIYo5hPl+Dg7K8+IoUWXk+oz71QwbFYYmMYZg
 JWgDGlkU60YzTP7uFwK9xiLYYsIc4wtgk8vRUKRL9uAQyfqx4HJoXnX2R8Tdpymo+qrDEH
 yTJW/mJv9z/eX6w4y7JScjJ1SWg4mWc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-VbDaKcMoPQC-3KXezNGPFA-1; Tue, 05 Oct 2021 07:20:26 -0400
X-MC-Unique: VbDaKcMoPQC-3KXezNGPFA-1
Received: by mail-ed1-f70.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso10386310edt.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8DxNvJPCW0wWRkzK7is2TKN8eqfqYzj6jjWzgoTSkB0=;
 b=T3QDc+VIhJD4j7dKFwqw0EJ8k6LDAMCkIsGu4p4eeAwu4rsxG5wamSeGk12tkuxpLh
 oHWkqmlmj4W12TShBI+xZ+G2fPTxFDRV5GQQLGSdcPY8dtMRrmeeo7LeMMUwTd2V9gEw
 uZlyKkt6KmiReaOkxgxN4CEVmt90TwhhS3Ndkzjz0R6CUW+rT6xXPhbB3+Kb0SizAC6c
 LZweQgnCxSYkHTIH0s/tnaN0vklyQabu8zg0IlTZZG92fNdh8iEEzBtuZmYRijPaYwK6
 yP/z5gWoVixw4ryqaZttOctnIQDHYZB8+/4GO6Akd2Gd1ndpVFCEH2UH2cKLfl1UgmQ0
 5SQA==
X-Gm-Message-State: AOAM531Aotba4NJH4iXpC39p2uB87xAIW2FGk3jiBq1299nyOvkZag7p
 9ItUwevh7W5dW1Q0yQ1RKcw9UrP4YB/fL1ft01aiADFcycWWh/SRn9ADxPUy8ivQQxvhBl1n5rh
 esSh50DYNk2EelfI=
X-Received: by 2002:a17:906:3a0a:: with SMTP id
 z10mr12655461eje.111.1633432825654; 
 Tue, 05 Oct 2021 04:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7CkJhv+B6EpESQjJAlERsSi/L6SFxie1MuYGz7XrNTrZeHjtBwjO3hp8O2z35qxUHeEJOQ==
X-Received: by 2002:a17:906:3a0a:: with SMTP id
 z10mr12655428eje.111.1633432825464; 
 Tue, 05 Oct 2021 04:20:25 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id b2sm8650876edv.73.2021.10.05.04.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:20:24 -0700 (PDT)
Date: Tue, 5 Oct 2021 07:20:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005072006-mutt-send-email-mst@kernel.org>
References: <87r1d64dl4.fsf@redhat.com>
 <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com>
 <20211001162213.18d7375e.pasic@linux.ibm.com>
 <87v92g3h9l.fsf@redhat.com>
 <20211002082128-mutt-send-email-mst@kernel.org>
 <20211004042323.730c6a5e.pasic@linux.ibm.com>
 <20211004040937-mutt-send-email-mst@kernel.org>
 <20211005124303.3abf848b.pasic@linux.ibm.com>
 <87lf372084.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87lf372084.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 01:13:31PM +0200, Cornelia Huck wrote:
> On Tue, Oct 05 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Mon, 4 Oct 2021 05:07:13 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> Well we established that we can know. Here's an alternative explanation:
> >
> >
> > I thin we established how this should be in the future, where a transport
> > specific mechanism is used to decide are we operating in legacy mode or
> > in modern mode. But with the current QEMU reality, I don't think so.
> > Namely currently the switch native-endian config -> little endian config
> > happens when the VERSION_1 is negotiated, which may happen whenever
> > the VERSION_1 bit is changed, or only when FEATURES_OK is set
> > (vhost-user).
> >
> > This is consistent with device should detect a legacy driver by checking
> > for VERSION_1, which is what the spec currently says.
> >
> > So for transitional we start out with native-endian config. For modern
> > only the config is always LE.
> >
> > The guest can distinguish between a legacy only device and a modern
> > capable device after the revision negotiation. A legacy device would
> > reject the CCW.
> >
> > But both a transitional device and a modern only device would accept
> > a revision > 0. So the guest does not know for ccw.
> 
> Well, for pci I think the driver knows that it is using either legacy or
> modern, no?
> 
> And for ccw, the driver knows at that point in time which revision it
> negotiated, so it should know that a revision > 0 will use LE (and the
> device will obviously know that as well.)
> 
> Or am I misunderstanding what you're getting at?

Exactly what I'm saying.


