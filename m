Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629047B127
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:34:42 +0100 (CET)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLcX-0007kk-5t
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzKJA-0006Yi-GX
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzKIc-000198-BQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrXrwa17cjPIKHX24KhjcAJqs4W+e/1opAqxcNitgYY=;
 b=aJ5aoA/BPt1Ksz4jPjWINGKpy69HwtdWrgi63BYv0v1bEXImphpjB6IF9y0cIS22kkOng7
 5kMtGbyfAAtY69ZX4qVKg7TVlno6BSoHeOxL4TsQtqQStW8jCXy1qnlb2pcNJqD1fL0bLZ
 zectWoOSxZNHhOK+3ThXLwn3MFevIR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-sr7_Mg89Pp-fMyxoJu7OKQ-1; Mon, 20 Dec 2021 06:54:36 -0500
X-MC-Unique: sr7_Mg89Pp-fMyxoJu7OKQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso3582330wra.18
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 03:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xrXrwa17cjPIKHX24KhjcAJqs4W+e/1opAqxcNitgYY=;
 b=XdLDTjYUPNrkdd/LiW2nLgcjRENPREAO2jUPP8vxJtlf6OJ/RUdBPkdxaTRuY7HrF0
 N7uT+Ubmha7Wej5Nf9RlnxqVvd5Q7VX7PD/fRM0ZzjkKyGJzMmXy3rn+puhTG6NofvRc
 cYTD/G/dEq5ycPHy4uGJ3ZGdPJlht/KPXLGrszQegwY/16Akod4n/PX4EZpG2PxXnOT5
 fy0RAuYKJVMfGxqv3GCz4DPkZmbUOB22wdZjpLsoaiB9jWqT6O8wnDjXSuJY4n90nueg
 QnffEPlHHLo1EYqhhovzy8SU2usicBWeoijJ6B8lDJjzFtY9uh2E9OI7n+Ttb8lWIKMF
 PkNw==
X-Gm-Message-State: AOAM531fs0tbI2e+Bc6SyJn+bEU4yjev1N0UOzfld6nIuAxrc4PBZtc6
 QNpMfUWB5yPe4sLIu9bvY8LKmrTMNWD0CrQhXbmfmFOJpi/QrwNMMVPmAgkJHi//mvN80dlVpi+
 Ljv7tcADKlWNZTMQ=
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr2515355wrs.425.1640001274830; 
 Mon, 20 Dec 2021 03:54:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZN2dYbEnw/nqRHC1oXa3sfhgzfTz0GgM1l2vTdF59kvc1iAJAgHZvNDe0xTmecGerbu8pSw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr2515337wrs.425.1640001274579; 
 Mon, 20 Dec 2021 03:54:34 -0800 (PST)
Received: from [192.168.100.42] (82-64-211-94.subs.proxad.net. [82.64.211.94])
 by smtp.gmail.com with ESMTPSA id
 y3sm13050718wrq.12.2021.12.20.03.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 03:54:34 -0800 (PST)
Message-ID: <c55a1d26-705a-473a-a85f-35d7b6458a26@redhat.com>
Date: Mon, 20 Dec 2021 12:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211220102759.311224-1-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211220102759.311224-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 11:27, Thomas Huth wrote:
> g_test_rand_int() must not be called before g_test_init(), otherwise
> the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
> message in the log. So we could change the order here, but actually,
> g_test_rand_int() seems also the wrong choice here, since we're using
> it to create a temporary file name, which certainly should not depend
> on the "--seed" CLI option of the g_test suite. Thus let's use the
> g_random_int() function instead.
>
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/virtio-net-failover.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index 4b2ba8a106..70b94bf18f 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -1308,7 +1308,7 @@ int main(int argc, char **argv)
>   {
>       const gchar *tmpdir = g_get_tmp_dir();
>       gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
> -                                     tmpdir, getpid(), g_test_rand_int());
> +                                     tmpdir, getpid(), g_random_int());
>       int ret;
>   
>       g_test_init(&argc, &argv, NULL);

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


