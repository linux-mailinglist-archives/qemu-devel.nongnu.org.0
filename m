Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B343947B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:07:01 +0200 (CEST)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexoi-0001uI-BC
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexnC-0000hN-NX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mexn8-0003aP-4C
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635159920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkFFP+Jr2BY9vMzJ0cFYr9O3kVeLom+TyTuy//tyM+8=;
 b=NTz+z1J36qux16SczcMxS+Xu3TViBKe2pptPG4Qd/dEu1HplXXZOhXeyZiAzCQkaKOrTp2
 iI8snXRE1xbxx8yp6rtGzsMC4QRrqHI4OAEHQCuy+Q4T7L/7szc8fY1T75SKkz3venBAQU
 je+oCpbfKU8gMU2QgtLxUidNTMjqyoE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ESKqt6LNMOKjYZLGnDnigA-1; Mon, 25 Oct 2021 07:05:19 -0400
X-MC-Unique: ESKqt6LNMOKjYZLGnDnigA-1
Received: by mail-wm1-f69.google.com with SMTP id
 q13-20020a1ca70d000000b0032ca7b7fad6so2040290wme.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=EkFFP+Jr2BY9vMzJ0cFYr9O3kVeLom+TyTuy//tyM+8=;
 b=l54goeAjaBKPQH2/xM3n5kQ4pRwOSkrFy7WXFJVhhl5Lgji4FhXXcyH+zrcpVBM61B
 6ZyeZq6nxQIgNgq1flGf4TbtiBI1v3awk4XPwCmyprKBgHPnKKWPAj2uo17DunnlJPHB
 lsr/gwO5g7Z95btm+YZWw8/gc/y8mRZjoH0aP5X3/ou/lNeA6II5XYMQ/ta11upGISN8
 8rOFJ5ySgv+0boNe/DMt6lA9+KjWhVG4V4PzzVSHjo7RDvlgcjuSeSwFh39YWLsaDvtK
 d2tRJfmYfbpjVdqI5gRxkFBmLT4xPZpiuMFfAwBh7A1KZKlG8h0Ze3iJizFi2LAXQFCy
 LKbA==
X-Gm-Message-State: AOAM532islK6aJJ9zSnTuChFnb1854Sg5fDRoVUOprHr6KKFk0fjumWu
 OM3EJTQ7dAoXuxVYR1vrm0MjOkR/ibDjiYC9+wwS7slqUlcJfXuZuGjZmsO/Yafee9VPe9ma9B4
 shSALBTeVn8O7/dg=
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr9357945wmb.57.1635159918250; 
 Mon, 25 Oct 2021 04:05:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv8Iqt15BwG5YgJAoAY1+EfAOBzyI5C/qGejHzwFj5PsEfVhWmSQ9MGbt/cxrIfiTXFoIZ5Q==
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr9357910wmb.57.1635159917986; 
 Mon, 25 Oct 2021 04:05:17 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 25sm18475062wmo.18.2021.10.25.04.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 04:05:17 -0700 (PDT)
Message-ID: <0eec4002-0061-69c1-4ca8-92f9e9263ed1@redhat.com>
Date: Mon, 25 Oct 2021 13:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
 <3ff66c29-7377-3fb5-a317-50e5a12eeea6@redhat.com>
In-Reply-To: <3ff66c29-7377-3fb5-a317-50e5a12eeea6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 13:01, Philippe Mathieu-Daudé wrote:
> On 10/22/21 11:52, Fabrice Fontaine wrote:
>> Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
>> https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
>> and avoid the following build failure on musl:
>>
>> ../block/export/fuse.c: In function 'fuse_fallocate':
>> ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>>   643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
>>       |                     ^~~~~~~~~~~~~~~~~~~~
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b
> 
> The 2 previous lines aren't really helpful, however this is:
> 
> Fixes: 50482fda98b ("block/export/fuse.c: fix musl build")

Also better to change this patch subject to distinct:
"block/export/fuse.c: fix musl build (again)"

>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  block/export/fuse.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index 2e3bf8270b..823c126d23 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -31,6 +31,10 @@
>>  #include <fuse.h>
>>  #include <fuse_lowlevel.h>
>>  
>> +#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
>> +#include <linux/falloc.h>
>> +#endif
>> +
>>  #ifdef __linux__
>>  #include <linux/fs.h>
>>  #endif
>>
> 
> With 'Fixes:' tag:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


