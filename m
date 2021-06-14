Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAB3A6DE3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:59:55 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqsM-0008Sh-V5
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lsqr3-0007jL-Jf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lsqr1-0004Ks-QH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623693510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vMgchVMKLGuPNFs5d7O/d0k7U56iZ8fVz9UojGo8CE=;
 b=buCMd+WL3grffPIGu/o+JA7OXd/2pzmRSQQVQm/J2pGtcswIAQTf7zxVobFI3iH/BCvHQ1
 l1pZtQP/TQx4S77zEf6ruXOU5vm0AKbYFjkmr/NJOt/rsnz0VLIN4ImGHfr/6Py7HlhazF
 D6cSws6TGBS63U95m9Fj8SCaIV38zv0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-MdHOP8qdPTeUieQdZNWlnQ-1; Mon, 14 Jun 2021 13:58:29 -0400
X-MC-Unique: MdHOP8qdPTeUieQdZNWlnQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t11-20020a05600c198bb02901bf95ba8642so2772457wmq.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 10:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/vMgchVMKLGuPNFs5d7O/d0k7U56iZ8fVz9UojGo8CE=;
 b=GOYjbzghZEd4iPIycXKCIprpA4PxgFTCnrY7eDhbsnlVbzLvQGDd8159BTsX6lNOQu
 YylrK3Zf9TNErYmUVXHEV/eBp5laFyIL8HCm9a630w6Ekls4qHNAIyNc4BKOggyOCJh8
 pp4YEQOFQ5tfpTfuMA78kFzqWfe692zjDYYH1sB2JBYyDWyg90sE56u94XJaTyfAh6+b
 xHgSu8w+rUsoukdsEFTyZrao1ZWqigsixKOFxlB6IRbCPBea7KWOMlrYYiCQcoY8DE7d
 Ub+Blv9EEWjB2KoEqyzB4avtwz4hw+Qblwp+FQONVLOf6JiQa+R1KnVrPKDhy/oJ9alA
 DkUg==
X-Gm-Message-State: AOAM530lXltxUvda3DK+zJW4zd+F645ikRVCtFHO1M/UomEnqypDlhna
 BfaAa3pxBAArsLVki2n/3lknbJ4gu4dg5SxxTPqM0PAFu10DTYFFMiiUzXt+/LPCk75PxtzglYk
 LDBRsc9BkCMfZ7IE=
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr15983240wme.188.1623693508418; 
 Mon, 14 Jun 2021 10:58:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYD8gP89QBHmcCR7zfmhABLIiwnYADj4KLYMvIPNN8Hs8/jpd1P8btskaLTENPKZZev6ozgQ==
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr15983209wme.188.1623693508141; 
 Mon, 14 Jun 2021 10:58:28 -0700 (PDT)
Received: from [192.168.0.5] (ip4-95-82-160-17.cust.nbox.cz. [95.82.160.17])
 by smtp.gmail.com with ESMTPSA id p23sm153312wmi.26.2021.06.14.10.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 10:58:27 -0700 (PDT)
Subject: Re: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20210611114606.320008-1-philmd@redhat.com>
 <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <359bf73a-8921-369b-6cd3-5ef4964d38cc@redhat.com>
Date: Mon, 14 Jun 2021 19:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 6:03 PM, Philippe Mathieu-Daudé wrote:
> On 6/11/21 1:46 PM, Philippe Mathieu-Daudé wrote:
>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>> -ENOMEM in case of error. The driver was correctly handling the
>> error path to recycle its volatile IOVA mappings.
>>
>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>> DMA mappings per container", April 2019) added the -ENOSPC error to
>> signal the user exhausted the DMA mappings available for a container.
> 
> Hmm this commit has been added before v5.1-rc4.
> 
> So while this fixes the behavior of v5.1-rc4+ kernels,
> older kernels using this fix will have the same problem...
> 
> Should I check uname(2)'s utsname.release[]? Is it reliable?

Not at all. What if somebody runs kernel with that commit backported? I
would leave this up to distro maintainers to figure out. They know what
kernel patches are backported and thus what qemu patches should be
backported too. I'm wondering if there's a way we can help them by
letting know (other than mentioning the kernel commit).

Michal


