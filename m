Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D147D13A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:45:51 +0100 (CET)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0046-0007C0-Bq
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzzxd-00015F-R7
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzzxc-0007d5-7G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640173147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogFUcmEzS6zzMopBGilCGUk71S98Jp9E6vfXnrikE+E=;
 b=c8P4Dk4bfLP5XQf3jmHg26LPExfjRDpbcJYdeAd8kWAZ5Uo6hsMz4tyWJ+YzGODy6GtU+C
 R7m/yzzPk2DGwHylBpFn5IApai5OeAnawqw7XE4yAddOrV1DRUjMs4QMMGIEjjOxX8wnvP
 WgZWSuv+rdfco6+gWLkKRuKFZB7+W/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457--9GozFg9PBi8a9zfvrQlaQ-1; Wed, 22 Dec 2021 06:39:06 -0500
X-MC-Unique: -9GozFg9PBi8a9zfvrQlaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso618233wmq.6
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 03:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ogFUcmEzS6zzMopBGilCGUk71S98Jp9E6vfXnrikE+E=;
 b=vyRvX1+HjPdMCAXe95dvsE5JFZkZJE1AZDT7qV1E8Uwn9x7uQ0R+BGhEZGvL+3ky10
 X5sBh6TBJGBZn8N588cEGOOAV3nsJGHD/6b00BHNAlxSh+2eSzjUMBb0/WTcnyEULSLn
 h3Epr5s54AgapMoXbe//vAtSki2zL3VGAr0AbxINE7qSVyFtPAgZT1TVRtO7sUIpnxYp
 XyGXtnR8zM0fewD23OQooLuiZg5Egb2Z107Ir66+AK2Y71/04uQKSu+jNScn8DSw9IXR
 jqIU7N7CU/j17vbjj7+id1apxXcV7uSPfVhz26gKlEieqJY9EEDkS0CitanlzPDLg0Yx
 7bMQ==
X-Gm-Message-State: AOAM532pHX0h3NX9L6iBgak07Iz1x+bEkzXr4EKe7QbcOTJwtf2aEvv0
 yqhkLZXb5XZDwGTFP9oJTqxeRckRRypG9X5MOrWBl4D1sF0gPit12WJ/PQhhImBP/OsQmYt12bl
 OVUlGdhlzpbQFhRI=
X-Received: by 2002:adf:ec46:: with SMTP id w6mr1861876wrn.288.1640173142692; 
 Wed, 22 Dec 2021 03:39:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiGdiwrpGSPtQcZsBZUAkoIYKjCP9uE1fFTs/Yy+Z11yrr0ac4MQBuD6PARbIy9IRR/UfXWQ==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr1861865wrn.288.1640173142441; 
 Wed, 22 Dec 2021 03:39:02 -0800 (PST)
Received: from xz-m1.local ([64.64.123.18])
 by smtp.gmail.com with ESMTPSA id r11sm2113206wrz.78.2021.12.22.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:39:01 -0800 (PST)
Date: Wed, 22 Dec 2021 19:38:56 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: correctly check passthrough during
 translation
Message-ID: <YcMOUPyF/u1R6OCP@xz-m1.local>
References: <20211222063956.2871-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211222063956.2871-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 02:39:56PM +0800, Jason Wang wrote:
> When scsalable mode is enabled, the passthrough more is not determined
> by the context entry but PASID entry, so switch to use the logic of
> vtd_dev_pt_enabled() to determine the passthrough mode in
> vtd_do_iommu_translate().
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


