Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AD58A85F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:58:06 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJt9h-0001zg-Jb
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJt6w-0005pS-HJ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJt6r-0002oJ-RS
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659689708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JqZtzel4epcRA/c/b0QmSid4wrnTrEuIOgA6nZ0USxo=;
 b=Nkj2C3lch/JWCnxREXtfTb7hq6taKFqfjIyHSCvpQyE5BLtZsPn8++viBJEmuKOAAnEkhc
 3BFeWy+s+HIWZAAVueLhCeIeg74cBKSz2V/kt/CDEQjswzmU0L9l9/iumzXSHee2QMN+zH
 0KGEwFmqcaxNKh44RzQD6v/WAqX3EBU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-qQNrdJsgOKCKyvqDlD2eXQ-1; Fri, 05 Aug 2022 04:55:07 -0400
X-MC-Unique: qQNrdJsgOKCKyvqDlD2eXQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z3-20020a056402274300b0043d4da3b4b5so1201797edd.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=JqZtzel4epcRA/c/b0QmSid4wrnTrEuIOgA6nZ0USxo=;
 b=IJ/+CEtfJsGbZDaczabjp4GkCLCGcxwzABce03czyUPa2kDnyUu5m0d1ATKEQeSBDG
 zRfBdHsQUuHxFr2QHjbgA+97PVLBBd1/1jEy8vOnp8mlzvKlIhdcEbe9iPEf6arL9mXk
 +Y18/rVKMO/4X7tQ2zxjNvFTtMCotQvH9KgLptPX2JgHLDkBUdNF2Q3wldbi+flmdqRI
 yRaAJ2T1eGqY05U3Zbo1lfyN2URHAfC+q77cu2BQ5gHfRNKpq9QV0f5+tviJPvzv/B+M
 o4BCcP3WBMyFTJspa56MnU3rNnMDwWtHxPWF9oApn8KD9wRDKF2X9CIG0E7G28o11TuS
 Lwzw==
X-Gm-Message-State: ACgBeo2E10esHPlTIZTTdMl2dyERkbflJcxkE66s9sq842E/cMD/+j6/
 /PuZIVQn3kOEy+pZ/A2xXmMxnP8ptSGC0T1gR5Jp3tT7tHIUNPyVFvkQJKq4eh7nCgRM18zB4Lc
 wi8QyMLfCdKdY4PE=
X-Received: by 2002:a05:6402:189:b0:437:8a8a:d08a with SMTP id
 r9-20020a056402018900b004378a8ad08amr5609753edv.241.1659689706257; 
 Fri, 05 Aug 2022 01:55:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7eDSnJaLNzaYdMYyoMRx2TQnjPcOqh06rgfkXgb81KfH8gYIb8VwIKiuAzrMPahTiGfR2Ulg==
X-Received: by 2002:a05:6402:189:b0:437:8a8a:d08a with SMTP id
 r9-20020a056402018900b004378a8ad08amr5609741edv.241.1659689706012; 
 Fri, 05 Aug 2022 01:55:06 -0700 (PDT)
Received: from redhat.com ([2.52.137.185]) by smtp.gmail.com with ESMTPSA id
 v9-20020aa7cd49000000b0043d2424aeefsm1763503edw.87.2022.08.05.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 01:55:05 -0700 (PDT)
Date: Fri, 5 Aug 2022 04:55:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Message-ID: <20220805044052-mutt-send-email-mst@kernel.org>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 09:21:07AM +0200, Thomas Huth wrote:
> On 02/08/2022 12.00, Zhang, Chen wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Qemu-devel <qemu-devel-
> > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jagannathan
> > > Raman
> > > Sent: Tuesday, August 2, 2022 9:24 AM
> > > To: qemu-devel@nongnu.org
> > > Cc: stefanha@gmail.com; berrange@redhat.com
> > > Subject: [PATCH 0/1] Update vfio-user module to the latest
> > > 
> > > Hi,
> > > 
> > > This patch updates the libvfio-user submodule to the latest.
> > 
> > Just a rough idea, why not depends on linux distribution for the libvfio-user.so?
> > It looks no libvfio-user packet in distribution's repo.
> > 
> > Hi Thomas/Daniel:
> > 
> > For the RFC QEMU user space eBPF support,
> > https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
> > Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?
> 
> Fair comment. I never noticed them before, but why do we have those
> submodules in the subprojects/ folder (libvduse, libvfio-user and
> libvhost-user)?

I don't think they are submodules are they?

> ... I don't think it's the job of QEMU to ship libraries
> that a user might want to use for a certain feature, so could we please
> remove those submodules again?

Why not?  Fundamentally I don't see why would libvhost-user be less
important to users than e.g. qemu-img or qemu-bridge-helper. There's no
rule saying we can only ship a single binary.

> If someone wants to use this, they can
> compile the libraries on their own or help their favorite distribution to
> ship them as packages.
> 
>  Thomas

I can speak for libvhost-user at least, the main reason is simple - QEMU
uses it - to be more precise, QEMU tests use it ATM, but there are also
ideas to implement the device side of virtio inside a VM and that will
use it more directly.  Same developers are working on both qemu and
libvhost-user parts.  So I don't think there is much interest in first
splitting it out then jumping through hoops to get it back.

But there are more reasons - for example, if an application
links against libvhost-user, then it's a good idea
to update libvhost-user and qemu together - they have
been tested together and are known to work well.

I suspect the same applies to other probjects in this area
but I'm not sure.

-- 
MST


