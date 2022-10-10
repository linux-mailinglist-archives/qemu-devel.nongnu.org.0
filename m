Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BC5F9C56
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:01:06 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpar-00023Z-P9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ohpNt-0004wG-1O
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ohpNp-0006cL-VT
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665395257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=STwuVtp+hRvOZvAp6GzSoUzLT/JqD+lwc5Yx3OCCCrM=;
 b=Xgr/AnDXYq6+gpdTgKs0sTTiooHYAJQAGfs91UhuJo6Tb7BE3h1RkwchwVl5h4O/bgO/XH
 RsQ0OPmpunnXBDsKCoIXmcpYfO8rbc2tYwUKuCIhIyYFnLW+HA6L5n6tTFC9ng7tWxH2yY
 nBo5rT1dv31pKYCBTs2aJpUsOVQBzvI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-NrrXqAifMkCSIct0EuQRFw-1; Mon, 10 Oct 2022 05:47:35 -0400
X-MC-Unique: NrrXqAifMkCSIct0EuQRFw-1
Received: by mail-il1-f197.google.com with SMTP id
 y13-20020a056e021bed00b002faba3c4afbso6211840ilv.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STwuVtp+hRvOZvAp6GzSoUzLT/JqD+lwc5Yx3OCCCrM=;
 b=mzCBZOUCHeBrJxfwOg9Y7daQTLEQ/7s91JBeJD5YUp1qnmqgRzpWjysIBvFp6PfV8N
 rWWY2Mr1qDf6h4zsp3ePYO0vYtnsODg3Q1ibOOZ8kZdlUxBs43Hd2nuGkrUF2kFaNHcj
 ieE385dSuMkMPLP7UkbpQi8lelMu9WR3JnfmByq5lVHCtoPMYZSCQtaoXQrqrovSV4PM
 Sim6bX95KBX/LytRQAugU5a5SCc4VHlE01Q93QFfTlknhMmFDclrsqqKOZkrh8bCtckk
 hUknFmj/Nil3zOdYTIocLRgfgdvSSCN0keMycnJSuZWYGhlBTE5s8aIdISrm6eabgr0K
 Wg3A==
X-Gm-Message-State: ACrzQf2g41LYFro3CQUF6Mu50HyBWWwvRVTvvqlLWhzBjKCixDfpQNaH
 nGnCGORV/yzl2TPeeAowbx3s60h6j4fxWBmjMOjibrqF6A0OYiRgk7TlbL0/GWanesLgpa1ab/f
 +GJEniZG1cje1bPJayUX+rszTWw0H8ys=
X-Received: by 2002:a92:c548:0:b0:2f9:fe3f:f4c2 with SMTP id
 a8-20020a92c548000000b002f9fe3ff4c2mr8866120ilj.180.1665395254925; 
 Mon, 10 Oct 2022 02:47:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM591dABoprWezOQLBybw5tmtu/2GHJDsjKSoj+j8rO9HR8NKYz9KKdKHOCq1FpCLY8hikkd5Pbh8I9Wxsb2oPE=
X-Received: by 2002:a92:c548:0:b0:2f9:fe3f:f4c2 with SMTP id
 a8-20020a92c548000000b002f9fe3ff4c2mr8866102ilj.180.1665395254753; Mon, 10
 Oct 2022 02:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221006213507.645402-1-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 10 Oct 2022 10:46:59 +0100
Message-ID: <CAELaAXya2pSuX5AYwDBTti8AAUYxmMZj_6jwwRBcAjZYfmn=mg@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] blkio: add libblkio BlockDriver
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 sgarzare@redhat.com, 
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Xie Changlong <xiechanglong.d@gmail.com>, John Snow <jsnow@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jeff Cody <codyprime@gmail.com>, 
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wen Congyang <wencongyang2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 6, 2022 at 10:35 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> v6:
> - Add untested nvme-io_uring driver. Please test in your nested NVMe environment, Alberto. [Alberto]

I did some I/O verification using fio [1] and it seems to be working fine.

Alberto

[1] https://fio.readthedocs.io/en/latest/fio_doc.html#verification


