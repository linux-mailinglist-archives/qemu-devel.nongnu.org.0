Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7936B9D42
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8hH-0003Yp-Br; Tue, 14 Mar 2023 13:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8hD-0003Y4-15
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8h8-0003UF-RL
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678815857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hoh/6fVTgkC+hIf5af+HPk+Ejg7rHi+S85OzvtFgdQc=;
 b=J1eb8pcGTmdQT26ry4XjvPLIkZ9u9IiINQSvFjeDIq55QgtqnPRJK1LdSSlVPAOH7MM47u
 3QDshWVGXhGnekKVEB1ev0M6xE9BWbs+actIL7SY7q9kzncX+cBzK6plS72hEheS0Xi3w0
 kCpWLMGjfKplFGIGL9tkWj4rH/CsQsE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-6OYSCxQ6M8embyWkFzbd9w-1; Tue, 14 Mar 2023 13:44:16 -0400
X-MC-Unique: 6OYSCxQ6M8embyWkFzbd9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 az7-20020a05600c600700b003ed25435106so2358661wmb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678815855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hoh/6fVTgkC+hIf5af+HPk+Ejg7rHi+S85OzvtFgdQc=;
 b=XEmI9W/8q5NjR0/EU0nTX83JHIkPKrOXtGKJeiwm9lWq23LUD9ihhfW7KghxyohjNl
 IYLhwyndJkOtMNBvM6cX3CL8+AO+h0CdNJo2sF/Ovs+wDY7IbVNs+YbklPAUXH6h4Zvs
 yvanIIcLGsCAx12nO/u/FTVKh5OfSCoHLLrQT1K3TEmuaWUrRnYYmHvQtmeqHF6wy7pQ
 s9XFdXXGHppHO2XN74BVbQjXgvjMd/I7cuq1J9nLEA6a8uTIOr+weyCuBhXn3JMYEreN
 AO6JpGQn62z8snGugMpzL/EDIbNydUphvZVg9BpVMAPbr3oiVsezL33qnUy3AnsZXcuj
 hKcw==
X-Gm-Message-State: AO0yUKXNYVSZniTOKFaiXzAexPolczssxFI1ZLNPYAyJnWSamokwK9jY
 cfQwqmP/vvrmMXXsLcT3GV3YnFVL8seSFc+4RCGsaPHtplTsENm0UoczjC+6AwvVy/XS8YVVqKI
 BW6wnHYaPhFcz2YY=
X-Received: by 2002:a05:600c:3b9d:b0:3ed:2e02:1bfe with SMTP id
 n29-20020a05600c3b9d00b003ed2e021bfemr1600296wms.20.1678815854958; 
 Tue, 14 Mar 2023 10:44:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set/FnDlrWRvC0n5cAENwka2sSldD3NH6vKvedYcgTB1F5h9LFTM7X8IGIwH2c80qLC4cEK+q4w==
X-Received: by 2002:a05:600c:3b9d:b0:3ed:2e02:1bfe with SMTP id
 n29-20020a05600c3b9d00b003ed2e021bfemr1600288wms.20.1678815854732; 
 Tue, 14 Mar 2023 10:44:14 -0700 (PDT)
Received: from [192.168.8.107] (tmo-099-230.customers.d1-online.com.
 [80.187.99.230]) by smtp.gmail.com with ESMTPSA id
 f26-20020a7bc8da000000b003e2096da239sm3598301wml.7.2023.03.14.10.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:44:13 -0700 (PDT)
Message-ID: <30ea43e8-0245-983d-7efd-eeece060ab02@redhat.com>
Date: Tue, 14 Mar 2023 18:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14/03/2023 18.08, Peter Maydell wrote:
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
> 
> Do the mask before the bounds check instead of afterwards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/cadence_uart.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842e..807e3985419 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>           }
>           break;
>       case R_BRGR: /* Baud rate generator */
> +        value &= 0xffff;
>           if (value >= 0x01) {
> -            s->r[offset] = value & 0xFFFF;
> +            s->r[offset] = value;
>           }
>           break;
>       case R_BDIV:    /* Baud rate divider */
> +        value &= 0xff;
>           if (value >= 0x04) {
> -            s->r[offset] = value & 0xFF;
> +            s->r[offset] = value;
>           }
>           break;
>       default:

Reviewed-by: Thomas Huth <thuth@redhat.com>


