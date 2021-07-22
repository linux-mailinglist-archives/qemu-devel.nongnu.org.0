Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE023D25F5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:40:58 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Zse-0006Ww-VW
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Zqj-0005Nm-OR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Zqg-0006x5-40
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626964731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQFN+Y/Jp0XojcXu0QCKiHJWr/Mmfi7IG3c5YpkBcno=;
 b=hwYIny2HhAIArLXI98WRIzsd2TQaNG3/Ij7LHDwMTog1CU//DpyCFBEC+nUthEn11Xy9ef
 PnVHlF9B/0EgOSuJjnEYE0Ddp08aWzOB+bJQVlMvc49E1Fen3IkncY0Dp6PyApLc2/2xI2
 ELfOHqnR7/GpdXLutLbpHFAUBBWjr2Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-iulPJ0idP5iVBOYr6Q9yKw-1; Thu, 22 Jul 2021 10:38:49 -0400
X-MC-Unique: iulPJ0idP5iVBOYr6Q9yKw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020aa7dcd10000b02903b85a16b672so2887496edu.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uQFN+Y/Jp0XojcXu0QCKiHJWr/Mmfi7IG3c5YpkBcno=;
 b=SiRGgVz37P+3V6vsrLqXAHGdCzTWKcYCtNc057PR4V9EtQHhamlxAdfJGyNPU1iGpf
 K1/tMWmKmAViHMyV51RPuYeKuT38DZWn5LkGoprFKeB6A5iOvbxZzpK/CU3FGvL35fyK
 WBz5zcJnmMZ/PS4wPe3hAIghrOV+4G4hj/H0vPahnwX4b6ulUVws1TO8gJH4YwGfYTnc
 SevXMzG9mQyi5mxCJXQfPq/ZIUgYY+nZJAHqCR1+ldFxcLCXp8QsyY/f42cSSTBzgiZf
 H8tgA5U/KaxNcwobg61YMIGWl856mRXlPsZSuFJJ+vPluM1bnxrtUfPB5IzR2EcRcs0K
 tTLA==
X-Gm-Message-State: AOAM530vj2RALO94TSlxkAaqdm3b5nJormzjVHl/eDBfGXsjV9cA4TB7
 AbTHdUwMeHf/0y1rzV6fxmB4l4oRAVnk98lOWb2/urzfjN2O3gqRAC2rETuo9KlVW6ZysrVZosM
 IzP4VbTMhxibooQY=
X-Received: by 2002:a17:906:7190:: with SMTP id
 h16mr205720ejk.251.1626964728200; 
 Thu, 22 Jul 2021 07:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDuJ9XzCZaPkvhGiYB4lPVXtAvlV3DrW9vfESyLb3QxwFTIAix+iow1CV9o3kph4KsUpIevQ==
X-Received: by 2002:a17:906:7190:: with SMTP id
 h16mr205691ejk.251.1626964727973; 
 Thu, 22 Jul 2021 07:38:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f22sm12411974edr.16.2021.07.22.07.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:38:46 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Andrew Jones <drjones@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com> <20210722133759.db2kjcoucf6rsz4o@gator>
 <672e17d7-bfcc-8022-044a-54a482e3c5ee@redhat.com>
 <93fb73cb-86e7-dc22-cd37-2d61718927e0@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <333c63ff-4ccd-9346-1d02-e1316ec365b0@redhat.com>
Date: Thu, 22 Jul 2021 16:38:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <93fb73cb-86e7-dc22-cd37-2d61718927e0@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 16:12, wangyanan (Y) wrote:
> The smp_parse and pc_smp_parse are going to be converted into a
> generic parser, and the added sanity-check in this patch will also be
> tested in an unit test. So is it probably better to keep the check in the
> parser instead of the caller? The duplication will be eliminated anyway
> when there is one single parser.
> 
> But I can also implement the check in machine_set_smp as you mentioned
> if it's more reasonable and preferred. :)

Yes, I would prefer to avoid having duplicate code.  There are some 
common checks already in machine_set_smp, e.g. comparing ms->smp.cpus 
against mc->min_cpus and mc->max_cpus.

Paolo


