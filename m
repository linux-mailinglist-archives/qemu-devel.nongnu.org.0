Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0B6ABD99
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:01:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8ag-0001kX-GX; Mon, 06 Mar 2023 06:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8aC-0001b7-Vx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZ8a8-0002mW-5g
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678100439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5d2p1ElJ9do5TuhJlhKmI6n/SuYv6NOHped0KPD3s0=;
 b=LgedpIIlPCRbUiovVy6nOLew6Y0VhRduyb8DZoZq0GM3wq4CAQAfwxqP/5KGLrch0qpDFs
 uTsRzdDrNFMPgRliSBIbJ/3qLy4t75YV+DvvwfJwgeOeeofiNCCmQfko3jyhhmheHFxAaN
 szQTGxVOTdddRO8GQg77Kb6u1XEkYXg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-3yZxtriTPiKTSSE35iTNEw-1; Mon, 06 Mar 2023 06:00:36 -0500
X-MC-Unique: 3yZxtriTPiKTSSE35iTNEw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1361919wrc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100435;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5d2p1ElJ9do5TuhJlhKmI6n/SuYv6NOHped0KPD3s0=;
 b=HA8ZrJZfwkiq0gB6K7IWyzOwNnEhHwgDMJgKSgt7vpXJc2ZBcWuYM2ZMQStj+6UIJ0
 hcYj1INgbajmxLjuLg9HWV+VDIUibU1BzR8vnkY+DQZhUhjFNLFYocGE0jUAmlm9xyqp
 f7nZmgh9dItoqN8bAFrfkhTJN5Jf+Xe51np8SW+scBXd3qAKvE6pE56KHhHz7JxM+1I2
 0WfYnzaWuoLQkNpoUykAHsNxIOKG6o9RH2VvfhrEJCG3V3wfs8OsxBScedRu9Gkojcg+
 5RCpM2wTAg+t4FfW3iugqlwhbNK54M+mlgYGbSz/DW0wMmKAGbo6QNw/HUyyoAgxTgt7
 JEAw==
X-Gm-Message-State: AO0yUKWEhrN69Sm+S4f8OWbDSOAtmqaNW9L5kSC+g7EazPq8YSWocY+N
 hdx/oJBVMzFwSroo6jBDTfIS2Z7v5LnltS789gMgtMHpg5/naa/U4lEM90IxxBRgXfBJqEhjIsb
 IhEXOLEbxcxWxepw=
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id
 t9-20020a05600c450900b003eb32ff0da8mr9403591wmo.16.1678100434965; 
 Mon, 06 Mar 2023 03:00:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+Qj9lzfcXBk3/bowrTuFcyoJ6Avi513EE4Rc4C0s1WIsU0mlFp3zKmFrzjBvleQReUUYOdCQ==
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id
 t9-20020a05600c450900b003eb32ff0da8mr9403571wmo.16.1678100434627; 
 Mon, 06 Mar 2023 03:00:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003eb39e60ec9sm9560308wmp.36.2023.03.06.03.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:00:34 -0800 (PST)
Message-ID: <9780e523-1bc7-df7b-2a55-4cd40c9fd435@redhat.com>
Date: Mon, 6 Mar 2023 12:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 13/20] target/s390x: Drop free_compare
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-14-richard.henderson@linaro.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230304181900.1097116-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04.03.23 19:18, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> Remove the g1 and g2 members of DisasCompare, as they were
> used to track which temps needed to be freed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


