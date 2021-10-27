Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E543C304
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:28:52 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcQd-0005Lt-Ps
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfcMk-0003yJ-8o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfcMf-000186-MG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635315883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7/VtSRrk+TO0Zn3mniNBWgzKVcw7ozqzxl93FsPIqs=;
 b=JA26URVwlZX7+8FiE9KDPA2v9HAqljlFlzHKdWsexC0rKxZk+qzSdq0iIwhQm8FMQYMlVL
 k22b979nv1rp2DNlf/A1Meh56TyYDCcqaQFKNy/D+6fcnA9lmJBjMShBeyvuOKItvv6ZQj
 vLa5CJtNmxYO6xw2Vl4MX0xt+1w65j4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-5ZufrtMuNsq1DXb3ujQPQw-1; Wed, 27 Oct 2021 02:24:42 -0400
X-MC-Unique: 5ZufrtMuNsq1DXb3ujQPQw-1
Received: by mail-pl1-f197.google.com with SMTP id
 w8-20020a170902a70800b0013ffaf12fbaso808663plq.23
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C7/VtSRrk+TO0Zn3mniNBWgzKVcw7ozqzxl93FsPIqs=;
 b=FyiFS4yKLRQo91I7/sTNKpUwlZgSpVyRsainRv5FzdbFohxv0AZDIEqdZJVGzgIUg/
 8NtM9EtTjIua/mii+oPyBThraEMbD3ZRx8hshRPDZWkmcvrFXsfwcSNGgtdN76jDf2Be
 fBxIUNZu4GAnx71ysjmdAJRbKxv2+Y5tEwScjcbRAdbHgtVyEn1UIljT+5S0c/L8iV4p
 5DVU/Ewzoly6nJbnOzHbY+f+ILa3MH/aMpm0CMf1M2j3LT9pOAbCOEXcxPVhjA93qZ6R
 l7u32QlgN18DXGWJsZnRblOvSvkBe5SdFB/E3JujFU/Z8nHo2qZ4nPkcvB5ZE9m5M2Yk
 QyQQ==
X-Gm-Message-State: AOAM532g9ut6+TinVeAa1UhR9ACZMIhmL9eNcGhg2q55tVJiWE1KDJGW
 Dh1dR3CTYh+qDcCmg9hZFWaZjM+/pNb/Rv836GkgMxBpSO23as90lQTh0YcMCypRcdLmRTNzd60
 /0vk+xHBUUJafZkc=
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr22682945pgs.312.1635315881132; 
 Tue, 26 Oct 2021 23:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzotNgwjuusHOkM6DXaEdPFk7ErxXScqBDL7kuaFONn4elxoYazfl6sTIGXqdYxlOgB1P7gtA==
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr22682924pgs.312.1635315880832; 
 Tue, 26 Oct 2021 23:24:40 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k22sm24750363pfi.149.2021.10.26.23.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 23:24:40 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
 <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
 <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fbdf6a0d-739f-9949-abf1-35b7ed1a29da@redhat.com>
Date: Wed, 27 Oct 2021 14:24:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/27 下午2:19, Zhang, Chen 写道:
>> mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr
>> _support][,position=head|tail|id=<id>][,insert=behind|before]``
>>> +    ``-object
>>> + filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx
>>> + [,position=head|tail|id=<id>][,insert=behind|before]``
>> I wonder if we break management layer. If yes, maybe it's better to keep the
>> vnet_hdr_support here.
> Yes and no,   With this series of patches, filters have ability to automatically
> Configure the appropriate vnet_hdr_support flag according to the current environment.
> And can report error when can't fixing the vnet_hdr(The user cannot fix it from the previous way ).
> So I think no need for the user to configure this option, some relevant background knowledge required.
>
> For the management layer, keep the vnet_hdr_support may be meaningless except for compatibility.
> In this situation, Do you think we still need to keep the vnet_hdr_support for management layer?


So it depends on whether management layer like libvirt has already  
supported this. If yes, we may get errors using new qemu with old libvirt?

Thanks

> Enable/disable it do the same things for filters.
>
> Thanks
> Chen
>


