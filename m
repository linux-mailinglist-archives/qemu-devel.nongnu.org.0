Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E63EF027
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:27:47 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1wI-0005SO-Bz
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mG1uu-0004PI-30
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mG1up-0006Em-G2
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629217571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVyMXP24DkoFfP5nuau/ExHViTuKUYXAE6uKf3wDqZw=;
 b=egoXpHO3xxT8E/Z/rLjT/90mNmT8UKLsd08VaHP3V7WhcGCvl3iW60DzF1viwPrWnUdnLD
 BlokZGyxPX+dhY4cZIQxnjMuPUWI37wRJfkX+yRWv/qqtd+a5hkyAx4EFhEaSFCnCfh2Mh
 DhdGzPacVxCVqbHL6/W7MdswwDTSUW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-vcKXQCScOLWbukNIWrTyYw-1; Tue, 17 Aug 2021 12:26:10 -0400
X-MC-Unique: vcKXQCScOLWbukNIWrTyYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso750641wro.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PVyMXP24DkoFfP5nuau/ExHViTuKUYXAE6uKf3wDqZw=;
 b=eryZdXzbRkNHRT3O0sAWvO1We3RdrXQo8gXjo+QbDx9kiPvIOCAxrJlAthAEfAL3m3
 d55cQABa2OpIX2712fTlfv58BIa3PDVe9LGtCbaHTHa3fUMy6jxtMUxydTa/ppdsjO86
 FOJc72NBPs4TTYoiVKXqifYwu5dFtNZJHTPjdEDruRD1cv2e8Zj0N9T3JG2u+PS44nAp
 y57j37G/+n50h25jyU/sukem5bNVStSxPaY773vwEFWdLjTyBw4BMQ815i0v58NCd3Lw
 GBKTrG+73Ez9/x1ewaIDzz+iZbXQ2VoA1Ii2olOBGOf10b/7y4asRPLrMv3+0ai0qKFI
 z6xg==
X-Gm-Message-State: AOAM533BfnNZOVU1UfG1hLqOSUxhIZ936Xd+NqoJma/kq6fViKnsJeJq
 a28+lxvjpOKPDRxQzU6c3m+suv0LznteajOuhVKWYfI/TdEV1DGz086f5V1DvPQmw8rrFqH+i2D
 KFSIxEs4KkJ+ljq4=
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr4280883wms.84.1629217568906; 
 Tue, 17 Aug 2021 09:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNp8PsRCDKt8UuZG7t9EjVGzbkvap3TkXhAYYvyrT4ppHKpRLqC7xT7DXfh6fG0B/w73LRIg==
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr4280866wms.84.1629217568722; 
 Tue, 17 Aug 2021 09:26:08 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r4sm2435737wmq.34.2021.08.17.09.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 09:26:07 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:26:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gabriel Southern <gsouther@qti.qualcomm.com>
Subject: Re: Using loadvm with snapshot
Message-ID: <YRvjHiZmPkSuv//z@work-vm>
References: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gabriel Southern (gsouther@qti.qualcomm.com) wrote:
> Hi,
> 
> Are there plans to support using -loadvm with -snapshot?
> 
> I saw some past discussion on mailing list including bug that was closed earlier this year but no recent activity:
> 
> https://lore.kernel.org/qemu-devel/162424905685.11837.7303570061857383641.malone@loganberry.canonical.com/
> 
> Testing with latest qemu it looks like -loadvm still does not work when combined with -snapshot.
> 
> I'm curious how complex it would be to implement this feature and if it may show up on QEMU roadmap in the future. Or if there is alterative command that can be used to save the state of a running VM and then use the same qcow to run multiple QEMU instances loading this VM state running in snapshot mode.

One thing that might work for you is migrate to a file;

 (qemu)  migrate_set_parameter max-bandwidth 100G
 (qemu) migrate "exec:cat > myfile.mig"
 (qemu) q


qemu -incoming "exec:cat myfile.mig"

Dave
> 
> Thanks,
> 
> -Gabriel
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


