Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC0475756
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:07:44 +0100 (CET)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS8M-0002mO-Qc
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:07:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRcp-0008Nz-Qf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRcn-0007cM-Po
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhJFm2bUFYV+oi/iXrA1YnkJNF5uni5a6EZYI/gGQt4=;
 b=JmklONp0fYM14J6CetI0aLqINBSF2TCLEN4YG7AGIljZPr1wlBshu2kX9l/9O81IJM6FXQ
 C4zMyr34kMkHmrw9EQshKwV2XQrR5Ad+hWJCfUmyQxuJPJTMdzWdKiqxHQ2qLVQp3fbqkY
 Ba5LyS/F9F8jKFiF2rKed713PDMT500=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Jr916Wz8NnaxO4CHIoM4pw-1; Wed, 15 Dec 2021 05:35:04 -0500
X-MC-Unique: Jr916Wz8NnaxO4CHIoM4pw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so5791758wrc.22
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhJFm2bUFYV+oi/iXrA1YnkJNF5uni5a6EZYI/gGQt4=;
 b=bwg5dqjnTjVVqlF8yvqvIQqvTh2xbkZTKKxmxjGFufAGze1nTaMqkW8VFEbdZkEtfX
 s5QMcSspd8cJz6f6UyPqmKdL+3bZkgnYquJ1+XQsfuz1XW887RaMoiYMUf0uSn7nQHoO
 8w6NuI9ibw+dm96/rfQgr5smwV3MLttcDi9asEsECwqF/3iAjeNjLkLvfwx01bu8F1yA
 pQfhUqJKWQzUFw71RS3Z+ysTxW1imseID5ENXgTr8nPhRIfrKjqSaBO20zWBw/t3xSmb
 oxXgGv0p1lI1dbkm4VlYEv8i6qPGST39KH2nOMhnmL7jViFN5ZRn6ZG/C4IZk03TuN9r
 pyJw==
X-Gm-Message-State: AOAM532Qcuk9gifx8fuHIB1vX6r6NgHjaQ6/eGq7uvcJE7/3dZCm/Ww5
 QI8bpIh3uMOZL0wnG4IR04VodbBm3GnyhQwKlOntYh8TLp/bYUnNt2rQfhprb5HPw+rXtLPrzj/
 zooGiBl9NNTXZDiSFLEzXhiMhC/1iiwy/n7DXfwoyXv3e10jQzzMcziXToZ/+WKaq
X-Received: by 2002:adf:f68a:: with SMTP id v10mr2721029wrp.212.1639564502849; 
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygOTndDWKhOXtzIVOMo/JDBY0LqC0pAJXBaasTno+50vdRSssrpNGajMsBN0zVyRp4KAuZpA==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr2721002wrp.212.1639564502532; 
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id r17sm4957250wmq.5.2021.12.15.02.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:35:02 -0800 (PST)
Message-ID: <2ebb697f-5ee9-24b2-6c80-3156ed8784d6@redhat.com>
Date: Wed, 15 Dec 2021 11:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] qemu-keymap: Add license in generated files
To: qemu-devel@nongnu.org
References: <20211117174533.1900570-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211117174533.1900570-1-philmd@redhat.com>
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
Cc: qemu-trivial@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 11/17/21 18:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qemu-keymap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/qemu-keymap.c b/qemu-keymap.c
> index 536e8f2385d..4095b654a60 100644
> --- a/qemu-keymap.c
> +++ b/qemu-keymap.c
> @@ -187,6 +187,7 @@ int main(int argc, char *argv[])
>      }
>  
>      fprintf(outfile,
> +            "# SPDX-License-Identifier: GPL-2.0-or-later\n"
>              "#\n"
>              "# generated by qemu-keymap\n"
>              "#    model   : %s\n"
> 


