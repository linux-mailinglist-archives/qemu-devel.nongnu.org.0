Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8C37D433
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:23:52 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvOZ-0000Vc-9q
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lguuS-0004yi-HB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lguuQ-0000ZQ-1S
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620849160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XktvUUGJ0ugVihWnuz/9CibOBoct/vVOcsr/96vg6us=;
 b=U/b1Xm9Axd0JMAMW0/DoHecUsO5G9vt+VagaAxi6QgX6tb8RFMo6Eqme6LwbyKcNirmC+n
 p51ls6GUgiHGM9cS0oqQo46dIi+xenj7iyfi64z6jN2N1/onMCk6oB24+MwlWaCyFN9yeX
 aKv/RKvll1QuVXUGTrxQtoEPome2JD4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-mCgFQCgFMIa-jYgYzFPRxw-1; Wed, 12 May 2021 15:52:39 -0400
X-MC-Unique: mCgFQCgFMIa-jYgYzFPRxw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so10478099wrm.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XktvUUGJ0ugVihWnuz/9CibOBoct/vVOcsr/96vg6us=;
 b=oyDvx0MjjXU5znAqQ5VaRo7jw2m4sQ4iL8C/rWeLFwf9qX7C5MYB8CRa85kXIgmU3f
 YOCRWlQz0Eg/eLqj9R8Tdy2q4zag01BgEDShA5eLuGA5+uv+J/sHnZJGLpL3+GDSQ1+R
 cno2T89jKxkgJ0cxNagW0IBDm5h58bu2A8zk3LlU7I1sVNKlraylD4rpU1Xx+xHDOADZ
 zzDGe23Kx5LyGQd8wG58dCkQxee5uvfCNjiyYazyTJTO6ztxr+AOOx4+UoYfJPuLxrYb
 2fnQ/6+6oEANY3aRDEkRETlnBJ/tHkXb7OZYH0m4kdFGuf5Ix9QlS3OhEbWAkn0e63Kc
 mMVA==
X-Gm-Message-State: AOAM530FlV/Zt35zss5VNB5Rx/7aRkX6IfpJJKtuGdVK2Ys1GKOnsOsS
 iZ8ZPBTAj+ja0KbyYXDuBTMyeoH8yyqKqBua2rJAamgRQ0t60IYMi9HIPG2y6Qaakro8CG61xPg
 JgER0D3zH9Y8IG73dLUCfiPia6ckjAil/kNoWuMFkyDoGluHXkuSzohnftfdo+ym6
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr40435017wmc.92.1620849157853; 
 Wed, 12 May 2021 12:52:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDo1Wt1DPYLQhf0tbIFGNzwJc3j/TqoXrx8Dhy/qDmuAuCsOn6vNkNN/d/UecA8F56I6EEaw==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr40434997wmc.92.1620849157554; 
 Wed, 12 May 2021 12:52:37 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n3sm525167wmi.7.2021.05.12.12.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 12:52:37 -0700 (PDT)
Subject: Re: [PATCH 1/3] pc-bios/s390-ccw: Fix inline assembly for older
 versions of Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f5da1494-ec3a-c68d-cf56-f0ee752e5a46@redhat.com>
Date: Wed, 12 May 2021 21:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512171550.476130-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:15 PM, Thomas Huth wrote:
> Clang versions before v11.0 insist on having the %rX or %cX register
> names instead of just a number. Since our Travis-CI is currently
> still using Clang v6.0, we have to fix this to avoid failing jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/helper.h   | 2 +-
>  pc-bios/s390-ccw/jump2ipl.c | 4 ++--
>  pc-bios/s390-ccw/menu.c     | 8 ++++----
>  pc-bios/s390-ccw/virtio.c   | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


