Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1413F6158
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:14:56 +0200 (CEST)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIY8d-0005gB-59
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIY7C-0004J8-Og
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIY79-0005TS-Oo
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsmlIR2Jepq56LofrF4lVcdf53iND8z63ALrJQoyOr8=;
 b=geZepzHy+aZKMe+Tmj6eG65a2Pr1aEF3+kcqYVxXPh2tZlV1iHzVrLHRsqqeRmJ62uDS+d
 7npa5OXwEUf/e+3kvDuoNdFjmcjn3UTaaJ0ZK7QEaztM4tlbpb19j3lbVKcvC1g4vNWb5D
 CPHCd6E9XvcL5TM2AEU08qqxB5feXuE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-kCCTTKa0NG65rHeRObgUEA-1; Tue, 24 Aug 2021 11:13:19 -0400
X-MC-Unique: kCCTTKa0NG65rHeRObgUEA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so4218978wmc.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XsmlIR2Jepq56LofrF4lVcdf53iND8z63ALrJQoyOr8=;
 b=ki84eBbzJeSDzPl9TgE06QyOhtMpDcIr7p7xBZr0yOLH2qIvCD6oty+ws3SMO1/XGD
 Xx2zQeE4tAmhqQIHlgy0j4ohisjoQUKc6SEJcs9dmVjFDRVkJ3pDHbfWtHVCI0MLwNWF
 1egftB4oKKq2j5MAeZ/M8M+FVCpxSKJmWhVSbIEcUPWo9GMZIEaIAsMA5ahX8+cLp605
 uX1Q2xICf4pfjyLm0RHvNrkcFNvDLWypG97sdh544gGN+DqqVrJ16nthrL3wDOMLcXbN
 BgruW/lSxmY6VLciZkof82G3mPKnQUpGxUuFZK6jp9xJluxc9+KORQfvvRXSMGqGVXZR
 vlLQ==
X-Gm-Message-State: AOAM5331E95z03Z/P3PtrNBPwVjC866NLWRhhIIYgSfpJZcTIJNf58E4
 Cx5gS/MTUqGqqRJ6mDn9wQNZwovlnvw65pTV9LKzVvy0zkiz9F61rVYWfwSj4lSZMI8dCC6A5Js
 UojlnOgV5vxHQX/A=
X-Received: by 2002:a5d:6707:: with SMTP id o7mr5671634wru.307.1629817998235; 
 Tue, 24 Aug 2021 08:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+N+MA2CqE1bGqAMdnn0A6U0/oD6+alQ4+7zAFD9uvPw8cTp/feI755b3E9iM6fZoytYRNzw==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr5671603wru.307.1629817998076; 
 Tue, 24 Aug 2021 08:13:18 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e3sm18873876wrv.65.2021.08.24.08.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 08:13:17 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] python/iotests: Run iotest linters during Python
 CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210720173336.1876937-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <69455db7-b583-88a8-4ad2-a4def78e2558@redhat.com>
Date: Tue, 24 Aug 2021 17:13:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 19:33, John Snow wrote:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/340144191

I’ll take the liberty of applying patches 1 and 2 to my block-next 
branch, because, well, they fix some of the 297 errors I’m seeing with 
an updated pylint.

(There’s more still, namely some unspecified-encoding errors, one 
use-dict-literal, and one use-list-literal, but I don’t think there are 
patches for that in this series, so I guess I’ll have to have a go 
myself...)

To make this formal:

Thanks, I’ve applied patches 1 and 2 to my block-next branch:

https://github.com/XanClic/qemu/commits/block-next

Hanna


