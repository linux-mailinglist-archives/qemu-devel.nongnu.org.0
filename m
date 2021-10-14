Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65A42D234
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 08:14:52 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mau0w-0002Bq-KX
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 02:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mau03-0001X6-N4
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 02:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mau00-0007fi-UM
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 02:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634192031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/cBEzVPA7acCiF0V12Jbj52QVEvgOLrN69QUUzHLYY=;
 b=F7nFmKjtFLjMjsL9Ag3PyyjaxlO/+IrpVRnIdu7J79HoO49ncnKy0aozTBuSJwMRfO2sk8
 olCNI66a+lHDyTmC1nPK5uIM9dFuXc3BSPRVvCUnuEPqVOkKE5F4Fv7dm1ChYrVMQgNdSr
 Iu7LA/3IXubMcNm0hLwWAYGgCo3+C4w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-djYrJL_MNHu5aBAxpQgeOQ-1; Thu, 14 Oct 2021 02:13:50 -0400
X-MC-Unique: djYrJL_MNHu5aBAxpQgeOQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso3691220wrg.16
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 23:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/cBEzVPA7acCiF0V12Jbj52QVEvgOLrN69QUUzHLYY=;
 b=lVUmCgmCIB1BUSEg1VzJxahku/F4RZNHQ1nqSMiUm0CCnyP6CQlwaTZtdpXykN+bBe
 uqCb8W5f/bi2MOAMwMgb/Zp7N+qYnQZAsQCpxtxsVBnKMNBYi7/CoUIA3er/bZcvTxNQ
 OP+onpdWa20JfOpI9wQIskDInSNCHqF4af/Gw00o4fF9oMBvExswBCMOTrGDRffhHTaf
 LyTAbsWVnGhFd8N1tSzmXfhWXxkYVbUFfXDfqFileOdOvUKxU/Di4w9YtnZ/vgv1d7bH
 bg30KYSnfmW8qQdL7jonuUtZN74QGAHTr8b+dAsz0A95hPogs5gUf+QvVQV2uiudCbJR
 3Txw==
X-Gm-Message-State: AOAM533Mv8zmBYRZhrsl0tclPTULgvFExdV0n2BmrYuY5q1MoL4EFtKu
 gS+c4/W0DOeesrFBOS1TGhSzgXcV+3ZnXu6BR/lAkS2wWtAVHWIPSmMTg0ElD04l5JKd/BWYgCw
 4RydOGW7gI6XKSvk=
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr4370710wrt.31.1634192029421; 
 Wed, 13 Oct 2021 23:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIt4qhh1dyHXEkI3oO2xlpA93ah2CTQfgWJPe5DP2olKstroCV/+9otyVIsApQl1af/nW0Dw==
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr4370693wrt.31.1634192029251; 
 Wed, 13 Oct 2021 23:13:49 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q3sm1201909wmc.25.2021.10.13.23.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 23:13:48 -0700 (PDT)
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
 <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
 <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
 <16181a8b-4676-24c9-796d-56207731d4c2@redhat.com>
 <c4807a16-7d32-bf92-a73e-d57b7cf13e9d@redhat.com>
 <1d2ff0c6-f1ab-fae4-e77a-edefcc27093d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dc1c1220-c6a4-6c84-f371-8c43308fc7b4@redhat.com>
Date: Thu, 14 Oct 2021 08:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1d2ff0c6-f1ab-fae4-e77a-edefcc27093d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2021 19.00, Paolo Bonzini wrote:
> On 13/10/21 13:27, Thomas Huth wrote:
>>>
>>> +def fixup_options(options):
>>> +    # Meson <= 0.60 does not include the choices in array options, fix 
>>> that up
>>> +    for opt in options:
>>> +        if opt["name"] == "trace_backends":
>>> +            opt["choices"] = [
>>> +                "dtrace",
>>> +                "ftrace",
>>> +                "log",
>>> +                "nop",
>>> +                "simple",
>>> +                "syslog",
>>> +                "ust",
>>> +            ]
>>
>> Do we need a check for a fixed meson version here?
> 
> No, on a fixed version of Meson it will just overwrite the existing array 
> with itself.  Once we can require a newer version, we'll remove the fixup.

Ok, then it sounds good to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>


