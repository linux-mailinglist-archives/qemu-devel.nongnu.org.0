Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2A542D9B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:30:00 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyswp-0000LA-4T
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyspM-0007OU-JO
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyspI-0006la-Rm
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654683731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0svpCYt0NP/EvVjhde2m9Yi3ykgVVFhsbY3OeENAPkw=;
 b=BqVtGZBifMOnjADUplMKQc30qUhgy1Sjr0vXmTfRzqvOfKdvYIMiX/OFbTLYBlrFMpfTi+
 Bslhq3u6VKGGHXX7jzHD//IPJXazQ775HgE06WAeGaacfkAbgwMeNy/CEvfrPCvl812bpK
 5VQI1SmtknUGVtX/AGqhX0gdzQqgB8o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-DgoK1X74MDmF4RCsuNpBWQ-1; Wed, 08 Jun 2022 06:22:08 -0400
X-MC-Unique: DgoK1X74MDmF4RCsuNpBWQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so2131304wro.19
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0svpCYt0NP/EvVjhde2m9Yi3ykgVVFhsbY3OeENAPkw=;
 b=QNF5/qS45STvat7Sw7Pktr6gyMKoMo+FTZu/HTyEdEc/Qgo6peefSt32tClZjttbwr
 GjOBEhFnpyx4sbbp2lZij9XtM0ebTygzsF1IiaDlmHIjCijDbrK+fSsk4IVbdI0S9R8K
 m1K2/AqE4Z9C4buQhk5EtKzNG28y+DUzwkcr4Dcr0k83J9CPcshSpqMtLUFbfgz5c2UJ
 Io1yD7upMNOaBymsoFzjNAkztHhJMW1xLdQs8XwR5jFUUZprpdk0V/AzZu3fnt4XRiFB
 6vlvuSd6As+dGqAvUaCyBWVpp7jZJ0F4B4/dC163LxJgXsbxU/V/WmwpTZouqJJ0gcyE
 mZfw==
X-Gm-Message-State: AOAM532L+shNV+B9giOphL0kk+1fWfBLhuvzVfyXkdhcFMA+vBKxitNk
 mkidxfHXHJcZsPo1GIRHKJqX8+qI/aMaB16FwT3Pv5TufshXTeITpP60v6I4VJs15n6C+XBlpBm
 c4N/u7ivV1La/NDE=
X-Received: by 2002:a05:600c:198f:b0:394:952d:9a72 with SMTP id
 t15-20020a05600c198f00b00394952d9a72mr61396318wmq.72.1654683727435; 
 Wed, 08 Jun 2022 03:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyBZ1gVc8edaVtTmNqMDE7JxGkKPFW/PsOPbZyFoG5uOF8WY53cRES9zCXEF0SURXDMoI6zQ==
X-Received: by 2002:a05:600c:198f:b0:394:952d:9a72 with SMTP id
 t15-20020a05600c198f00b00394952d9a72mr61396298wmq.72.1654683727160; 
 Wed, 08 Jun 2022 03:22:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a5d4fc1000000b0020fc4cd81f6sm20538696wrw.60.2022.06.08.03.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:22:06 -0700 (PDT)
Message-ID: <c1c94b97-346b-e2c1-4b8b-de1ae6f0ff9b@redhat.com>
Date: Wed, 8 Jun 2022 12:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 16/45] block: drop bdrv_detach_child()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-17-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-17-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> The only caller is bdrv_root_unref_child(), let's just do the logic
> directly in it. It simplifies further convertion of
> bdrv_root_unref_child() to transaction action.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 45 ++++++++++++++++++---------------------------
>   1 file changed, 18 insertions(+), 27 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


