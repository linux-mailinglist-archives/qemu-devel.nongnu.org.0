Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599D4FE03A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:35:22 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFjr-0007kg-KQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1neFhK-0006bU-Qv
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1neFhI-0004ba-J1
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649766758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ouc2uABnjTSm9/aUQzWzGi6GiW3YulliowsOo5NICuw=;
 b=IZzWjybx9A5pZmdxH35wya7SdRjD72UM4pG1ymIBy5lq0Ki3HMpw/s0dFwz1KmuP8pU6VN
 tBMe7872c97S8R+xFj7iiYzdBzQsXU70lkD9ooICZ1gFJOQ0N5dp8LU0b9vmjsK8jVnvpU
 VMeOvhcLOZfLr3eFnyJcf5UphC+UADE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-baiNVECOPxmUxG_Wi8sfig-1; Tue, 12 Apr 2022 08:32:35 -0400
X-MC-Unique: baiNVECOPxmUxG_Wi8sfig-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020adf9f0e000000b002079eeec6b6so1535121wrf.22
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ouc2uABnjTSm9/aUQzWzGi6GiW3YulliowsOo5NICuw=;
 b=ifqbJODT3yABcCTof6ctx8JAASlx7Raa1PKgkLUU8Epo5XipkTGrrG5oGgY37wRtED
 LGa6fpHq1vd9qzq7zDK07nziDEcKxajn6J/j9YE24VVKfiy95SkSUd77xq0pAWC+EXWq
 eVhW9sXXbuCuplok2St2KYsXp/+SIfONIt5LEjF1/HUxGzjDynDQTJEOtete4w7CLEty
 BsF8kBZGfmIPjTD0517vXcWcHgMP9L9jXoDv2RcpTOqunz+N/NdOXhmLWh5Bc2OCYYyJ
 M8zCXiIRpZWJLbcnq+JJRjZ1XGWdb64FxAiQ9aKOn1i222oyig+yRw2YP/VNoToCOCY6
 lx4Q==
X-Gm-Message-State: AOAM533lm2c6LCRNWkK99jcPu+uYehdOhHjCTLrJSDC1rLvhB0hqjr4k
 ShgANo/9BGCIKGXdTWFDZtpfghuqfsTJqvuoE+/xonNTU3yAxVzYLzyneDSh3QaxGLPfgn9lGYF
 CEhOAGSzg7B3ouFI=
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr3896071wmb.93.1649766754666; 
 Tue, 12 Apr 2022 05:32:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUvX2ICpFWU6za+zyMIbRn9KPnSwlb9ctIxrFdfYE2249WkJ3hyD2bsS/f6uyayXutGbfy1g==
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr3896049wmb.93.1649766754445; 
 Tue, 12 Apr 2022 05:32:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1800:7c14:16cc:5291:a9f3?
 (p200300cbc70718007c1416cc5291a9f3.dip0.t-ipconnect.de.
 [2003:cb:c707:1800:7c14:16cc:5291:a9f3])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d6c6c000000b00203ec2b1255sm36437819wrz.60.2022.04.12.05.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:32:33 -0700 (PDT)
Message-ID: <2e817203-a761-8395-9218-9cb348b7ef26@redhat.com>
Date: Tue, 12 Apr 2022 14:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: David Miller <dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
 <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
 <CAEgyohUqmHrbQC5yqAtuhcqmnx-q5YxE+6xctbCVROGz+cqrqw@mail.gmail.com>
 <05661926-6d26-9d78-b576-a33391e25c24@linux.ibm.com>
 <654b2fcd-0532-4484-d9cf-f875acedf7ee@redhat.com>
 <CAEgyohVRpn51FDaJ4xa5Ysfjo51g3yOpeJCjJqCK0SXkEHmQqg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAEgyohVRpn51FDaJ4xa5Ysfjo51g3yOpeJCjJqCK0SXkEHmQqg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, farman@linux.ibm.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.04.22 19:03, David Miller wrote:
> Recommendation for comment?
> 
> /* vri-d encoding matches vrr for 4b imm.
>   .insn does not handle this encoding variant.
> */
> 

Sorry for the late reply.

".insn doesn't handle vri-d properly. So instead, we use vrr, which
matches vri-d with a 4b imm -- good enough for our purpose."


-- 
Thanks,

David / dhildenb


