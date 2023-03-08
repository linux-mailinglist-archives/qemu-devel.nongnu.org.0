Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE66AFC70
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZih6-00046W-GC; Tue, 07 Mar 2023 20:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZih4-000469-Ij
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZih2-0005XN-AN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678239250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4xvnnbH4/c9Y9hiuiROtUYMuUkd9GYWk1R5PAsyYp0=;
 b=UKk6ywR6hqKJfmAd+Rx/XiMbWIT8x4Qlab47OrrCeyX3ZBRK4iU0N5umLJA72B1owRQDAx
 0plSSxLnGm0zXA1/MNO97J/YnTyUFvaNNVu+WJ1DFbqKIxjyIG0XTZPTv8F8dDnasEPPZU
 tGtrjsl9RtWVOpwSfZ574Rm2Dqdia6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-l6vc1ELvPhOR4Mbn3ba_6Q-1; Tue, 07 Mar 2023 20:34:09 -0500
X-MC-Unique: l6vc1ELvPhOR4Mbn3ba_6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so234926wms.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678239248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4xvnnbH4/c9Y9hiuiROtUYMuUkd9GYWk1R5PAsyYp0=;
 b=PR40ISX6quuB6y/CfAQN+67SVP5XpFNN3MfEyzs+2klypbIkZdixG5TYxQqEksSbwD
 7OKQkkcuPAyW0qhwOealkq06GoiF7U/H2ZriBoY3WfhxETFhOnNL/6uItbwX5hSrqMcC
 2w6CB7JveoV6LeUmf3DagsQZlbtm/5mIjvH7VASH06xIgVoqTNhFoPoM+Wshh1tS5rD5
 QnF+okAwAbgIUUREqmUIY11navlAGxaaIxXCavZ7WdpZsifMbKN5mg+o+urEb8VDZNPV
 B4ptEHl+YyShJcxCzS5wKIwk4zHhTCdlbWu5xIXrytktOb/OefLEHy6a6+MwSCgQmtEF
 UfXw==
X-Gm-Message-State: AO0yUKWl91IDsFWS+oKKKENm8u4Rq+9ThXrP64G+qTPAIhn5zMo7uTHB
 J5MK7GoAA87sFiHhUjj51w5OrjZwsJ8tpHFaJ59FF9CiXMbpGW4RFUFwastPvawdLGy+ZVnOBN8
 XYtfBeNhXjc+crro=
X-Received: by 2002:a05:600c:19d4:b0:3eb:2b88:7838 with SMTP id
 u20-20020a05600c19d400b003eb2b887838mr14972750wmq.14.1678239247789; 
 Tue, 07 Mar 2023 17:34:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sKEFelmOoGA64I5/yDoj+8dPF6Dp7yoFjT2RHPQ2cYH4wGV3Kg5DZg+vymhsYmZuJc5v8WA==
X-Received: by 2002:a05:600c:19d4:b0:3eb:2b88:7838 with SMTP id
 u20-20020a05600c19d400b003eb2b887838mr14972728wmq.14.1678239247512; 
 Tue, 07 Mar 2023 17:34:07 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d43c5000000b002c55de1c72bsm13501937wrr.62.2023.03.07.17.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:34:06 -0800 (PST)
Date: Tue, 7 Mar 2023 20:34:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fan Ni <fan.ni@samsung.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH v6 8/8] hw/mem/cxl_type3: Add CXL RAS Error
 Injection Support.
Message-ID: <20230307203336-mutt-send-email-mst@kernel.org>
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-9-Jonathan.Cameron@huawei.com>
 <CGME20230307192642uscas1p15caa7ff372247e96544265fbd031d83e@uscas1p1.samsung.com>
 <20230307192641.GH1489326@bgt-140510-bm03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307192641.GH1489326@bgt-140510-bm03>
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

On Tue, Mar 07, 2023 at 07:26:41PM +0000, Fan Ni wrote:
> > +typedef struct CXLError {
> > +    QTAILQ_ENTRY(CXLError) node;
> > +    int type; /* Error code as per FE definition */
> > +    uint32_t header[32];
> Instead of using 32 here, would it be better to use
> CXL_RAS_ERR_HEADER_NUM?

merged as is, fix on top pls.

-- 
MST


