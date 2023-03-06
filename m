Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF106AD0F0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIqE-0000Er-M9; Mon, 06 Mar 2023 16:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZIqD-0000Do-76
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZIqB-0005pc-Qv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678139874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eLojvR1hlOckBZP07RQrQxEj6o/zI8InLDqt1gjySZ8=;
 b=hS7My3NozROcX4SDhaAz8pydeBb/SEpoQv1TR42Nkd0yqgXg8Rk8Xnf5siXZ0xyyTcTEWE
 98nECJy1Fu5W/gojShBISRGF87z/g4gH0iHgtSDjRmXn30jZ25K980HNY14QZhJjRD3k14
 cf3kj9o8nQIZxZ/Invdk+qFE5nXr3Ak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-tDe8XeQGMem2G9Oisr5SIg-1; Mon, 06 Mar 2023 16:57:53 -0500
X-MC-Unique: tDe8XeQGMem2G9Oisr5SIg-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so7312080wme.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678139872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLojvR1hlOckBZP07RQrQxEj6o/zI8InLDqt1gjySZ8=;
 b=krbOU9y3sglXR4OBX4lmxdz0t9JXrRlz4Ka2ExKwTQQP29yHAWHqED6AOg5W4FhQXT
 xTfXF65HqzaAAUUsK2Yc/y7HWZWt6ygTWYHOGoBPXN1JeZnl9uEs1oVicoXvO+AB1k2r
 2/n4umebtjKa+SNlbZl6JsVWM+9NY68Ytm7zOR+k6nh9mVJZv0jogkZTmZnG5mRAdapB
 7aDMKcDKgmmHZBdoCxzupG2yBJqerFUKUt3sAdbJjUlxjGqM0suAGHn5nHfo26+SJPpS
 57gMNJnxun/hGPDNq75vO8nVPo9R4U5oNPElDjBVEefuZYDdYe3ShQyDtgJrlTKtWTNN
 bPcA==
X-Gm-Message-State: AO0yUKUN5j5ngRgpMimnl9ybelcXxd4JyytGxX9f1I9dx/p9v/gF6vLj
 gr0LCg0GBxo2l1xwc5RvsoBcjZocqMsStMFsFXK7jEFVLfF0fdBgmMp/glzYkKuHgqQ8U4MGfEz
 ylfGKGl3Rwxb/3B4=
X-Received: by 2002:a5d:4569:0:b0:2c7:6a6c:c71e with SMTP id
 a9-20020a5d4569000000b002c76a6cc71emr8396721wrc.70.1678139872331; 
 Mon, 06 Mar 2023 13:57:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8p3a3/3dcqjwsFFFE6TZUOMkcEK9VGUcMyANC0GcKp6I5oTKstkY9n3pxkoBRjije4CVEIgg==
X-Received: by 2002:a5d:4569:0:b0:2c7:6a6c:c71e with SMTP id
 a9-20020a5d4569000000b002c76a6cc71emr8396710wrc.70.1678139871985; 
 Mon, 06 Mar 2023 13:57:51 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 m14-20020adffe4e000000b002c54c8e70b1sm11129334wrs.9.2023.03.06.13.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:57:51 -0800 (PST)
Date: Mon, 6 Mar 2023 16:57:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH v6 0/8] hw/cxl: RAS error emulation and injection
Message-ID: <20230306165630-mutt-send-email-mst@kernel.org>
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
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

On Thu, Mar 02, 2023 at 01:37:01PM +0000, Jonathan Cameron wrote:
> Resending to expand CC list. Looking in particular for review of the QAPI
> part of patch 8.

Given QAPI has to be maintained for a long time,
I guess it'll have to wait until next release unless
someone acks it ASAP.

-- 
MST


