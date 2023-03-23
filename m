Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF506C61BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGN3-000597-40; Thu, 23 Mar 2023 04:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGN0-00058v-Ao
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pfGMy-0005w7-SB
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679560344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTbTRcD5JWX3OOU1h57CcRdvKYQ4G6hj6pG8nefRmYU=;
 b=MZkS8RPjqcdBLm5W8m7LCOIPFWS1ADqXuynfrs2EHpqk6l6vCk9lyP3Z6d+oljrGJkdA0c
 B69P7oqUcyCb0sqeV7RB0ZlYu/ngdpwBqoNAB5hkIwvilAN8ebufzPf4EjQuUlztalCedW
 8sjS2ITJpS6FbAJPtc55wvjsrxMqhJ8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-PPaSn_0cPqSJ7U1-9EOcew-1; Thu, 23 Mar 2023 04:32:22 -0400
X-MC-Unique: PPaSn_0cPqSJ7U1-9EOcew-1
Received: by mail-ed1-f71.google.com with SMTP id
 i22-20020a05640242d600b004f5962985f4so31548120edc.12
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560342;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RTbTRcD5JWX3OOU1h57CcRdvKYQ4G6hj6pG8nefRmYU=;
 b=1xiCImgeWV+a9qsrzJPOJcUQ3Gl6/upGwXter+yfYvNdo500fKnPb/rbHX92EVpkwO
 p0ege8YIS0xW/DLlA+UklEEoqkgBzpy+7I7jHOy5miRYcN/LUtWB/S5SXXhAjfcU0Mt9
 hu6lHgrCCcBtEnpj+Gy2u4GbetBImGFtSvk6VjIWaGsqNnu/y12kjjtk+N+3Nok2RtM+
 /S0dz0pVz7A/0cFjNi0Rool5drOIbBSfeuS/RmkMUvPtksb+rbRSVYCxcUqggWJj1bz8
 WMjTKeOdsB4MXTK16G7CTsXVXOksYszojYrVan0VqQh7hHv1X1oZmWtWPAMR45RghTom
 4kUQ==
X-Gm-Message-State: AO0yUKVkRnHpQqqcTn1O2mwpB9wOnNG7lXRHHeHqJnTbl47E4R9fNt0x
 Nei6fhhLEEBhj7I4RenYJMhhvk+hwCJNmYNJlESB2xy5ZpJHs3+L8X+aHCDGHxXicz4RWQ/7jXq
 kMn1Ed7hUdrgBbB8=
X-Received: by 2002:aa7:d890:0:b0:4fa:57bf:1416 with SMTP id
 u16-20020aa7d890000000b004fa57bf1416mr9866487edq.35.1679560341908; 
 Thu, 23 Mar 2023 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set9BtTNB9x9UpTX4qsH4nPEmvPenIG4k17aX/cgfwv5XXbErf0f9unbbJ0ByDwxL+NzIQJpiSg==
X-Received: by 2002:aa7:d890:0:b0:4fa:57bf:1416 with SMTP id
 u16-20020aa7d890000000b004fa57bf1416mr9866468edq.35.1679560341669; 
 Thu, 23 Mar 2023 01:32:21 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 i3-20020a508703000000b004fbd365fb33sm8887508edb.38.2023.03.23.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 01:32:21 -0700 (PDT)
Date: Thu, 23 Mar 2023 09:32:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: Re: [RFC PATCH for 8.1 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
Message-ID: <20230323083218.4xqix24clzigc564@sgarzare-redhat>
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-6-eperezma@redhat.com>
 <20230322142712.egnc6rlmeclwmchg@sgarzare-redhat>
 <CAJaqyWdaXCO5VDSQ_wda9rCFH0VHcTMEuq4RP2b-LLGFty7m7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdaXCO5VDSQ_wda9rCFH0VHcTMEuq4RP2b-LLGFty7m7g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

On Wed, Mar 22, 2023 at 07:04:03PM +0100, Eugenio Perez Martin wrote:
>On Wed, Mar 22, 2023 at 3:27 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Fri, Mar 17, 2023 at 03:55:41PM +0100, Eugenio Pérez wrote:
>> >Evaluating it at start time instead of initialization time may make the
>> >guest capable of dynamically adding or removing migration blockers.
>> >
>> >Also, moving to initialization reduces the number of ioctls in the
>> >migration, reducing failure possibilities.
>> >
>> >Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> >---
>> > net/vhost-vdpa.c | 200 +++++++++++++++++++++++++++++++++++++----------
>> > 1 file changed, 157 insertions(+), 43 deletions(-)
>> >
>> >diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> >index 4397c0d4b3..818a24fb0e 100644
>> >--- a/net/vhost-vdpa.c
>> >+++ b/net/vhost-vdpa.c
>> >@@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
>> >
>> >     /* The device always have SVQ enabled */
>> >     bool always_svq;
>> >+
>> >+    /* The device can isolate CVQ in its own ASID if MQ is negotiated */
>> >+    bool cvq_isolated_mq;
>> >+
>> >+    /* The device can isolate CVQ in its own ASID if MQ is not negotiated */
>> >+    bool cvq_isolated;
>> >+
>>
>> I am not familiar with how CVQ works, so my question might be trivial
>> ;-) but why do we need to have 2 variables depending on F_MQ?
>>
>
>You're right, it is not specified anywhere in the series.
>
>Vring ASID / group management is based on vq indexes. CVQ is always
>the last queue, but its position depends on MQ. If it is not acked,
>cvq will always be queue #2. if it is acked, it will be
>net_config->max_virtqueue_pairs*2.
>
>Previously this was done at device start, so we always know if mq has
>been acked or not. But now we are moving to initialization, so we need
>to probe both configurations.
>
>Is that clearer now? I'll add to the patch description for sure.

Yes, thanks for the explanation!

Stefano


