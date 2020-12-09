Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024862D3C88
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 08:53:54 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmuIK-0007dl-KZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 02:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmuGs-0007Ay-Bq
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:52:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmuGq-0007JB-3l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607500337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6l9I91yG5bHt0E7JfpJoNJVJshhIcnUGTc2wCnvYhw=;
 b=KvIfv0rV4mqsYfKErfGue1sUfwZqns9WywM7r0Xd2YBKKXgVl+Kud8GDeDlBIIeg+Xvp1w
 2c0Af/QxZc2Jt1V4b/YZE3U78NZqnHHL8/Y0sCIdSvEurBkBlxJSZLsnhyEglANMdHS+TW
 LAjC0Q4E7T+IKkQ7958DsU9tKMy7poI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-NdsxFFbANviAMVbKqS6srw-1; Wed, 09 Dec 2020 02:52:14 -0500
X-MC-Unique: NdsxFFbANviAMVbKqS6srw-1
Received: by mail-wr1-f69.google.com with SMTP id b5so334251wrp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 23:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6l9I91yG5bHt0E7JfpJoNJVJshhIcnUGTc2wCnvYhw=;
 b=jtaxV3I0jhROSjj06vG1zbs3j5dzcmgbV4MZZWAkwh8u95hWiumFJ3UEF7D+hmc3qz
 4dYsxKRVKNlUYScReM1aBwST3f5E46idBElx64eHBL/Qus/NsLBveIUZ2tWEZyjV7pig
 P6FI1RA55t5qq3eROr3htOH8uaZSQnSOp3ZDe+HE0glbpsY5I85ZRcf+QQwWUsWU1/Az
 R/dn4Dq+4m4qX2wFn8utffFKWbvHPnzOfDxo+neplZF9S1LtH739vjXPStrxrkc5egW0
 AdPa2n66gziRwK/h/2u5xgw3Qoc7I3ajXb8AepD/lHGji4xiT4GERKl+LjPmDEDk13xz
 md5g==
X-Gm-Message-State: AOAM532yOTfa/hMlRQR2p+v3w4/8gSqd5E5RjPQ/4s+dDgd88COjqfGJ
 DXuKqVAcrAcLhwnMRJ0iIJsUEHdIbsUuQU15trYjy+JUg7GqSagPhKDVde1P2vnFfi5MH2F3nCA
 hwq8xlWTMLE+c7Z4=
X-Received: by 2002:adf:fa05:: with SMTP id m5mr1198916wrr.26.1607500333851;
 Tue, 08 Dec 2020 23:52:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuZ/IvYTwKdn5oaeq1xZyuXK94wTKRsbDMkHmPCfxN3FiZ9S3fLUvWgmNgiKKaHl3cSeFiXg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr1198893wrr.26.1607500333645;
 Tue, 08 Dec 2020 23:52:13 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id g192sm1663956wme.48.2020.12.08.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 23:52:12 -0800 (PST)
Subject: Re: [PATCH] fsdev: open brace '{' following struct go on the same line
To: zhouyang <zhouyang789@huawei.com>, peter.maydell@linaro.org
References: <20201209060735.2760943-1-zhouyang789@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f995879d-b18b-5d78-4a66-0c1b65e26a31@redhat.com>
Date: Wed, 9 Dec 2020 08:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209060735.2760943-1-zhouyang789@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, alex.chen@huawei.com, qemu-devel@nongnu.org,
 hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 7:07 AM, zhouyang wrote:
> I found some style problems while check the code using checkpatch.pl.
> This commit fixs the issue below:
> ERROR: open brace '{' following struct go on the same line
> 
> Signed-off-by: zhouyang <zhouyang789@huawei.com>
> ---
>  fsdev/9p-marshal.h | 12 ++++--------
>  fsdev/file-op-9p.h |  3 +--
>  2 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


