Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055824431C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:36:05 +0100 (CET)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvpS-0008T6-Vx
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvXk-0003gc-Kj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvXh-0007GF-Cr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635866260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhzAznkOYfQeC6PTU3d5sXwOvib21XLnYGIJ5EFIMZk=;
 b=C5RmsRKHZL+YkgKKSHFw0TJFJDSAmSl9UMjnp4q3fDUCk//VXvdYNOryueB935tvPEnCmN
 +laSjGWnU3emp9APKzA3IpcVE4ijRdzblKR9dnt1nespSWThK6w42tnraMNP6ncfeZ+COO
 rbLTUF7ABaILDxj8AR6oHZCgbVGta8s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-ouejqXlKPjyi2gJbtjrmPQ-1; Tue, 02 Nov 2021 11:17:38 -0400
X-MC-Unique: ouejqXlKPjyi2gJbtjrmPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so6432277wrc.22
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YhzAznkOYfQeC6PTU3d5sXwOvib21XLnYGIJ5EFIMZk=;
 b=GIG9lSaIqyHGYEFnace+cCLIRsr0y4u0bPA4Y0lpWYrYehbN+ySsDZPtGDb7A4mNSP
 6GbCAyP6tbjts/dS34GgxIJZ1EXBQr/K4stKj2p1Q9YZawEX+alQB3bEeLG/Gs4PHZh/
 jUkb85msS0S09bZgV+h8xxessFVKZzL+VNliWaKu+I46yfoxjGokZJD8QyLoRwMO3UBy
 AsQnhGX0fOEeUxU5RymiaSAoKToj7j4G+fEAkduRw6FPO14oGVAS16eCXS6f+PxIr281
 rBY8r12wpWmUb7pIjh7C3ONOhm5/Gv25GZYFVoPJ0UiPhNZa5AbHQahEGZoGEfJK+KS+
 zZUg==
X-Gm-Message-State: AOAM533Mu/DkxfZTHUuPv7WAEefB/lvGRtMjwxU+WH5hmGlvxOzokIjK
 Plt8nKkUpsvG7X01kd6sOp2xmoufHJlYNWgSeOtcb/yQS84q9/tGKKYrzEe8H1dLSUnmEtkbHP9
 1fxVKcls1vPA5AQo=
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr25846514wrx.292.1635866257630; 
 Tue, 02 Nov 2021 08:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySFBA00e0Enwx+HzO5zvqXxAWQUhWAQpZSdqMdtYuSdCIssIjG5H2SV91Us2xH/qQfojuszw==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr25846471wrx.292.1635866257417; 
 Tue, 02 Nov 2021 08:17:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g4sm10346387wro.12.2021.11.02.08.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:17:37 -0700 (PDT)
Message-ID: <6e7abf1d-2e3b-bdb2-e0f2-367e9da29e0b@redhat.com>
Date: Tue, 2 Nov 2021 16:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
 <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
 <19edd050-c09f-2039-0c89-50bcae61321f@redhat.com>
 <YYEwDRCvNpct0BeB@redhat.com>
 <09f679c0-98e6-e5d5-4a1d-8376c8af51e4@redhat.com>
 <YYFQPe2cRUE5Dvr+@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YYFQPe2cRUE5Dvr+@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 15:50, Kevin Wolf wrote:
> Am 02.11.2021 um 13:36 hat Philippe Mathieu-Daudé geschrieben:
>> On 11/2/21 13:33, Kevin Wolf wrote:

>>> Should we still merge (parts of) this series for 6.2? Or does this mean
>>> that we don't want it at all?
>>
>> Patches #1-4 are cleanups welcome for 6.2 :) However we do not want #5.
> 
> Thanks. Patch 4 doesn't seem to make sense without 5 (and definitely not
> without rewriting the commit message), but I'm applying patches 1-3.

Oops indeed. Thank you, that helps.


