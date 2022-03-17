Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870564DC46D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:06:23 +0100 (CET)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnxV-0001Od-CU
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:06:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnZX-0001BM-MT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnZP-0000kO-VD
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647513686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTagTBnitTWVPxwh698nsxbjJBzWdRhrznf3XdXIvY4=;
 b=VJELXqj47kdVAubuUb5NuLfIwkJwvm5DsgD4k9RIW4SKaLKjhVNkcQJF8NlDVKNlapMsh6
 nMi14dBAFoaXieKfaTRFdKU61TMh5Cmp/zvuVWEAjLzpuKAF9lFdbxp9oCof73deFrN3PD
 hFWhv+TEIAWIPfA1ebRbI2ScwZzUrAI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-MjKecMxEN3ez7hjko9uP0w-1; Thu, 17 Mar 2022 06:41:24 -0400
X-MC-Unique: MjKecMxEN3ez7hjko9uP0w-1
Received: by mail-ej1-f72.google.com with SMTP id
 le4-20020a170907170400b006dab546bc40so2685196ejc.15
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=KTagTBnitTWVPxwh698nsxbjJBzWdRhrznf3XdXIvY4=;
 b=UASr3C7+OW3Axs/vDMR/eg6scftKn8uwvq5p02+g4B+dqE8iRE4B6joPeCVaD5HcWl
 /cDhAnH+dnC/Fqs+OxvHe7u7lkvlV1t/F0SteYUEDlD8HnIyhRZGnZgm3IhxXRpVyX7L
 cZyLm0BoowBKdchMbkYKWfLsyO+71RjjEJTRTntS+CUCvlBqAOapDZUzP93R1atbN9fF
 aUc7WAzRbcVUhVbnOUELFDQffCPX5sJ0dsseP4CaXtgJPibyPgtQmv20PUdhVo4XN5wP
 aDkWh2Vcef+7fZ3+tHzWZG2Aif/UJVQB0KK8uYAnu59FVDm8Nzs9u6DVaElbJU6F5s83
 ZYQA==
X-Gm-Message-State: AOAM533nOrVs4QlD5RruSV5QZJxY88+YHV5ktlAtRJgfKJGYwiXUE5NB
 UMGCM4q//OKHScRJsBy5emeyPbkM37MGDrZ88S4nxl29eYrRgyBHi/9sLHPm2Hyz9SP5IUnMmqi
 OOXn9xofsEgQbXLo=
X-Received: by 2002:a17:906:2cce:b0:6ce:e203:d207 with SMTP id
 r14-20020a1709062cce00b006cee203d207mr3812069ejr.242.1647513683727; 
 Thu, 17 Mar 2022 03:41:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/h/vwpdLHy9GIQKREzhONWvjl9e8wGQg89dmLkIsw/4JhJfULHHuw4akBygXG1TyrOb6JmA==
X-Received: by 2002:a17:906:2cce:b0:6ce:e203:d207 with SMTP id
 r14-20020a1709062cce00b006cee203d207mr3812048ejr.242.1647513683547; 
 Thu, 17 Mar 2022 03:41:23 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 sa32-20020a1709076d2000b006df935924c1sm775356ejc.59.2022.03.17.03.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:41:23 -0700 (PDT)
Message-ID: <647ef14d-7c41-956b-1dcf-691407594a0b@redhat.com>
Date: Thu, 17 Mar 2022 11:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
From: Hanna Reitz <hreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
 <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
In-Reply-To: <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 11:25, Hanna Reitz wrote:
> On 08.03.22 02:57, John Snow wrote:
>> re-write qemu_img() as a function that will by default raise a
>> VerboseProcessException (extended from CalledProcessException) on
>> non-zero return codes. This will produce a stack trace that will show
>> the command line arguments and return code from the failed process run.
>
> Why not qemu_img_pipe_and_status() as the central function where all 
> qemu-img calls go through?

OK, I see that your follow-up series effectively does this.  Still 
wondering why this patch here doesn’t touch qemu_img_pipe_and_status() 
instead.

> It seems like this makes qemu_img() a second version of 
> qemu_img_pipe_and_status(), which is a bit weird.
>
> (Or perhaps it should actually be qemu_tool_pipe_and_status() that 
> receives this treatment, with qemu-io functions just passing 
> check=False by default.)

(And perhaps this, but I guess qemu-io is the only other real user of 
qemu_tool_pipe_and_status(), so if it doesn’t care, then there’s no real 
reason to change that function.)

Hanna


