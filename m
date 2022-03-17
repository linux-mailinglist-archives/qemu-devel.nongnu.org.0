Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29D4DCB7D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:32:33 +0100 (CET)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt3A-00048i-5F
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:32:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUt07-00020O-5h
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUt05-0004Uf-LT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647534560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPAOUP65EtLDYyOF+BjVzFkO3Jc5KifTWhuGlQaj35U=;
 b=hgbYxChdla1d+6f28bsS4mtB5zym7G2vsYCHbCHp2lFyXdxJUqPI02iKJoDOdj0veQC3fR
 2i0VpzGKQcHAziz+VMRssADmJztdGPW6UHH9FMwmynB+LVP9Tj7m7Ew0bEvKNdLnYG4i4v
 6FD8F6N4rr4fIyZJWUPhshGteiHf3+0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-AFcrfJ6VONW5rJaQMiMjug-1; Thu, 17 Mar 2022 12:29:19 -0400
X-MC-Unique: AFcrfJ6VONW5rJaQMiMjug-1
Received: by mail-wr1-f71.google.com with SMTP id
 f18-20020adf9f52000000b00203d86759beso1717017wrg.11
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HPAOUP65EtLDYyOF+BjVzFkO3Jc5KifTWhuGlQaj35U=;
 b=QWd4zR79jbEAfQPuewGDmzhzWziXNb2DQb2HP5jefgz2+bfIENTm9JQiJb9j3RwwM5
 gOzyEfsMfezUg++rPLp+6/bzrADIV+Mza47wQ2G0ZRypdG0kj95zlgqgrqaDxD+GYYvR
 rOkTCJGmQiBjQJz4w/fD1y4ZpB78v2nhu1csWfrMP/x1AjhwdB6WNL85H8hBAhl23YcP
 9vhgl2AHnEhSUs/Ryw8ZbEpsebfKZASEjoQzEpe0+/ViL9mJ3HzgoUZB05dzwCZ9y3DN
 G4QLWhFhHBG5ub/IyDAKuSWlNlAIdxHKxfMBf3r1g4Q4lASEp4MXXSBbutpczgzzbXqb
 Ea7Q==
X-Gm-Message-State: AOAM5316uS3i2dxjYpXGnlV7XW26ee9Xs74QCL8S3fUy2ZOWLdgRtCte
 akxxv2YlRNUvVgY2ZPvOwXFQg3tvVUen9mVokrvMXytyJe82XFTSam0hcHY7bIwGge0Xe7ILyj1
 DvQgTDOmLk0SqnyE=
X-Received: by 2002:adf:d4c8:0:b0:1f0:22df:d67c with SMTP id
 w8-20020adfd4c8000000b001f022dfd67cmr4721909wrk.510.1647534557671; 
 Thu, 17 Mar 2022 09:29:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy75b54dwnbISezfs9ira4Dz44xRcc6fevPUVvZp6ET7+4Qv31yg7tWSRL1jPEGOvrWFZtnRg==
X-Received: by 2002:adf:d4c8:0:b0:1f0:22df:d67c with SMTP id
 w8-20020adfd4c8000000b001f022dfd67cmr4721891wrk.510.1647534557436; 
 Thu, 17 Mar 2022 09:29:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bk19-20020a0560001d9300b001a65e479d20sm4272589wrb.83.2022.03.17.09.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:29:16 -0700 (PDT)
Date: Thu, 17 Mar 2022 16:29:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
Message-ID: <YjNh2jSDpWvLJ1S3@work-vm>
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
 <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
> > I've been looking into converting some vmstate_register() calls to use dc->vmsd,
> > using as a base the docs in docs/devel/migration.rst. This doc mentions that we
> > can either register the vmsd by using vmstate_register() or we can use dc->vmsd
> > for qdev-based devices.
> >
> > When trying to convert this vmstate() call for the qdev alternative (hw/ppc/spapr_drc.c,
> > drc_realize()) I found this:
> >
> >      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
> >                       drc);
> >
> > spapr_drc_index() is an unique identifier for these DRC devices and it's being used
> > as instance_id. It is not clear to me how we can keep using this same instance_id when
> > using the dc->vmsd alternative. By looking a bit into migration files I understood
> > that if dc->vmsd is being used the instance_id is always autogenerated. Is that correct?
> 
> Not entirely. It is the intended common setup, but because changing
> the ID value breaks migration compatibility there is a mechanism
> for saying "my device is special and needs to set the instance ID
> to something else" -- qdev_set_legacy_instance_id().

Yes, this is normally only an issue for 'system' or memory mapped
devices;  for things hung off a bus that has it's own device naming,
then each instance of a device has it's own device due to the bus name
so instance_id's aren't used.  Where you've got a few of the
same device with the same name, and no bus for them to be named by, then
the instance_id is used to uniquify them.

Dave

> > Given that this is a 13 year old comment from Anthony Liguori I wanted to confirm its
> > validity. Is there a long term goal of getting rid of instance_id? Can I ignore its
> > role when converting these calls to dc->vmsd?
> 
> Only if you're prepared to break migration compatibility, I think.
> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


