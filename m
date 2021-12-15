Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275447585B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:04:55 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT1i-0006CZ-GF
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSSr-0005jx-6R
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:28:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSSp-0008CF-9m
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg1UaZVbz4hFODdZt1B8y8s4SJFwv5b38uu5m/eGVqc=;
 b=auYo5vq+a5fPN8SJDaAOWNJMYQXnNjhXCvnpys6mYUuiTv8+OosT9/OzIPbetrwurGjtwN
 OjC6kgx6HQ3zoHhIFShPuI+W7irIiHBven3QzVDIWYpawP1m6BhVTZv/CNs7TeXe1B4xPl
 2KWbQYISVKyaPnt8oVNAScsDl4tij1k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459--0ManL9uNv6hlUPK9WX0nw-1; Wed, 15 Dec 2021 06:28:47 -0500
X-MC-Unique: -0ManL9uNv6hlUPK9WX0nw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x17-20020a5d6511000000b0019838caab88so5817022wru.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zg1UaZVbz4hFODdZt1B8y8s4SJFwv5b38uu5m/eGVqc=;
 b=3LF1hEuJGHRFoX1dJT+dpcVfvXYv2w20nCBEGCLdPxdyOMWzScp1WV/4+JKeVBnLWw
 nQMqPufkNjBSbv1ZM5czORxK04yzGMIvpG8JC85cg04XeFtiHyjq+im2QyJW+WqvmAIX
 CTvlyMhkeE7ZfnQd1RH4OvImPF0gRbN+hS5SGfdakoZnYesU/Hdcqkld/qFZnu8BSKGx
 Ljr2JHDK7cC6kY4Oc6rUPWEMTp1b5alfcvLt3tcag0k3G7pbt9jzl7cx/ORfhm6zVZ7D
 cysZADmYeGm9G+u/IDow6L02PPL4E4HGyg26QkuDmU1GxCx6DpEja3ZiJd1cnpZWDoZ+
 CGlQ==
X-Gm-Message-State: AOAM530wEfpPV0kBx/6uzp4Y8lmg6alFUlaSWwIJt7U6TlxrDNyJhzws
 LjKrA0T131xTzqXxYvqqLCyt8NA4zi+4ZBGw/vylyjT+Eht5lJfLOnnN1BseWelqsniN57fBE+H
 YcnvEgOITbx7lYkg=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr4026971wmq.175.1639567726539; 
 Wed, 15 Dec 2021 03:28:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBGXXXjOt/YLFVp1GvhgpuoD4uactTicIea6opsxIvNKCXFmOh2oK1rnzMEZJwmY2OIM6VXg==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr4026958wmq.175.1639567726392; 
 Wed, 15 Dec 2021 03:28:46 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l3sm1523350wmq.46.2021.12.15.03.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:28:45 -0800 (PST)
Message-ID: <3c5ecc0c-121f-6535-04e5-a26c2f53400c@redhat.com>
Date: Wed, 15 Dec 2021 12:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/18] tests/docker: switch fedora image to release 35
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> The Fedora 33 release is shortly end of life. Switch to the newest
> Fedora 35 to maximise lifespan until we need to update again.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


