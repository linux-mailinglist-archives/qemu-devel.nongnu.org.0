Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC84D2C75
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:48:58 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRswD-0006OT-46
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:48:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRsuU-0005bv-Cc
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:47:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRsuO-0000fG-NV
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646819222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvV/Z81UwUuHotr7bOX83O5GdTryXyb4kmyQC2ztmy8=;
 b=HxONoh3zFDU8xPUbJeI6MClUg5eLYB/XNCMkNf/ZJLDAH6/pWoTQYOsADnuzY9kHTR+jqk
 5PUYcOtpj+O7LOB7gEjrBOCdaM1CPzttFsUIIXV/1wyUrmYiIb6mk2fRfaG87bSnYyra/g
 MVu4/qmJ8jjHD9nMVebKPXRs6f+CjSk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-nGJBARCuNFmrce01kWRW2g-1; Wed, 09 Mar 2022 04:47:00 -0500
X-MC-Unique: nGJBARCuNFmrce01kWRW2g-1
Received: by mail-wm1-f69.google.com with SMTP id
 14-20020a05600c028e00b003897a4056e8so748057wmk.9
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 01:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=FvV/Z81UwUuHotr7bOX83O5GdTryXyb4kmyQC2ztmy8=;
 b=tmbtYMxcl5Z2fAMdi//lQRq04iW9tHJ2xwEDYgxR3YnFdzY5Mrk7lLvBfndbBfjuRa
 faQZE64q0BiT/9EO0wg/YOKoAfXL9Xpo6/GlVnrbEV7ymmnxSOzCCxkn9YSrUh3ycy6s
 nGVnAr0v+TXfSPXTcRqhpQQ1sTnwY5CwrRUy5TnOfJyPphScPWOEdb4PQabRjH1i1K6t
 VUhyPBVkXPrHFfj8TenH+vixel0eCOp9vug0rQPGozPBHTlIV5NyQEtnRE/ADv0axVDh
 0aioGGzKDTkk6W9U/cGVCdjtMbVHfqZXbCF4JPA86vHtz3toYothI3GHVlSkMbjHezSI
 AHTw==
X-Gm-Message-State: AOAM531zIOCh0N4E9KSA1nJvLokQd6baU+QC3WVPM/goc6W98l+qBJsH
 zpmvxAr/Y1DbNM+4OOlBLyJY0XrHQygu2Qk7FU4gJKKjojdfY88+ltmNtq5kheJGSlk7ZSZ9LmL
 1nri+7/tj667NBjA=
X-Received: by 2002:a05:600c:3b12:b0:381:80ed:aae4 with SMTP id
 m18-20020a05600c3b1200b0038180edaae4mr6899282wms.111.1646819219109; 
 Wed, 09 Mar 2022 01:46:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymh5TEHQL9Li7Sdb3fzp46Dw7KtzyaboqwVtXDRRJataJpf201fEMmT+K41T3y7iGQuWjIGg==
X-Received: by 2002:a05:600c:3b12:b0:381:80ed:aae4 with SMTP id
 m18-20020a05600c3b1200b0038180edaae4mr6899265wms.111.1646819218810; 
 Wed, 09 Mar 2022 01:46:58 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003899263bab1sm1205132wmi.20.2022.03.09.01.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 01:46:58 -0800 (PST)
Message-ID: <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
Date: Wed, 9 Mar 2022 10:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2022 12.31, Paolo Bonzini wrote:
> On 3/8/22 09:14, Thomas Huth wrote:
>> You now need to revert commit db4b2133b8d ('Quote "case not run" lines in 
>> TAP mode'), too, which has just been merged yesterday.
>>
>> But instead of reverting, couldn't we simply go ahead with my series here 
>> instead to restore the output of failed iotests:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05031.html
> 
> That one also drops the progress report of non-failed tests, so I'm not sure 
> it's an improvement.

That only works here anyway if I don't run "make check" with the "-jX" 
option ... which I hardly do, since it then takes forever to finish the 
testing. So at least for me that's not really a reason.

>  Also the commit message for that one should mention 
> that it's a meson bug, IMO we should ask distros to backport the trivial fix 
> to --verbose 
> (https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5a4cfac3ffe1de7d901a4e8aba10.patch). 

Ok ... could you maybe ask the meson folks to include the fix in the 
upcoming stable releases?
... the meson master branch has been switched to Python 3.7 already, but 
AFAIU we still target Python 3.6 in QEMU, so I'm not sure whether we will be 
able to jump on the next main release with QEMU... we might need to stick 
with a 0.61.x release for a while in the future?

Since the fix is not available in any meson release yet and we're in QEMU 
softfreeze now, I'm now also not quite sure anymore whether we really should 
go forward with the TAP approach right now... maybe it's indeed better to 
revert the patches for QEMU 7.0 and sort it out later?

  Thomas


