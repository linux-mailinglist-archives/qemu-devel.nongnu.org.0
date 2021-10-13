Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0A42B3D7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:50:26 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVHd-0006PA-Ch
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVGe-0005hi-Sw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVGd-0005ST-E2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634096962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nc561+saWJMTudX0gcwoL+PiV5ic65YeUcHohjLIlJ0=;
 b=EdZc9yzjwZV36jyG4l4c3d+weQEkxjnxKZbf3pCQxjMyXhWEU+4PNu54Eopy/4AIKlri+i
 lr0OVh1xOEL04Db+zeAY2T5k8cQlSSwAT49yZv7Mq5oIYyByKmE/hRusvGWPigHi6N6vsZ
 RG7V6FjYgql7MpNKtybLxJOj94VM3Rw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-JC1J9B1xP7Gk_FXFeq3Lhw-1; Tue, 12 Oct 2021 23:49:19 -0400
X-MC-Unique: JC1J9B1xP7Gk_FXFeq3Lhw-1
Received: by mail-pf1-f200.google.com with SMTP id
 q3-20020aa79823000000b0044d24283b63so802813pfl.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 20:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nc561+saWJMTudX0gcwoL+PiV5ic65YeUcHohjLIlJ0=;
 b=ne2zFbk36Ys4Mhrwg0bW6mr7XFSnLGBj88zo/fZ/f3iT5uj95RptXsYMoxbfeIiti4
 jZlyfbLERvnbu7xURHJgJv81Bn3pRfcQQSKpRM7EDVVh56Eb6msvbOxjk2a2Iwta80b8
 iB3zhjPFbbFRKRa0EE8mTBQJ6S6WHNxupPe77vPUGpVoIVYCum7YcelhAlqexlPFZyB8
 zPfcKPSl2T35AJTevs2b0DoVv1JixiI3YwGIrCsg+lV9A5Y+TEeWDhjTpUQq9CDmx1cR
 vkZzMgUymdUdnxzJsAZNOpzrEa/NezR5b5pqpSbi1U80TOK5ixtUvOschcPu14ZeXaVQ
 4yTA==
X-Gm-Message-State: AOAM530FoHE/fTd47VuhhmPt2EROBmbELqNVxgmvuRaiCVp3gpMu7mdj
 Phu2eaUItjVg0bjICSOLhTS7ebXrR+DFnGWfsxu5g/QPDY6q7Mt565psGqdWy/h8XtXWOwK/PLS
 pA5Ze1K3HMJKZGcI=
X-Received: by 2002:a17:902:8b83:b029:12c:cbce:a52f with SMTP id
 ay3-20020a1709028b83b029012ccbcea52fmr33479384plb.9.1634096958393; 
 Tue, 12 Oct 2021 20:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp/w9WOLm+s/zGkpqTH9LhI2NC+37oxCG/DQLSpvGBV5AYay992DvMB4K3Df/+MFIoVxELeA==
X-Received: by 2002:a17:902:8b83:b029:12c:cbce:a52f with SMTP id
 ay3-20020a1709028b83b029012ccbcea52fmr33479356plb.9.1634096958112; 
 Tue, 12 Oct 2021 20:49:18 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x10sm12657741pfn.172.2021.10.12.20.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 20:49:17 -0700 (PDT)
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <69c4056c-4a9b-8480-80a0-2b78c9b90ffb@redhat.com>
Date: Wed, 13 Oct 2021 11:49:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-12-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> This will make qemu aware of the device used buffers, allowing it to
> write the guest memory with its contents if needed.
>
> Since the use of vhost_virtqueue_start can unmasks and discard call
> events, vhost_virtqueue_start should be modified in one of these ways:
> * Split in two: One of them uses all logic to start a queue with no
>    side effects for the guest, and another one tha actually assumes that
>    the guest has just started the device. Vdpa should use just the
>    former.
> * Actually store and check if the guest notifier is masked, and do it
>    conditionally.
> * Left as it is, and duplicate all the logic in vhost-vdpa.


Btw, the log looks not clear. I guess this patch goes for method 3. If 
yes, we need explain it and why.

Thanks


>
> Signed-off-by: Eugenio Pérez<eperezma@redhat.com>


