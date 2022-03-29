Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280964EB099
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:30:00 +0200 (CEST)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDnD-0005I1-5S
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:29:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZDlW-0004SM-Bk
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZDlU-0008OE-PQ
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648567692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qy1Fd54YyP4FK4ZFWbi30jtkVTD98I09auNxMQdOja8=;
 b=EGRlrVJ8Ekzp03KL48X4u/R288rGZ8soE6LYyWBBHljlFmj3qa5AalYApke4JKEzVRTkd/
 AtECxkzeaqHPa5ReM+0dRUXw1sVDxfF2Iq/qpWbwX3RSLcfnoHpmX7+A4k3ivXS/kATe1K
 AB/GrFJF7jfiBR+1ZDSyipU9DGWbHHs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-DYmeGg2LPGWpllOTvYzHRA-1; Tue, 29 Mar 2022 11:28:08 -0400
X-MC-Unique: DYmeGg2LPGWpllOTvYzHRA-1
Received: by mail-qt1-f199.google.com with SMTP id
 f22-20020ac840d6000000b002dd4d87de21so15035440qtm.23
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 08:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qy1Fd54YyP4FK4ZFWbi30jtkVTD98I09auNxMQdOja8=;
 b=vaAfjCzwuwAukbBmZKmB5OhZwS0Lm7y+N1tnleXS8yOCmPOUEt8Lp9uYGTAnJL4nAL
 VQx8dwZgunQjxrjkFp5VBhZj336pflaBtXRcRdHZ3l6/8H3W9ilqlaruBbaeHFDea3Jz
 G3c/Zb11FwIVBS1yHcabu3Xoh+tpPve7iVnk68o3biZK4tLzKSA+PpFa40/X2WysMetB
 APFCdhb0PcR5E3YQ+umsfMTlt0paaJ5yKz+rASBFvvaKrwUIkmZVzolbf5rNCC0N5top
 1K/PxYHE8X5XH26uk3vbOFWF2ZFOGSWKjLp2cT84CKJ6adgxRcDoI61/z9JIWEjhb4zZ
 zFpw==
X-Gm-Message-State: AOAM530BcdOrKCuCfC8K++EJupuX/IvaOWqeBe/XQsjXUAIVlPsg7AsY
 derE+5ysH2SD0qjqPg8evxfGHMGEuxdQzcbBmRmr2iKkOz+GHalwqDFeERV7XDmQkYTSA2rOiIa
 qDbJdPc9eer9kBDg=
X-Received: by 2002:a05:620a:44d3:b0:680:9eb3:e7ad with SMTP id
 y19-20020a05620a44d300b006809eb3e7admr19553067qkp.376.1648567688219; 
 Tue, 29 Mar 2022 08:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjwztQEsxr4wmrA4Hx1sDKM2kwNPJdU2FroAWh3+6vH4WzRJUPkGJrpq1puurPNIVtvcbUaQ==
X-Received: by 2002:a05:620a:44d3:b0:680:9eb3:e7ad with SMTP id
 y19-20020a05620a44d300b006809eb3e7admr19553035qkp.376.1648567687934; 
 Tue, 29 Mar 2022 08:28:07 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 g5-20020ac87f45000000b002e125ef0ba3sm15296334qtk.82.2022.03.29.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:28:07 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:27:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 0/8] blkio: add libblkio BlockDriver
Message-ID: <20220329152758.hysmda3sssklsyxx@sgarzare-redhat>
References: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220323111727.1100209-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 11:17:19AM +0000, Stefan Hajnoczi wrote:
>This patch series adds a QEMU BlockDriver for libblkio
>(https://gitlab.com/libblkio/libblkio/), a library for high-performance block
>device I/O. Currently libblkio has basic io_uring support with additional
>drivers in development.
>
>The first patch adds the core BlockDriver and most of the libblkio API usage.
>The remainder of the patch series reworks the existing QEMU bdrv_register_buf()
>API so virtio-blk emulation efficiently map guest RAM for libblkio - some
>libblkio drivers require that I/O buffer memory is pre-registered (think VFIO,
>vhost, etc).
>
>This block driver is incomplete because bdrv_refresh_limits() and several other
>APIs are not yet implemented. You can already boot a guest though. Once the
>missing gaps have been filled in I will send a non-RFC patch series.
>
>Regarding the design: each libblkio driver is a separately named BlockDriver.
>That means there is an "io_uring" BlockDriver and not a generic "libblkio"
>BlockDriver. In the future there will be additional BlockDrivers, all defined
>in block/blkio.c. This way QAPI and open parameters are type-safe and mandatory
>parameters can be checked by QEMU.

Indeed it was a great design. Adding the "vhost_vdpa" driver was quick 
and easy.

I've been reviewing and testing it. Aside from the problem in patch 7, 
the rest already looks good to me.

Thanks,
Stefano


