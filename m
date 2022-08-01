Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB69586317
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 05:30:58 +0200 (CEST)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIM8u-0004Kp-O1
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 23:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oIM76-0002OJ-Gc
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oIM72-0007oi-Pt
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659324539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stUZJZt+04i0BNsId39KwgbL/T+mzkb3f/zlf/9c1DM=;
 b=ha8vGbHBUZlvdasW6HvsMoHEe/fz1ZTaxTQSNJpxirQ8kCgCfW7+P7/+0H67zQFMArLIwL
 ZU5jpE5hVqB8VPk86BUVFYqWWeOzO6cdNOr5WI7LEng78t+DBkTTeEm0+gGE279L3wlB1Q
 aLxL1UlvO6r9EGS+l/zY7F0WYlu73Fk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-c9MAa02UOxq6RrgKUBWUmA-1; Sun, 31 Jul 2022 23:28:57 -0400
X-MC-Unique: c9MAa02UOxq6RrgKUBWUmA-1
Received: by mail-pj1-f72.google.com with SMTP id
 ng1-20020a17090b1a8100b001f4f9f69d48so1295621pjb.4
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 20:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=stUZJZt+04i0BNsId39KwgbL/T+mzkb3f/zlf/9c1DM=;
 b=LjWZujbIhfbV8gC8C9+7I2p2Ejd4qQftCqqbVIyEzdpa4l0ajViwznyBlQy6M6i6wf
 xvQdI0Y/GdRA/I/AdnUrkfyRP+cKJsw4XwbJs+TsqyDn477SfTfl6Z+EWtnm+S6ytwzr
 7xF0PRHGKNSW5tFU5iU5UbqFo5HMHXHSHf6/tSALFvbVmApsirFiEZUY4thrCRHjnM+s
 qaexJ05qoq9PZtavjqkJDAjMxLsGA/Z9HHG1AG6bNgM3Bwd5EZCTkrxcIpnymGd2HEiz
 WA6o9BXvaLCc+YzS3CgKEeLbftKLdlyp6N6J90bkU9J4F0ZSRw5U2YNFBCh2LVBOlIa5
 IxBQ==
X-Gm-Message-State: ACgBeo2FGLy35DsK1gcUsl6TR/DveSP796V+1ExLP5+UeDZ/8XerFKqa
 eFnc1V7boPRaiMhWYF3Tey8LH4Q3sX6xBSZZdv0+DtVdAI/vIKtY0Ge7nANVXAkKGglVENFCLpp
 7cIBGZJvEDpvdhYQ=
X-Received: by 2002:a17:903:2452:b0:16e:d0b6:6507 with SMTP id
 l18-20020a170903245200b0016ed0b66507mr8280360pls.68.1659324536637; 
 Sun, 31 Jul 2022 20:28:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Uw/v5X2DQugz8Z0RgDqqg8lLRp4IX2At8zZqLRVbDtcrOSKTxv3ToNpgR8lZEJ3NS3pMDvw==
X-Received: by 2002:a17:903:2452:b0:16e:d0b6:6507 with SMTP id
 l18-20020a170903245200b0016ed0b66507mr8280346pls.68.1659324536256; 
 Sun, 31 Jul 2022 20:28:56 -0700 (PDT)
Received: from [10.72.13.139] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d188-20020a6236c5000000b0052c7ff2ac74sm7429920pfa.17.2022.07.31.20.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 20:28:54 -0700 (PDT)
Message-ID: <55e82876-fb77-fa6e-2a28-f53efce47efd@redhat.com>
Date: Mon, 1 Aug 2022 11:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PULL V2 19/25] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-20-jasowang@redhat.com>
 <CAFEAcA8UZcOLTpLUutMFeaugZwm2vAKTGZgLkcHAG3B2BHYtUA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAFEAcA8UZcOLTpLUutMFeaugZwm2vAKTGZgLkcHAG3B2BHYtUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/29 22:08, Peter Maydell 写道:
> On Wed, 20 Jul 2022 at 10:04, Jason Wang <jasowang@redhat.com> wrote:
>> From: Eugenio Pérez <eperezma@redhat.com>
>>
>> To know the device features is needed for CVQ SVQ, so SVQ knows if it
>> can handle all commands or not. Extract from
>> vhost_vdpa_get_max_queue_pairs so we can reuse it.
>>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Hi; this change introduces a resource leak in the new
> error-exit return path in net_init_vhost_vdpa(). Spotted
> by Coverity, CID 1490785.
>
>> @@ -517,10 +521,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>                           NetClientState *peer, Error **errp)
>>   {
>>       const NetdevVhostVDPAOptions *opts;
>> +    uint64_t features;
>>       int vdpa_device_fd;
>>       g_autofree NetClientState **ncs = NULL;
>>       NetClientState *nc;
>> -    int queue_pairs, i, has_cvq = 0;
>> +    int queue_pairs, r, i, has_cvq = 0;
>>
>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>       opts = &netdev->u.vhost_vdpa;
>> @@ -534,7 +539,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>           return -errno;
>>       }
>>
>> -    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
>> +    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>> +    if (unlikely(r < 0)) {
>> +        return r;
> At this point in the code we have allocated the file descriptor
> vdpa_device_fd, but this return path fails to close it.


Exactly.


>
>> +    }
>> +
>> +    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
>>                                                    &has_cvq, errp);
>>       if (queue_pairs < 0) {
>>           qemu_close(vdpa_device_fd);
> Compare this pre-existing error-exit path, which correctly
> calls qemu_close() on the fd.
>
> Related question: is this function supposed to return -1 on
> failure, or negative-errno ?


Kind of either:

   if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) 
< 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
             error_setg(errp, "Device '%s' could not be initialized",
                        NetClientDriver_str(netdev->type));
         }
         return -1;
     }


>   At the moment it has a mix
> of both. I think that the sole caller only really wants "<0 on
> error", in which case the error-exit code paths could probably
> be tidied up so that instead of explicitly calling
> qemu_close() and returning r, queue_pairs, or whatever
> they got back from the function they just called, they
> could just 'goto err_svq' which will do the "close the fd
> and return -1" work. Better still, by initializing 'i'
> to 0 at the top of the function (and naming it something
> clearer, ideally), all the code paths after the initial
> qemu_open() succeeds could be made to use 'goto err'
> for the error-exit case.


Yes, having a consistent goto based error handling seems much better.

Eugenio, please post patch to fix this.

Thanks


>
> thanks
> -- PMM
>


