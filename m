Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506C577F1B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:56:20 +0200 (CEST)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNUB-0004q4-KE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNT2-0002xl-LL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNSy-0003kB-Oy
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658138103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WXlpbDhYOXlauu1JpDQTm8HXxFY29VxzzhSToLdBb4=;
 b=fr23XdI9YUTbye0SwFeA+fkuINGzi2OQ6wf/XB+SWRW7AdWsVz02UN7EH0fRFnBTaVJ+0c
 cWvSRIzB473D71FRi1+Hx8Nvdf3icwGKcruK2bIwttwyzhbOUhJqTpvPzCwfO3rrrcAYD8
 5clvBApW9YkFEd3gQngZNp+YgvD6aQU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-PU73xCrVP4O7XjkeNy-8lw-1; Mon, 18 Jul 2022 05:55:01 -0400
X-MC-Unique: PU73xCrVP4O7XjkeNy-8lw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so97089wrg.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1WXlpbDhYOXlauu1JpDQTm8HXxFY29VxzzhSToLdBb4=;
 b=rvfKdPDo4mPIg4nUJ2wZ3bmJ8gn1SBmwsai+L9miw960hVVQLrUZffblH7vpC7pkE9
 Ot4dQoCd6SeS17dQaWc/EM3ejaamfU13Q2ES+SCsGGJ2gVAtg30737s0HLfjoqpl8qkN
 tr5yNq15l1ilrJgtXQGkWcn4jYJXWcg/x9lWQMEScU7o58JqxdzTKEtDX/+hyR15LpU3
 1YnExV7Vp/Iw9nNkXbXD2Pk+WXQR5YVYreV13mtHodfeSqKMk8nFsDEHcGg9BFNA27Uk
 O2od0cqI7ftvafLtTI/9QuAWpG1hOkD3dJwm7CEND9guj9mpTYRN5nXs2XnDQ0g+VwsO
 h3Bg==
X-Gm-Message-State: AJIora++ONWwkAcNPf0dFgL3u5LHx8bOz8XTnuujIS9GgA1LPkzyiqTd
 7FqKCUnUh9dPp2M5VTcpf/UHWdbnHJ15s0H9Llmq1pee3rDPk/vPtLdaYIOH8u+Nrn94d5ef7yZ
 wZSMZggg0nLol/LE=
X-Received: by 2002:a1c:4444:0:b0:3a2:fe56:e8ca with SMTP id
 r65-20020a1c4444000000b003a2fe56e8camr21923049wma.21.1658138100608; 
 Mon, 18 Jul 2022 02:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uq+Okr/yidYX4ve0UzoVeVZQay+IiIhcE64JLzPx2RpeeM/dcDhGRWgntP/AF3p2YbawBgpg==
X-Received: by 2002:a1c:4444:0:b0:3a2:fe56:e8ca with SMTP id
 r65-20020a1c4444000000b003a2fe56e8camr21923010wma.21.1658138100197; 
 Mon, 18 Jul 2022 02:55:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 r129-20020a1c2b87000000b003a2eacc8179sm14714000wmr.27.2022.07.18.02.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:54:59 -0700 (PDT)
Message-ID: <f07702b5-f139-0158-3d4f-8cbbdf8f9654@redhat.com>
Date: Mon, 18 Jul 2022 11:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com> <87ilnuda33.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ilnuda33.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 18/07/2022 11.49, Markus Armbruster wrote:
[...]
> An OTP device isn't really a parallel flash, and neither are eFuses.
> More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> other interface types, too.
> 
> This patch introduces IF_OTHER.  The patch after next uses it for an
> EEPROM device.
> 
> Do we want IF_OTHER?
> 
> If no, I guess we get to abuse IF_PFLASH some more.
> 
> If yes, I guess we should use IF_PFLASH only for actual parallel flash
> memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> be worth the trouble, though.
> 
> Thoughts?

Maybe we should simply rename IF_PFLASH to IF_EPROM or IF_FLASH to make it 
clear that it is not only about parallel flashes anymore? Just my 0.02 €.

  Thomas


