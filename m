Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C54E2D15
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:03:25 +0100 (CET)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKVA-0000cI-75
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:03:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWK8x-0006Hw-Pt
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWK8t-00088k-0w
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647877222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXlIU786Cdujb/tOH3GRknK6b2HKNAl+Jc4ULG9gCWk=;
 b=IKeMZZWycgeuWFq1Pb/QcEzsuzw0BMOfVW4RnxMNuA4nnznPuALwz7Z1REpLvUIuVIcyq9
 P14zVFReMuWG6CC9nAF2HrgOMrexq5l9UiW3aWZXKlfG9KIT+eYk1PV4qO7MlVpbnSqSsE
 P+ifGH0zjagKAcDlNpWDaDlSWS92tZw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-c44_xFwBNF-FOIFfIDU3_w-1; Mon, 21 Mar 2022 11:40:20 -0400
X-MC-Unique: c44_xFwBNF-FOIFfIDU3_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r128-20020a1c4486000000b0038c8655c40eso14982wma.6
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QXlIU786Cdujb/tOH3GRknK6b2HKNAl+Jc4ULG9gCWk=;
 b=MR6p1+hQHRsDbTTZu1ahupn1lpt5VdYp0O/aDxdoFwya90vK6L4EYxye5YM9v3Blxk
 BzqQPlGgbSS57VnlcmDL/5kKWFOTXuamu2Sw/UW2cFYqAU8QYKm80Fhja+3WVs2Kyr5X
 tLWQ3EE6a6g61L8353bZ91opluSR2wBxIHfwnE/JSDg/V3yS+Z+Yr3SuXKnsErOc0AW4
 3VWX+Qnuyb/2TvIduGy9k8mNI9/83FTxOYyL4Sm/iqOVgOcqetZ1NVyWJvGly4+12col
 TJcGJEXUFb/g+ACjolwBgbiIdDiVJv0p+SgTWmRTJDOwmld/8MIufH4X+6/ysmXZBs94
 rwiA==
X-Gm-Message-State: AOAM532g9DISa6kHTVdSuEE2A8Z9pzT/TP87/T+xf2Jyp+v+5evnkO4u
 uhaNSfz50w5ieUJnroDedqxRPfhDNZUaoDT8+EDhzCNk3SlAavtPQFwI3XPX4ZI3cUfpMlSl/++
 3V2JhgJcyjeXnzug=
X-Received: by 2002:a05:600c:35ca:b0:38c:9933:41c3 with SMTP id
 r10-20020a05600c35ca00b0038c993341c3mr9314373wmq.200.1647877219281; 
 Mon, 21 Mar 2022 08:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2h9xUJk7g+6KfbRMa3bd3TpiOuyfswKbU4xCJymewNfxddJW6G1oJd5kZ2hzHkl5qh6CWAA==
X-Received: by 2002:a05:600c:35ca:b0:38c:9933:41c3 with SMTP id
 r10-20020a05600c35ca00b0038c993341c3mr9314348wmq.200.1647877219010; 
 Mon, 21 Mar 2022 08:40:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm14256904wmj.34.2022.03.21.08.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:40:18 -0700 (PDT)
Message-ID: <136ad982-5517-0141-fe69-d700efd82e2b@redhat.com>
Date: Mon, 21 Mar 2022 16:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 06/11] target/s390x: vxeh2: vector {load, store}
 elements reversed
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-7-richard.henderson@linaro.org>
 <ec84c578-1518-26e1-b1a9-082f1eeed2dc@redhat.com>
 <49573ed3-2084-fcd0-5765-cf1c83e78c3a@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <49573ed3-2084-fcd0-5765-cf1c83e78c3a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 16:35, Richard Henderson wrote:
> On 3/21/22 04:35, David Hildenbrand wrote:
>>> +    /* Probe write access before actually modifying memory */
>>> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
>>
>> We have to free the tcg_constant_i64() IIRC.
> 
> We do not.

Ah, then my memory is playing tricks on me :)

-- 
Thanks,

David / dhildenb


