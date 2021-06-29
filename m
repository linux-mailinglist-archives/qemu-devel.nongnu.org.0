Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0173B7AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 01:36:49 +0200 (CEST)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNHc-0007i6-8V
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 19:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNGo-0006xR-AR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNGm-0005GY-MX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625009755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU2Y/M2EX0OoNjgm6UIFtolN4kKr4rAk3JjokumxttU=;
 b=DdGQpFAtUkMVKpbuGOz6EItyoyCRv+x2GV3b63h9Qg28Zuk3UAFo7D+TW2vvBc5AZnoiKM
 HyaZrG1RoQLEvm777ZMampKV01Vos6Lz7pxiVFhc6OF/HFMiqAzw/8f8PJNVMRdDiBmrDn
 PqTQbjJnUtC2Ide/S0CVMmyITtS6LlE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-tGDAHfGjO7uTFk2BK7IUvQ-1; Tue, 29 Jun 2021 19:35:54 -0400
X-MC-Unique: tGDAHfGjO7uTFk2BK7IUvQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 e13-20020a37e50d0000b02903ad5730c883so265358qkg.22
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 16:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fU2Y/M2EX0OoNjgm6UIFtolN4kKr4rAk3JjokumxttU=;
 b=pCU26ZC7d4Q/K4i9kOoJb6avoeiWX6te0As+gnpt/JcPMenkuV3jzpWsm2ZIokdsiD
 eI8C5FRRX30UtUoRr0WvoT7MR0NX7PZfU4Vbc61goqXoy+MEZL5S7WL+sv0DfwcSlJam
 Fd0oycPX9aiwlgb3+aohulS4c8uFMb3wqVcOqQHlPtcMsfa+poMA49W5/lOfV5n3zoXy
 H7FIHLhchp2/bx46SV54TJBjlI7NvX3Ng5K8NGTy7uU4hHIWFquWM1kMZfG3ewVUku0Y
 GZ1dUHd16ah8vWIZ6m1OxryPhdGeop7o0dRiu3AaIH9fAf0xJ7gV8YqHanBfAa0T+OWK
 XBYA==
X-Gm-Message-State: AOAM530bSHmUqTcgXxJcfKt0wgEtxZ3MRmyVe6TFGQoXGTx8bQE5LhoM
 5lvEunH46W8jdHvff5VbMVghOQRreechY+RuTrHKNg3XyOug7nU7HGfJZ61hdSVZXVN1gEeBHhg
 YzTG85JXx0Gmp0QQ=
X-Received: by 2002:ac8:474e:: with SMTP id k14mr21767642qtp.384.1625009753698; 
 Tue, 29 Jun 2021 16:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT5Mr53mdiEo4ePg4nWBB98UFXP4hR1gpZ4SptfDTj8gVdkTShe61nz30K22/3zN/ss2vScg==
X-Received: by 2002:ac8:474e:: with SMTP id k14mr21767622qtp.384.1625009753542; 
 Tue, 29 Jun 2021 16:35:53 -0700 (PDT)
Received: from ?IPv6:2601:18d:8a00:ab70:b677:d979:630:695c?
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id 16sm9693493qty.15.2021.06.29.16.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 16:35:53 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Erik Skultety <eskultet@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
 <YMHJoVrcuEwS7nYg@nautilus.local>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <7c872432-df06-f546-5144-d7a43d3a050c@redhat.com>
Date: Tue, 29 Jun 2021 19:35:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMHJoVrcuEwS7nYg@nautilus.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/10/21 4:13 AM, Erik Skultety wrote:
> ...
>> On a freshly installed Ubuntu 20.04, the script failed for me with
>> dependency messages on the apt side. After I updated the packages on
>> the system, the playbook worked without problems.
>>
>> So, my suggestion is to add the "update = yes" here, or add a note in
>> the documentation asking the user to update the system before running
>> the playbook.
> I'd advocate for always updating the system automatically rather than putting
> it into the documentation and relying on users actually doing it.
>
> Erik
>

ACK, I'm adding that to v7.


Thanks,

- Cleber.


