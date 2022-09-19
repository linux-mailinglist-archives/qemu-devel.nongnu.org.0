Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393045BD495
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:13:39 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLGz-0001bf-PW
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaL3B-00081D-5d
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaL32-0006KJ-El
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663610350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrgUlsPUm1lxtvse+uEsL21auprLeIbkX+cOYEtE9fg=;
 b=iUd6gTr47UEMzNi8YzqClXjAUJJQz94yJzx8ZWK94btaCxzLvhVxcWQD378vyZ4lqC0mWL
 tS/Ka5/NFwU9uaKPiA9zYac0w9LeEr63VoxYIrAw01PhrpkSCIsXTrstvLnbkCkJMmfXOT
 JGhRsxQX33/2h8qbPSxhCZz/7geFvik=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-fsEdER0sPfKI-xo9eLCUig-1; Mon, 19 Sep 2022 13:59:09 -0400
X-MC-Unique: fsEdER0sPfKI-xo9eLCUig-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so175065edz.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qrgUlsPUm1lxtvse+uEsL21auprLeIbkX+cOYEtE9fg=;
 b=vChB00A40dlwFkdGIsChoBj8MeUgrGJv5GcJC+5+6lpqRGYS8/hXy9R5IL0MDI1CS7
 FkjfzwapzimveuhDpKCWI0DFGYafULEanonDA2CtZQklvXXCaRrMdklHrq6Q29eCGKiB
 /4Mr0eZehAdgdNAqriLWf2PgKDuJ4m2qyhj7cX+Z42wpuGYjQypXThlyEr1rwUyJc6mv
 5S4RT0FGYnCNEbCWxC5izejCgb1YEcIAVoBbnJrwZ2s4Sy4RVJ1dYYdGCUYQMn+qDGfs
 7TC8CJLumgLLje1Co/i8P0KgDlakIqnOtdi616BNthyLnoV7nmmgEKc8Eqai2Dcv6a9V
 zR0g==
X-Gm-Message-State: ACrzQf08MLgFBR9rMYnxhsBKVLFSzbT+CbTS3Lpgo7bGGZtgwL5gilLA
 yWZhouLkzTMd+B/07/SvMKPvv/di0tUbOANQUfojVX0is8rhvI4NUGcq7eKJUbgaBAUG6bTTu2e
 TjOFc/4Zh5bSzJ+M=
X-Received: by 2002:a05:6402:b85:b0:44e:dad7:3e24 with SMTP id
 cf5-20020a0564020b8500b0044edad73e24mr17179796edb.264.1663610348329; 
 Mon, 19 Sep 2022 10:59:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Z3tfkNtzcw6Zj18xVKx3kdeyMkIZHDl/7zm1p4vVpK7o7arV8J5A+ys5CMiw1zxgdyle7CQ==
X-Received: by 2002:a05:6402:b85:b0:44e:dad7:3e24 with SMTP id
 cf5-20020a0564020b8500b0044edad73e24mr17179761edb.264.1663610348114; 
 Mon, 19 Sep 2022 10:59:08 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 c10-20020a17090618aa00b0078194737761sm508008ejf.124.2022.09.19.10.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 10:59:07 -0700 (PDT)
Message-ID: <51bfcb7d-b929-b192-bd7a-158f494d2d30@redhat.com>
Date: Mon, 19 Sep 2022 19:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/8] qtest: "-display none" is set in qtest_init()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902165126.1482-2-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902165126.1482-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 18.51, Juan Quintela wrote:
> So we don't need to set anywhere else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c      | 2 +-
>   tests/qtest/fuzz-lsi53c895a-test.c  | 2 +-
>   tests/qtest/fuzz-megasas-test.c     | 2 +-
>   tests/qtest/fuzz-sb16-test.c        | 6 +++---
>   tests/qtest/fuzz-sdcard-test.c      | 6 +++---
>   tests/qtest/fuzz-virtio-scsi-test.c | 2 +-
>   tests/qtest/fuzz-xlnx-dp-test.c     | 2 +-
>   tests/qtest/fuzz/generic_fuzz.c     | 3 +--
>   tests/qtest/fuzz/i440fx_fuzz.c      | 2 +-
>   tests/qtest/fuzz/qos_fuzz.c         | 2 +-
>   10 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


