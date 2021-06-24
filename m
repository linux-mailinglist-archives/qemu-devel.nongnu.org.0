Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96C3B2991
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:42:23 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK0E-0004if-WE
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwJzD-0003rA-2s
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwJz9-0000uu-QV
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624520474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Nf5w++S82XbzI7YG9+gploOmccUTxACt/SjTq/rGS4=;
 b=H6TKPUQQCllJCl05pBVXEDGwiUcUYeV3h3gf02flMHkEXtmujoLw545OrYaRyoygZ56sj6
 2XWogh0rYoOg6Gx2XyA+d6uQEn3i2paN3Ikqu2LIDoFPI9xu9749NIHXcObB5jhVfxuX5v
 fP0kRvbYPO4/oe2rwJd25oXe0Wsnb7I=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-1MkYhcJ2ONy0b1n1dOag7w-1; Thu, 24 Jun 2021 03:41:10 -0400
X-MC-Unique: 1MkYhcJ2ONy0b1n1dOag7w-1
Received: by mail-pg1-f198.google.com with SMTP id
 k14-20020a63d84e0000b029022216b0ebf2so3280278pgj.15
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1Nf5w++S82XbzI7YG9+gploOmccUTxACt/SjTq/rGS4=;
 b=pLaiY2GPJr7/4i6zThqip4yrsUZ7CR9mANeidz16bci8Cf8I+7hTZRQQuCIp5ZSJhx
 C6J3B3VhfD3YN9q55oOjpihUc3T1z9xSriig6OlmJXXiYP6UpyPzgPxtMaCWybOTDPNP
 WTtzlpyalu3vtzi1vUvgndbZ8VSH8DWooHtYXZ9wiqJGgCO/KdSkhSivB7TDGvfyQlgj
 pre3uPENdY9ouoX+I7CJ9NM+XjGV43F/zNl6NysBTh41gKhIVfxtqYUSE2NsPiC6slkP
 OIppIbHyJ0ZzF8pTNhJTSJ+Ew9ZFNpf1oVSj6HhggRQuCL9pAiBlWgR7M1aHV797y2IR
 4tvQ==
X-Gm-Message-State: AOAM531PxIumi7cbJWa3JfYTysbTDDsL3ODb2iF0N5TaQFhq5wSvDLs4
 s2LNsHPV1ryNoWknyw6ze8XaI+rQgSQhb5i8BKXP/jlcPVer95/hCCbTb+ePPRoPqxtmhWgqf6Z
 A/unbvWek+8eYMEA=
X-Received: by 2002:aa7:9569:0:b029:2f8:2cf3:e9dd with SMTP id
 x9-20020aa795690000b02902f82cf3e9ddmr3992456pfq.10.1624520469559; 
 Thu, 24 Jun 2021 00:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDnu4f+q/pcCE9OL1h67a1MuM6pdZvCrQCCw9vBcXmOr0qZDVrzClI67K1n/Y3w6Vk2Vlz+w==
X-Received: by 2002:aa7:9569:0:b029:2f8:2cf3:e9dd with SMTP id
 x9-20020aa795690000b02902f82cf3e9ddmr3992431pfq.10.1624520469314; 
 Thu, 24 Jun 2021 00:41:09 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n69sm1948607pfd.132.2021.06.24.00.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:41:08 -0700 (PDT)
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
To: Eli Cohen <elic@nvidia.com>, Stefano Garzarella <sgarzare@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
 <20210623150016.mdrk35bkxfr3ww43@steredhat>
 <20210624071435.GA41596@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <79979847-ef14-ade7-b8f9-9b2ad6971757@redhat.com>
Date: Thu, 24 Jun 2021 15:41:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624071435.GA41596@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/24 ÏÂÎç3:14, Eli Cohen Ð´µÀ:
> On Wed, Jun 23, 2021 at 05:00:16PM +0200, Stefano Garzarella wrote:
>> On Mon, Jun 21, 2021 at 12:16:38PM +0800, Jason Wang wrote:
>>> Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>> net/vhost-vdpa.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index f5689a7c32..21f09c546f 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -111,6 +111,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>>> err:
>>>      if (net) {
>>>          vhost_net_cleanup(net);
>>> +        g_free(net);
> Shouldn't this call be part of the implementation of
> vhost_net_cleanup()?


Not sure, at least there's one user that doesn't do the free (see 
vhost_user_stop()).

Thanks


>
>>>      }
>>>      return -1;
>>> }
>>> -- 
>>> 2.25.1
>>>
>>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>


