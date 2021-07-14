Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BEF3C7BEA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 04:43:58 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3UsP-0000ne-Dr
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 22:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3Uqy-0007zM-Vj
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3Uqx-0007UR-DD
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 22:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626230546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLz7x4yUhQWg67tkIIZISfwZcVwQdPl8bcepOXdBrXk=;
 b=EV4UjpDFpaAW2yaAmMeeD6nzPfNkNnm4HcZHjmTCiDxFjQ4UCYS502Em21Dpwwc1/YwWFM
 GtbSSiPk/cB6KyF2/nn5OZVYZsMBRH7pobQWCI8CD3sMZXGWo02IHeYnXszITFMkKmvO8J
 N+iGR2llsDwJ3EKkL6/aQGSBmptgTE4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-0XGcgXjhOeqsOO6qrcCw_g-1; Tue, 13 Jul 2021 22:42:25 -0400
X-MC-Unique: 0XGcgXjhOeqsOO6qrcCw_g-1
Received: by mail-pl1-f198.google.com with SMTP id
 p8-20020a1709028a88b029011c6ee150f3so569673plo.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 19:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jLz7x4yUhQWg67tkIIZISfwZcVwQdPl8bcepOXdBrXk=;
 b=DHCHIa3ZxW04sQ89KeUwx7cL1NYraPBmEKcFh/r8rL0a73d7Ec9gBdIAJGcCW4MeLU
 +RS36adECFmM0KLkEiwGguBqWYNX7IYXm63/IygwdIiL43ySbN5BJ7v3vS9LJAXzOWcZ
 3Sq6mh/dl82yDNCfSbzB6UcWQGf3vA7kk6elOHH1+PilWzP+x7+FmJhGcrSVKMqZeHjP
 d4OFsiSYBpVVRbDa6JeADk7p22xdgGU/o1w2b4obi7+7z/lHBWFipnx+0bdI+uEi7rWE
 lpRwTKhkgmeJokXGbZOn13UAMnuKzTkcPN20sJdWZvVxkWER7Zt6J2tYdLhq35UpRNcz
 0P/Q==
X-Gm-Message-State: AOAM5317PcqOKIrclgxVgvQbzIDsMq3K6LTMSzKHXQh7BEI6h5L55p17
 xI+tBHC92IIcKhHGRNFTZBNFbkcuILs0kgnS7RPliZDNzYwEudec1g3KN0wepXdlZ0ivIsB2WId
 X2UNhTbdsOJM0oLo=
X-Received: by 2002:a62:8013:0:b029:328:68bb:fa7c with SMTP id
 j19-20020a6280130000b029032868bbfa7cmr7749859pfd.80.1626230544464; 
 Tue, 13 Jul 2021 19:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfuxS7Kb7uHkh9e35niKZaiLHD3tRgVS79yQxquSDsREdKkKNOXHw2geJtmKeXvgwHpsvwIg==
X-Received: by 2002:a62:8013:0:b029:328:68bb:fa7c with SMTP id
 j19-20020a6280130000b029032868bbfa7cmr7749831pfd.80.1626230544303; 
 Tue, 13 Jul 2021 19:42:24 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b65sm524439pfa.32.2021.07.13.19.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 19:42:23 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] hmp, qmp: Add some commands to introspect virtio
 devices
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com>
Date: Wed, 14 Jul 2021 10:42:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/12 ÏÂÎç6:35, Jonah Palmer Ð´µÀ:
>          Dump the information of the head element of the third queue of virtio-scsi:
>
>          (qemu) virtio queue-element /machine/peripheral-anon/device[3]/virtio-backend 3
>          index: 122
>          ndescs: 3
>          descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 len 108 (write, next),
>                 addr 0x3c951728 len 51 (next)


I think it would be nice if we can show driver area and device area as 
well here.

Thanks


