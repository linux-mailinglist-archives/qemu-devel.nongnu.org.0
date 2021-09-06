Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F84018C3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:24:01 +0200 (CEST)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNArA-0004Or-65
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNApt-0003fL-KQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNApq-0004Nq-Mw
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630920156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1fy9p9mxhj3f2wBoPdzmb5wB7i6lsG/aHGwlzogzFY=;
 b=LRW3nUJAbwmhtWrKGItPzy70cus6DmQmIb/WNoZ68dMdoabBmjpciujPjY7yvazb2RSxoi
 6KBQhMk50MRR/O7bfqSIEw8uX0pP7tPf/yGB+l9+63t4OZ8gv11dA57fjmquyMLOwIQpxp
 vj+44c+bm1APILEAi3fsWFauiFItXAc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-lSFUTwyHOL67VEzQVVqvtg-1; Mon, 06 Sep 2021 05:22:35 -0400
X-MC-Unique: lSFUTwyHOL67VEzQVVqvtg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso2999536wma.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=I1fy9p9mxhj3f2wBoPdzmb5wB7i6lsG/aHGwlzogzFY=;
 b=DnOEa+j58G/5iVF7XJLgxh+ipBqPZVXSsaTnEHWSN+wVrrE+vBdyYh98FijWVpRaQL
 sAvujAwylsSz/6a1MrBigE7Vm5YgvGNHrRmOoFiPbcrDsDN/inw6FMpa+ZXTbnQD/eO+
 buJxtKda90Ck7x5bMe2L0NDm7croTrzzn6j7BZ9sLaIKgRhfG/xtIGbESOFEKAEmNReK
 VGe8Cj4MxeFTXwB2mRVRV4MJD/Z7E969sVYitFIlQYoduKFFly2DahFxTu3AnUVBITCd
 0TFgDgQJ0mjVzHzFWm7SYlHUU69Qn3ZS1ETC1xtsTJm9xk2UdeGYHnXH/sWCwcKZUbVG
 0svQ==
X-Gm-Message-State: AOAM530KKOVk+k6ocIQT/wKLAnKoG2u+JhoU0OlOa2LeflEEIyaqiGpv
 TFO5p6Imay3A/oAsCOJ79/hiAebye14csy/XX+qUY/+Rz58KlPTtaGiXZWGxFgaqFPEL8Ms+8Fi
 Ze2LDw7D2vHOAXoU=
X-Received: by 2002:a5d:690a:: with SMTP id t10mr12341272wru.304.1630920154194; 
 Mon, 06 Sep 2021 02:22:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5XN4TJsaGBwF6k6v8fhqxG8F/IW3EnjczZJTGgR70CupoF8AO0mXl8RCLhBGseNSkCpkLvQ==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr12341247wru.304.1630920154002; 
 Mon, 06 Sep 2021 02:22:34 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v21sm7636676wra.92.2021.09.06.02.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:22:33 -0700 (PDT)
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org> <YSQjBX9SwzgNGiag@t490s>
 <CACGkMEttajn8xihZCw8UYVHxGu1wE8eDoEhuc7Ug7_Q_aKCyRQ@mail.gmail.com>
 <YSUVO7sVsgsZiCHF@t490s>
 <CACGkMEvYxibuozehc3m2rETBTWNWT4jg+M5RA1-4rMDW78f8yw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <49aca8d2-ddcd-2b16-a29f-41c54302c38d@redhat.com>
Date: Mon, 6 Sep 2021 11:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACGkMEvYxibuozehc3m2rETBTWNWT4jg+M5RA1-4rMDW78f8yw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 8/25/21 6:23 AM, Jason Wang wrote:
> On Tue, Aug 24, 2021 at 11:50 PM Peter Xu <peterx@redhat.com> wrote:
>> On Tue, Aug 24, 2021 at 10:52:24AM +0800, Jason Wang wrote:
>>> It looks to me this doesn't solve the issue of using virtio-mmio with vhost?
>> No IOMMU supported for any of the MMIO devices, right?  Or am I wrong?  Thanks,
> I guess virtio IOMMU has that support, but I might be wrong.

No that's not supported yet in QEMU. There is an inflight contribution
attempting to support vSMMUv3 protection for sysbus devices though:
[PATCH v6 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices

Thanks

Eric
>
> Thanks
>
>> --
>> Peter Xu
>>


