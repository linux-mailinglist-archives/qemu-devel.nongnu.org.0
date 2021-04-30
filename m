Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B029736FBEC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:12:41 +0200 (CEST)
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTsm-0003XS-PX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcTnm-0007cS-5e
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcTnj-0001iS-GI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619791645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIaSm7f76GogVGeDKsTJ9zBib7NB9MgN+5TVxGyPsPg=;
 b=Dh1UcJhcVBeqAfwQGyV4KJsE3qCv0hojXakjyLcho5konvMRAr6mmePP+Val9nAUE26yjK
 mxTmFZkQAec6ITuk3zFe4ptyoQoYpGh4LV0gSlX0LFf1a58FQ10zvdL/+SUBVLJcjLdyIg
 ZitQ6s6htz5RVtlm50jHDtbZzC6SEso=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47--ifIgu0bNN2C7krfJSFbHQ-1; Fri, 30 Apr 2021 10:07:23 -0400
X-MC-Unique: -ifIgu0bNN2C7krfJSFbHQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 x21-20020a1709064bd5b029037c44cb861cso14985371ejv.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIaSm7f76GogVGeDKsTJ9zBib7NB9MgN+5TVxGyPsPg=;
 b=PdgEORNIhG8tfsjMs5DIoTP0pF6hgHcxsOInOH3gfBIWOQCGTMTRZ8qpM0Fsp/OjYQ
 SflCo/L+16PIYkWFZKsLpwVgfUsfolAfKFBCXBaB/i2bdSLRwvjKlaFEuLjOLTEbiCFu
 zPF5vtDj+XdeT3zkZtuhr7i3SRF2+YAKpfLnPdSTtCmltfkxiG86AKGLJ9tHNyXmAnol
 OiMFzfUe4c8J+uAFX3Q9LC8jlKVaPP0Y52HQLxcKD9+iAMmXGutBsk2NlkzWAoyPzVsw
 cJg22wuY0UVJ0rwKZYsBM1uTGRd0IG0pKibBXzsC16aPZHN94hScqfhyL0zE88B7YC5Q
 hygQ==
X-Gm-Message-State: AOAM530eWHkfiPcMHHVxDN5i0FRQBbHSH5GRRC/rl8o25E2PQAdRBYsr
 IwkfycvbEHRdBRm67cIt1jb8Bw5Hxqw11Flb4MPqkvUhojZhPEeDiwVdH2ZZRFp7VBwRt8wJITf
 x7VxqEnOW5GbF5GAjLIZnJB3ddUVZ5Z9uDvBawoWY0p4IyaX4amNcnt/iblKgZ8UbHDM=
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr6205295edu.350.1619791642032; 
 Fri, 30 Apr 2021 07:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1s9HG1WKDyaL7FOgQIeVsA14ye/OTKFVdM6mIuakj47+XOP2F1IeOfTnHIia1kGfPj2d/bA==
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr6205246edu.350.1619791641677; 
 Fri, 30 Apr 2021 07:07:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hc43sm2040492ejc.97.2021.04.30.07.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 07:07:21 -0700 (PDT)
Subject: Re: [PATCH v3 03/15] docs/devel/testing: add debug section to the
 QEMU iotests chapter
To: Max Reitz <mreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-4-eesposit@redhat.com>
 <ea095307-698f-085a-a1d4-b76d679b3810@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <10076deb-9916-04dc-7da2-a8bee94d3c6b@redhat.com>
Date: Fri, 30 Apr 2021 16:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea095307-698f-085a-a1d4-b76d679b3810@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/21 13:23, Max Reitz wrote:
>>
>> +-----------------------
>> +QEMU iotests offers some options to debug a failing test, that can be
>> +given as options to the ``check`` script: 
> 
> -,

Even better: "The following options to the ``check`` script can be 
useful when debugging a failing test:".

Paolo


