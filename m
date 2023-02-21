Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4169E21E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTS9-0006iQ-F9; Tue, 21 Feb 2023 09:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTRn-0006gj-Ek
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTRl-0007xI-PM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676989005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmliDIUuWuowENEMGaDzr3ZY1ANxPbxbcJPoZMlbKRk=;
 b=gGpP3yZ6z9jlIAslGzKqh5aypkg2ZsM/mcWKLX1R3kmTaSDdQOkTsUIYOL1fS+SYd759BV
 2J+cLQCzKKCDtCUs6ss5e+/DKA8EPCDYiBmejkim+PYtuS2/5UbJ6XUIC0mNNxUFe5Fxxu
 qFqHVCRaDDsxMdTAjClJmZyvnImBtb4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-azCy-Wz9O5SfDXq2DpsXwA-1; Tue, 21 Feb 2023 09:16:43 -0500
X-MC-Unique: azCy-Wz9O5SfDXq2DpsXwA-1
Received: by mail-ed1-f71.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso6027687edb.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmliDIUuWuowENEMGaDzr3ZY1ANxPbxbcJPoZMlbKRk=;
 b=pht1lD3aMHRTWdleGDq0kFfEQtPzIH8h62Q0I5n7V8htAjyraFeQ35FfYs4+TVQWWv
 dh5cwz9S3WxDpeRspTRrmfBuGxwiZAQ2++qaHxWKDnFKdIskgDVMZUVaFWRoEv96t7N3
 Z35wDUNmAlaxmFune1AnnYPdesZtbh2wKo8CQCKU/9Ixfiva1y5MmW+H10hM4EUpXzbl
 N0cUFnFbzLLC6BXRhuRrapbWDqMCJsNEUDT50ggPHmO7+kQ6mBVZFwv/xgwEN3B65Hv0
 E68eTRpRqEIWyeZiGf/Bawfnn/0MjaUozEAX2IgwRjWFNFMuRhwE/xPVz2LjHvseWB15
 /bsg==
X-Gm-Message-State: AO0yUKUjcW3G3hChUKXbRrc17TVkZqkm1VFV/TNBcF/ivW9FQZueN9Se
 eg9DBgmQX5qP2Ix399/t0S7K0Zt2HgmFut+33C/cXAC7lwyB6js/DMWiFRe93vmqsgNFSbMaBsV
 on4Ny8jHOW7zFpRQ2JNwU
X-Received: by 2002:a17:906:805a:b0:8b2:7534:265e with SMTP id
 x26-20020a170906805a00b008b27534265emr14401095ejw.58.1676989002583; 
 Tue, 21 Feb 2023 06:16:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+st/i8NQLkBHpm5zbU8II9jpR9ixBogUV1g+PqDvJXcOxb5afAwK9wF+VPBJOpdfXlYqvuTQ==
X-Received: by 2002:a17:906:805a:b0:8b2:7534:265e with SMTP id
 x26-20020a170906805a00b008b27534265emr14401068ejw.58.1676989002311; 
 Tue, 21 Feb 2023 06:16:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 f21-20020a170906049500b008e36f9b2308sm240924eja.43.2023.02.21.06.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:16:41 -0800 (PST)
Message-ID: <7cc74666-df5a-792a-4f18-657b5281a68a@redhat.com>
Date: Tue, 21 Feb 2023 15:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 15/16] os-posix: remove useless ioctlsocket() define
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-16-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221124802.4103554-16-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/21/23 13:48, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The API is specific to win32.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

The idea was to use for socket ioctls that are common to POSIX and 
Windows, but it turns out there's no such usecase.

Paolo

> ---
>   include/sysemu/os-posix.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
> index 58de7c994d..378213fc86 100644
> --- a/include/sysemu/os-posix.h
> +++ b/include/sysemu/os-posix.h
> @@ -52,7 +52,6 @@ void os_setup_post(void);
>   int os_mlock(void);
>   
>   #define closesocket(s) close(s)
> -#define ioctlsocket(s, r, v) ioctl(s, r, v)
>   
>   int os_set_daemonize(bool d);
>   bool is_daemonized(void);


