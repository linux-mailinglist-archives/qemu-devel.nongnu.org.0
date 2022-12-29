Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1F658B14
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:34:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApE3-0001AI-7Y; Thu, 29 Dec 2022 04:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApDr-00014t-KM
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:29:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApDp-0005fN-MF
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672306148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
 b=K1i3Vo9i5iV/jhIyDuf3NdqUI8neXkPaIl+JOebG/kqdlS1bCgzKHpuy7tiw/FIlAU1wqa
 pqgoVj9POAy1lpaXPtoV+PSx+/ltrIJ7+4p7M2wJRZrI5kTiZo0fiECrAGB2pUMiijJSP8
 VGDOcIH4otSYAsOAnqL3wFr08YheQdQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-dFYa0U5hMWiM3pCRrH0q_g-1; Thu, 29 Dec 2022 04:29:06 -0500
X-MC-Unique: dFYa0U5hMWiM3pCRrH0q_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so3979609wmq.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
 b=ZIbKlbX1JuzIiklvsRJzWd8VrgZoVmD8M70x+M2VobNDGj+TJEXCdeM0HBEOV46s3e
 9AVRXA8VnyuQ7r02NNsrNGmxBp+F+L6szLxNFl/Z5JXCgwIiHlaURcfKIDNZZppp/yKF
 uCSfbd6Bhxyim/FzZdKbV2Q1zYXZcbvXbd0w6LTFaBqVs9dWoghnypGPioa0x/Phzpeo
 8ImV4ItsY3rJRF352mgKEJ6wzLgvNo1Xsigkn5QroZMc/BS+s+dWbRjstTbFE0d7SBIO
 dAMPNc1hnaLcNDwvaGC6tho7fiJA8ocxE01IFBK0myyxFA+kJm/CM4fhXLnz6HjDiLnF
 lfZw==
X-Gm-Message-State: AFqh2kr6DQdAh2w3nmjsCNiVcq1iiycHqgjKup8GJCzQ+0+Y/R+gYe1X
 n92J4HZ8+HL6t7vJLekwDV/oJ0ZOdQGUNedPGff5M/RIhJNzJPkQZu3wgDi1oRI/UiucIbhF6Wx
 wjJPClTpjP6FBxbE=
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id
 g3-20020a5d46c3000000b002427676689dmr16793811wrs.19.1672306145975; 
 Thu, 29 Dec 2022 01:29:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvjWFBbb03W7bVXUDXS3S/VxZUjupIzmYbFuMIRxk+FI9eyNYhfuauEmH9uHEbJaq7Qg4B3A==
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id
 g3-20020a5d46c3000000b002427676689dmr16793782wrs.19.1672306145747; 
 Thu, 29 Dec 2022 01:29:05 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b00282194eaf7bsm7531081wrq.71.2022.12.29.01.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:29:04 -0800 (PST)
Message-ID: <20f8ff01-8240-5c53-99ad-c75d37f6639c@redhat.com>
Date: Thu, 29 Dec 2022 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/util/error-report.c b/util/error-report.c
> index 5edb2e6040..6e44a55732 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -193,6 +193,7 @@ real_time_iso8601(void)
>    * a single phrase, with no newline or trailing punctuation.
>    * Prepend the current location and append a newline.
>    */
> +G_GNUC_PRINTF(2, 0)
>   static void vreport(report_type type, const char *fmt, va_list ap)
>   {
>       gchar *timestr;
> diff --git a/util/error.c b/util/error.c
> index b6c89d1412..1e7af665b8 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
>       }
>   }
>   
> +G_GNUC_PRINTF(6, 0)
>   static void error_setv(Error **errp,
>                          const char *src, int line, const char *func,
>                          ErrorClass err_class, const char *fmt, va_list ap,

Reviewed-by: Thomas Huth <thuth@redhat.com>


