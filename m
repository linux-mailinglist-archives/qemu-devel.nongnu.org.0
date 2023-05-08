Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF06FB37C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Wb-00030w-6N; Mon, 08 May 2023 11:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw2WW-00030W-RH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw2WR-0000CS-TA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7U3PV/gcSP+vQiWVMGZmA7vXOzS7LXXwAAk45zZURiI=;
 b=b2qqHUq/H5Vjm39s4gcB56cTL57cGXcIN/ux3fSmx8Y8VleuB3kOgLuW1V4sSLlIY51pqm
 5ST9IndBUSvlLv7sSCCMvCxsWSd/99MzLGfZpJe0SI3Wfst7pluz4Qa4hrZTsD/EU8k1e5
 ey92g/BwXXQlKu7WbhzAXGWExYiIaP8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-Q0YGL-kWMcyWeeka2xYs-g-1; Mon, 08 May 2023 11:11:26 -0400
X-MC-Unique: Q0YGL-kWMcyWeeka2xYs-g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso576201066b.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683558685; x=1686150685;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7U3PV/gcSP+vQiWVMGZmA7vXOzS7LXXwAAk45zZURiI=;
 b=L6MrfxVzCOL57ZW16QJmSDFwAkiiJ++tcQyx18C9QqA8yjJ5YlbdfIpkNOnZoL2s4F
 sgJLnvb4zZkVAy4YY1wB9JpId4WRNcdgUS/P6DfJRAd3om2eFLPKzk1XwMSufwC+86Bb
 qeaFoPCC5pueR2OLO5kuSyKq9bHuFrNk4Mey4OeabX9hWj3igu0vfzHtAPj6B8EWZ7vu
 bYQryLKA0fZ2I22oNijpb1SqBZWZ9iOsG1HKmDdLFazxbZItNpQccqn2xbKqu0ZcbIjd
 qI5hCEjTHnp9HGPHy8OVXpKKPJw8mf37WoqnCtO4BaWZewwQqSbqYETkF/JmXv1gZU1h
 sl4Q==
X-Gm-Message-State: AC+VfDzFrkQTtXRJydiptNwdatB2Wc9ZeH1yoX7a3W+HaTFcsFh1XW1z
 1cvJkMXPXKjAKouE46HMgKyudU9PWi/pc0emc2icMT9XnKsou555NrXX2yo7rL9G6JhvEf2Fxyt
 HfXTeJ7qTtVSGL8ssuciCO0I=
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id
 xa13-20020a170906fd8d00b0094f35210394mr8024079ejb.51.1683558685266; 
 Mon, 08 May 2023 08:11:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4n3v5Y3rX9mpgtVQ3xNlRm78ipyG1aE7TOXHJUghE3IQUw9DkNq1mj8RBuU1k7EHOvE/AJvw==
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id
 xa13-20020a170906fd8d00b0094f35210394mr8024060ejb.51.1683558684911; 
 Mon, 08 May 2023 08:11:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 v9-20020a170906338900b0094ee99eeb01sm75647eja.150.2023.05.08.08.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:11:24 -0700 (PDT)
Message-ID: <daf7118f-23ee-c883-d033-17c8e10cdc61@redhat.com>
Date: Mon, 8 May 2023 17:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: How can I find problematic uses of error_report() with vrc?
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <87v8h3mdef.fsf@pond.sub.org>
 <70100e22-6d7d-bb84-b2ed-e64d7929d2c5@redhat.com>
In-Reply-To: <70100e22-6d7d-bb84-b2ed-e64d7929d2c5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

One fixlet:

On 5/8/23 12:41, Paolo Bonzini wrote:
> Let's just cut out function  pointers for simplicity:
> 
> (vrc) paths --limit 1 qemu_ram_resize [!ErrorPP,function_pointer]* 
> error_report
> <no output>

This should have been

   paths --limit 1 qemu_ram_resize [!ErrorPP,!function_pointer]* error_report

but the output is indeed empty; it was just a matter of cutting-and-
pasting from the wrong line.

It could also be written using DeMorgan's law as

   paths --limit 1 qemu_ram_resize [![ErrorPP|function_pointer]]* error_report

where the outer brackets are not necessary but improve readability.

Paolo

> Okay, so this one was a false positive as well.
> 
> So you can see the good and the bad here.  The tool is powerful and 
> finds what you asked.  The problem is that there's _a lot_ of hay in 
> which you have to find the needle.  For coroutines it works bettr 
> because we have already cleaned it up, you can get there but it takes 
> some sweat.
> 
> [here]
> 
> Let's try a more precise (but also more restrictive) query that only has 
> a single function that does not take Error** but calls error_report:
> 
> (vrc) paths [ErrorPP] [ErrorPP]* [!ErrorPP] error_report
> error_report <- qemu_open_old <- qmp_chardev_open_file_source
> error_report <- runstate_set <- qemu_system_wakeup_request
> error_report <- machine_consume_memdev <- machine_run_board_init
> error_report <- numa_complete_configuration <- machine_run_board_init
> error_report <- egl_rendernode_init <- egl_init
> error_report <- parse_numa_node <- set_numa_options
> 
> I checked parse_numa_node and numa_complete_configuration, and they're 
> genuine issues.
> 
> Let's add a couple labels by hand to see if it finds your example:
> 
> (vrc) label ErrorPP qmp_migrate rdma_start_outgoing_migration 
> qemu_rdma_source_init
> (vrc) paths qmp_migrate [ErrorPP]* [!ErrorPP] error_report
> error_report <- migrate_fd_connect <- rdma_start_outgoing_migration <- 
> qmp_migrate
> error_report <- qemu_rdma_cleanup <- rdma_start_outgoing_migration <- 
> qmp_migrate
> error_report <- qemu_rdma_resolve_host <- qemu_rdma_source_init <- 
> rdma_start_outgoing_migration <- qmp_migrate
> error_report <- qemu_rdma_alloc_pd_cq <- qemu_rdma_source_init <- 
> rdma_start_outgoing_migration <- qmp_migrate
> error_report <- qemu_rdma_cleanup <- qemu_rdma_source_init <- 
> rdma_start_outgoing_migration <- qmp_migrate
> error_report <- qemu_rdma_reg_control <- qemu_rdma_source_init <- 
> rdma_start_outgoing_migration <- qmp_migrate
> error_report <- qemu_rdma_connect <- rdma_start_outgoing_migration <- 
> qmp_migrate
> 
> Mission accomplished. :)
> 
> Paolo
> 
>> Here's my find-error-fns.cocci:
>>
>> @r@
>> identifier fn, errp;
>> position p;
>> @@
>>   fn@p(..., Error **errp, ...)
>>   {
>>       ...
>>   }
>> @script:python@
>> fn << r.fn;
>> p << r.p;
>> @@
>> print(f'{p[0].file}:{p[0].line}:{p[0].column}:{fn}')
>>


