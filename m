Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92B2CBA87
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:27:50 +0100 (CET)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPMT-0001ou-Gf
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOya-0006L0-On
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOyX-0006XC-K8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606903384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/WPuuZk3/erDBY0z1XJeDrk9p2q7xgo6xiXzKnFb24=;
 b=FnK/kFBPOyY3Oxe44Yw2HIxX8HBpjwwxjco88g6kYSpuaTsld3uLT8fXsNVPbjdM8Mts/b
 eCHY4jySLp9o/dOXbQ48jAm0VzdwA/KL8GLWbij4bnuPu5UwVe5zdEeVruywW2cq8ej9wx
 uMq7c4mxNqQZPFfW7oslzbx3qKXlcxU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-k6RiJWW6N4y2NDBW61A4hg-1; Wed, 02 Dec 2020 05:03:03 -0500
X-MC-Unique: k6RiJWW6N4y2NDBW61A4hg-1
Received: by mail-wr1-f72.google.com with SMTP id p18so2882260wro.9
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t/WPuuZk3/erDBY0z1XJeDrk9p2q7xgo6xiXzKnFb24=;
 b=TTNTT8URmGtPh94YcHY1AG0I4FhvR5+HNLqypdPRFGhmG+t1gBOICCF83qLj681SRA
 dcoWHeK34f5OeQdYkxfOODcAkiNP+mjXscyNI9SrfByXcxqrWb3E4Ll3i/nbMthnQMlS
 zLOpgevekRVOQiVEoMF+HG/N0sPLq27qHq4txwZBcOPogp6Wvxvykfrn+G/B4Y0u4zqL
 IZNjlgRsuBuvFSV/pEigh9pDDuyAOH1UirZjVOxmbOXSKMAouHQQS1AThxGvG02yj2dz
 fAeSZRLhnK0nvgHnBjI7GO+GZPZjnvEIa2qO+cwX/GhxXhHm4Dir6B1vaLHK1cZUby68
 YPlA==
X-Gm-Message-State: AOAM531cl9W9NMX2p9SXHENno4v+cJ+6umVYKTBQ61xvuxxm7lRtrSID
 t4KSPhale9dbGE5/OJwynhlZzVzGcRKCKD8kY/fF77WLFFlF/wAES+dd9Ct3IQlgNO13/HkKapa
 hYuzyEvo5Okhwqb0=
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr2206624wmg.37.1606903380643; 
 Wed, 02 Dec 2020 02:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBS+XKMNcGyPsfQSqIXaiyj/JEpAxv+dQl1la+98Czqx0kx4XUGcDAwpoRVPM8oXKG/2PmBw==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr2206611wmg.37.1606903380529; 
 Wed, 02 Dec 2020 02:03:00 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u85sm1333701wmu.43.2020.12.02.02.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:02:59 -0800 (PST)
Date: Wed, 2 Dec 2020 05:02:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
Message-ID: <20201202050205-mutt-send-email-mst@kernel.org>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
 <20201125145659.00004b3e@Huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201125145659.00004b3e@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 02:56:59PM +0000, Jonathan Cameron wrote:
> Cool.  I'll run a few more comprehensive tests then send out the
> trivial patch to enable the kernel option + v2 of the qemu support.

IIUC there will be another version of this patch, right?

-- 
MST


