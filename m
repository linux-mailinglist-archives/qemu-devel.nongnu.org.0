Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5D3E23D5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:18:32 +0200 (CEST)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBu7j-0007wN-JY
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBu6p-00079o-Ia
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBu6o-00038Y-6I
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628234253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9IHpTcADPANjU27GMvrmRxjRwMx1Koo+6MLKbI6NGk=;
 b=E9EaAwVgGLuPLkw2jmVmmN8aenMfoV6MvmosOMe5FUYe59KtoOzNu12Y1b1d94w6XPROZB
 VCAdh5dAHwF12omgSmdt+mHzPm+jw8rSEODGcJwMPFNMeZtq/9NFOVX+d5ZRCeX3h1Q2xV
 gXbCMT67cf0U553c3HYmGxVrvbWvBxU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-KPDTgeKSPkmz3MzeuVBAtw-1; Fri, 06 Aug 2021 03:17:30 -0400
X-MC-Unique: KPDTgeKSPkmz3MzeuVBAtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o67-20020a1ca5460000b0290223be6fd23dso1714633wme.1
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/9IHpTcADPANjU27GMvrmRxjRwMx1Koo+6MLKbI6NGk=;
 b=CNpQWmgUy3jQUE12kSx+DqHwr6EQvp+ZGlY/dMirmRnyPBJJqxVv2QDPTMq3Jq5Ct1
 J35D+aIC0iSk6rK0Hvc8Ik7qbqyzZbgZle/NDSg4aYvw/lionW/5Ggu/7hJyA50/D09o
 E/n+xJcrWf+NRJBSZ7bzGVLxSD6b0iWW3l/uhBrPOeWEcj02Agoyw5E5KHBzleEotLpY
 zNTFD0kIRI6A/8ysKHEuI12Kx63p0JpL56+t1vxgqXKtHxetnXYNq9WO1BBLIt9gX/Tz
 o033ToJx8F+p/RZcpmotmAcRYowVmRmCTfInqOQ79nvNRs1UtOES4Wm0PafLedRORcyW
 C0Tg==
X-Gm-Message-State: AOAM531dc4okYNgHInPoN1RgQYTKbX9kOcuJ8xYaFKVqdMwV6XIy9s/l
 llGN/3wMLbpGgNO9sjtL5oa8n8Ghv+jT6kJrmwgGBSCYO8KwhJIF3rZw790xS6EY5UVbp18lzH/
 eFsMy4ElQCBTakNw=
X-Received: by 2002:a1c:238e:: with SMTP id j136mr1762105wmj.91.1628234249169; 
 Fri, 06 Aug 2021 00:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwseRYkaBCrXjSccKb3VyJIqPoXmWg1YHHQxAv4Ss/rmlC+1xUiuFW2mQosdZ4JWnnB78R10A==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr1762083wmj.91.1628234248953; 
 Fri, 06 Aug 2021 00:17:28 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id x15sm8290240wrs.57.2021.08.06.00.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:17:28 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
 <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
 <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
 <2806b81b-4e80-6f85-5f0a-ce78bb6ee3c0@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <efd67ce2-aaff-9887-c318-f184290f2d0a@redhat.com>
Date: Fri, 6 Aug 2021 09:17:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2806b81b-4e80-6f85-5f0a-ce78bb6ee3c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 09:11, Thomas Huth wrote:
> On 06/08/2021 08.52, David Hildenbrand wrote:
>>>
>>> According to the PoP:
>>>
>>> "When the enhanced-DAT facility 1 is not installed, or
>>>     when the facility is installed but the multiple-block
>>>     control is zero, general register R 2 contains a real
>>>     address. When the enhanced-DAT facility 1 is
>>>     installed and the multiple-block control is one, gen-
>>>     eral register R 2 contains an absolute address."
>>>
>>> Don't we have to take that into consideration here, too?
>>
>> We don't support EDAT1 a.k.a. huge pages yet. If we ever do, we have to
>> further extend this code.
> 
> Ok, then maybe add a comment or assert() to make sure that we don't forget?

Well, we'll need modifications and extensions all over the place to 
support EDAT1, so I'm not sure this will really help ... we'll have to 
carefully scan the PoP either way.

-- 
Thanks,

David / dhildenb


