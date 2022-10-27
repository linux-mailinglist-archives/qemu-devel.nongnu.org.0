Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0EE60EFC9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:03:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvvZ-0006xU-Oz; Thu, 27 Oct 2022 01:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onvvR-0006dJ-MV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onvvQ-0005SO-9e
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666850370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=tLi7/cHa0QxH2Bbd2oDLD+dZ0J6j7LE9gCV5PY9v6vM=;
 b=LG4G+aRh2IQ88KFkFsJEFY9cpb3WKkCaVW3uPMyp5COsrs/7hKNIL9A2TNI6B7xKY6WKwO
 97bP2QHhfxmDhvnvqM9ZWmkN0QBeFon5/YiGbjz9Mzc1yoTTyGARRC4772gtacrXiYGImw
 kEiPQC2ye4Tw/K/NPKkZu7dYgz/F/qs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-8yRwCemQNmC62ng3RerXGg-1; Thu, 27 Oct 2022 01:59:28 -0400
X-MC-Unique: 8yRwCemQNmC62ng3RerXGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b003cf4d3b6644so205745wmc.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 22:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLi7/cHa0QxH2Bbd2oDLD+dZ0J6j7LE9gCV5PY9v6vM=;
 b=HCydp+X5OjAesezgp7CMij+HeGJ/B4x7uxpOdfCC051uuohLtc/QCWOAHdcosK6aBf
 gursXx0+Zd86m9Q/Z7KSAsL9Dwc6osfj4pymlyGhiFYWM/faZqnC0Xk0sFYSJFR4w+Lr
 Ny5lwhOVHF31278IOOiqNp6hB9bP99Qn26MqWh0oVx4amUNw2kOOPshSUbRtud5+LuiH
 owVD5AAY2xVSF/jELJZvyNt9YzIj1z43XvbDCRakWttBlYI3ZuZ+M4gh5aprlIz6e+1M
 7VdwrOtARAabwA8SUV73SPHWBFF4fWiY+cizuXBFp+iSgi361s2Fe7DpHO5nFSlgdEwx
 hzJA==
X-Gm-Message-State: ACrzQf36IT5+D/mZBlybMaMUvDtl24FRHbGLgqi1yfl9BbS3Sk06riwM
 IxsYrn3Pe0smFptpiaMoINSi507AtldILFut2aw+8bksKatENoSeoUewN9mZ9suVHIAwTQrfFpa
 xEfhkRZQX+QrHbsc=
X-Received: by 2002:a05:600c:4f54:b0:3c6:edec:2787 with SMTP id
 m20-20020a05600c4f5400b003c6edec2787mr4687167wmq.109.1666850366832; 
 Wed, 26 Oct 2022 22:59:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5MlXQ/IS81WRMSwoLQehdRNVyBoOoEI0LKkCVNPHASm4MxDeqar3uP83FB8GPOhFmQbUDD0Q==
X-Received: by 2002:a05:600c:4f54:b0:3c6:edec:2787 with SMTP id
 m20-20020a05600c4f5400b003c6edec2787mr4687156wmq.109.1666850366565; 
 Wed, 26 Oct 2022 22:59:26 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003c6deb5c1edsm450935wmc.45.2022.10.26.22.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:59:26 -0700 (PDT)
Date: Thu, 27 Oct 2022 01:59:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: type mismatch in SSDT
Message-ID: <20221027015833-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just noticed this when disassembling:

Parsing completed
ACPI Warning: NsLookup: Type mismatch on ODAT (RegionField), searching for (Buffer) (20210604/nsaccess-760)
Disassembly completed
ASL Output:    /tmp/old-asl2/tests/data/acpi/virt/SSDT.memhp.dsl - 14945 bytes

Did not look into this yet but it seems new.

-- 
MST


