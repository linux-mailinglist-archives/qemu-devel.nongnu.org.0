Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A843947E129
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:13:15 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0L62-00043x-0M
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0L4Q-0002Zl-VO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0L4M-0005mK-I2
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640254288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0VxZ91h1637LceCYVXSAaG/Q3PzMx23wfzxwZW6V5U=;
 b=hvOylqIEzN35VulQTjbXtlAXZ/74xnIC6BgjAiJmqk32xzz9epMub/1WO0E8PiV086kqoN
 0KMq417NT0NUUxx9YaDEIbrWEKa559fJSVWflKhvWA3ak2q2nfcNpe44fhx3WSeMJR8MPv
 HFpUeDpu27gAlrXVmzeuIfBiEZddLA0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-NDGnGj6rOZyUTF5LX5g_1Q-1; Thu, 23 Dec 2021 05:11:27 -0500
X-MC-Unique: NDGnGj6rOZyUTF5LX5g_1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1816804wme.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l0VxZ91h1637LceCYVXSAaG/Q3PzMx23wfzxwZW6V5U=;
 b=8QbRHJM/cjDho/Aa+qGMzRZw8OVtbbUic9L/RG4EJlm/RJDaHldG3Ojpse0yCo+ysc
 Wfm0JFxiuJH+QdKZTHuLq3qhnHL8ffOb5E1e+c40s3QSPS38KsXzTJYz2beYP3gZVxk/
 z+amuD5+9j7Mmx1GQkWffBKTRDWRz2TljogBAaGKdIUipEEtN7H9FiUPaFG3Gp49B7dj
 fmq0zVOoUyZqinxlxkiQ/aS5gNve8gXk+XEJFugo0IbtBEfMMwGdVEsxh76qZpi5ZY41
 mxnEbP5YBu0Q2cY5RtZ5M9LTtiJU9wqwj4U4dLTWhjg7hkMiiiDR+P8j7REwipm7n3rA
 o3Pw==
X-Gm-Message-State: AOAM532BPdCLwrDLFTs0i8qyWjrT0z+MUa5aw6IEObR1imjpatEdCcrb
 0RbS8bitt3Usttv+wMsHDLyK7aqs/+ivzxo/w0jUrqqFGqE3h+hh+i6ZYd9tQhfyoooKWct8GfV
 D/Oxn8oTtioqrzH0=
X-Received: by 2002:adf:d843:: with SMTP id k3mr1277688wrl.303.1640254286159; 
 Thu, 23 Dec 2021 02:11:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEnyS3CzxTs4touMGJiCmhPeIZoK+hGfG1YZinBxfLviNfOnqa6vtRC9bCr97t2BQtWuFExg==
X-Received: by 2002:adf:d843:: with SMTP id k3mr1277666wrl.303.1640254285875; 
 Thu, 23 Dec 2021 02:11:25 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u20sm6332119wml.45.2021.12.23.02.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 02:11:25 -0800 (PST)
Message-ID: <0a856200-c53d-ca61-32e8-dd2d65e747c3@redhat.com>
Date: Thu, 23 Dec 2021 11:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] block: print the server key type and fingerprint on
 failure
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118143547.2045554-1-berrange@redhat.com>
 <20211118143547.2045554-4-berrange@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118143547.2045554-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 15:35, Daniel P. Berrangé wrote:
> When validating the server key fingerprint fails, it is difficult for
> the user to know what they got wrong. The fingerprint accepted by QEMU
> is received in a different format than openssh displays. There can also
> be keys for multiple different ciphers in known_hosts. It may not be
> obvious which cipher QEMU will use and whether it will be the same
> as openssh. Address this by printing the server key type and its
> corresponding fingerprint in the format QEMU accepts.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   block/ssh.c | 37 ++++++++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 7 deletions(-)

Nice!

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> diff --git a/block/ssh.c b/block/ssh.c
> index fcc0ab765a..967a2b971e 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -386,14 +386,28 @@ static int compare_fingerprint(const unsigned char *fingerprint, size_t len,
>       return *host_key_check - '\0';
>   }
>   
> +static char *format_fingerprint(const unsigned char *fingerprint, size_t len)
> +{
> +    static const char *hex = "0123456789abcdef";
> +    char *ret = g_new0(char, (len * 2) + 1);
> +    for (size_t i = 0; i < len; i++) {
> +        ret[i * 2] = hex[((fingerprint[i] >> 4) & 0xf)];
> +        ret[(i * 2) + 1] = hex[(fingerprint[i] & 0xf)];

(I would have found an sn?printf() solution a bit simpler here
(snprintf(&ret[i * 2], 2, "%02x", fingerprint[i])),
but now you already wrote the code, so...)

> +    }
> +    ret[len * 2] = '\0';
> +    return ret;
> +}


