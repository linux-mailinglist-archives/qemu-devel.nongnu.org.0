Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F294501EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:04:07 +0100 (CET)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYqM-0001I4-AG
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmYnS-0007XR-2R
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmYnP-0005do-1z
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636970458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsBqmtiJdyrFD4xfIkuJEm4lGzCyJHMqvH9RDCqjjhI=;
 b=NkHhUjyz01syo/FKGmeMinC9oaELcAVWYORMc7Y3wNKh4XSZXSSVKpzYcxOC3ZskOJjByQ
 ZkDiTb920T9F37uHQmDeN+T6bpW2QvxmFfetV4AndSVdAELGaY1LqZpT/1abhg9FH0m1Gi
 OFHeNiBvQn14x2xPAIil6WyUqmJqwD4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-5QS-Fqe3OV2rlca9APQK4g-1; Mon, 15 Nov 2021 05:00:57 -0500
X-MC-Unique: 5QS-Fqe3OV2rlca9APQK4g-1
Received: by mail-wr1-f69.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so3352294wro.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsBqmtiJdyrFD4xfIkuJEm4lGzCyJHMqvH9RDCqjjhI=;
 b=NEB8Nb6Ojoi75rj2R5lX+Yg1J0177YSN7b/BbL0GbK/sssqrvKU5yzKZj2Fp2XhCGj
 nZMvNJ0lRLp74rnThyRFN9dQIHBO8OsKEoRy/GZ6ppHwaxfK/o+YrwfqjzxNkGUYZ8gn
 yKTWjJE82Bj8GyrFiRoxbcwB22/h1VYxegAvuVezd6el5tZTNkS8K4LXFlDusyFEoIoE
 l1riitWzSJOayzlu5iNl9DZGBx/uA0QQ4X7s5y7LcYPX0bbjUGANQl1AtwaOKf8SFa5k
 hIiKtRIMCZzCiYe2W2/rg8giRNFxbYPYQY8CQNMtCOkadkB7FhMiLe+14n8hbguIJ2Qw
 ii0A==
X-Gm-Message-State: AOAM530psfWu+S70Af8fvSu3t9TZFgVI76XRaB0Gapa4hpM9U8ZQVMnE
 tmNjWbDyvs4CeeXofWhdVnTdsdh5s8ZYc9XRTuhkJ45yvjy9iXzezxaZx7iw1Ytdkqq3+9gnVmJ
 R5OLn2LBel7fAGek=
X-Received: by 2002:a5d:6902:: with SMTP id t2mr46794432wru.317.1636970456599; 
 Mon, 15 Nov 2021 02:00:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoPUQA+g8s3cOyDmj6q7C6oOoBMG6cZ5vVk8/fs6rKGWKhfNag026VSzKiMDMjqNNHLFKLug==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr46794414wru.317.1636970456492; 
 Mon, 15 Nov 2021 02:00:56 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b188sm13335539wmd.45.2021.11.15.02.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 02:00:56 -0800 (PST)
Message-ID: <95a48a5f-021a-e981-fabe-446c258b9dfe@redhat.com>
Date: Mon, 15 Nov 2021 11:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/2] qemu-options: define -spice only #ifdef
 CONFIG_SPICE
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211115080312.64692-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211115080312.64692-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 09:03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Marc-André Lureau (2):
>   qemu-options: define -spice only #ifdef CONFIG_SPICE
>   vl: typo fix in a comment

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


