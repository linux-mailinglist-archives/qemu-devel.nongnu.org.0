Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A292FB6C7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:14:38 +0100 (CET)
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rmH-0000vA-Lv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rl3-0008Ni-Vm
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rkz-0000SI-9c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611065595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZ+/Dahv4znPl5k32kOuM4zxqHPTgaWLQNqqTZK1mEA=;
 b=F45tBs7HeQqdsECVTeYjTYUnSfm/N493UaoUmOYzpSLYjRgJwyjdFFQoqwhuxWF1h+YPuU
 /u0PeWYIF2UhzzNhlhfEXZ+2exbQhmHmLAfXSREWEElEtiWQIjdFJcAQUiAkXjwkB9fUby
 yYsUsqB2wntjsJfxAR4kUlh3Pz7fkTk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-zrmtWJMNPPOM2FfR9y3RDw-1; Tue, 19 Jan 2021 09:13:14 -0500
X-MC-Unique: zrmtWJMNPPOM2FfR9y3RDw-1
Received: by mail-ed1-f71.google.com with SMTP id f19so9430398edq.20
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UZ+/Dahv4znPl5k32kOuM4zxqHPTgaWLQNqqTZK1mEA=;
 b=N7L8/JnThFIBjhB8Y8BWsfAPXHoIppUgmqPnVgjPCk3M+hXKgNYqkYJz01iCRk4wFb
 0mtsW1o0ZpucJVZ1dw6tfOAeZ7hj381x0CmSVqJPxo6FL5GTMXaLMybKVwUnPhtrekb3
 BcRqQyieY7u8umSvPI2BwdrezDlwtGGW0msAQ2ZjPX15LYc7zDtV7DiXOVMPbWlpaom1
 QiWlHGQaFmpRswTbw2gV8dypeeUwgg013LWAont86f4Kn9IkmAe3rKm9hCnzOWEyo+eL
 RnwhbaFpeqlskexRECEAK2nJGt4yuuOBD6h+l5apc5Vmj3u1VSqpdTqYuqOKuge2Y2PS
 9zIg==
X-Gm-Message-State: AOAM5336tZ0U9b+2yfe+QMuOUriSgAEsxiwdFcIo6O9yRivYEZw4qivg
 /vrYI8YI+sHwLKAZca1opRtUoASqAcNgMDXz2AZrT6LNoq4QD5hwt/6QIzzTKik6t8euOpRvq8F
 Crde+7E64gIFL36E=
X-Received: by 2002:a17:906:f144:: with SMTP id
 gw4mr3153970ejb.189.1611065592538; 
 Tue, 19 Jan 2021 06:13:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwErYbMOmLv9Gd1ODPgEWiiXjxb93/W1Hjo2Hx8pQbltYaVYETFcoPcqzH4A4c/pX5mAgOIQ==
X-Received: by 2002:a17:906:f144:: with SMTP id
 gw4mr3153965ejb.189.1611065592413; 
 Tue, 19 Jan 2021 06:13:12 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i15sm10946432ejj.28.2021.01.19.06.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:13:11 -0800 (PST)
Subject: Re: [PATCH] ide: set an upper limit to nb_sectors
To: P J P <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210119134211.494133-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b0198f13-c5af-70c5-59cb-c34bac328b83@redhat.com>
Date: Tue, 19 Jan 2021 15:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119134211.494133-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

On 1/19/21 2:42 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> Set an upper limit to number of sectors on an IDE disk media.
> This is to ensure that logical block addresses (LBA) and
> nb_sector arguments remain within INT_MAX range.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/ide/core.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> Update: limit s->nb_sectors count
>   -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04270.html
>   -> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04173.html
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index b49e4cfbc6..064998804a 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1161,15 +1161,21 @@ static void ide_cfata_metadata_write(IDEState *s)
>                                      s->nsector << 9), 0x200 - 2));
>  }
> 
> +static void ide_set_nb_sectors(IDEState *s)
> +{
> +    uint64_t nb_sectors;
> +
> +    blk_get_geometry(s->blk, &nb_sectors);

       /* An explanation here would be useful */

or better, add a self-explaining definition for this magic value.

> +    s->nb_sectors = MIN(nb_sectors, (uint64_t)INT_MAX << 2);
> +}


