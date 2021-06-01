Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1839725F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:32:04 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2ct-0003m1-Fz
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2ap-0001RG-FH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2an-0002Xf-B4
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622546992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRpT3AUSZst0zjC4rOIMCNa3IjmVdiLoT3ucN0/Q77E=;
 b=dl0M3I3rglyrt7WWStXNVjAs6JU3GEGbCei3+SabjItOvdbG4+3Jd/vtbQgSYcad4Q4LpA
 M6+rxgjtcgVdjtbEYgZ+q8ZyNBh3LJ5bfcSOt5zXmRedtHkv6JImN/QmpflHtgyjixZJKS
 ELd4a/RUWGc0DiNK9UBE1ed0kiEzdL8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-y6iU5wKXNfawlb3JcKb-fQ-1; Tue, 01 Jun 2021 07:29:50 -0400
X-MC-Unique: y6iU5wKXNfawlb3JcKb-fQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 gs18-20020a1709072d12b02903f19777c38aso1501671ejc.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HRpT3AUSZst0zjC4rOIMCNa3IjmVdiLoT3ucN0/Q77E=;
 b=n9ycbDjCF0igvlBgvB1b4eZ4aEZO34Y2306ph5opmUbsDmYw5m8E2zQ7CoB/Sm9dY1
 1D9YnOl3DEGIEqn5YwkZapaw0IpYaWyuNGDzwpisX8AZQGgFGZeip/UWpey5+JOOa4fQ
 JE0Y0pAGxphr8HAIFhdFft/gJUGP91hM4EYTferRAqH3OAm4+C3hLCn/s7NAxHj5P6ag
 hfKYWCzhmjPe7cgtOPDL0+kACjmSRfzJQVisg+4sa7Ul2XG4YB4hCyrUKLSEe9VyT3WC
 VBfwkt5HKMohZSa1oX6ZRCgpwIb5qwGR4uZdwwJikiJApmFqLDh2f97y+kNNoctvhIt1
 c8Sg==
X-Gm-Message-State: AOAM532zW/RHbxGTtM790+6Wq3DALpxoKok3GI41MEAt5YH3WhDaBEpn
 dq5Eq2bFjTBsbHYF09z1AnDMAl4wxDall40gU87fBEN541VMDXFRIcy2AkVLqKr7rnfY+6KAH/m
 uOX7V4oQiv0PzlEI=
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr31177187edv.315.1622546989437; 
 Tue, 01 Jun 2021 04:29:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQeo05nO/1jluJZbe72ec8aMbRAtWhMnPaFoMPALP8/uYX3hZYqKt+AF+RqOilvrTqdwu7qw==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr31177158edv.315.1622546989245; 
 Tue, 01 Jun 2021 04:29:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 di16sm1115818edb.62.2021.06.01.04.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:29:49 -0700 (PDT)
Subject: Re: [PATCH v2 30/33] iotests/image-fleecing: proper source device
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-31-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <38b620e2-5062-6653-ed73-8b778828a6de@redhat.com>
Date: Tue, 1 Jun 2021 13:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-31-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> Define scsi device to operate with it by qom-set in further patch.
>
> Give a new node-name to source block node, to not look like device
> name.
>
> Job now don't want to work without giving explicit id, so, let's call
> it "fleecing".
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 12 ++++++++----
>   tests/qemu-iotests/tests/image-fleecing.out |  2 +-
>   2 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


