Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548832B693
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:28:51 +0100 (CET)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOkL-0007oa-Uo
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOhy-0006G2-F3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOhw-0004ZC-RQ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLxfRhJuVUpBJomhAyzcOGm+4EL9t754GbjPWvFTcCU=;
 b=Mw8VQsYlf/GesbqaSVAtI3Vkne/nwSwXkAV2SpHNNAc17xB8rpu1UmHPgNkiWN4cg/OHGb
 daHgo84hnZWefmWwwEyNePMdo9vALDv3/QGYEo9OzuZq3C0jriwR5aJZ6gyv73TDMsg3gl
 cm4XnqTe7ofda6actNFAr4rJ5+DDGHo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-yBBAnhmDNkaQ1lS4GzkB0w-1; Wed, 03 Mar 2021 05:26:16 -0500
X-MC-Unique: yBBAnhmDNkaQ1lS4GzkB0w-1
Received: by mail-ed1-f72.google.com with SMTP id bi17so5876edb.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wLxfRhJuVUpBJomhAyzcOGm+4EL9t754GbjPWvFTcCU=;
 b=lIIVyC4nN44hegnz9mu4delWI/PC3Td08kpvRRF8ezRFh+rIOSwGh5sGhWnzrKJqa2
 uUjJyf2f0LsjJ3QbySag3lL4NiUlRDuDrchO/VHLHw4qwc8/+RZG3iVfSUFyunCJM3QR
 2Z68MAoU28TmVB0pj0y3/3ZUvYCL5zZLlNBcnguhTNML/kmOXJA35xriZlyct5d2Wdqg
 eZVlA/vnNbc1lp0qK4OTOrjGbntO6IW/dpgdbDTOhaIiViP2aThETidiK8x2uyBH1g3f
 8i2jrBQOkBWRiHEl4k89kYqdplQQyo8WcPTHBXLC+FE8SoyKC10QsO4M17ecwwS2S/pL
 8R0Q==
X-Gm-Message-State: AOAM530H6595kYCzKMENW8YrtBIk3d/yLVSPzMmVihqodb6n/YoJAL6z
 k28z7VA7m6t6R4fwnlrQ057dngRNi4kI+haVlQQuyyn6Ofn9WWQZI2ZjPvKqjyKtR/OhgGTbCJL
 j02tf4zF0EZeNcvw=
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr19193269ejj.204.1614767175509; 
 Wed, 03 Mar 2021 02:26:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJCXLbr4BC4hDB3ZG92u9qQJDaUt693E3nYqh4XbgIOHnEShI9H4lD1ZBmBo3rDPFsWF1Ijw==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr19193256ejj.204.1614767175353; 
 Wed, 03 Mar 2021 02:26:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h10sm9468951edk.17.2021.03.03.02.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:26:14 -0800 (PST)
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Denis Plotnikov <dplotnikov@virtuozzo.com>
References: <20210303070639.1430-1-yuzenghui@huawei.com>
 <YD9iTgCNgrsbzWfx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b81b241d-a439-2ae3-58be-b2ce9be9d78e@redhat.com>
Date: Wed, 3 Mar 2021 11:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD9iTgCNgrsbzWfx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 11:17 AM, Daniel P. Berrangé wrote:
> On Wed, Mar 03, 2021 at 03:06:39PM +0800, Zenghui Yu wrote:
>> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
>>
>> * Variables declared with g_auto* MUST always be initialized,
>>   otherwise the cleanup function will use uninitialized stack memory
>>
>> Initialize @name properly to get rid of the compilation error:
>>
>> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
>> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>    g_free (*pp);
>>    ^~~~~~~~~~~~
>> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>>              g_autofree char *name;
>>                               ^~~~
> 
> This is a bit wierd.  There should only be risk of uninitialized
> variable if there is a 'return' or 'goto' statement between the
> variable declaration and and initialization, which is not the
> case in either scenario here.

See also commit 076b2fadb58 ("gdbstub: fix compiler complaining").

> 
> What OS distro and compiler + version are you seeing this with ?
> 
> Also we seem to be lacking any gitlab CI job to test with the
> multiprocess feature enabled
> 
> Regards,
> Daniel
> 


