Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1E69DE5E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQPN-00047p-I7; Tue, 21 Feb 2023 06:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQPF-00044R-PS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQPE-0005j7-2Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676977315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYtS+t3SUNNkBTEOmmsgmMqKzuunC1z40mi5cSjsLa8=;
 b=CBhInyfy4+UYynvS7w3PoeaValtVHNe4J0nGTY1PQlREZgpQp3/HIL/lmVZgCHhqN0UjK1
 tQcZUs0wzrLeDBDXpJSwPlGRdZD/nRaLFi783YEqSPawB77/bV9JkIRaB7XhDOS0aaNOvO
 63W4j9nEj3/eM7u9iU22zeZes1rMiuQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-boN3RJRTPjK3ZSZTY97XbA-1; Tue, 21 Feb 2023 06:01:53 -0500
X-MC-Unique: boN3RJRTPjK3ZSZTY97XbA-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so5301273edc.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UYtS+t3SUNNkBTEOmmsgmMqKzuunC1z40mi5cSjsLa8=;
 b=WTgo3eUfaH8XGB7uBL/0zU0mwHkiK0i1bnsNz5+SAyXcvu8yPUMYvplY5Bt5T9AuLm
 69QJeO7gILmRH0XublgLogmtjjJcEoMTCq/POZBvpV/JGXAtcsW3ntPhc28DZNkZd6ps
 1XCZ+dYJm+VKLvfAqFeb+bn66hueqSGbVrBQSicNvNcSnH3byc9f9mfZ8nOoXXY8dTG2
 nn0GpVdFYH4yprfwgmdhN5RNG14/fPwRGAxPvh5/+DPWYeHJVfkcmCN/b3mMIXFAVEXG
 feX1DMXcU43siUi8uB6kKKNhgCp71Tn4mRhqMoPZk4y0XbNMsTINQYoZ+Ly+3XeIE1KP
 rwIg==
X-Gm-Message-State: AO0yUKWDDH+ThRGpSDoNUyE43w7SyonVUVs/PHF6UxAZS6yUEyoWAd5t
 Sf4+ZYvgss5aPD8Ptu55umZUuDphy1OqDdoIMOUdBBhgEePgpQJ3iNJ5RVYH7ekGIUwws8Lax5o
 z3grY3gz2kpyj/7k=
X-Received: by 2002:a17:907:b16:b0:884:ab29:bd0b with SMTP id
 h22-20020a1709070b1600b00884ab29bd0bmr12602034ejl.69.1676977312442; 
 Tue, 21 Feb 2023 03:01:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8SQRr5hd9DQGLNG9uMtg/+MbKslEj3EFuCni34WiP6cYLNtUBiyjjBxBzo4COZe09P7rakJQ==
X-Received: by 2002:a17:907:b16:b0:884:ab29:bd0b with SMTP id
 h22-20020a1709070b1600b00884ab29bd0bmr12602005ejl.69.1676977312113; 
 Tue, 21 Feb 2023 03:01:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 l16-20020a1709065a9000b008d6e551e1bcsm2084752ejq.2.2023.02.21.03.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:01:51 -0800 (PST)
Message-ID: <74a9832a-ba68-15e2-e2e6-aabe49f6d088@redhat.com>
Date: Tue, 21 Feb 2023 12:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/6] configure: Add courtesy hint to Python version
 failure message
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-3-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221012456.2607692-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/21/23 02:24, John Snow wrote:
> If we begin requiring Python 3.7+, a few platforms are going to need to
> install an additional Python interpreter package.
> 
> As a courtesy to the user, suggest the optional package they might need
> to install. This will hopefully minimize any downtime caused by the
> change in Python dependency.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> ---
>   configure | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 6abf5a72078..0d0cca53f09 100755
> --- a/configure
> +++ b/configure
> @@ -1059,7 +1059,10 @@ fi
>   
>   if ! check_py_version "$python"; then
>     error_exit "Cannot use '$python', Python >= 3.6 is required." \
> -      "Use --python=/path/to/python to specify a supported Python."
> +             "Use --python=/path/to/python to specify a supported Python." \
> +             "Maybe try:" \
> +             "  openSUSE Leap 15.3+: zypper install python39" \
> +             "  CentOS 8: dnf install python38"
>   fi
>   
>   # Suppress writing compiled files
> -- 2.39.0

Let's delay this past the actual patch to introduce 3.7.

Paolo


