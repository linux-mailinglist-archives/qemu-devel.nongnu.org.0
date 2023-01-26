Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968BC67C804
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKz9S-0006zh-8e; Thu, 26 Jan 2023 05:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pKz9O-0006vl-1I
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:06:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pKz9L-0003Yh-JK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674727590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/c6h29Cm5dSs/lf3Y+uVEOywxKG7KwtMu5N7B8h4mk=;
 b=dWPzYDBoQUnxrGKja+SfwB2xBTz74UatbVxA3rh6ye1SlOz5SSIP0ZPg+wukZkxqF4HSez
 AgRAwBAqCzfoI3TcRulFjl+T/KeM9V6Ct3zH+8KkyfXJni+9JTryOerO+BGIvVBoL+sAMU
 BdU1yf9Ubm3gAC4JsTsVPCuMhKIEeNg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-mqPDPeq2M2qEL_52VyNO5A-1; Thu, 26 Jan 2023 05:06:27 -0500
X-MC-Unique: mqPDPeq2M2qEL_52VyNO5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 o11-20020adf8b8b000000b002be143c4827so184764wra.19
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/c6h29Cm5dSs/lf3Y+uVEOywxKG7KwtMu5N7B8h4mk=;
 b=WgGU1wm23NfL8LTdGnSr+6jIQaasMwaCB+cXHJdgdMvB9KLeiQGEFh2sEswYHaD+nu
 rUV6uLVnRLS1uUmug2SJCOEDHvrnPsLEoWSKK2b/n7gLbOxARWH6U0nuDU0jiPgU8Iob
 0k1lhJPu5qK7TaC91+dQQXJGuj8S3AjQXej3iZd5ALDW+HnCU4YvP62GRPvUAX/iQ06+
 q2GQBhuNZuGaNY+Y+nPYebe5cTbpAQ38TD0fU5rWx3k3Gqr7eRIEBYwCjbQQlV6nD8iQ
 gVfrZzfQl9RdqUFaoKFe1cu8ih+gUtpIv1k1kdxyMJOxLdSgnsq3PLB8HvyIdRA2MGfb
 qX1g==
X-Gm-Message-State: AO0yUKW4QDTWKXzlP9RPdZTGXRY6k9kHf6+3yreMM/jjTU1Q+PLFvJlB
 zJAiN7imvXZixi9UlqjE+7rXkZRT+FyxN3BE0hpr2XS4J9o2yt2j2uDgroX/zGdFqZs2bDqryqJ
 B9L5H0owByL1gzVY=
X-Received: by 2002:adf:df85:0:b0:2bf:bfc1:f622 with SMTP id
 z5-20020adfdf85000000b002bfbfc1f622mr3397705wrl.64.1674727586733; 
 Thu, 26 Jan 2023 02:06:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8nLCZTfMGNaJEpzPUCfvFFQQ1Qum+ysIVbg6hKK+v/m4vBoHkQzIuW6kbFJMgG1RKMJCg5UA==
X-Received: by 2002:adf:df85:0:b0:2bf:bfc1:f622 with SMTP id
 z5-20020adfdf85000000b002bfbfc1f622mr3397685wrl.64.1674727586419; 
 Thu, 26 Jan 2023 02:06:26 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adff086000000b002bdbead763csm853096wro.95.2023.01.26.02.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 02:06:25 -0800 (PST)
Message-ID: <44efae8f-f254-5aa2-9b6e-11b43408f545@redhat.com>
Date: Thu, 26 Jan 2023 11:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 30/36] target/s390x: Use Int128 for returning float128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-31-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230126043824.54819-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 26.01.23 05:38, Richard Henderson wrote:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Remove extraneous return_low128.
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


