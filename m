Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B508649C4A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:36:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gAS-0006wd-Gs; Mon, 12 Dec 2022 05:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gAB-0006u9-Un
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gA9-0000ni-NE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670841356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DqbGz5vF5fJHUsFsTbpWS37vUJldXmgOickHbl2ir/I=;
 b=IQsrs7z9NblZDkwn+u7Q9q4BU8LFk3koyYYBcIydsRsdhTs0RC995SyM9E/cXUNwr4YXgu
 agE1GqBQCPZ6mc0MlvR6nUYq6FGmw4S2jWYveqgW2zOyHUS5uLb50zPKkaK6TK7qZgwTdW
 7UeIxsjAbXtm6sIeTIeLPznKYxnhdlU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-D7I0M7yoMIWQCVdx2xeQMA-1; Mon, 12 Dec 2022 05:35:52 -0500
X-MC-Unique: D7I0M7yoMIWQCVdx2xeQMA-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc5-20020a1709078a0500b007c0ca93c161so6784229ejc.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DqbGz5vF5fJHUsFsTbpWS37vUJldXmgOickHbl2ir/I=;
 b=bOiL8CnCjLFzxmhBH8e0AE9zL8O4fkurDwULnXPp46MdpNw2NEVvWtVbCJK4zo0Cza
 s6CEku4moYSsgEuiQs2sflrGSiC1LoTHAVJNTxeXgkjyucHrGnn9LykJ1TEra7FsgUK9
 5/BdrpMV/zXOiiDaIBxFfUdDf8bS66YsmxOAUWgwKrw12/vUUIj+ESnPgp0CqmnKuSZH
 HRVeEN4z3gULVl4ujZfrpYCk0xg3fAFfqdDcgqGVpCQFl6b3nz6R3xyYWKUm36lYwPjC
 51LgdwXfwtkTmmAC/Q1nsZzcmxOHRxrOewFbaCOasGKGWIbGiMsJUUvzJRjJ+cxMZmu1
 dx+w==
X-Gm-Message-State: ANoB5pnBgRPxDIS//+Tsuc079KpGEdkwkE9WN7bIErq6tmq8dN2O6scG
 e51f05vNeJH+jC9pg+Yti17qyEniLCGNNcZLO6Qxc7LIbMmB656/6Xem+w9Y2qoBlXZwNwZisCO
 MwZNg/caCt1a2L24=
X-Received: by 2002:a17:906:b312:b0:7c0:dcc5:756c with SMTP id
 n18-20020a170906b31200b007c0dcc5756cmr12024886ejz.71.1670841351418; 
 Mon, 12 Dec 2022 02:35:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67wZGTsQEsuTdaMGyCBCHpx2mm4WjImvT09AtMWe2W2DzJI9ikzDzk///zfM/VzyUUzrbsJQ==
X-Received: by 2002:a17:906:b312:b0:7c0:dcc5:756c with SMTP id
 n18-20020a170906b31200b007c0dcc5756cmr12024866ejz.71.1670841351211; 
 Mon, 12 Dec 2022 02:35:51 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 tl12-20020a170907c30c00b007c0ae137404sm3163688ejc.97.2022.12.12.02.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:35:50 -0800 (PST)
Message-ID: <15f930ce-cac9-5438-135b-c2e41a990a65@redhat.com>
Date: Mon, 12 Dec 2022 11:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/5] qemu-img.c: Move IO_BUF_SIZE to the top of the file
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-2-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221128141514.388724-2-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28.11.22 15:15, Nir Soffer wrote:
> This macro is used by various commands (compare, convert, rebase) but it
> is defined somewhere in the middle of the file. I'm going to use it in
> the new checksum command so lets clean up a bit before that.
> ---
>   qemu-img.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Looks good, but is missing your S-o-b – with it added:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


