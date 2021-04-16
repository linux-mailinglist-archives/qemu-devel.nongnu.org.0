Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13B362599
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:23:13 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRFP-0005gM-Um
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXREc-0005Cs-OC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:22:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXREa-0006sn-1p
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/be2flijRMrqu3LzEmuXpCudrTbxo2cZaiHsp29hkxg=;
 b=CTh75L0nh/KqigVXXHSbyltkbDy/xkAW8XsHZnT6lVMxMrMNObycy33bAWTqNV9DSiAC9M
 CPJyzqFKKPi4ka7sLv+bfTBusLyJmfu+wt+ldOSozuTm+Ekj6fTnO/x7PvObHGXeFOXVVo
 NJrQW3XoE2unYqiXrb72et9GtW0UElo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-C19G9ZJGN0ONlAfANgEZXQ-1; Fri, 16 Apr 2021 12:22:16 -0400
X-MC-Unique: C19G9ZJGN0ONlAfANgEZXQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 x21-20020a1709064bd5b029037c44cb861cso2194647ejv.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/be2flijRMrqu3LzEmuXpCudrTbxo2cZaiHsp29hkxg=;
 b=jFf+QwRf6ZTEdGJMLMugnfLZPefNYo3sjfFZh99bKK92VPHnAd3GL0N+jWk6zTKu8H
 CpPbVLM69mgJ+IvC+BlyP0nDxqcnmWm7LZC9KSNS0Yg7nqkDkEWc/HjDNzC+HP5oTCEP
 Qj75Yg8rqtWRGLRw0A+jeTHzR/2n8QH0sJRwzCvhEVuRzpAjBIOzO0rGdUEdKWeJ2N39
 GsUoRUD8+5ISOx3dmDC0xrv/W6hVn7+dDnxKlz7A4y2pdEgvELOSOzam2c96sQCAKyDJ
 D+z9rA72fklEM+at2ZAtN4x+2Lw5JHtkuVmTdNjy7KBBvZNPdbNBjm2mV9rBD9Wy818p
 C5RA==
X-Gm-Message-State: AOAM530tePSol/dTd0CjfpZhYp0xgPjPrBEpq8R7FVyYdqDN2c59qWU4
 P14zzv4gA/mtTsdHA4yFLxiMAQQyPHjPqbVFpn6pnUDXJw7csYFXHMVVc/UrPTtC0gZceHzYfs6
 +KrSsP+wlDWbSUHk=
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr9119776eje.30.1618590135003; 
 Fri, 16 Apr 2021 09:22:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzX41bN5OprOfWtTHyOXZqUthMR6C4tkEycOHiAELjN+hW/ghCNeOR5jq3z4tawL/uSlUwgg==
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr9119749eje.30.1618590134803; 
 Fri, 16 Apr 2021 09:22:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id la24sm4876318ejb.71.2021.04.16.09.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 09:22:14 -0700 (PDT)
Subject: Re: [PATCH 0/8] Tests: introduce custom jobs
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad6d0dda-ba29-d9e5-1ca9-d849ef28eb66@redhat.com>
Date: Fri, 16 Apr 2021 18:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/04/21 23:51, Cleber Rosa wrote:
> Different users (or even companies) have different interests, and
> may want to run a reduced set of tests during development, or a
> larger set of tests during QE.
> 
> To cover these use cases, this introduces some example (but
> functional) jobs.
> 
> It's expected that some common jobs will come up from common
> requirements for different users (and maybe be added to a common
> location such as tests/jobs), and that very specific jobs will be
> added to directories specific to certain groups, say
> "contrib/com.redhat/jobs" or the like.
> 
> This series does*not*  add new jobs to GitLab CI pipeline, but this is
> expected to be done later on custom runners.  That is, custom runners
> could be used for custom jobs.  Anyway, a GitLab CI pipeline can be
> seen here:
> 
>   https://gitlab.com/cleber.gnu/qemu/-/pipelines/287210066
> 
> This is based on the Avocado version bump patch:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02391.html

I admit I haven't even having read the patches (only the diffstat), but 
still: documentation please.

Paolo


