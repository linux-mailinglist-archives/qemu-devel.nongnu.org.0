Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2873350479B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 12:33:22 +0200 (CEST)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng2DY-000680-Rj
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 06:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ng2BE-0005LV-QQ
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 06:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ng2BB-00047D-Ov
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 06:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650191449;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHbbU62HAo+2yn1QoC2sAt1GJpPAVVxoGsvADElQIEc=;
 b=CT/435o8DDm00mHHEve5qXzqfRS691lfAYn5wEc5yFA05uo7uTlKdL0bH9lGW/zOqZOPHE
 9/iFck/li1o2N5WgmDLsQTGVqb5maJJBhQ7MYfMHMOSGA0kyNHp+nQNMS+sNoZJ4GmFBGV
 CBvU6Z38c57boc0GvPVJ020sBas2J2U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441--oTQtRLBNs-0-5cRAEnDyw-1; Sun, 17 Apr 2022 06:30:48 -0400
X-MC-Unique: -oTQtRLBNs-0-5cRAEnDyw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i184-20020a1c3bc1000000b0038e4c5968b5so8585920wma.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 03:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=PHbbU62HAo+2yn1QoC2sAt1GJpPAVVxoGsvADElQIEc=;
 b=HyrGVtQAp1CMf92szDzG5qtZOEbpUt0//q8zU0GLMTTLXw7yUj6O/Rv7LgNK6KPttF
 A31/c5cyvjRCb2RgQeMB3DeKBunmlN8CeZlF73yh6j1TljbGQW9xzGnPFiGTIG5g8sUW
 u40JETgHwdi4rcORDZGVKeItGC78FJ2b4+ShF5HQvesefjP6r/st0oi8bT2QVz0vDpLy
 UrN5f7htavVbcx2EntaNlqYtA0s6q2iYu9Dhy/9ldcVGAEgx98DhDctA0z4V26g/rHEc
 I3DtT/6PFoCPs5N0cqFsDu6ijKYWopm56l66EiXvB5LP4ZhcRsaa7uy1rCyUnZzro61l
 dj4g==
X-Gm-Message-State: AOAM530vVzaL5yZxMbPmzzz2pnvDAtp04u7D6Y+DucuVcRMnvblegEuH
 D2wdi2BChnYnV1j0Pzq1LqtWe9JqFAZFLVTyzrn3D2IeXMitz6t3bNQ+5nBRcnxp5H4HVO1prhH
 xzWLPL9bsrTopcgk=
X-Received: by 2002:adf:90e9:0:b0:204:2ee:7d5 with SMTP id
 i96-20020adf90e9000000b0020402ee07d5mr4979515wri.536.1650191444806; 
 Sun, 17 Apr 2022 03:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOgepzP0Qhj28I9+rO7u9OMUqOzXLmpTBzQujGVxXvsSse5itwwDWFec5f51/YFzPF3NP6sQ==
X-Received: by 2002:adf:90e9:0:b0:204:2ee:7d5 with SMTP id
 i96-20020adf90e9000000b0020402ee07d5mr4979488wri.536.1650191444545; 
 Sun, 17 Apr 2022 03:30:44 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b00205aa05fa03sm7776205wrr.58.2022.04.17.03.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 03:30:43 -0700 (PDT)
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
To: Nicolin Chen <nicolinc@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <Ylku1VVsbYiAEALZ@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <16ea3601-a3dd-ba9b-a5bc-420f4ac20611@redhat.com>
Date: Sun, 17 Apr 2022 12:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Ylku1VVsbYiAEALZ@Asurada-Nvidia>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 chao.p.peng@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 peterx@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, kevin.tian@intel.com, jgg@nvidia.com,
 eric.auger.pro@gmail.com, yi.y.sun@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Nicolin,

On 4/15/22 10:37 AM, Nicolin Chen wrote:
> Hi,
>
> Thanks for the work!
>
> On Thu, Apr 14, 2022 at 03:46:52AM -0700, Yi Liu wrote:
>  
>> - More tests
> I did a quick test on my ARM64 platform, using "iommu=smmuv3"
> string. The behaviors are different between using default and
> using legacy "iommufd=off".
>
> The legacy pathway exits the VM with:
>     vfio 0002:01:00.0:
>     failed to setup container for group 1:
>     memory listener initialization failed:
>     Region smmuv3-iommu-memory-region-16-0:
>     device 00.02.0 requires iommu MAP notifier which is not currently supported
>
> while the iommufd pathway started the VM but reported errors
> from host kernel about address translation failures, probably
> because of accessing unmapped addresses.
>
> I found iommufd pathway also calls error_propagate_prepend()
> to add to errp for not supporting IOMMU_NOTIFIER_MAP, but it
> doesn't get a chance to print errp out. Perhaps there should
> be a final error check somewhere to exit?

thank you for giving it a try.

vsmmuv3 + vfio is not supported as we miss the HW nested stage support
and SMMU does not support cache mode. If you want to test viommu on ARM
you shall test virtio-iommu+vfio. This should work but this is not yet
tested.

I pushed a fix for the error notification issue:
qemu-for-5.17-rc6-vm-rfcv2-rc0 on my git https://github.com/eauger/qemu.git

Thanks

Eric
>
> Nic
>


