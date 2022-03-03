Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116D4CC4A0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:06:38 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpqX-0000Sb-6z
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nPpp0-00086I-Gn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nPpox-0007oQ-BF
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646330698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=je4Ez9zw3+n43JLMjMydzHZHA0H/zhhUcbvnDYr65kk=;
 b=HSbopCNrvhpZCH0VdccCK0WUPtTcGjny+tL+5vfFZdRsrq+w9YXOrwQ/J0JJQz4pSHBdGN
 x8l4s9j/yCbu2MymZVFmz7cPH6QNZ9GIVJa/yJ3ZyFLL0j/kSI1OzwZVvqr8zUnNsmpkTC
 1YhRGLY+7CIfQ4BromfxKZ/hVGwmH38=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-mWemzB1ROJe0dajK6AcQDw-1; Thu, 03 Mar 2022 13:04:57 -0500
X-MC-Unique: mWemzB1ROJe0dajK6AcQDw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso2091977wmh.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=je4Ez9zw3+n43JLMjMydzHZHA0H/zhhUcbvnDYr65kk=;
 b=5df5LstSY1u3ezlAuwM7oKR+VOu7amkx1TnkFM2pRXYiX5tAl9Mn0va4Zf9Q/h4Qkt
 /+zMXjhABQ0DCU86ZNoOJMSq5GJy+G3X2atZQ8MHnGF9JnJSOag3l1vcgi3EEiFhMzBw
 SdCxvoz1OGAwvQNKHSlSOy6lyiw3MZEs2qujndSID528ISO6STxTeq7gcNah7MZgP+Su
 ngVFoq2m1knn8vidgum67T8INLh4i1AfgU/OwQUemPe6uTQ4eC8mwcfJTI4nXpS+E0N2
 +10x3t1PI5yzsLwmTdZ5y/5zOrPaKZLAU619RPSL2kdxNQAxCOhYex21lurykkWFQ2Bv
 uD8A==
X-Gm-Message-State: AOAM5337c//U9bdkOL37SKVFjreOsyhdRzKulB0uDteLbEiGVziAGrtp
 QG6XNwHlV6jpdBbFJCyR6KuRzhpINggzb1IKkNunQNK/9cf0+vnTYFEBxydANgre45m1x1bIZNf
 ih2LvGVKMfea9a8A=
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr26287158wru.426.1646330696064; 
 Thu, 03 Mar 2022 10:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe4Km+5MDGingZWnKKkuefhb7fs355wyBrDWr8a2Fc9QaIxsMAFXqhc+syA/0aubeA0gJ3gA==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr26287143wru.426.1646330695809; 
 Thu, 03 Mar 2022 10:04:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:3600:f39a:d830:baab:42f0?
 (p200300cbc7063600f39ad830baab42f0.dip0.t-ipconnect.de.
 [2003:cb:c706:3600:f39a:d830:baab:42f0])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b00386bb6e9c50sm5684141wms.45.2022.03.03.10.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 10:04:55 -0800 (PST)
Message-ID: <64fe466b-f374-60f6-92dd-3d6caaf892ee@redhat.com>
Date: Thu, 3 Mar 2022 19:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
To: David Miller <dmiller423@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
 <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
 <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
 <9fa82035-b273-9c44-16e4-c859a6de5b6b@linaro.org>
 <CAEgyohUZjHp0b5Ku9AvmNM48WRCaQWeji49OMXdT9euBn63rHQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAEgyohUZjHp0b5Ku9AvmNM48WRCaQWeji49OMXdT9euBn63rHQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, farman@linux.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 19:01, David Miller wrote:
> 
> Makes sense,  thanks for the quick reply.
> Last question,  the patches can depend on others in the same set right?
> IE:  all of the additions to insn-data.def in one, implementations in
> separate patches.

For bisectability, each patch should be self-contained and can only
depend on earlier patches in the series.

See my VX patches to get an idea of how it could look like, e.g.,


commit e58de341d948d12cb36bbc5aa4866b7412581880
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Apr 10 22:45:35 2019 +0200

    s390x/tcg: Implement VECTOR SUM ACROSS WORD

    Similar to VECTOR SUM ACROSS DOUBLEWORD.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: David Hildenbrand <david@redhat.com>

commit 8dc69a196eb2e3e8ab1d033b378e4f5a5efaa219
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Apr 10 22:40:01 2019 +0200

    s390x/tcg: Implement VECTOR SUM ACROSS QUADWORD

    Similar to VECTOR SUM ACROSS DOUBLEWORD, however without a loop and
    using 128-bit calculations.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: David Hildenbrand <david@redhat.com>

commit fe2be36d26b3d3e86246c88bb09a9613b99dc6c9
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Apr 10 22:48:25 2019 +0200

    s390x/tcg: Implement VECTOR SUM ACROSS DOUBLEWORD

    Perform the calculations without a helper. Only 16 bit or 32 bit values
    have to be added.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: David Hildenbrand <david@redhat.com>

commit bc725e65152c57d42f19eec134c99940114d6362
Author: David Hildenbrand <david@redhat.com>
Date:   Tue Apr 9 23:26:47 2019 +0200

    s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW COMPUTE BORROW
INDICATION

    Mostly courtesy of Richard H.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: David Hildenbrand <david@redhat.com>

commit 48390a7c2716a128155b872d5316cda5f55dcfa9
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Apr 10 22:15:07 2019 +0200

    s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW INDICATION

    Fairly easy as only 128-bit handling is required. Simply perform the
    subtraction and then subtract the borrow.

    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: David Hildenbrand <david@redhat.com>



-- 
Thanks,

David / dhildenb


