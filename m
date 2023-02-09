Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7D7690DBD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9Ik-00004q-EZ; Thu, 09 Feb 2023 10:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9Ij-0008WG-3f
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9Ih-0006Yo-LI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675958250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PChn1PXgqDTC/udWBhKntS+0/sc49aP5CMj9n3/FISA=;
 b=RKNSZmEDMv7sPtjI8cOmhVtDMtB3tKGMk90K1OU2CSyUvvKqfcNgrrE2iDd3P2i0I4cSFj
 nH+xjKMfWPqaY/hMOj4DxehPegHdR+ANTJLs5xCNKSRjw52RZ/7OpnAVX2QiCIOfS55ecf
 aDpDeJq9zXRCAtaeWys5GIL3ewMjbDo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-aWrX5RbANjmDNyQNikVa3w-1; Thu, 09 Feb 2023 10:57:29 -0500
X-MC-Unique: aWrX5RbANjmDNyQNikVa3w-1
Received: by mail-qk1-f199.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso1478179qkp.20
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PChn1PXgqDTC/udWBhKntS+0/sc49aP5CMj9n3/FISA=;
 b=oQveFJzEK/x5nNmYmGBTTgxpi6/QXQvUjCMSou4aHw916JyGWhubfcU+H7C5Q0BdsV
 PSUfwyG30oRB//u1jdDBz67yR8afdv2ZhuhCMw1GGKpMtGzOGAyu8pUSPj9YJ09fsyuL
 WwFdo1WOwwabNk8mhxLbEpJc6EW13miYIHhLrFo+fHNtx6swfyiUYJn8Gpi86h+ZHg1a
 4nKYIGWKk5j1tGLGly0+mmyW0TSmgD2anxB1oIAUGp26QYN3ceAIRuditTN9NsxBo6Eb
 nFXOx5PdNGSsDXwaDrvCCuQNqhMMEpZ+DiJ0H9B7JAHbeqRJ3NClyrDlqaaLTa6UkoUn
 iGGA==
X-Gm-Message-State: AO0yUKXdUsq75Rrcx+OLt6vpsl3Tb+6FSB3AZtVTimYXz1KOAD+bDRcB
 GXmiQ8Gbj7V7Lw503p1UfN5FkKvdQEesBvN/myimDA/xW3xHmBN+DR/1nxo7v3W83K8MdhdNUq/
 UDhAEmyC1CKu2Zd8=
X-Received: by 2002:a05:622a:28d:b0:3b8:1743:89dc with SMTP id
 z13-20020a05622a028d00b003b8174389dcmr21188257qtw.2.1675958249024; 
 Thu, 09 Feb 2023 07:57:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/8uzfXofiYWkDmdECBAhFS6stQfkVfhmeVbhcjiI4bHppmUpACCQMqrpMgQN4qt+Lwgxk0qg==
X-Received: by 2002:a05:622a:28d:b0:3b8:1743:89dc with SMTP id
 z13-20020a05622a028d00b003b8174389dcmr21188216qtw.2.1675958248725; 
 Thu, 09 Feb 2023 07:57:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 o24-20020ac84298000000b003b880ef08acsm1525558qtl.35.2023.02.09.07.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:57:28 -0800 (PST)
Message-ID: <149f68b5-564a-68ff-b012-38d1ac91322a@redhat.com>
Date: Thu, 9 Feb 2023 16:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/7] CI: Stop building docs on centos8
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230209154034.983044-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 09/02/2023 16.40, John Snow wrote:
> CentOS 8 does not ship with a sphinx new enough for our purposes (It
> necessarily uses Python 3.6), so drop this from this build. We can
> resume building docs on CentOS 9 if we wish, but we also currently test
> and build docs on Fedora, Ubuntu, Alpine and Debian.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aa149a3524..0eb7f6606d4 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -166,7 +166,7 @@ build-system-centos:
>     variables:
>       IMAGE: centos8
>       CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
> -      --enable-modules --enable-trace-backends=dtrace --enable-docs
> +      --enable-modules --enable-trace-backends=dtrace
>         --enable-vfio-user-server
>       TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>         x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu

Reviewed-by: Thomas Huth <thuth@redhat.com>


