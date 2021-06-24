Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCBA3B2866
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:12:06 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJWv-0000hA-Fb
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwJVu-0008PF-Ft
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwJVr-0001Ux-Ce
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624518657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyicUO/+pXFbvhbUQOrgpeudkm3K9MpOVFVwKErW1SE=;
 b=doMZy3v3ZyoiVIIls0gRW2yWeCOxHTFkTctMfQqAYlyAs6YsTyShppIfcxgFBrQis438Kd
 aBkyb0QeC95OFUc7dKPem8fsfdL4eVSaxinUqMzzfXx5mMJaaH6YI/I1zyNGkI9KX2pkZQ
 LyF+b+rKjNNCWPQotBSSz4CyUttlhKk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-z8QzIcEXPrW7s2sPjigO-w-1; Thu, 24 Jun 2021 03:10:56 -0400
X-MC-Unique: z8QzIcEXPrW7s2sPjigO-w-1
Received: by mail-pl1-f200.google.com with SMTP id
 x17-20020a1709027c11b0290122d280f05bso1859764pll.8
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lyicUO/+pXFbvhbUQOrgpeudkm3K9MpOVFVwKErW1SE=;
 b=U+TGTaII5fHESjO9+F/jwo1EG76w1LleOeEhTPqPHHC0+HWSKOF5wSQyChBCbmyDG0
 sC+4HygGJO+fMYvKkx+oHTs5qtxw9y3xFZgFiQ4eEwB+0tHNGo7yfOlch0/GXWKZWqZX
 WCdn28Ygk0cEcl9fEHIkWavv7YTytMHF2bxMsCALFOJEEM72M2uHRBCiqSPW1gnGP9N4
 XdQp7kqkM+B0xOA9Ccd2CVrMIMK2Ktt1Otc4n19EeBuwg2vW932NA+0lIClQlAhO2MRp
 jRtOUoxbX/0rPrkBc/ozO+YDWS6zZEpb0uFhTal//rU8JOSXQUTJZeyiFZhe6rk9iXzd
 oY9w==
X-Gm-Message-State: AOAM532f4TahXincOShvHMMgK5yG5tN7xTY84XRvD3F3qheOlPxdK/bF
 2bImYNJApLbYUs0geBlOhrC6V0b/te/YKCT42LSj2cbegK6+d6jVuDhOdeMx1JXa1dYxSPQJvsq
 81ZnxE6xvv8At/mg=
X-Received: by 2002:a17:90b:2504:: with SMTP id
 ns4mr689189pjb.140.1624518655189; 
 Thu, 24 Jun 2021 00:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpZf9Ixpo0ZHLGlZEnTrjGdsy2yKa7x48gErzCMMgpFlAwBxV1Obzorcw7K//kMxWWWawBKg==
X-Received: by 2002:a17:90b:2504:: with SMTP id
 ns4mr689164pjb.140.1624518654943; 
 Thu, 24 Jun 2021 00:10:54 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z6sm1356870pgs.24.2021.06.24.00.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:10:54 -0700 (PDT)
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
To: Eli Cohen <elic@nvidia.com>, Stefano Garzarella <sgarzare@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
 <20210623150016.mdrk35bkxfr3ww43@steredhat>
 <20210624070609.GA41237@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <53867f1d-5b57-29f0-ff1d-a3f2002c4324@redhat.com>
Date: Thu, 24 Jun 2021 15:10:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070609.GA41237@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/24 下午3:06, Eli Cohen 写道:
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
> This check is redundant. net is not null.


Actually, it can:

     net = vhost_net_init(&options);
     if (!net) {
         error_report("failed to init vhost_net for queue");
         goto err;
     }

Thanks


>>>          vhost_net_cleanup(net);
>>> +        g_free(net);
>>>      }
>>>      return -1;
>>> }
>>> -- 
>>> 2.25.1
>>>
>>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>


