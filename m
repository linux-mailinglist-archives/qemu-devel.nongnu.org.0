Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA952B431B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:48:23 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecze-0002GC-RQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecy1-0001gy-6v
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecxz-0006ZN-Gg
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605527198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEQNmZvdgUozWvWR8XYhqspP8mkgXk2CmcEgAhIx2DE=;
 b=QoJeP9zlU3I2rq9h7BBLIruYAdnlu10Tvqk8XXBdVRZjGfR4nnLQlTQ5LpUgAWtg2PJv6z
 qEOxEZAXLs/cdAWm7jhb5wXVQLGgchM3djPmtRx9qWz0F5x4+anRURHueml91mQS7J+Njs
 Y46OiCbE2vcojkcWgKMabp4ZqOBgC3w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-009i1gQgMbCvigrxDaZBPg-1; Mon, 16 Nov 2020 06:46:37 -0500
X-MC-Unique: 009i1gQgMbCvigrxDaZBPg-1
Received: by mail-wr1-f71.google.com with SMTP id h29so10902779wrb.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEQNmZvdgUozWvWR8XYhqspP8mkgXk2CmcEgAhIx2DE=;
 b=OdvALUb5HVNDVSSxrgd0t2HrRcE+uAqZEA1brpiBLwcP8pXAipFnwyX9rqf/+3FuDo
 X7e396PihPP+6eLm190Eou9uHhXql9ozD+3cJ6i9AvQAqb2N/vzS6oJ+hOPukHa51mS3
 Bu70Twd+6WQdOgbG8Sfh6zPzwOP0oIJLHj5ZM6mT7fdg+qVcdSZ5aTpRuQzs9J4hy8WS
 sqKcS9PC+sFR9ha6qmti+kmGssNaHzqKHycRr0OffGnWLnX1o48yKhe8dYf823gsG5vs
 lHWJZ4nSGhSOaAXm9aVa8wSAGQJkmgkL331jdcLwjZnWzBIqx5e40ZlJLdiPcjgosJNK
 5rDg==
X-Gm-Message-State: AOAM532O+3Q5Iu91/AYSDr85LaI6rWOiAOlADTygpALvxZG9shQQ74j+
 ns3XDzmc6m/Zm4z9omvg8TfaKmMP0n8jyfkYtGis0TAHfo6wd/Wtx4MGxvofTt0B7xtImM9paeY
 bPlo7lajQHJw7vIk=
X-Received: by 2002:adf:e789:: with SMTP id n9mr18627622wrm.211.1605527195450; 
 Mon, 16 Nov 2020 03:46:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvbjLZkf7cv/L0687BDM4VNhdTbMBhNCc1PiInbn+NnUyo16Eq2Y4niFq8sFOR9f8ZjaEDbA==
X-Received: by 2002:adf:e789:: with SMTP id n9mr18627595wrm.211.1605527195211; 
 Mon, 16 Nov 2020 03:46:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c62sm19308520wme.22.2020.11.16.03.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:46:34 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v3 6/7] ppc: Add a missing break for
 PPC6xx_INPUT_TBEN
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <58864f26-7e06-efc4-86fd-b7b710def15e@redhat.com>
Date: Mon, 16 Nov 2020 12:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David, can you queue this patch for 5.2 (bugfix)?

On 11/16/20 3:48 AM, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> hw/ppc/ppc.c: In function ‘ppc6xx_set_irq’:
> hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   118 |             if (level) {
>       |                ^
> hw/ppc/ppc.c:123:9: note: here
>   123 |         case PPC6xx_INPUT_INT:
>       |         ^~~~
> 
> According to the discussion, a break statement needs to be added here.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
> v1->v2: Add a "break" statement here instead of /* fall through */ comments
> (Base on Thomas's and David review).
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/ppc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 4a11fb1640..1b98272076 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>              } else {
>                  cpu_ppc_tb_stop(env);
>              }
> +            break;
>          case PPC6xx_INPUT_INT:
>              /* Level sensitive - active high */
>              LOG_IRQ("%s: set the external IRQ state to %d\n",
> 


