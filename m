Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04E528834
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:13:51 +0200 (CEST)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcPu-0004L8-Uf
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqbzh-0004QN-RH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqblB-0005Cd-OQ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:32:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id fd25so5994059edb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JDUf9P+S6NTt3D99ppDqmwR631HQ5e6TF9MP7a0wRNM=;
 b=knIH3A6IJWY2jRXyEDYj0RPCRpTJXLD6dA3YqYkVGlAH7FptzdAtVLBARlBnwWkbDu
 U1RuKnpFlH2VskmmHPeLyY/ucdDna/49TPAZ6blSfC/pzp1VmQ/roYBTAcYwgskL6QcC
 JzXCnVtO2l/M6yU0JHYvyhcMI7yChsSNZMG485EuKov9TWUHFKV0EnlY6niajNao48t6
 SfNXNoElQBEcrW8zcbPmIxHs8/u+eCZTe0NfS24KBdwq1xfILk4cNMdt8xppD2ClhFlO
 hHiN8Ytq2KQr104X/7XA1C6ArVV7yqjsu533chzOdLW8aPchtNZ2OMIw3UzDRPaQ9DIv
 /Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JDUf9P+S6NTt3D99ppDqmwR631HQ5e6TF9MP7a0wRNM=;
 b=CXVIHMSUVjeP81qSt0rBvg89Zxxm/ka8wIuPSVH904G9myD2JBs2OjbbOkIrdlKK8L
 4rg+jV4X/qpIB64Z2G3TV43CT1K0n8msnD3CbfU3sW77jjFN2pemZ9f9evuoQyZhliWw
 b4x/j+as5QLQL+YbNWSbjiY6bAX4qg00wSn0qH/mjzje/Dx/HcmmJHO5XKQNvVfqd42H
 0MyrQnyjxC3magi+NLITjIzCayvFkSgfabNuhs5QJAP9JIDOF+MzjVzDTiyjzjEyyN7p
 AzF01bsyJsT4k3/ypoDqD83xdxPMJhvCyL/hNd1R2IjOb/qn8X8e7wGzCuHRnWvwhAmz
 ZGMQ==
X-Gm-Message-State: AOAM531LXbiyZeDrzyyL5NW4CEMKhIKE1oEaS6iSyuyWU2++gqLF7QR2
 ljXjql4am/3k/bsNHS5P+Eo=
X-Google-Smtp-Source: ABdhPJwj0uC66cZdo8eZOzMFPZj+l2YN7KnxV64R9E/g6etQ5hBMGvSml5ENXjw4HsDQ4Bi4A0lqbA==
X-Received: by 2002:a05:6402:5190:b0:427:f1c8:a897 with SMTP id
 q16-20020a056402519000b00427f1c8a897mr13791579edd.52.1652711486648; 
 Mon, 16 May 2022 07:31:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b21-20020a170906729500b006f3ef214dffsm3784088ejl.101.2022.05.16.07.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:31:26 -0700 (PDT)
Message-ID: <034fc387-ef82-a472-ad5f-2d4e32024d80@redhat.com>
Date: Mon, 16 May 2022 16:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/8] qmp: add filtering of statistics by target vCPU
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090234.1195907-2-pbonzini@redhat.com> <87lev1y98k.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87lev1y98k.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 5/16/22 14:04, Markus Armbruster wrote:
>> +bool str_in_list(const char *string, strList *list)
>> +{
>> +    strList *str_list = NULL;
>> +
>> +    if (!list) {
>> +        return true;
> 
> Are you sure the empty list is supposed to contain any string?

Well, it matches vcpus missing below but it breaks with vcpus = [] 
(nonsensical but valid).

So I'll have to catch vcpus = [] and names = [] up in qmp_query_stats.

Paolo

