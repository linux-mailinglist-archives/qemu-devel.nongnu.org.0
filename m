Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F038CB70
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:59:58 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8VB-0007OK-9P
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8T6-00060e-0c
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8T1-0006Yt-Th
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621616261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dZlnJqb8OmVyajDETBdSbP1Z/P87r+achN+rAqTZXM=;
 b=ImZb8GWVBodKrqej4UtoICZUwd6GkdDdAK7ZyxqcGgu15MQ4horjJ2II+MT4ku6F91K8U3
 K5ZiuAnd2qU6e+L0mITKR6qRJFyCjPMEi2uOK2bYyMfOjgzggXXMYi80z+S8j/FT6JrBOb
 MZp1Uxtt6wZ4kqxWRQqQeJ8c1aNJNkI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-taqSsL_JPNmL-Sd-1SNX1w-1; Fri, 21 May 2021 12:57:39 -0400
X-MC-Unique: taqSsL_JPNmL-Sd-1SNX1w-1
Received: by mail-ed1-f71.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so11627271edc.5
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0dZlnJqb8OmVyajDETBdSbP1Z/P87r+achN+rAqTZXM=;
 b=M8kzswHrcnYMEY2LD03OWQHAGL3EROnAd1vEO+pa+spLEhXMfGtq0OBpclMxmAeNyK
 E7tOllv/YuCnfdPuZpdXmix6kJK7FDFDp1ftVfVQjrSs8DJwyj+7X0QhybNY19CsU035
 8f3EBLir7PrSkTVlT2i7PgfC+cwRGACvBzS2drx5MNo3VWRYeOA9NHPm3G8XQPbngiFs
 iUPxUpZO/09JZlgilCrAqvMrRzvcvoEriY7cdx1W78JtcR1Y1Lx3p2uj5hIrOA2h6cJX
 8liIMT5NXDMvNh1mVKEdtDkfBNPPQMzeGKVZNJquUHdJRB5ekaUg21cfLQWu99fE41SB
 ovpw==
X-Gm-Message-State: AOAM5326naqkvlaGZLwLbn4jbLE0/QsAKWTNTehl3GaqdYqVKonN92N1
 WOhucNppzD5CPmSG7+BVPGS0mgitrIUgyXtSqvHoynvCM5TuugDqX/ya8O8TUxmJQR70/R1jt8u
 NLKIGPr/X2Z1+zU8=
X-Received: by 2002:aa7:c718:: with SMTP id i24mr12080087edq.43.1621616258814; 
 Fri, 21 May 2021 09:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN63cgsDi4jzYSSixSVgLFMb+2YwFJRd3fBkfOxSl6Y6gfZG3kBRpE0zXDZNsiHoMtVfWJ9g==
X-Received: by 2002:aa7:c718:: with SMTP id i24mr12080066edq.43.1621616258566; 
 Fri, 21 May 2021 09:57:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k13sm3880270ejr.1.2021.05.21.09.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:57:37 -0700 (PDT)
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <949b3ab6-2d87-a873-d96b-41ee7ef5e7d5@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a734314b-e495-550b-9a01-40e9e75f6b8f@redhat.com>
Date: Fri, 21 May 2021 18:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <949b3ab6-2d87-a873-d96b-41ee7ef5e7d5@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 mark.burton@greensocs.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 16:06, Mirela Grujic wrote:
>>
>> PHASE_NO_MACHINE
>>    -> machine-set -> PHASE_MACHINE_CREATED ->
>>    -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INITIALIZED ->
> 
> 
> My understanding is that an equivalent of previously supported 
> 'preconfig' state is PHASE_ACCEL_CREATED, from the perspective of the 
> QMP configuration that Igor implemented. In other words, I believe that 
> when -preconfig CLI option was passed, QEMU was waiting for the QMP 
> configuration in PHASE_ACCEL_CREATED phase. Now, if accel-set advances 
> the machine directly to PHASE_MACHINE_INITIALIZED, there will be no 
> chance to configure what Igor did with -preconfig.

Right, that was only NUMA.  I have to check, but I think it can be moved 
to PHASE_MACHINE_CREATED.

Apart from that, if we add a third command for the CPU model, that third 
command would run from PHASE_ACCEL_CREATED so the pre-existing preconfig 
state would be accessible.

Paolo

> Is this something you don't want to support anymore, or it can be 
> configured in another way? Or is this something that we haven't thought 
> of yet, but we should?


