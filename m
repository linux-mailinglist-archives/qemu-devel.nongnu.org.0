Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55756628BA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtMf-0001vV-Mp; Mon, 09 Jan 2023 09:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtMa-0001vF-1v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtMY-00065m-FR
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673275377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqgr9CNoN1ocvZ5fzfjVgbeJyxZTq+v1fsDHAcX952M=;
 b=XVoXzeQpl+2EwYDW8EOVNIxM4LPpWbzgbcl5SkT99EMCF5c7efgmb88vGrN6bs2XPjmZDQ
 kd1cXVQLMXsn4AkeU24HV4hEJOsBMbxJZDdfQuVjU2WiYyl+7n5VQGSjiwKyP8t4ZIjtR9
 x9+ntgal+4OY8Hw3N8Ns6oAD+hZQytc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-5ScqG8jUMqmX8WLgxKGeMg-1; Mon, 09 Jan 2023 09:42:56 -0500
X-MC-Unique: 5ScqG8jUMqmX8WLgxKGeMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso7373866wmb.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqgr9CNoN1ocvZ5fzfjVgbeJyxZTq+v1fsDHAcX952M=;
 b=x/5xEEDzmedVu8fNIMYdfddQG4LbSGGQHqtLfIEBWrOwVFQPFczpDST8UKVC4EJvHH
 PpHkS+cFrY6DL5KPPlL3quHREZ5FJILyktkruKxgHHoCELW0nhlKNLIQFB6+mnZeUC4w
 9yDA/0AZh9jDg7nHX30pb3iGj+2Aidx9Ew2PpO02Y6ifMGCb6N3s6VNgUtDZ8gJfmBnC
 vsVRTejgZCNo6/wvR3jYlvgkC9jGN+rznN8UT5cIt1C1yuwZL/GOxljNHzkesssjVF3w
 MWVxgnvCfZVGxnVf3ujMDw1Gm62HxlqPTEK9pmSPCtytAHO68AG7E+oqBz17rdtpf0MG
 cqrg==
X-Gm-Message-State: AFqh2kqy3IhOwVYZATWcLgHTBLS3H0IUKSRAANSBEqPojLJRJvXpiG0q
 bn9ltiL9IXw7Q+oQRNscEBW8bSl1DpS5NKrPgFwdAda3aPBIiX033Ifh7LGTQjQ9bGH2cnoBHyR
 tD1zPFtsfGaFsthI=
X-Received: by 2002:a05:600c:4854:b0:3d3:5a4a:90ff with SMTP id
 j20-20020a05600c485400b003d35a4a90ffmr48850484wmo.23.1673275375259; 
 Mon, 09 Jan 2023 06:42:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXusne7feucIki7iO6xWiJCcX5XpyOtUIAOnG16y0qJUVnTqIrsIMUVL8nZ0t1eIg4JyRMWhSg==
X-Received: by 2002:a05:600c:4854:b0:3d3:5a4a:90ff with SMTP id
 j20-20020a05600c485400b003d35a4a90ffmr48850468wmo.23.1673275374950; 
 Mon, 09 Jan 2023 06:42:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:8f00:ba3:7d27:204f:8e29?
 (p200300cbc7038f000ba37d27204f8e29.dip0.t-ipconnect.de.
 [2003:cb:c703:8f00:ba3:7d27:204f:8e29])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003d99fad7511sm11208399wml.22.2023.01.09.06.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 06:42:54 -0800 (PST)
Message-ID: <4b70ab3b-c9ea-636b-3139-31ab1dab0809@redhat.com>
Date: Mon, 9 Jan 2023 15:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/6] migration: Factor out checks for advised and
 listening incomming postcopy
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-4-david@redhat.com> <Y7cGdweVxbGlcvWh@x1n>
 <44b9b396-f3ae-5066-4674-4c4eac5f9b2e@redhat.com>
Organization: Red Hat
In-Reply-To: <44b9b396-f3ae-5066-4674-4c4eac5f9b2e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 09.01.23 15:39, David Hildenbrand wrote:
> On 05.01.23 18:18, Peter Xu wrote:
>> On Thu, Dec 22, 2022 at 12:02:12PM +0100, David Hildenbrand wrote:
>>> +bool migration_incoming_postcopy_listening(void)
>>> +{
>>> +    PostcopyState ps = postcopy_state_get();
>>> +
>>> +    return ps >= POSTCOPY_INCOMING_LISTENING && ps < POSTCOPY_INCOMING_END;
>>> +}
>>
>> This name is misleading, IMHO.
>>
>> The code means "we passed listening phase" but the name implies "we're
>> listening".  We can add the "incoming" into that if we want, though.
>>
> 
> Let me call that migration_incoming_postcopy_running(). Thanks!
> 

... which is also misleading. Let me just drop the sanity check and this 
function.

-- 
Thanks,

David / dhildenb


