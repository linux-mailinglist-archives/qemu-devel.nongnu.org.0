Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFD6DDD37
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:05:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEcU-0005AB-AE; Tue, 11 Apr 2023 10:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmEcS-00058G-BL
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmEcQ-00068p-TF
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681221910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tt8pABb2a0YTc4ncwPh2RZ0x68oCdVjLSsxrlaDkkHg=;
 b=dMbCcFdmeHoKig8VAe88Ja9lY2wV4T2ByotAQ9a+xWCPi1jCqhZyxiTFMfFb5RY8Vr/ZXU
 giNwO1Kz2NJ//cHNaxA3TTYDLZfh3CMMaY+q4eoO61wXSswZZx77aznEyZBuar56B3bJH8
 zvKQ//xk87W4JzKhtuYOy8cNZit1OPY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-t1ClhwIGO66Q_KP23NxL6w-1; Tue, 11 Apr 2023 10:05:08 -0400
X-MC-Unique: t1ClhwIGO66Q_KP23NxL6w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k24-20020a05600c1c9800b003ef6ed5f645so940134wms.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681221907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tt8pABb2a0YTc4ncwPh2RZ0x68oCdVjLSsxrlaDkkHg=;
 b=NasJiPHa16/gHLPit+1Uypot2JPovhea4fGHz46k9fOqobsTi58wmdr+Xq+IcxMJhk
 0YXjg2OBHDy2hSK2wIm9omb+xJiVaQYaGvj4aoZwTJOF97ZPT6boTGkHoRib5sbj5pnL
 gmmKOEk7C8nDZkC15gLbFIbjcyyCZ2cFOBCrgRQuVebC8sAGrTOtsrQ6Av8veclI2c1Y
 C3LWbY7osWZjlnt22pS9g0XuCiWByvHuOggng2TxQNoPY3GC0szfs1loX2tyXn4/dNxK
 zWoHFHtKAMWFLk+ihELLev5sf4bftC4I3IhuXOW51UAFnoHjZGd4S0YZIHQ7hBhOdpFL
 5CRQ==
X-Gm-Message-State: AAQBX9f7tuvWDZOuF5NeCwAur9BJ9GcnlmEX/587mlO02U2AsvW5vUxr
 bK309byyacl0fdbxoSNcBCvUxvoAY+E+RAXks0YDICQYiB5riSngs1mJJp7hsCnOwtB9pu3E/V0
 VAmJTgA0Q5wOITV1cMSnSDF4=
X-Received: by 2002:a05:600c:21c8:b0:3ed:bc83:3745 with SMTP id
 x8-20020a05600c21c800b003edbc833745mr9199597wmj.25.1681221905406; 
 Tue, 11 Apr 2023 07:05:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgkvLGXiNwDhdodxd9O+SNfZ2yWQPayXyYUZv6TVVz40LIdQzdK/UQQmOGVRfimyZJg4kj0g==
X-Received: by 2002:a05:600c:21c8:b0:3ed:bc83:3745 with SMTP id
 x8-20020a05600c21c800b003edbc833745mr9199568wmj.25.1681221904841; 
 Tue, 11 Apr 2023 07:05:04 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 v5-20020a7bcb45000000b003ef684c5e32sm17054980wmj.48.2023.04.11.07.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:05:04 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:05:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron via <qemu-devel@nongnu.org>, ani@anisinha.ca,
 berrange@redhat.com, Fan Ni <fan.ni@samsung.com>,
 Dave Jiang <dave.jiang@intel.com>
Subject: Re: [RFC PATCH 0/4] hw/i386: Factor out PXB parts of DSDT into an
 SSDT table
Message-ID: <20230411100416-mutt-send-email-mst@kernel.org>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
 <20230406112529.00006533@huawei.com>
 <20230407033509-mutt-send-email-mst@kernel.org>
 <20230411160219.64f0aa2f@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411160219.64f0aa2f@imammedo.users.ipa.redhat.com>
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

On Tue, Apr 11, 2023 at 04:02:19PM +0200, Igor Mammedov wrote:
> PS2:
> Also, I'm working on expanding PCI slots descriptors to PXBs,
> and more or less that will negate this tables split. 

Hmm any ETA?  We can defer this discussion until after that is posted.

-- 
MST


