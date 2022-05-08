Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE151EAB6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 02:39:55 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnUxm-0003xj-JU
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 20:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nnUwq-0003GB-H6
 for qemu-devel@nongnu.org; Sat, 07 May 2022 20:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nnUwn-0004Ok-Te
 for qemu-devel@nongnu.org; Sat, 07 May 2022 20:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651970332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGDF8pVwDhyRrNmAVitN6G/hKsNrG8t+hjv7n+8VP8I=;
 b=e5/XmkiZqnsE4bKNdLjp2qFM8bAxXl2rcfo2Wq+33iOKIjrtFO2xoJz0UM4OBGhxJiCdbt
 Tp4bmNGMPCZ3RgDch6Tf8yildfXg3OUpphgHglwsOsLWDvh0ifpptIiA8Dbss0A3hVEE8W
 f1ZgDJzsrsXkFr8Fh+MELAuvpXcd5zk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-FM8-tCPbPh2PGoyvixvJgw-1; Sat, 07 May 2022 20:38:51 -0400
X-MC-Unique: FM8-tCPbPh2PGoyvixvJgw-1
Received: by mail-qk1-f199.google.com with SMTP id
 d186-20020a3768c3000000b0069fcfacbea0so7452534qkc.0
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 17:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PGDF8pVwDhyRrNmAVitN6G/hKsNrG8t+hjv7n+8VP8I=;
 b=Lr4DZjjez+vxTXdcUVPVn5M/1OZEJWpcRBZyLitLooih9TeaHMopB7vbbrH6E1LXQd
 6mST2iTQqJfQLetjuZddf8m5frg4ISwuHKdFyPnJpvgNgPkp+DlfwSFWjWgP5+JFZWOD
 59hgmAGQSIQGimlX+JYmGdXM1FBzxAh5YRguNZH7AhVLG4foQkg8VAwawmhaZI78SfMR
 Zm6aq1VLoUfTcXID8txn0mpFi5cK68VdQ0K+MnIpZz1V1GviaDb5PeaSY6AxMVYheiIf
 Hx04JTbnC4BNgIhfh0E2ndyL8XtS7co1Qm0P3mQKoZc0I3qkNqhi3pwXMbXKvsQ+zKQh
 4YVg==
X-Gm-Message-State: AOAM532HlEJoUzdJh23JPgRokhS30Jil5A6nriOWeHqNcWekPduyE1tg
 auJMowzelBiA9QHrzgvPjDNnB2D5sROkGLMbTGHZNHRhOcsL/xNhfkGzz5pGPXDVD2QpyOPJx03
 F888OG7hmfxwB5tg=
X-Received: by 2002:a05:620a:1aa0:b0:6a0:a34:15e0 with SMTP id
 bl32-20020a05620a1aa000b006a00a3415e0mr7382173qkb.19.1651970330761; 
 Sat, 07 May 2022 17:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxox/XLw1XBebDTTvS3/TrPqcV2VGEU8dqkj8Cqf5fzbOltFgJKgiZ12nJ3WT/DdStv6O4mGQ==
X-Received: by 2002:a05:620a:1aa0:b0:6a0:a34:15e0 with SMTP id
 bl32-20020a05620a1aa000b006a00a3415e0mr7382163qkb.19.1651970330499; 
 Sat, 07 May 2022 17:38:50 -0700 (PDT)
Received: from [10.23.153.165] ([46.248.132.196])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac867cc000000b002f39b99f6b7sm4947498qtp.81.2022.05.07.17.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 17:38:49 -0700 (PDT)
Message-ID: <ed4a912d-e614-3109-7e1e-d4a27ef01dc5@redhat.com>
Date: Sun, 8 May 2022 02:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] linux-user/s390x: Fix unwinding from signal handlers
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
 <20220503225157.1696774-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220503225157.1696774-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.22 00:51, Ilya Leoshkevich wrote:
> Commit 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
> removed an unused field from rt_sigframe, disturbing offsets of other
> fields and breaking unwinding from signal handlers (e.g. libgcc's
> s390_fallback_frame() relies on this struct having a specific layout).
> Restore the field and add a comment.
> 
> Reported-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Fixes: 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
> ---
>  linux-user/s390x/signal.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index f47713e04a..4979c4b017 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -84,6 +84,11 @@ struct target_ucontext {
>  
>  typedef struct {
>      uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
> +    /*
> +     * This field is no longer initialized by the kernel, but it's still a part
> +     * of the ABI.
> +     */
> +    uint16_t svc_insn;
>      struct target_siginfo info;
>      struct target_ucontext uc;
>  } rt_sigframe;


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


