Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7931534A33A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:37:27 +0100 (CET)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhyA-0000rS-J5
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPhxM-0000S1-0q
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPhxK-0006D3-5c
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616747792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2tRmaUmbu/wYZcauDQI/ImIBTsKUkDChd6Y36AmDx0=;
 b=eLwvrpe7+OrStlOZOwZA70qyIVBs1L/ODUjNC3Ls46d8K8iTWGHBccj5s5xgIuTTD7/MjM
 H/JtiINE9H5qTsgPgc5H852wWf/8IZ4Bgud+yM7Y7KK9SbSN+NYjkISOxj0V6NIZU0SjzA
 MUSL4LUGwaWn85s1yHY84A/Ae7TlH+c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-c80B1FDFM02CAlBs72W15w-1; Fri, 26 Mar 2021 04:36:30 -0400
X-MC-Unique: c80B1FDFM02CAlBs72W15w-1
Received: by mail-wr1-f69.google.com with SMTP id r12so3922141wro.15
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 01:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z2tRmaUmbu/wYZcauDQI/ImIBTsKUkDChd6Y36AmDx0=;
 b=GfPmuKJHlnnUtx49pGEV+ZUqKPPy1v2RDuGL8O9eghcea9vY+EozZKqqEzYK5lmYI+
 dzOBR+RDHOILfiHb9rns70/iBwzoTi34HSHYwHNmngPvimfw5ghM/ukO3eXQ+E64T79J
 hykqRiuHralLhvIm8KOYhIi0UVwauyinc9d8hxTtv5JMbJETOo4YfsEPcZU1ONAUk6Lg
 XhslrABkg9ZsxOMXY0v28fd2+Z4rBG1g5wc5NRlZS2AnLqp/BAfOWKgoFHQLHPKDcuuA
 eOnesc9diX7aEzt3Vb5NaCgnOnvDjrKD17a1EGztPBjSmlOljPIpakWJhr/lqmCLhAbJ
 xWmA==
X-Gm-Message-State: AOAM533Wk587p+BD+pwy1LewuwHutMt/jnXl657jhMd3aPOx30Jd0Xwn
 p4xgR6KzmEtCLsxbT3tbDqbSXBmUj5/D/bvSM+SAuk5D81qGmAQJlYGwf3CXghoWTOkMBAAmCZO
 MnopeJTJNUl776cY=
X-Received: by 2002:adf:e108:: with SMTP id t8mr12919403wrz.371.1616747789621; 
 Fri, 26 Mar 2021 01:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8ua+HpOHzdWO6b5pdf8rlgIjKW/kdTw0Llz8SFWYal0qf97p18faOuOt4j2//NEoB+Zm8Fg==
X-Received: by 2002:adf:e108:: with SMTP id t8mr12919388wrz.371.1616747789455; 
 Fri, 26 Mar 2021 01:36:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a17sm9553972wmj.9.2021.03.26.01.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 01:36:28 -0700 (PDT)
Subject: Re: Fail to create sev-guest object on 6.0.0-rc0
To: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c0d75038-a48b-6c0e-4dfa-09e9ec4c17d4@amd.com>
 <935d4fa4-09fd-b063-77c3-dc388b662e81@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e144027f-2fba-f173-00b5-0761087c52ac@redhat.com>
Date: Fri, 26 Mar 2021 09:36:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <935d4fa4-09fd-b063-77c3-dc388b662e81@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/03/21 21:31, Tom Lendacky wrote:
> On 3/25/21 1:51 PM, Brijesh Singh wrote:
>> Hi All,
>>
>> It seems creating the sev-guest object is broken rc0 tag. The following
>> command is no longer able to create the sev-guest object
>>
>> $QEMU \
>>
>>   -machine ...,confidential-guest-support=sev0 \
>>
>>   -object sev-guest,id=sev0,policy=0x1 \
>>
>> It fails with "-object sev-guest,id=sev0: Invalid parameter
>> 'sev-guest'". I will try to bisect the broken commit but if someone has
>> already looked into it then let me know.
> 
> I bisected it to:
> 
> bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c and QAPIfy it")

Will fix.

Paolo


