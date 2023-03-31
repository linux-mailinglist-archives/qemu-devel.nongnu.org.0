Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240106D1933
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:01:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi9gz-0003TP-C5; Fri, 31 Mar 2023 04:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9gw-0003TB-Az
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9gu-0002od-L3
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680249655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTViHKCMETj6BuPMbwko7vTwxJ5ooDfJ5CcTmKiPb20=;
 b=Zmq7leR1yJo9QnyGRFMOgGL2i/ZLnC/0D4Z+6BvI137Xj/jlZnRxrRPs2h64usZVqjC8r7
 VNKZKLkwlW8BS73NrvAXAlp1ZsNNc60/m0jJaOxf3xS3DjIdyXO1rDux7MdqSwVtbTZl5P
 goDc7J7Ny5l2XQp4227NE4ee7QRxrDM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-lR-UBjilOxSJXVgsO81_zw-1; Fri, 31 Mar 2023 04:00:54 -0400
X-MC-Unique: lR-UBjilOxSJXVgsO81_zw-1
Received: by mail-pl1-f200.google.com with SMTP id
 kw3-20020a170902f90300b001a274ccf620so3923126plb.8
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680249653; x=1682841653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mTViHKCMETj6BuPMbwko7vTwxJ5ooDfJ5CcTmKiPb20=;
 b=SeBNTo46dBy7Klhp3ysQfFMcfmWw+1Yw2k6+BxoJ8p22v09gSiAuPTyZLdPsf4Cnbj
 l5mq45OANMg4F/gpw/kpilvwB5yGVl5WfWJ1WnqV6XrjALuJK6mVtEPYyG6FxxxJ5BHl
 eKfDh5hIzkv7UEP3AY004Vp3YU+BA34X9RtFdMh7iGIbMbboTn7uzAhbnp70+vEyWnW2
 HJ/qcr69AK7UVeII3m0TjtCYZEUIu2jxE5LI9dqZxQS4vLJYs0UMG5wlxkzDCe4Po5tk
 dV5qDk4bQIBD9WW/g/wdD4cW/x2RriKil/whd0ZJ9ejJ0E3MrJlQfI7ATBKUgNxLwy49
 a0ug==
X-Gm-Message-State: AAQBX9faQkJ1AhJrQQoha8aIbpXQ+ze6RCAa2rbtk/cJRDDjjeYgwih5
 ooVrA44b+w/PvEJrPy5omNenUzELaJBDB5DSQCIgyLhadHuBvT4sCMP/PMQm/Rk9CFN1/tEqKwI
 SMmzmlHcTzeEyW88=
X-Received: by 2002:aa7:950d:0:b0:5a8:ad9d:83f with SMTP id
 b13-20020aa7950d000000b005a8ad9d083fmr25555506pfp.24.1680249653059; 
 Fri, 31 Mar 2023 01:00:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ykcgve78tTJ5LM56//I5vEo7UatzXc5gdlWJuo1r06c546/pQ5rwDlJN808KdSob+SsKFJJA==
X-Received: by 2002:aa7:950d:0:b0:5a8:ad9d:83f with SMTP id
 b13-20020aa7950d000000b005a8ad9d083fmr25555466pfp.24.1680249652745; 
 Fri, 31 Mar 2023 01:00:52 -0700 (PDT)
Received: from [10.72.13.208] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a62aa0d000000b005921c46cbadsm1141971pff.99.2023.03.31.01.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:00:52 -0700 (PDT)
Message-ID: <0cc19893-f832-f03a-cbb0-19f053ff8aa7@redhat.com>
Date: Fri, 31 Mar 2023 16:00:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, Eli Cohen <eli@mellanox.com>,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
 <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
 <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/3/30 18:42, Eugenio Perez Martin 写道:
> On Thu, Mar 30, 2023 at 8:23 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Thu, Mar 30, 2023 at 2:20 PM Jason Wang <jasowang@redhat.com> wrote:
>>> On Fri, Mar 24, 2023 at 3:54 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>> Evaluating it at start time instead of initialization time may make the
>>>> guest capable of dynamically adding or removing migration blockers.
>>>>
>>>> Also, moving to initialization reduces the number of ioctls in the
>>>> migration, reducing failure possibilities.
>>>>
>>>> As a drawback we need to check for CVQ isolation twice: one time with no
>>>> MQ negotiated and another one acking it, as long as the device supports
>>>> it.  This is because Vring ASID / group management is based on vq
>>>> indexes, but we don't know the index of CVQ before negotiating MQ.
>>> We need to fail if we see a device that can isolate cvq without MQ but
>>> not with MQ.
>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>> v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
>>>> ---
>>>>   net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-----------
>>>>   1 file changed, 151 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>> index 4397c0d4b3..db2c9afcb3 100644
>>>> --- a/net/vhost-vdpa.c
>>>> +++ b/net/vhost-vdpa.c
>>>> @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
>>>>
>>>>       /* The device always have SVQ enabled */
>>>>       bool always_svq;
>>>> +
>>>> +    /* The device can isolate CVQ in its own ASID if MQ is negotiated */
>>>> +    bool cvq_isolated_mq;
>>>> +
>>>> +    /* The device can isolate CVQ in its own ASID if MQ is not negotiated */
>>>> +    bool cvq_isolated;
>>> As stated above, if we need a device that cvq_isolated_mq^cvq_isolated
>>> == true, we need to fail. This may reduce the complexity of the code?
>>>
>>> Thanks
>> Since we are the mediation layer, Qemu can alway choose to negotiate
>> MQ regardless whether or not it is supported by the guest. In this
>> way, we can have a stable virtqueue index for cvq.
>>
> I think it is a great idea and it simplifies this patch somehow.
> However, we need something like the queue mapping [1] to do so :).
>
> To double confirm:
> * If the device supports MQ, only probe MQ. If not, only probe !MQ.
> * Only store cvq_isolated in VhostVDPAState.
>
> Now, if the device does not negotiate MQ but the device supports MQ:


I'm not sure I understand here, if device supports MQ it should accepts 
MQ or we can fail the initialization here.


> * All the requests to queue 3 must be redirected to the last queue in
> the device. That includes set_vq_address, notifiers regions, etc.


This also means we will only mediate the case:

1) Qemu emulated virtio-net has 1 queue but device support multiple queue

but not

2) Qemu emulated virtio-net has M queue but device support N queue (N>M)


>
> I'm totally ok to go this route but it's not immediate.


Yes but I mean, we can start from failing the device if 
cvq_isolated_mq^cvq_isolated == true (or I wonder if we can meet this 
condition for any existing parents).

Thanks


>
> Thanks!
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg07157.html
>


