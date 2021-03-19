Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D339341BAD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:43:12 +0100 (CET)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDX5-0005OO-B3
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNDIv-0000qV-Da
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNDIt-0003De-SU
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616153311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WU/dYRut1Lu3UeRTNVxUrh6Z/H3WSOZC3c+Mm6OVU8=;
 b=ZsgTRECC5wRO0jEmjnVUcN7Oesmi/PLbTh9dy/7Q17pvcMZzGU8hIAJJyMRuhqi9/0eGDB
 BNuQlikL2uKmE0SWS28d2SznpFqn+Vd9upicAnRzIIIF5CeJ/bCVjjh7aq/+zYKCHvfB99
 B1sDgWgGaprHxbScA9E/8zt3NJZAiUI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-A613m6hGMCqzq53eWs3B_w-1; Fri, 19 Mar 2021 07:28:29 -0400
X-MC-Unique: A613m6hGMCqzq53eWs3B_w-1
Received: by mail-ej1-f70.google.com with SMTP id gv58so18041860ejc.6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5WU/dYRut1Lu3UeRTNVxUrh6Z/H3WSOZC3c+Mm6OVU8=;
 b=W2GsE5euTA30Gi0DKTzEhiFl2vtpgAnA8gXoU/NN79DFdMlQL5aYR2Fkwkxt8m0sZT
 GUdi4vnzsPuwcXfnUsPRozPEnuurBJJ4Y3JfbJLG5WLyAt2b6DNi/rz7QE1tOLPgYYir
 f6/ZYJ0JWaPIA/RguXht6bZ+KytL0xR6O3j1/QLssravEut/LK0jogN6BYLSbbHnSwV+
 f9/7IEQKJeo3eqmFywqvDHrXCV/HdzrsO1/jnz/N5z2a45vJ8Y3K6ybb0Q5oZVurCXwX
 J+7cR7WWlr6GrR+ALE9pY2nRD4SbGO7xMpn/B2kgXlgk3Ie7hmBlogfHzuEuJh3zfxUl
 TvfQ==
X-Gm-Message-State: AOAM533rfn7DCPaPtXZ69wibHjN7W9fL7r0WJcTo/Qlk54t57LA3w3q1
 sGDZTIv4ik1amLzOFe7G4E+Ia98iTYDYvCLsJnCbFOQG2lh2H5pU1cpoLQaot6+QJWq/SvpuhLF
 3LX4np7bqU3+PkkA=
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr9014435edu.114.1616153308539; 
 Fri, 19 Mar 2021 04:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWBq7rIiMZ3ut4DPEJGhXDmlFtjo1S5JDf1iZ7KrQ5vau/0nV0fsX45BSYtaJzf/1gwB1tLw==
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr9014421edu.114.1616153308363; 
 Fri, 19 Mar 2021 04:28:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a2sm3567694ejy.108.2021.03.19.04.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:28:27 -0700 (PDT)
Subject: Re: [PATCH] tests/unit/test-block-iothread: fix maybe-uninitialized
 error on GCC 11
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
References: <20210319112218.49609-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <43389c06-36d8-b754-8265-d776aaae749b@redhat.com>
Date: Fri, 19 Mar 2021 12:28:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319112218.49609-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 12:22, Emanuele Giuseppe Esposito wrote:
> When building qemu with GCC 11, test-block-iothread produces the following
> warning:
> 
> ../tests/unit/test-block-iothread.c:148:11: error: ‘buf’ may be used
> uninitialized [-Werror=maybe-uninitialized]
> 
> This is caused by buf[512] left uninitialized and passed to
> bdrv_save_vmstate() that expects a const uint8_t *, so the compiler
> assumes it will be read and expects the parameter to be initialized.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/unit/test-block-iothread.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
> index 3f866a35c6..8cf172cb7a 100644
> --- a/tests/unit/test-block-iothread.c
> +++ b/tests/unit/test-block-iothread.c
> @@ -89,7 +89,7 @@ static void test_sync_op_pread(BdrvChild *c)
>   
>   static void test_sync_op_pwrite(BdrvChild *c)
>   {
> -    uint8_t buf[512];
> +    uint8_t buf[512] = { 0 };
>       int ret;
>   
>       /* Success */
> @@ -117,7 +117,7 @@ static void test_sync_op_blk_pread(BlockBackend *blk)
>   
>   static void test_sync_op_blk_pwrite(BlockBackend *blk)
>   {
> -    uint8_t buf[512];
> +    uint8_t buf[512] = { 0 };
>       int ret;
>   
>       /* Success */
> @@ -141,7 +141,7 @@ static void test_sync_op_load_vmstate(BdrvChild *c)
>   
>   static void test_sync_op_save_vmstate(BdrvChild *c)
>   {
> -    uint8_t buf[512];
> +    uint8_t buf[512] = { 0 };
>       int ret;
>   
>       /* Error: Driver does not support snapshots */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


