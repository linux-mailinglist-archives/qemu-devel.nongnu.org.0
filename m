Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8E33EC78
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:13:59 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSFa-0005Xx-LX
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lMSEe-00055p-Tn
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lMSEZ-0007iJ-KA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615972373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHG/7521rY0yyL5GJmvWy1y40DckqnHluMj6zpN4f50=;
 b=jHyRIWjJpKOW7siicN9mXTVLqktLbucsNQmmBxx/1Fa7UsyFlI03/xkv/iCWhRzmrSQkYL
 M15gpws/DOQ23qzHgLKH0HdgX+y2Yjt+oadXryAvz92WvtzMHaxmlTC9YgbLz1Tq2jrN7E
 YYyeBqf0bzOJp5AQADlpBTBI18WCg1k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-rkrhLhlYOL-E6bMIYzActg-1; Wed, 17 Mar 2021 05:12:52 -0400
X-MC-Unique: rkrhLhlYOL-E6bMIYzActg-1
Received: by mail-ej1-f69.google.com with SMTP id en21so14896428ejc.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hHG/7521rY0yyL5GJmvWy1y40DckqnHluMj6zpN4f50=;
 b=SRWcuYLQoxloN57Gz/EubEeiQtid7pzLwD40xOKU3yLnYpCYhixfziN039eJddIS9W
 /yNh+bD+QxZNO1dTNEGKx+Mi7AwuRd6veZAw0/4JRliIGxpcn1ssnsLzlBB6YeZsVqXW
 HKmBJ0PNagGTwCAPMG8uQF7JPu3u145gCcdzJVZsgzUfrghxTsVKp8949QoZMn/QyHmt
 i8RrgeFpDViYjxboVsf59SJfLR/A5T3mblyiZSQ6izsa0KaSaXzLy6db/MKiJctz+exL
 tHF5mkqIgfjd2HcBWgxM4kVL4w1DLiVdr1SB24Bo9XSKP0tyeyl9cZkgF+iqkfCARogf
 ZUfA==
X-Gm-Message-State: AOAM533HTOOU5LTXaOaHl7/CNBW4Um5maOrBS4fF63+QDdmB9nVXh3ef
 Cvf2X1T6DRnb4w0JzplOU3z2AXTXCDT+2yGwdpRlM6xFdKIbskA8ckoiwPLJwz5bvNQRDLA3lVx
 ExhT0OOFaGNvCSfw=
X-Received: by 2002:a17:906:cd05:: with SMTP id
 oz5mr34908030ejb.345.1615972370923; 
 Wed, 17 Mar 2021 02:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxoA5O10jVzDEB6ICdL3UsF+JKtibj1K7K3fHtW/4d6OR3MxMtEQrZEqdoflP2HSvvv7m7AQ==
X-Received: by 2002:a17:906:cd05:: with SMTP id
 oz5mr34908022ejb.345.1615972370774; 
 Wed, 17 Mar 2021 02:12:50 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id bx2sm12076469edb.80.2021.03.17.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:12:50 -0700 (PDT)
Date: Wed, 17 Mar 2021 10:12:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: wangliangzz@126.com
Subject: Re: [PATCH] virtio-pmem: fix virtio_pmem_resp assign problem
Message-ID: <20210317091248.3dndvl7hq23boimx@steredhat>
References: <20210317024145.271212-1-wangliangzz@126.com>
MIME-Version: 1.0
In-Reply-To: <20210317024145.271212-1-wangliangzz@126.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pagupta@redhat.com, mst@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 dan.j.williams@intel.com, Wang Liang <wangliangzz@inspur.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 10:41:45PM -0400, wangliangzz@126.com wrote:
>From: Wang Liang <wangliangzz@inspur.com>
>
>ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
>using virtio_stl_p.
>
>The kernel side driver does not guarantee virtio_pmem_resp to be initialized
>to zero in advance, So sometimes the flush operation will fail.
>
>Signed-off-by: Wang Liang <wangliangzz@inspur.com>
>---
> hw/virtio/virtio-pmem.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


