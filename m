Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB1B67273F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDMj-0000jn-5P; Wed, 18 Jan 2023 13:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDMU-0000g4-UB
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDMT-0005kV-Gq
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674067237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9547UR+94HJXEOKrgHliAbt+LVTk2+ezOroM2WA4w7w=;
 b=iyGoCwsDX/NPve74LfeKZqXpuxQ4gyNGZ5FihAKCUMId6ejn4D9UQMaSaa52vvrKuxSWZX
 nnJ+liz1RZRR57Ef+LiFxry92tFZavIrci4uiISivZ0Xdj8Q6QiZ8jVH+IOVpmkwxhRXPz
 lk1XpEA9cnbu+3NSZSnT0JqcnGkIXQU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-jDk_54LQMKOfmoStt49k7Q-1; Wed, 18 Jan 2023 13:40:35 -0500
X-MC-Unique: jDk_54LQMKOfmoStt49k7Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 op7-20020a056214458700b0053548eb08b8so466769qvb.10
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9547UR+94HJXEOKrgHliAbt+LVTk2+ezOroM2WA4w7w=;
 b=mzpyg2ieo8eVzkvQuLxidV/2g3qlPyx0cCxyCuOhoHpioLFFo8O5fa/w96YubANHZY
 K3z7fP18pcnfERLfVzfm2YGbI7qiNEOVokzbxTd1P18XJ0o0pNuhM00NJ2KdsZTdMMiG
 ue7U+Ma37aSR5fH88hpvzdoIJqS9d+u1eUTdKOUeygV+nEjm92EIamZ2VUotYIylfntE
 4LB9Y7reIEHDMDB6bMwejyBujsKJP+5BDu8fjZvZp6NiGyx51YNS0kurb37eIspxhD08
 +TswRhhi9bw8Gja2DG0Xwhnzdc1qYoFQxG0d7BCkPqbKeyPyy6FqshamdeWPxemYZvdV
 Sxxw==
X-Gm-Message-State: AFqh2kqdOQ9bR4o8ZaleG9fqkXnv9vylvD56ekqAbzty3Hq3NPv6PSX3
 zmEdxoc+gBU+No6fgH6/zhaNAHaO4yCyBx0tPKy64+G7sTsCIHjzFc6AuBAloBLU/SNFOWU0Nvt
 WsjC3u0h3tL/XJvk=
X-Received: by 2002:ac8:4a83:0:b0:3b6:3024:dde1 with SMTP id
 l3-20020ac84a83000000b003b63024dde1mr9500003qtq.0.1674067235210; 
 Wed, 18 Jan 2023 10:40:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXurM9tA8kLR916DSAikHGeZDo0xmT6qGHR21gw+VhAtxyQ4CIe4ZsvkbGdo5anfv3uRSu5RRQ==
X-Received: by 2002:ac8:4a83:0:b0:3b6:3024:dde1 with SMTP id
 l3-20020ac84a83000000b003b63024dde1mr9499985qtq.0.1674067234971; 
 Wed, 18 Jan 2023 10:40:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bz25-20020a05622a1e9900b003a591194221sm2578928qtb.7.2023.01.18.10.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 10:40:33 -0800 (PST)
Message-ID: <217b8c77-8f2f-b92b-1727-019ba4f348b1@redhat.com>
Date: Wed, 18 Jan 2023 19:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com> <Y8FQ9li7gQ+bPiRe@myrica>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <Y8FQ9li7gQ+bPiRe@myrica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Jean,

On 1/13/23 13:39, Jean-Philippe Brucker wrote:
> Hi,
> 
> On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:
>>> Jean, do you have any idea about how to fix that? Do you think we have a
>>> trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
>>> like virtio probe and attach commands are called too early, before the
>>> bus is actually correctly numbered.
>>
>> So after further investigations looks this is not a problem of bus
>> number, which is good at the time of the virtio cmd calls but rather a
>> problem related to the devfn (0 was used when creating the IOMMU MR)
>> whereas the virtio-iommu cmds looks for the non aliased devfn. With that
>> fixed, the probe and attach at least succeeds. The device still does not
>> work for me but I will continue my investigations and send a tentative fix.
> 
> If I remember correctly VIOT can deal with bus numbers because bridges are
> assigned a range by QEMU, but I haven't tested that in detail, and I don't
> know how it holds with conventional PCI bridges. Do you have an example
> command-line I could use to experiment (and the fix you're mentioning)?

You will find command line examples in

[RFC] virtio-iommu: Take into account possible aliasing in virtio_iommu_mr()
https://lore.kernel.org/all/20230116124709.793084-1-eric.auger@redhat.com/

Please let me know if you need additional details.

Eric
> 
> Thanks,
> Jean
> 


