Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED44243A0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:00:46 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAHd-0003Ev-ET
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYACi-0004zI-8B
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYACf-0004Jg-R8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633539337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6U5APrNX5d2Qtae+IOT/XhbvqvFNkubKrEnqG174yFk=;
 b=T7okhYQ70hdFr7MyLDhnGSrrV0SHqs7kB/lPqQns7MtPPMGJv1wJpppnm3WWQU/oxQGoGD
 LmU5QxMz+MhMQgzR7mwup8ljlsTDuBCJkK4n+MlwKOJrtyYO/TWwj85HJY6uYPU7642Wtt
 a5bLsH15T51D4U8MJthweHyTqV9x5o8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-YwIEM3WaOtaf9DS_9QjLVQ-1; Wed, 06 Oct 2021 12:55:36 -0400
X-MC-Unique: YwIEM3WaOtaf9DS_9QjLVQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso2552158wrr.15
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6U5APrNX5d2Qtae+IOT/XhbvqvFNkubKrEnqG174yFk=;
 b=6rM9yGB09RrFmr4fGTdO+qkPv9qeJHSm7kEZpOEQcPf4SrkXMFSxEW5yozTJpOggFl
 pWMUVigqrEFNCzweZOi5m200yGgnVdA51m9rYMyO12DewdlyQFbxhptUtNehKXieWisZ
 rmb59TstumPLtO14QbsLXLLIOHv++yzoOUKaiwahy96zaWZIOGfUMb3dxY8lhk0uu3EA
 aOXsGCoBECFjPVkdoQXrLZPJDp2UwwOsALO/FHAtp5JS930pXIHdsZK1wUDj5zNY4GvH
 g/3lhUPLL5l8TCE1Vi4CLi76o5880wPWs6z0MNsjW890F3bbv/d32xgR+9nDL38+zhYj
 KCJw==
X-Gm-Message-State: AOAM530YRwPx9zGYhX2fkO0gFyc0aweoPLXKffJyNM7t/MZAG/xaHijt
 oxxApmqHtaEbEiGAiFCkxXhT+SCrl6Z4JQ4HdprnARiiK7Fb7l0Pd9AeaATxNrrzyRKOZSpvRKE
 4Rjg35TEovPVfC80=
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr29791807wri.158.1633539334708; 
 Wed, 06 Oct 2021 09:55:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9VtrKRkvA/SbszhjNkveKNiCTegF6NdUptu65uY405yCabyvFXDo9LQgyfTpW1aaKaSMkPA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr29791771wri.158.1633539334403; 
 Wed, 06 Oct 2021 09:55:34 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n66sm6144875wmn.2.2021.10.06.09.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 09:55:34 -0700 (PDT)
Message-ID: <8a067352-a8d5-6afb-6584-79604a0377a5@redhat.com>
Date: Wed, 6 Oct 2021 18:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
 <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
 <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 18:52, Richard Henderson wrote:
> On 10/6/21 9:22 AM, Philippe Mathieu-Daudé wrote:
>> There seems to be something wrong here:
>>
>> The Meson build system
>> Version: 0.59.1
>> [..]
>>      rbd support                  : YES
>>      xfsctl support               : NO
>>      smartcard support            : [<mesonbuild.mlog.AnsiDecorator
>> object at 0x7f00880538e0>, ' ', <mesonbuild.mlog.AnsiDecorator object at
>> 0x7f0087ee6850>]
> 
> Paolo said in the cover letter that 0.59.[01] are broken, and that's why
> 0.58 is allowed but we default to 0.59.2 (from the submodule).

So something doesn't work, because my system has 0.59.1 and it is used
instead of the submodule...


