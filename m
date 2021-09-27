Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F5419152
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:09:36 +0200 (CEST)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUmdi-0004hT-Nf
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mUmc5-0003wD-A3
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mUmc1-0008Tg-H6
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632733667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7ns1ugZhOzPMjpo3MJvSmpO1/M1grl7hfzSUDAv8Qc=;
 b=U5oQE8mdCPbpeaCn04V69CcuVwP7XfnvnjPma2+/jugTwg3EnfjMWGJFmeO+ne70Ago5h1
 3PqwrzHu6SrW2ZFBVZ1N79yfTdmkW66JpVQ1AcUB2VjdTtCHlP8yjJIQMr7Wc4U0f+8d9m
 oOPR9ylDLBJtfdceljYelZk4eTAoSlM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-vurYHMy3O0ucrT56zSz9kg-1; Mon, 27 Sep 2021 05:07:46 -0400
X-MC-Unique: vurYHMy3O0ucrT56zSz9kg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u7-20020adfed47000000b0016061b6caa8so3017957wro.16
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=u7ns1ugZhOzPMjpo3MJvSmpO1/M1grl7hfzSUDAv8Qc=;
 b=uOj0Zo8o8wM29FMPu2CUtTzA6pkxwBx3FD23A7xvT6COoSQVVOAsAg7Cp/yWx1yVxg
 YC+jMjvpmutnn7IUczN7ShX/mDGb4GkJbKAS7MTnFeYw3we6lXAvra3Qn8xUUEgU//uH
 5MMXFGT6QGyqjSzPZK9deUcMaAMRT9ttmLkVtmGgZXXU1ARZCZUFdlSbPtZZnRZaX/9I
 hBgrwYIzEsRw1Tl41UVn/+aGTL2UL6zSkXBKENmV+f+sBxc7xf6hlcadIZkIhSY33Pkg
 wotGzDtnVF5zSrNQS89MOE4dF5FqUo0v+2gtWBof6+tU1dOREc+gLZjy8f/Fc9CQZ8et
 Vq+w==
X-Gm-Message-State: AOAM530E/L5PwQNzba5FrGif1kZVUhL9AM8zGz1RtF/EfttclkX79OK+
 ZgRJWPepOxKwz1OEDenqMZrOxIIFFE3y/6ZF2rMotO1gwWvuicEqRp4i6azJvf3/zsA64BFP1aw
 K5h8+m6oDn1XBq90=
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr26453992wrs.58.1632733664996; 
 Mon, 27 Sep 2021 02:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM+WMCya60Ee5kSxyuqImP5moqXfA3NzSDg8u5PwhQP4vhrPk1fK+FeAsLyGkyiNxPkq4p0Q==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr26453965wrs.58.1632733664773; 
 Mon, 27 Sep 2021 02:07:44 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c654d.dip0.t-ipconnect.de. [91.12.101.77])
 by smtp.gmail.com with ESMTPSA id
 w21sm2471277wmk.15.2021.09.27.02.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 02:07:44 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>,
 David Dai <david.dai@montage-tech.com>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
Date: Mon, 27 Sep 2021 11:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Igor Mammedov <imammedo@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.09.21 10:27, Stefan Hajnoczi wrote:
> On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
>> Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
>> to VM, so driver in guest can apply host memory in fly without virtualization
>> management software's help, such as libvirt/manager. The attached memory is

We do have virtio-mem to dynamically attach memory to a VM. It could be 
extended by a mechanism for the VM to request more/less memory, that's 
already a planned feature. But yeah, virito-mem memory is exposed as 
ordinary system RAM, not only via a BAR to mostly be managed by user 
space completely.

>> isolated from System RAM, it can be used in heterogeneous memory management for
>> virtualization. Multiple VMs dynamically share same computing device memory
>> without memory overcommit.

This sounds a lot like MemExpand/MemLego ... am I right that this is the 
original design? I recall that VMs share a memory region and dynamically 
agree upon which part of the memory region a VM uses. I further recall 
that there were malloc() hooks that would dynamically allocate such 
memory in user space from the shared memory region.

I can see some use cases for it, although the shared memory design isn't 
what you typically want in most VM environments.

-- 
Thanks,

David / dhildenb


