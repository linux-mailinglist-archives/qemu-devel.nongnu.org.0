Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63425620B68
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKCQ-0007UP-6E; Tue, 08 Nov 2022 03:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osKCO-0007U0-2E
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osKC8-0000Ng-TA
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667896974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgOJw41BFyNGUh4MIVog68UXXoZofQfUPnEYq/Fv05k=;
 b=eqyhQsZP/SCf1ItbdG4Ng+XRFDxYlVMzqgX796ZV5+4bmsjZbfgjKqZC7mSECWpyYjZIgj
 Ewq1UWuWo0Vta+TceTfGtfm4gUmw/oM/WyKvxkv3YHyw+Q40JA92FAIdv6A/mhIjqGZOhJ
 In52iGxpdEcW9WRBhhKkal9icG6+R4o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-AURJ7vqnNSSR-b1Tg-WofA-1; Tue, 08 Nov 2022 03:42:53 -0500
X-MC-Unique: AURJ7vqnNSSR-b1Tg-WofA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so3760721wra.23
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BgOJw41BFyNGUh4MIVog68UXXoZofQfUPnEYq/Fv05k=;
 b=dGDsuJ5jpNpu3HgfRjSrOmhVyBDWeszAaV+lW2bJsoub0o96rtrjpODXFh6vatoMy3
 c2Gyu0nTIxzj3cBW+97EO5icxehxayB7F1h2FOkRvR8Pxxbp54DwwEMbGs4GQrnKUg+q
 oPTJh6KnSsSdQT5cXNYcb+wwUHZRTVcKF+lLMrvLAfPcpogBo6de18W9dP2mGluWuwmM
 88yDzUetazP1+GywlyGERoMgHeH5QSSzUgnquSert45HBENARO8kzHOyqkmGGE2+h68N
 3aLH1O906W/niDPbnpEYVvpjcrQSCfmS/djbfQApYqcWAaEk5uLsHYzGAzzN6wyZg9+e
 DJvA==
X-Gm-Message-State: ACrzQf0RHF1j2p7dVhkdGQKMxj/sXjLdy20jfowvdtx9cmZ56yewXFea
 K+HGrpZw/FqhrUzFtj8jD/w8s59x4Z+7lr2XL//jJr+5l4yn6C897T3Ld16IJKNwpopn1szessV
 vRw+k39Jb2nRj67s=
X-Received: by 2002:a05:600c:5408:b0:3cf:7195:4dfb with SMTP id
 he8-20020a05600c540800b003cf71954dfbmr31655399wmb.189.1667896972174; 
 Tue, 08 Nov 2022 00:42:52 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4czWa1RY2iWyz28N96GAuI0L3zfeA07zOR1e4cgm6r2AZIIgEHmYV0d36IcYXPEevwRLiubQ==
X-Received: by 2002:a05:600c:5408:b0:3cf:7195:4dfb with SMTP id
 he8-20020a05600c540800b003cf71954dfbmr31655371wmb.189.1667896971951; 
 Tue, 08 Nov 2022 00:42:51 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 f17-20020a056000129100b002368a6deaf8sm9589886wrx.57.2022.11.08.00.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:42:51 -0800 (PST)
Date: Tue, 8 Nov 2022 09:42:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Jason Wang <jasowang@redhat.com>, stefanha@redhat.com, mst@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 xiehong@huawei.com
Subject: Re: [PATCH v8 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221108084242.ad7aqvhvhpam7vs5@sgarzare-redhat>
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-6-longpeng2@huawei.com>
 <CACGkMEtPpegJ+GbUseq4Y4=Y6De+trDZ5Ks8UqnTcsyVVPvnaw@mail.gmail.com>
 <1f9235a3-237f-aa89-f558-838b3f85caae@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f9235a3-237f-aa89-f558-838b3f85caae@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 11:30:53AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>在 2022/11/8 10:42, Jason Wang 写道:
>>On Tue, Nov 8, 2022 at 8:42 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>>
>>>From: Longpeng <longpeng2@huawei.com>
>>>
>>>Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>---
>>>  docs/system/devices/vhost-vdpa-device.rst | 43 +++++++++++++++++++++++
>>>  1 file changed, 43 insertions(+)
>>>  create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>>>
>>>diff --git a/docs/system/devices/vhost-vdpa-device.rst b/docs/system/devices/vhost-vdpa-device.rst
>>>new file mode 100644
>>>index 0000000000..b758c4fce6
>>>--- /dev/null
>>>+++ b/docs/system/devices/vhost-vdpa-device.rst
>>
>>If the doc is for a general vhost-vDPA device, we'd better have a better name?
>>
>
>How about general-vhost-vdpa-device.rst?
>

I would leave vhost-vdpa as the prefix, how about 
vhost-vdpa-generic-device.rst?

Thanks,
Stefano


