Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C645432DA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:42:54 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywtZ-00032y-AO
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nywRK-0005rO-JA
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:13:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nywRI-0007il-Uq
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:13:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id h23so30673007ejj.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dUiY10kJ3SWNb5am+hka4/vL3JkTd2j/XWvoryNovLA=;
 b=VY6jE+M88hrsQbxJD5gfhWb7zzvutycvOhMGSPfUyAPgqUY1VWyus+4ePRVWQz6tXQ
 SwKu3WYCCVZxX4dflgecMtcpc3ITb7RMmu0UQNKKNeQ+PxpbA5eEfMFGlYlYEDh3b99c
 KF+m6Qu1aYwazR5dCHBkyaqTQzP5p4resSUjK1UkogzWWPGKKCSO/E5OyFZUfMBw9rwa
 gnc3WxGxNiei6gE8XiAtCd9yKHNY5XuyOYhX5Oadp44rwD/liXf/0Ea+QbwLqaQ4VDPm
 itLHReCgULqcejJEkvuUDv4RxvvljV4wDY/Lzy9oT5Cr0pMylqdZa2VvzAFhEFlW8O35
 c/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dUiY10kJ3SWNb5am+hka4/vL3JkTd2j/XWvoryNovLA=;
 b=ERPnEoiYmSTtehjg22rcruSOT+NdAHqE+etVOMNjzYrMG8rrYF3SAhUe9KqTE/LL0D
 dQS7zdrnHuY/+DtkaRkxUKY8lS1Po0Wsg36DuYuUDAh/C3EZmttQGvup5RkzDCuH4PbK
 xMS2oYxOwOWhd0o4hhjhtoWdkyHBHpF7zgsqUVB+TF/dHFEyiyREm6T07aLpoX2+ReaI
 KUFtkyEAsw/Qyba4WqfgZVCtQ3KaULeiOnypqixKdcZTzzR3UgNdoYjnCd5VHkW+XjRM
 +J2b/hqdTStVuPCVmTBY4HuTWCPhiib/Hn00aRiwU9AXE4B9KTgk2SO2Z8z7LQwKeAZw
 UbsA==
X-Gm-Message-State: AOAM533pVkdY6RO6Xt4xjkP9eMntn96RPRIQ2fsfajU2I8DPAK+hQwii
 LcQbjWkxLO6IiiWbMbA+2AM=
X-Google-Smtp-Source: ABdhPJw7uUJQqgLde3rs+9LfiMpJnPATcBbhfJ0uxD3sbttH+VvpxMRFUNKLZz18Kpv1oRron7KCIA==
X-Received: by 2002:a17:907:7f06:b0:6fe:b81f:f885 with SMTP id
 qf6-20020a1709077f0600b006feb81ff885mr31727328ejc.621.1654697618381; 
 Wed, 08 Jun 2022 07:13:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a05640205d300b0042de8155fa1sm12657536edx.0.2022.06.08.07.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 07:13:37 -0700 (PDT)
Message-ID: <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com>
Date: Wed, 8 Jun 2022 16:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com> <Yp+ObQxOi/EXc6PZ@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yp+ObQxOi/EXc6PZ@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

On 6/7/22 19:44, Dr. David Alan Gilbert wrote:

>> +        return NULL;
>> +    }
>> +    descriptors->kvm_stats_header = kvm_stats_header;
>> +    descriptors->kvm_stats_desc = kvm_stats_desc;
>> +    descriptors->ident = g_strdup(ident);
> 
> There's something that confuses me here; you check your set of
> descriptors above to find any with the matching ident, and if you've
> already got it you return it; OK.  Now, if you don't match then you
> read some stats and store it with that ident - but I don't see
> when you read the stats from the fd, what makes it read the stats that
> correspond to 'ident' ?

If you mean why not some other source, each source has a different file 
descriptor:

+    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);

but the descriptors are consistent every time KVM_GET_STATS_FD is 
called, so basically "ident" can be used as a cache key.

If you mean how does it access the right stat, here it uses the offset
field in the descriptor

     ret = pread(stats_fd, stats_data, size_data, 
kvm_stats_header->data_offset);
     ...
     for (i = 0; i < kvm_stats_header->num_desc; ++i) {
         uint64_t *stats;
         pdesc = (void *)kvm_stats_desc + i * size_desc;

         /* Add entry to the list */
         stats = (void *)stats_data + pdesc->offset;

Paolo

