Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9A557E86
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:21:58 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Oeb-0007Ze-Ig
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4ObK-000634-Gw
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4ObH-0007RO-3c
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655997510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiMB6FDMAdacpuCWmf+pY54pVTSyXsBWb71HCmuv7Ns=;
 b=V9MM1dXey47jPnIa6U4VCavH2JGI6xQC67HNt3g+0HaUiE+/+6G5xfP9eXFcQglpTIraja
 /kWd1x2ZCpvP96Wru/yXGu9ixMzMStzMs/wEHgt2zVPK7tVv3eh/OpLO+TA48ZZcGuya3L
 KhYz/mBFSSkz2DssOTwQ7ChSp6It4aQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-0hXWlse2NaSEKWTpMPrijA-1; Thu, 23 Jun 2022 11:18:28 -0400
X-MC-Unique: 0hXWlse2NaSEKWTpMPrijA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p6-20020a05600c358600b0039c873184b9so1555431wmq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 08:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=TiMB6FDMAdacpuCWmf+pY54pVTSyXsBWb71HCmuv7Ns=;
 b=hNW0J2qa0L7cYyBXcCDoe279kXIRp/TrjpMWE88hxdmioOC0feDQVkJ0ivawCH6bmS
 ly/arN6My534K8mxLlbxOGcp7skXNT2KFUEFlTDz7blTGyHRoqdWrKoYebZGDab3G9gU
 m60D2OKNOoNbDSPrlTsCgOSUz2RgsZ/zkNGPcem98zblfzd1A6LoTaANfSmcuz/QhbuC
 ijb5z+GgX9tER8ZfRh5pWfEzWuCcsbzFcJb9WZMnlIYyOIT4imzUnsz64BTIBF4SBJUn
 c+oQ9WNjIIbEJitWpdDuvf/mOLUjWNLPW3BkFzWkGUVe/ttGoU3GVJsViIXgBYN46781
 vVfQ==
X-Gm-Message-State: AJIora9gsZrs7vjwMNHQ5+JFXaPNgppldfDujgF6mhiq1gd+iCYI55wY
 de72CRHDirENdaZIBqieF6c5Xc7u/TtHYtQ1mXCnpOeKkVAXMRfqDzp/WZT9272MJnyKRVrrokL
 KGS/frkqg7uXBE6E=
X-Received: by 2002:a05:600c:d0:b0:39c:5927:3fa7 with SMTP id
 u16-20020a05600c00d000b0039c59273fa7mr4719064wmm.36.1655997507088; 
 Thu, 23 Jun 2022 08:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1siThJRU/a7b2kw9eNpeMqF2dIXaXcMPDbuK28MvVuN44nOZxRnPKr/c+iAUZRd0S4q1jEjgA==
X-Received: by 2002:a05:600c:d0:b0:39c:5927:3fa7 with SMTP id
 u16-20020a05600c00d000b0039c59273fa7mr4719036wmm.36.1655997506848; 
 Thu, 23 Jun 2022 08:18:26 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c15d500b0039c96b97359sm3273724wmf.37.2022.06.23.08.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 08:18:26 -0700 (PDT)
Message-ID: <a0a7c39d-a60a-cfe0-c297-f08aba63cca6@redhat.com>
Date: Thu, 23 Jun 2022 17:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Qemu-devel] [PATCH] gtk: Add show_tabs=on|off command line
 option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_Quei=c3=9fner?= <qemu-devel@mq32.de>, qemu-devel@nongnu.org
References: <56D0203F.5060303@gmail.com>
 <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
 <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
 <020edc4f-32b2-fa76-12b8-cc0a455a8233@mailbox.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <020edc4f-32b2-fa76-12b8-cc0a455a8233@mailbox.org>
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

On 23/06/2022 17.05, Felix Queißner wrote:
> 
>> Not sure why it was never picked up
>>
>> That patch certainly needs a re-spin since it won't apply as-is anymore. 
>> Want to have a try?
> 
> I guess the semantics of the code stay the same, but the boilerplate might 
> change a bit?
> 
> If so, i guess i can give it a try tomorrow and see if i can make it work.

The part that affects vl.c has changed completely - you now have to declare 
it in the "QAPI schema" in the file qapi/ui.json instead (and it has to use 
"-" instead of "_" now).

Just have a look how grab_on_hover is handled nowadays, then you'll should 
be able to figure it out, I think.

  HTH,
   Thomas


