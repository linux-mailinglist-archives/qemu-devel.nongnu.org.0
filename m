Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF66321E0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:27:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5tA-0007tm-Hb; Mon, 21 Nov 2022 07:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox5t8-0007tU-T4
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox5t7-0000BS-D1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669033620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OTIq3lEx2SpGQbbSHjmDVmqQ2S/CdmGvWL42Qk5Kruc=;
 b=Qbrk4GFejTQN/RDoX+dpUISmfLWcbcbX0bTrjBEiNjOeexHknSg94u3V/pfKbbm9AdNUhU
 HvJ2IRQhOv63gKhk8LaUu7CVgeXAN/P9Vj1b/Wr+MKMznuwN7MUoheDutMV3fYfW1Umc9t
 4rV1WQviB7QPUyT9C+YAYSWBhnc7FUY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-jEQtkOLUOBuA2c-AYBbjcA-1; Mon, 21 Nov 2022 07:26:59 -0500
X-MC-Unique: jEQtkOLUOBuA2c-AYBbjcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x8-20020adfbb48000000b00241c6e4f72eso1664272wrg.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OTIq3lEx2SpGQbbSHjmDVmqQ2S/CdmGvWL42Qk5Kruc=;
 b=TxLNODhKndYEtrZUi6qi2tqlyL+WpKTcC9mo0VGFZQX6rNHtxzD+3KlFzKwl621DA8
 qGIzpfmoSJgN463Apl9pUD9thdRsXRPSgrJ2kO9fzTkfuSQiGJTmfNp+gjRMw0cGkHPN
 dpRlKJNPtxJTFXBryjavV+LNLf2KprJxnVyNbpNO3l5AGgpbFY+YO+h0ydlyKkEmhPQu
 LXMpfmuUqnm75Gt+2y3822tt2XMFp+UKoe+hVs8LoP68NsLBbA3rtZxlArO6rWKaSmEw
 BB/on7UvPRFH4zHnl4vCTZQDPtaCXvTWRDAkp81egoDO1BVgs0I+hNM8gkQVupuSES1S
 +u6A==
X-Gm-Message-State: ANoB5pmQDccFfyDbCVwxCJjowiKZiWyMga2VQwa5C8gfxAoic1zHCVSU
 ZL+R2y9o6lCyJf1RPshxwVS+8xCqDiuPcod/i5Ds76LUpkfLrd8IfTjAd009KuLcVSkmisGtf1t
 HPxt8apKercE8vHU=
X-Received: by 2002:a05:600c:3c8a:b0:3cf:6fe0:b16a with SMTP id
 bg10-20020a05600c3c8a00b003cf6fe0b16amr3036508wmb.28.1669033618001; 
 Mon, 21 Nov 2022 04:26:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4U/sx8ev/OiVW8xHM6AdIcEKho4d3atDnPIXyJwB/8SmKh90W7ww14/a+gdm5npUONH52mYA==
X-Received: by 2002:a05:600c:3c8a:b0:3cf:6fe0:b16a with SMTP id
 bg10-20020a05600c3c8a00b003cf6fe0b16amr3036490wmb.28.1669033617780; 
 Mon, 21 Nov 2022 04:26:57 -0800 (PST)
Received: from redhat.com (62.117.240.223.dyn.user.ono.com. [62.117.240.223])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adffb4c000000b0022a3a887ceasm11129390wrs.49.2022.11.21.04.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 04:26:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  dgilbert@redhat.com,
 pbonzini@redhat.com,  eblake@redhat.com,  prerna.saxena@nutanix.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
In-Reply-To: <87sfmf84iy.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 02 Aug 2022 09:53:57 +0200")
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com>
 <Yt/MZiK3OuvQMRfF@redhat.com>
 <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
 <87sfmf84iy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 21 Nov 2022 13:26:55 +0100
Message-ID: <87r0xwtrw0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> Het Gala <het.gala@nutanix.com> writes:



Hi

>>>>   # Example:
>>>>   #
>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>> +# -> { "execute": "migrate",
>>>> +#      "arguments": {
>>>> +#          "uri": "tcp:0:4446",
>>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>>>> +#                                   "destination-uri": "tcp:0:4480",
>>>> +#                                   "multifd-channels": 4},
>>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>>>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
>>>> +#                                   "multifd-channels": 5} ] } }

Why would one put the source uri and destination uri on the command?
It looks more complicated to me, but I guess there is a good reason.

>>>
>>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
>>> API wrt multifd - essentally the same data is now being set in two
>>> different places. IMHO, we should declare the 'multifd' capability
>>> and the 'multifd-chanels' parameter deprecated, since the information
>>> they provide is totally redundant, if you're giving an explicit list
>>> of channels to 'migrate'.
>>
>> Hi Daniel. Initially while brainstorming this idea for the first
>> time, we also came up with the same thought of depricating the
>> migrate
>> API. But how will we achieve this now and how is it going to
>> work. Is it like we will be making migate V2 APIs initially,
>> integrate it and then
>> depricate the old one? would be happy to get some pointers from your end.
>
> Migration maintainers, please advise.

I would put the old one in top of the new one, and call it a day.
I really hate the old one, but I haven't had the time to think about a
better one (nor I have had the time to look into this one).

The problem that I am seing here is that we are adding the number of
multifd channels here, and we were trying to not add migration
parameters into the migrate command.

BTW, once that we are at it, I guess we can just drop the inc/blk
parameters, we have had them deprecated ... forever?

Later, Juan.


