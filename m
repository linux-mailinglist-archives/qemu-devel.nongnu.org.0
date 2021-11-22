Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E18458DF8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:04:13 +0100 (CET)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp83P-00061M-Om
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp81H-0005Bd-C1
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp81E-0002MZ-Sv
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637582515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CzzSYQPjqmTpSYeNyQj95bYxr+Lu0SBMuhBueKyvho=;
 b=P+h1Y5vYg13poysA+6kpcCW8FpAxCka13eAbBvZp/GLDo0zNlvZBSw9wbO15iMiOQpNR5A
 qkx0E2GaL6XsK5tzm0ZugC/qZoxkWMQ9/rOotQFltyL2yYjx76s47xKvuiX/dK194etiX8
 ER/vg0YAAvVjPa2k9AaGFcSNpUsLojU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-E6S9V2PJOv6jNoca5D5Pdw-1; Mon, 22 Nov 2021 07:01:54 -0500
X-MC-Unique: E6S9V2PJOv6jNoca5D5Pdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so10080860wma.5
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+CzzSYQPjqmTpSYeNyQj95bYxr+Lu0SBMuhBueKyvho=;
 b=ljeeoW6uxqQZvQz47ED5qDuroiMykWtZDEiKtYtPqVAqYnhzOC4tsnvrlhO01nDast
 Z5/0qEEs+a3zvpxKquvPQl9yNHNgMjoWNRZHbNYN9v458hqZrbZjJo8MvC3R1x+Z6RKM
 nH8IGVxYBzR9iyuLze6+ovLVMKQTnVF0SeXi75hPvzMl6lQqZ0coExFqwAoaMdN9qdPf
 aNLMd11Px/B7igZqmebCxak/h7y7lO1vD5r6ieiL3wkZdiWEpSP8lMCMSx4CQExzLujH
 d6ysMOYNkvqDY9n+lpXrd4AW9+gYk7WHzCR4ITiD/XmboyKuOL8+sIAJGYnPmtKn3r6V
 kRiw==
X-Gm-Message-State: AOAM531aivaK43JTWLDz6UH2yT4qHUC5uDaZ0q0yBorhAgIi9/TGdEYf
 cHlMOoYgxIHaVjfGTtaD7538YBIZ3kRTHRH0hTCFILO9pmfVOLUUPmgkje7m/WfX/4fGFUB2W1p
 ICNPU2KI3OTakEpU=
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr29420684wmq.34.1637582512944; 
 Mon, 22 Nov 2021 04:01:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznfsj9dMbgjPXCgQTFA3c4GkdcunULioJ6hWdPFpJdfp5XRwKVRTzXXxFGUmuVgC7jwttEoA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr29420659wmq.34.1637582512778; 
 Mon, 22 Nov 2021 04:01:52 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id m9sm2234890wmq.1.2021.11.22.04.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:01:52 -0800 (PST)
Message-ID: <3c54b0ab-85b6-bb86-93f6-ecfd6c63f346@redhat.com>
Date: Mon, 22 Nov 2021 13:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] virtio-mem: Don't skip alignment checks when warning
 about block size
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211011173305.13778-1-david@redhat.com>
 <20211012032705-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211012032705-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.10.21 09:27, Michael S. Tsirkin wrote:
> On Mon, Oct 11, 2021 at 07:33:05PM +0200, David Hildenbrand wrote:
>> If we warn about the block size being smaller than the default, we skip
>> some alignment checks.
>>
>> This can currently only fail on x86-64, when specifying a block size of
>> 1 MiB, however, we detect the THP size of 2 MiB.
>>
>> Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Thanks Michael, will you send this for the v6.2 release?


-- 
Thanks,

David / dhildenb


