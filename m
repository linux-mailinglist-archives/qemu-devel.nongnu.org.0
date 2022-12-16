Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402A64E97C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:32:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67zw-0004OZ-0Z; Fri, 16 Dec 2022 05:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p67zS-0004Jv-7N
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p67zP-0000bt-B8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671186650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2RUUoFpLdW5YUbSU7pZvDX4sROylGIh4QCdYVC3TKY=;
 b=FjP5U9ODI9q3fABKCu0XmslBFt2EIvs0smGlfsXxMYsrhINK1e2cFumFgrIm/qrR7pxCib
 fPiv8zSOyao0+X6BAeu8GCjcUwY2EstlpMm2BHGPhTImM/jw+bjNOp2kpTE62a3N3MDerR
 m/nEFH0SdSxVYSXw/KMBMN3kRTcqscI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-TA8mVpvTMJ270YvPP_CVsA-1; Fri, 16 Dec 2022 05:30:48 -0500
X-MC-Unique: TA8mVpvTMJ270YvPP_CVsA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so349079wrg.16
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2RUUoFpLdW5YUbSU7pZvDX4sROylGIh4QCdYVC3TKY=;
 b=nzEWZYl7jHKbqpbeJaQuvVd95RS64e7W+1HyP6cm+C0eNINCPuchAvaVdOpDqKDiXz
 Gp/tovOtWXCIqc+U0EUdvY4jleLhQY/jVfNa5B88TiiUPKhCz2CwbQnxPqbQhtGJqhXe
 u8x5bPzyousayyJonw/azX/cQ1sy8cTe1C4G6jvAndb/TY98lnTUUZ55ynCAzmqVMnU5
 JkhwLg9u9Um0h9tVK3oYFcIMmuEEopVKnfod0WaNC9Hn6STwqp+3vzrvwYhbuB9KTVLo
 zhRwMIrHro8GDFwY2Occlcatlr2Rx7tfIAMeteajUn74VOlBv/gpAxb3SLZuJLYpYWee
 1Ayg==
X-Gm-Message-State: ANoB5pnhHLHWxqp9xEKu79quyyE8BCyjadRyddYR3IUcM/jIg/8rg6zi
 uo1oAZAc99G7WK167tDN73rpRiNEg5af8ze1M08T9T+r7Z2BqSMK1nPJBgVrAlOCwWfxPCFcY/k
 fhk5xABsGGSZcFOE=
X-Received: by 2002:a05:600c:384b:b0:3cf:6926:2abb with SMTP id
 s11-20020a05600c384b00b003cf69262abbmr25085962wmr.7.1671186647378; 
 Fri, 16 Dec 2022 02:30:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6bYHql+ScOiEALxH28Ee/yos4oTSPEyNgoBQBxWT/J0BEbiMByZeF5FAiX4ly6f1EWil7+AQ==
X-Received: by 2002:a05:600c:384b:b0:3cf:6926:2abb with SMTP id
 s11-20020a05600c384b00b003cf69262abbmr25085948wmr.7.1671186647094; 
 Fri, 16 Dec 2022 02:30:47 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:3900:7211:d436:8d8b:531c?
 (p200300cbc71c39007211d4368d8b531c.dip0.t-ipconnect.de.
 [2003:cb:c71c:3900:7211:d436:8d8b:531c])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003a84375d0d1sm10493202wms.44.2022.12.16.02.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 02:30:46 -0800 (PST)
Message-ID: <13e3d3fb-bfa7-26e3-2e21-1bb21cf577c3@redhat.com>
Date: Fri, 16 Dec 2022 11:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] virtio-mem: Fix the bitmap index of the section offset
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20221216062231.11181-1-chenyi.qiang@intel.com>
 <b661461d-fb24-c974-2d8e-d3e760e00033@redhat.com>
Organization: Red Hat
In-Reply-To: <b661461d-fb24-c974-2d8e-d3e760e00033@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 16.12.22 09:52, David Hildenbrand wrote:
> On 16.12.22 07:22, Chenyi Qiang wrote:
>> vmem->bitmap indexes the memory region of the virtio-mem backend at a
>> granularity of block_size. To calculate the index of target section offset,
>> the block_size should be divided instead of the bitmap_size.
> 
> I'm curious, what's the user-visible effect and how did you identify
> this issue?
> 
> IIUC, we could end up our search for a plugged/unplugged block "too
> late", such that we miss to process blocks.
> 
> That would be the case if the bitmap_size < block_size, which should
> effectively always happen ...
> 
> 
> unplug_all and migration would be affected, which is why a simple test
> case without a guest reboot/migration wouldn't run into it.

I just realized that unplug_all is fine because only vfio implements the 
ram_discard_listener so far and always sets 
double_discard_supported=true. So migration should be the issue (and 
IIRC migration with VFIO is still shaky).

-- 
Thanks,

David / dhildenb


