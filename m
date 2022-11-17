Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB462DE83
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovg7a-0005VV-Li; Thu, 17 Nov 2022 09:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovg7Q-0005V8-6l
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovg7O-0006St-Dj
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668696233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xik3GDQmQZUDZ0GtGLDP5XWSplS/+vBU2EdXIozpqcA=;
 b=TEJ9/o0NvyKToWcaFvMA53MiE/iM0Z80lVfoqEfS1DycY3yupnlc2O7vfEvbCnA1YkR5Zs
 s0t9vEy3i82zfuR7uxhOjXxKeIiYyMxM25wRMqZrHp9zaWDKxEaGY815cGxtg4bhr/Y3k8
 kBUrqfwkFrRZqlWrvVkUwsC3DC9QAuQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-Tco_wRUqNVmbiTC7jar4lA-1; Thu, 17 Nov 2022 09:43:51 -0500
X-MC-Unique: Tco_wRUqNVmbiTC7jar4lA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so1370139ede.1
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 06:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xik3GDQmQZUDZ0GtGLDP5XWSplS/+vBU2EdXIozpqcA=;
 b=uwxdQORKbxXQ3jAudLYIHjm/t/112aC3dNESYdH2W+T0cGNtnWfV9AjJTs93m4E0IF
 /dOc0uAZv/SQjTVO208tk4/LSJGgh1G5MfPOmms7nkrqf92yPsXmBs7GE9NLWUtRN+rq
 DhQpS1LHFGswtaRmIxUwvjIoL1dE4l7JelulugeFhigJa3+WxPdTQkUEH9y18wzHztmR
 hA9m/0pV42M7d6lPeJFWJWNofpIoWyBQF+F2bolSX7FEqMHL/SaVhrCqmWNP/VqQs3Y0
 yt81LzvsC8r5mtEUvRO8I16be3Jcjd4N54+8gXgSXEAWxDudM+/RWDeZxI5t06BcHRZJ
 q9XQ==
X-Gm-Message-State: ANoB5pmX0CpDkMC1BeGVB8zOcS1fyNg4KtwdE557vKKIJ3Zccrdgm7zy
 umcls/RJ8RdJluK4xaqJzOqv6qGVmKA3wjeyBt8cbI2QPtBUA14DDWYiLiXc0GQfpsPoC43jVh/
 +dAl+5xBMaH0sNBs=
X-Received: by 2002:a17:906:f204:b0:79e:8f4a:c5b3 with SMTP id
 gt4-20020a170906f20400b0079e8f4ac5b3mr2290878ejb.223.1668696230412; 
 Thu, 17 Nov 2022 06:43:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4/93i3OTZXi3v7rW/c/5gmmhW01QVuFi4wdWn2LSXFPSxNmB11AOJ6D0jfkIGEhFK1G0CRsQ==
X-Received: by 2002:a17:906:f204:b0:79e:8f4a:c5b3 with SMTP id
 gt4-20020a170906f20400b0079e8f4ac5b3mr2290869ejb.223.1668696230218; 
 Thu, 17 Nov 2022 06:43:50 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a17090632da00b007ae4717bef1sm468019ejk.15.2022.11.17.06.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 06:43:49 -0800 (PST)
Message-ID: <68fe41a5-8d36-a7a6-4fff-4cc2ffc0335f@redhat.com>
Date: Thu, 17 Nov 2022 15:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <20221114134939.18365-1-pbonzini@redhat.com> <Y3NJz1u7u38Dz0qO@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y3NJz1u7u38Dz0qO@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/15/22 09:11, Daniel P. Berrangé wrote:
> On Mon, Nov 14, 2022 at 02:49:39PM +0100, Paolo Bonzini wrote:
>> Queued, thanks.
> I presume you have unqueued this patch again after the discussion
> yesterday ?

Yes, of course.

Paolo


