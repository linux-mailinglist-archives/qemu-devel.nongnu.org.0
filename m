Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A046C9F60
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:30:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgjAt-0008VL-2P; Mon, 27 Mar 2023 05:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pgjAq-0008VC-JV
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pgjAo-0002Lk-Ey
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjqMr88GUw+ILqt1iJBJxd8oyhKh9mZRSnDlMNA5t+g=;
 b=HHWcJDlB8ckDYTcoEGaMnddogMK4LZe8D/FUEb02H9kkzMIu2cw6hAFflh2WXwRHSpvRmx
 6yWXEFGpj2sMgx3Dns9toMmFQlGi4nntBF+hhb49DMjTazmRPsogOTYx4FZOxy0EqwBXw/
 bHynv0bR8Lpoj9m65+u4zb6lXitJrAc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-0JUrLkCkM4y9i_dPQqDjMg-1; Mon, 27 Mar 2023 05:29:51 -0400
X-MC-Unique: 0JUrLkCkM4y9i_dPQqDjMg-1
Received: by mail-qt1-f198.google.com with SMTP id
 h6-20020a05622a170600b003e22c6de617so5654487qtk.13
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 02:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjqMr88GUw+ILqt1iJBJxd8oyhKh9mZRSnDlMNA5t+g=;
 b=TaWWI+ItIW1rnaz4YJ3QauxYYSFlT43mwrKlLqwYmCto1aVsT4WVa6zH9NQ2OFOn5s
 Nk0N/sw5/PdJhB+5iHg26ajd3JuI64UqCpthaXsX8429S08d3iIUvaxmELir87EOs6rF
 9yyuaQBeMr0qZN/CF0vd7NadsAiXSJn8h9bUD/FG9YKJy+sAmcNySZwzySdCqvGBOiWY
 35MBXmMhHLYlaAnMKXtaSsFq+LcolE/I7OaO2qb7+vahLJjB3r2IrYfOE6RH4CFnPN6J
 y4ORjGZfPDd20funT4bkbaQel+ogCkvrMp5cOel1tGxRkxA0ZVL4P7//PviMhm4PXlFl
 2AsQ==
X-Gm-Message-State: AAQBX9cOB8PSnlc0Br8FTds5eNaq7K5huYFdCf4+e4dkrTM7Bo3G3HzX
 zSG4EwsqkBZRiCkV6WOjB4Vofis36NMxBAmfE7MP6GVfJ7BivItaLoD5Og8YE6JxzdeCBHccuie
 br6C6NKUIgHD0jVU=
X-Received: by 2002:ac8:7f0c:0:b0:3e4:e3cf:22d6 with SMTP id
 f12-20020ac87f0c000000b003e4e3cf22d6mr7250845qtk.54.1679909391082; 
 Mon, 27 Mar 2023 02:29:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8ja1KN/ZPnGXv0v/cD4vB7f/hVs7zerPr01Mn1edeWeIdtSvA5bmntOBxHo58ZNHo1+Z0KQ==
X-Received: by 2002:ac8:7f0c:0:b0:3e4:e3cf:22d6 with SMTP id
 f12-20020ac87f0c000000b003e4e3cf22d6mr7250828qtk.54.1679909390861; 
 Mon, 27 Mar 2023 02:29:50 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-5.web.vodafone.de. [109.43.177.5])
 by smtp.gmail.com with ESMTPSA id
 h23-20020ac85497000000b003e3927a2cd8sm3783254qtq.3.2023.03.27.02.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 02:29:50 -0700 (PDT)
Message-ID: <2f88c5b2-bb6e-181d-d47d-1dd3b5d3d2dc@redhat.com>
Date: Mon, 27 Mar 2023 11:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] MAINTAINERS: add a section for policy documents
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230324173836.1821275-1-alex.bennee@linaro.org>
 <ZCFe68dxx/Wa5xya@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZCFe68dxx/Wa5xya@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 27/03/2023 11.16, Daniel P. Berrangé wrote:
> On Fri, Mar 24, 2023 at 05:38:36PM +0000, Alex Bennée wrote:
>> We don't update these often but if your the sort of person who enjoys
> 
> s/your/you are/
> 
>> debating and tuning project policies you could now add yourself as a
>> reviewer here so you don't miss the next debate over tabs vs spaces
>> ;-)
>>
>> Who's with me?
> 
> Sure, you can add me.

Me too, please!

  Thomas


