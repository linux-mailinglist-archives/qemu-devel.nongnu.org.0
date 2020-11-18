Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A92B7FD5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:55:45 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOs5-0002Jz-0T
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfOqW-0001Hq-2S
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfOqU-0005fu-78
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605711245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YL3mHiAg18kRRSwZOpXirw5pq7oaRUA2noAbQfpde5A=;
 b=YSBHdssSnAwuxyS2nDTRMMSCo0bVRqItZVPToon9iusyfroxNxsgzgMffJuZdstgs39W/F
 Q04zl8Cl/ogQDmpCHNLtA7CXPtNfjMqBM6oJ0YMNwWbRjGz4BPiVl1x5qntAXrbcXyqpV3
 FcFJvqD06rdpOuzf9fwGruowCmjRGKM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-y2AaSgqAO0eAZglofqYS4Q-1; Wed, 18 Nov 2020 09:54:03 -0500
X-MC-Unique: y2AaSgqAO0eAZglofqYS4Q-1
Received: by mail-ej1-f71.google.com with SMTP id 2so950409ejv.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 06:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YL3mHiAg18kRRSwZOpXirw5pq7oaRUA2noAbQfpde5A=;
 b=esHI/qhNbLwg3sPTErUVh5rPv4O39NbGXZ52L1ccxfCrfeGIUW3HISuzFZmaK2UKrw
 BxN90t+vCUu7w8hoAHz9ke+WZj0PsxGkU13i+YGamIHFW4pJqQvgZXXL0fltF0tSp1EH
 0jr7MOor+keLldZJSOegDj4ANCfEQ/1wOdRBETE1lPxgU2cC5ZCXb1PkvunOMGP3ga9G
 tnwMnOAw5jDwOHWiVqIVOhpmkCynPjbxm6qXjMYtrYX/CfptmHjYHyZ0XzGwJD+cncXL
 5nNfJW+uHAQ/zYF3HNcA4YYWWhePDVJ/IUAQSGzENrasNmg0dzVDvUSrhCXghUIem6uu
 V9MA==
X-Gm-Message-State: AOAM533in3rqANgeHJCJxl7OvOvLAWHqxQ+lVvEufPYU+UDWC3i50pRu
 kzdqX/NCRfnxYjAK5oaDVlDjBx/skSmrXVUbXth8Se9amX2nmwyodMiePHj0ZhvJLaE5xu65EoW
 GRiyHcO91eEHC2eA=
X-Received: by 2002:a17:906:3641:: with SMTP id
 r1mr25200231ejb.391.1605711242207; 
 Wed, 18 Nov 2020 06:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm2Be9Ejb0xRzxBMX5UNL8Gk51cexOCwTxJa0abt+/fxwJ/6pWsV1yjmOM/8YB2NFy8FMRRg==
X-Received: by 2002:a17:906:3641:: with SMTP id
 r1mr25200218ejb.391.1605711241986; 
 Wed, 18 Nov 2020 06:54:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k17sm12726005ejj.1.2020.11.18.06.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 06:54:01 -0800 (PST)
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
To: Markus Armbruster <armbru@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net> <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local> <87ft57oycu.fsf@dusky.pond.sub.org>
 <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com>
 <87r1oqlsmy.fsf@dusky.pond.sub.org>
 <07b90b7d-2216-d0db-57d0-ea1fa4a32f44@redhat.com>
 <87k0uiiv0q.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7b4c4d2-3cb6-37a9-45b7-38336875780d@redhat.com>
Date: Wed, 18 Nov 2020 15:54:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87k0uiiv0q.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 15:45, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 18/11/20 14:08, Markus Armbruster wrote:
>>> These look like errors, but aren't; things are working exactly as
>>> intended, and QEMU runs.  If we want to be chatty about it, we should
>>> make them info, not error.
>>
>> If there were an info_report, I would have sent a patch already. :)
> 
> Commit 97f40301f1 "error: Functions to report warnings and informational
> messages", 2017-07-13 :)

Doh, I just learnt about info_report.  It never occurred to me until now 
that without a warning or info marker it would be an error.  I can see 
though why you didn't add "error" automatically for REPORT_TYPE_ERROR, 
while leaving REPORT_TYPE_INFO unadorned.  Between the 
incorrectly-marked errors and probably some "error: error: " it would be 
awful.

Paolo

>> In general, these are probably not the only cases where error_report
>> is used as a fancy fprintf(stderr), rather than to report actual
>> errors.
> 
> True!
> 


