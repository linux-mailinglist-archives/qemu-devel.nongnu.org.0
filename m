Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55223B29B3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:48:17 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK5w-0005PB-PV
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK4b-000401-Hq
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK4X-000661-J7
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624520809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MNBz52mgHIebvy8scihGsw5NU74/hBanDFv9EbSUBI=;
 b=JsCCtQgxcaF9ZzZpstgDpYana4JjI4c+gQyrhTxZoY1iEZpwjt+ICaA6/1F4wIwo9VXMqS
 nDkwPoW68/eGV3srPmE7VF3Yfgzlvcba6hcbgXjUAuwkPWbKWCTMo3FJqOyYsoh0Us+pIE
 3whkjjFr0q66KIOKc+83F68mjYX5B0Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Ir7G5bkzNpOrRzh2H4-ivg-1; Thu, 24 Jun 2021 03:46:47 -0400
X-MC-Unique: Ir7G5bkzNpOrRzh2H4-ivg-1
Received: by mail-pf1-f197.google.com with SMTP id
 f9-20020a056a0022c9b029030058c72fafso3468966pfj.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/MNBz52mgHIebvy8scihGsw5NU74/hBanDFv9EbSUBI=;
 b=TkopTAMlZ1ibvXazyZEOTlXqrHRTioK2izjvlv6msXxPLnIRVGXtM9FcjuuzkPXYDI
 40fxPsx96jsvW/X04whyX1uhpBJAl6NT2DxTc//8HVGSCjs0KGZi9OLT6mSm1j5fxtw2
 Bc3vIfytMLlxOpMhKPkgLSPeXowDAMTqWUQbzoCb6Jgzz7HwKZhcRp4rgtg/TFXfRtb2
 Y7f9JUp/R1evtWnizxh21Re2Otah6/ZXDnSSaLvo/3jfT98N21b0czRnx5dWRMkHAD/i
 Fd5yAJxIW8kn8qRKhM5wEbrRmyl5Sc+XLbGA6EY/Uz8cv59TR5uf51uK67ugPJaZzsth
 i+hQ==
X-Gm-Message-State: AOAM532uN9fd/XONy0zex/85DN/JlaMyjaW3WYil8/E2o/bIe16hJEal
 p98RUPwoLywdquybnZXKFUcs10DF9B/erqCAXHLNAFfyYXnbn3VhuvU2bQXGwUTJ7pOekFEJQ42
 zvn0q4WOXOdyGxVs=
X-Received: by 2002:a17:90b:38cd:: with SMTP id
 nn13mr13851698pjb.48.1624520806347; 
 Thu, 24 Jun 2021 00:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf8OAeY6Y2NUc5saFcuuPOIyfnbsk91gyIYocGXE1pOwXLy8OY3G6/Cs1ZlHv3RxLZA93SQQ==
X-Received: by 2002:a17:90b:38cd:: with SMTP id
 nn13mr13851683pjb.48.1624520806206; 
 Thu, 24 Jun 2021 00:46:46 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w123sm2048706pff.186.2021.06.24.00.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:46:45 -0700 (PDT)
Subject: Re: [PATCH 04/18] vhost-vdpa: remove the unnecessary check in
 vhost_vdpa_add()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-5-jasowang@redhat.com>
 <20210623145359.bi4vrsg63la3l3id@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a1a0e772-aff3-4a06-a985-c98cbd2c13c5@redhat.com>
Date: Thu, 24 Jun 2021 15:46:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623145359.bi4vrsg63la3l3id@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/23 下午10:53, Stefano Garzarella 写道:
> On Mon, Jun 21, 2021 at 12:16:36PM +0800, Jason Wang wrote:
>> The VhostVDPAState is just allocated by qemu_new_net_client() via
>> g_malloc0() in net_vhost_vdpa_init(). So s->vhost_net is NULL for
>> sure, let's remove this unnecessary check in vhost_vdpa_add().
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>> net/vhost-vdpa.c | 4 ----
>> 1 file changed, 4 deletions(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 18b45ad777..728e63ff54 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -112,10 +112,6 @@ static int vhost_vdpa_add(NetClientState *ncs, 
>> void *be)
>>         error_report("failed to init vhost_net for queue");
>>         goto err;
>>     }
>> -    if (s->vhost_net) {
>> -        vhost_net_cleanup(s->vhost_net);
>> -        g_free(s->vhost_net);
>> -    }
>
> Maybe we can add an assert() to discover future issues, but I don't 
> have a strong opinion.


I think the assumption of qemu_new_net_client() is that it will always 
succeed (see other caller).

So I tend not to bother.

Thanks


>
> It is fine:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>>     s->vhost_net = net;
>>     ret = vhost_vdpa_net_check_device_id(net);
>>     if (ret) {
>> -- 2.25.1
>> 2.25.1
>>
>>
>


