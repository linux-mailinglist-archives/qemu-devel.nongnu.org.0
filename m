Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC547E0EB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:38:11 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KY6-0003WC-Ez
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0KXE-0002bz-N3
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0KXB-0005jm-84
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640252232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaHf7+NmeQB/mBumcO3eN4ICaAAm6Nokq4Q5fTRqzKQ=;
 b=AMtc/Kf7uGPcKEV+KHcA13nicltoS0IGHWUlDAxyqAiz0wib8B4hWvkl9wQBc0FoPGUjGJ
 mEaBUV6VHmWSymXVP8BJl+Onz03aDkJtmN4v/uf2uX0wektxpp1lKdhf884oVemF+kfmoU
 hV0VBu7zxT+kWVbZ7Xjx8kbsh20Wi28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-_d57uG3HOAi-1seAlT-boA-1; Thu, 23 Dec 2021 04:37:10 -0500
X-MC-Unique: _d57uG3HOAi-1seAlT-boA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r8-20020a05600c35c800b00345bfa31160so1746203wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jaHf7+NmeQB/mBumcO3eN4ICaAAm6Nokq4Q5fTRqzKQ=;
 b=rpGqHaVJ9ZO9K0Qh2NIvPis8sLkiBSxWCikkhYm0LsftT8KbZXMNIgGY8chaMAVJdi
 EtsmZjg+0ZVAxiwBTWsr4Exr7hJ38H8ed3MBjGcjtvYFzKM6mK4nCq0CNLRZ6wehhdWp
 M0Gxi2ahq7ddQEoffHRecqX4+zkgKez4HuV36ueHQhzTAIeoMdpjR44L5AXZR6PVRega
 rm2WBKvR+SgAOSriJVnepgXA00sA6A3FglFdRZGgQE6x/vxrkmJwzhtMETr5tmask1qe
 KE6Od3vxQ70Qsj6HmbRI5I6U5LfiRf3xh+fcvTzgq3XsU9THhmaUFpetJL1F84CrFUoB
 6CqQ==
X-Gm-Message-State: AOAM5322AhUuJAeXnrt1XCgfl7lOkfH/uE+mX7zvZTN4/997pHiJX1js
 sBMpXtjX1ec6EWYmclm5XcjVLx9InvkB0TYpWLLGVClZk1IjeQC0Kkqi8gAO6jPwyy4T52KmzlF
 Idut5BLJW04cKaqc=
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr1154585wrd.47.1640252229748; 
 Thu, 23 Dec 2021 01:37:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCUoK/JAYY+mtFbl8IYZugVy0wRBdgiUuqoQqWecMk0pUYB7+OVLsrY3bMgBUZHLQ8gwFZ5g==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr1154566wrd.47.1640252229469; 
 Thu, 23 Dec 2021 01:37:09 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o12sm4542682wrv.76.2021.12.23.01.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:37:09 -0800 (PST)
Message-ID: <bedd1afd-8926-d43c-400e-092cb5d413b1@redhat.com>
Date: Thu, 23 Dec 2021 10:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] block: better document SSH host key fingerprint
 checking
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118143547.2045554-1-berrange@redhat.com>
 <20211118143547.2045554-2-berrange@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118143547.2045554-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The docs still illustrate host key fingerprint checking using the old
> md5 hashes which are considered insecure and obsolete. Change it to
> illustrate using a sha256 hash. Also show how to extract the hash
> value from the known_hosts file.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/system/qemu-block-drivers.rst.inc | 30 ++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index 16225710eb..2aeeaf6361 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -778,10 +778,32 @@ The optional *HOST_KEY_CHECK* parameter controls how the remote
>   host's key is checked.  The default is ``yes`` which means to use
>   the local ``.ssh/known_hosts`` file.  Setting this to ``no``
>   turns off known-hosts checking.  Or you can check that the host key
> -matches a specific fingerprint:
> -``host_key_check=md5:78:45:8e:14:57:4f:d5:45:83:0a:0e:f3:49:82:c9:c8``
> -(``sha1:`` can also be used as a prefix, but note that OpenSSH
> -tools only use MD5 to print fingerprints).
> +matches a specific fingerprint. The fingerprint can be provided in
> +``md5``, ``sha1``, or ``sha256`` format, however, it is strongly
> +recommended to only use ``sha256``, since the other options are
> +considered insecure by modern standards. The fingerprint value
> +must be given as a hex encoded string::
> +
> +  host_key_check=sha256:04ce2ae89ff4295a6b9c4111640bdcb3297858ee55cb434d9dd88796e93aa795``

I think the backticks at the end of this line should be dropped.

With that done:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +
> +The key string may optionally contain ":" separators between
> +each pair of hex digits.
> +
> +The ``$HOME/.ssh/known_hosts`` file contains the base64 encoded
> +host keys. These can be converted into the format needed for
> +QEMU using a command such as::
> +
> +   $ for key in `grep 10.33.8.112 known_hosts | awk '{print $3}'`
> +     do
> +       echo $key | base64 -d | sha256sum
> +     done
> +     6c3aa525beda9dc83eadfbd7e5ba7d976ecb59575d1633c87cd06ed2ed6e366f  -
> +     12214fd9ea5b408086f98ecccd9958609bd9ac7c0ea316734006bc7818b45dc8  -
> +     d36420137bcbd101209ef70c3b15dc07362fbe0fa53c5b135eba6e6afa82f0ce  -
> +
> +Note that there can be multiple keys present per host, each with
> +different key ciphers. Care is needed to pick the key fingerprint
> +that matches the cipher QEMU will negotiate with the remote server.
>   
>   Currently authentication must be done using ssh-agent.  Other
>   authentication methods may be supported in future.


