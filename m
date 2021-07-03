Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138C3BA983
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:35:34 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzic9-0000ga-I8
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziZM-0005hC-21
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lziZK-0002pQ-No
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625329958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REGg3QMBdAmIXQp30o/vSn3UkaOQ5OIQAj9pUEbHsp0=;
 b=gMtCXflNZBLlvvJ0FUTYxcYEcAMeyKPqrRBzWpVVdub4CVOOFYSnSemhczCi6BQV55gSNM
 DgvozegfU4kiSW7ggOBMM2Abd49kP6vgvdx24Vtcj8/yc7nJ4TGkja888uQ5ZmHyNV9yjL
 8h0wekaSNdvZJ7SaYGEGgKSJ64K7hiY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-MwdDnIaZN0-1s-mYRh7BMQ-1; Sat, 03 Jul 2021 12:32:35 -0400
X-MC-Unique: MwdDnIaZN0-1s-mYRh7BMQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 da21-20020a0564021775b02903997f7760a6so444014edb.10
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=REGg3QMBdAmIXQp30o/vSn3UkaOQ5OIQAj9pUEbHsp0=;
 b=JEYrTuv4TMVT3hLvYTyb/3HGdd8cUPv/M4Cm66Kc6qfoK63VLqkxbzO1i4ECeicSF0
 Q6Z9i+B8Axz7RSa1ZsWVTMDz/Q2f0Yworoj+ZTnt9ZmKSsEwAKQnK+hLYbtYW18iVFml
 hdg8lCTbDugThu8ROwJqjOjCeFnZKNTzPrr6SkU7A0onOmN5NgkvhdNhvqS5N10sus7z
 Ls5bmDRLLRRlklnbCbKL8tiz+rqyVFu+4iqr9bWj5pe7FQM7qdFUy4Wgl9K9Oc1/8Sam
 EXt7P4JxwAn0LTlUznnbn6h0ZVB0rxUv9+M9mzN4Qz6e6IRqKT5AjuT8Jp530JKALjye
 mvYA==
X-Gm-Message-State: AOAM530j3BgRli9jenkEKNwZc75prRJk+3bDxCRz1au+Bmc/6NyIjKyT
 PX3tSPKmL+DHFbowprbMqD+rIyIDZ3Ejf60qbN4p3ZD7XQxzmylRDO0fkzC89XKc9hl0Rh+Hp+y
 DWC+zvWJkrR1caRc=
X-Received: by 2002:a17:906:5d05:: with SMTP id
 g5mr5074026ejt.201.1625329954054; 
 Sat, 03 Jul 2021 09:32:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBAl68k+9ANOIhNDVoEJ4f/AMtEPqvw++/mUI68w47uzbYXtOENKvCHmGN3FwO3y9PLmcoYA==
X-Received: by 2002:a17:906:5d05:: with SMTP id
 g5mr5073993ejt.201.1625329953704; 
 Sat, 03 Jul 2021 09:32:33 -0700 (PDT)
Received: from redhat.com ([77.126.110.253])
 by smtp.gmail.com with ESMTPSA id p26sm2274255ejn.106.2021.07.03.09.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 09:32:33 -0700 (PDT)
Date: Sat, 3 Jul 2021 12:32:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v7 2/5] virtio-iommu: Implement RESV_MEM probe request
Message-ID: <20210703123153-mutt-send-email-mst@kernel.org>
References: <20200629070404.10969-1-eric.auger@redhat.com>
 <20200629070404.10969-3-eric.auger@redhat.com>
 <20210703123113-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210703123113-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pls ignore, my mail is acting up serving me old patches.
Sorry about the noise!

-- 
MST


