Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4A310A8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:47:24 +0100 (CET)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7za7-0002NB-8L
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7zYP-0001qH-UL
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7zYG-0006au-81
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612525524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPq4l5Ivjs/dd6ynKOidMd50nbXSnERSU+SuPfqRRBg=;
 b=a6elTdOnYZnLLiwtW7A5K386/+w+1nGAshJo2sJCE0EbjgoaetoL3zI7pQVr4IOJ/ZMQuW
 3OKnwLoqc3VKvEt7NLhomJ/JunMDqQY+vaUr9Ch4KmNzmoh5rwN1XHXDS1KJjakoS6ya4o
 BcVsxfAafKTyP3OkWPllQqSo1UxTsoo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-EUHvk_nnNci00Ce6B1iJsw-1; Fri, 05 Feb 2021 06:45:22 -0500
X-MC-Unique: EUHvk_nnNci00Ce6B1iJsw-1
Received: by mail-ed1-f70.google.com with SMTP id u26so6831334edv.18
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPq4l5Ivjs/dd6ynKOidMd50nbXSnERSU+SuPfqRRBg=;
 b=A9LzmDJx5V5OMr7VAQYgnyKt2a9/AK0qczgc0nIpRhanOJnuDwK595HMcGgu9ZCoeu
 YlX+LCAVN9kZR+HAau4AQZ9G+SEF3soOK/GNcN5umrL/Y81bpUE5n8W6oMQra2DN4wo5
 Byu/jsAJx57VpPvZWQIcUNl+Xu0vyJBva5jgRaFcHPXnriOqCaGWQqAXzsTyPwEQpYNN
 sd249uqOC3c1uVZRVzLcSEicaW5XT1IG7Agx9kli+AAcyAljLkfRyHWv1nL864wGi3o2
 37EVmO9bY93Adseh4CoAhtoXU/4412egIfeoKIT4TXtYMo/a/iHBvqiI2vVN/03fdSeM
 iIYg==
X-Gm-Message-State: AOAM530c3rhMUMJlsd5mDQz3RBJwY3PvvMChPo2+dNoFGdhAru47m0iI
 PiebLl52xqSl4IGtxCOC1NFpmO1My3+Jdd/5S5qqGOvnq1nRynsUgNv/TIw/jyGaq0By/vg0U7a
 iji3utNVoHvGe4/Q=
X-Received: by 2002:a05:6402:364:: with SMTP id
 s4mr3146677edw.98.1612525521389; 
 Fri, 05 Feb 2021 03:45:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq2q91mLH3Ms5/aF/RoKp01HNWh3MxkkKYOEOcHa6IOZjvqx3y0xV6aAUXZZxQlD63gRLyPw==
X-Received: by 2002:a05:6402:364:: with SMTP id
 s4mr3146652edw.98.1612525521181; 
 Fri, 05 Feb 2021 03:45:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z16sm3775139ejx.73.2021.02.05.03.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 03:45:20 -0800 (PST)
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
 <20210205095115.GB908621@redhat.com>
 <e11240d0-d325-336b-f43b-3cee6cf94b76@redhat.com>
 <20210205113738.GH908621@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <263306b6-52c5-6da8-7f58-b639eb74c40d@redhat.com>
Date: Fri, 5 Feb 2021 12:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205113738.GH908621@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, James Bottomley <jejb@linux.ibm.com>, jon.grimm@amd.com,
 tobin@ibm.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, frankeh@us.ibm.com,
 Dov.Murik1@il.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/21 12:37, Daniel P. Berrangé wrote:
> On Fri, Feb 05, 2021 at 11:58:26AM +0100, Paolo Bonzini wrote:
>> On 05/02/21 10:51, Daniel P. Berrangé wrote:
>>>> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
>>>> +            error_setg(errp, "SEV: no secret area found in OVMF,"
>>>> +                       " gpa must be specified.");
>>>> +            return;
>>>> +        }
>>> IIUC, historically QEMU has gone out of its way to avoid creating a
>>> direct dependancy on specific firmware implementation details such
>>> as this, so this whole approach makes me feel really uneasy.
>>
>> The problem here is that this secret must be measured and therefore cannot
>> be extracted by the guest out of fw_cfg.  Note that there's no reason why
>> other firmware than OVMF could not adopt the same interface.
> 
> I didn't mean to store the secret in fw_cfg. Rather to use fw_cfg as a
> way for OVMF to tell QEMU where to store it

I may be misunderstanding, but I think QEMU has to store it before OVMF 
runs, because the measurement is "sealed" when the VM starts.

Paolo


