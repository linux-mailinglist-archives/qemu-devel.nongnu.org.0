Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C652BBBC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:14:02 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKR6-0008FY-IV
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrKKD-0000jB-Vz
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:06:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrKKC-0000be-FG
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:06:53 -0400
Received: by mail-ed1-x531.google.com with SMTP id c12so3143630eds.10
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BZ6lMYi4CFf1mmgsP1lWjXJdIVMIE2MwZuB/eAelruw=;
 b=U60annpcskKlpULTR/Junj0sTwR/J2/daaFcNaQtgwPfrr/tS43t7M2hxOTo1vggwP
 KRzanA84PrWFXYI5UztaOMV8nPtSZYRxc4REVrg1QFZOlbUWU8RAuaZ7T3ZAZVuJVbXM
 dbkgeFmKzQXxjB7hwjohDHl/3G3ZOadCs/Ex9Yq71jk6K9Z5BabsBN2VyuPh3HU1a6xu
 TWVOhh0r8KvqFtiMxvSpz8u/QeiRVwFKBTyOPp5K5K9peSl0M+wJUrgrByMjHIURUbjm
 qEd1s/6U8HVEh2ob+6Bt3vWQtumbeAUFSLXC/DbzxTNzVjY759ccI+cSUTkLEJETyIJl
 pZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BZ6lMYi4CFf1mmgsP1lWjXJdIVMIE2MwZuB/eAelruw=;
 b=DHodToKYAlfLtpLnSbB10pzjQpcMz03wykoGm3USr9Uv9Ne0dYI/1emslSqTaDgLgq
 EYeN7zSuurmgEDeI87+WjEMtm68a8ANnOcjkK8RPk6OwD8RfTnykQ2GGkApZQ7f+GsIf
 O8utTY1qpi7UsNb9RnWoYz5Vf2flrrlCHQby5vsw6Y2bo9LEiK0PrKYNyiJXY2ivmIgj
 a+rOff5m9PZ7NHZAR0PosGdK5DHaqsld5EkpJRrfBwC3S7FMfxQrujPTcBEhOE8LlIeE
 i4DaStqc52o6p9IAy1zUE9g6hcA6eQshnX49vPR8UYOqs1RrZCqo+Q9xRssm6L/a/MHF
 R74g==
X-Gm-Message-State: AOAM532PsPEWK9cZF6sQN4Z6Lyh+Uf7djLLO/5hYBCxQ/6Eprz+/UKDz
 TaGXCJ8/0Ytpy/QWw8fxYTfeTp4QsWs=
X-Google-Smtp-Source: ABdhPJwbT3BO6nISOAEg3bck5vwffZb/nBmPzhFiUsVqIuEPwe1Q/e1YszjE4ebf5mJ0WLRYfUEUPA==
X-Received: by 2002:a05:6402:388d:b0:42a:ba9f:f85c with SMTP id
 fd13-20020a056402388d00b0042aba9ff85cmr14063062edb.292.1652882810398; 
 Wed, 18 May 2022 07:06:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 en21-20020a17090728d500b006fa9820b4a2sm969765ejc.165.2022.05.18.07.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:06:50 -0700 (PDT)
Message-ID: <9851633b-d9a3-bc71-afd1-d24fe8972177@redhat.com>
Date: Wed, 18 May 2022 16:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>
Cc: Igor Mammedov <imammedo@redhat.com>, dzejrou@gmail.com,
 qemu-devel@nongnu.org, david@redhat.com
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
 <20220518121716.658ec569@redhat.com>
 <843da9ebf73d89a5084d4e29d972fdaa8b79bfae.camel@suse.com>
 <YoT1OolqFQ9+5t/q@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YoT1OolqFQ9+5t/q@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/22 15:31, Daniel P. Berrangé wrote:
> When picking defaults there is never a perfect answer, it
> is more a matter of the least-worst option.
> 
> It is pretty clear that nthreads=1 is terrible for any
> large VMs. Defaulting it to nvcpus made conceptual sense
> as the user has implicit said that they expect the VM to
> be able to consume nvcpus worth of CPU time on the host,
> so we might as well consume that allotted resource.

I agree.  Yes, one could argue that the regression was on the libvirt 
side, but it's easier to fix it in QEMU.

If we later add the ability to create a memory backend before machine 
creation (for example with a QMP-only binary), then it's of course okay 
for those backends to use only one thread and require a manual choice 
for the # or preallocation threads.

Paolo

