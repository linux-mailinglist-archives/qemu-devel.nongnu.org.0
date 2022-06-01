Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41226539E36
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:29:59 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwInk-0008GM-Pb
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwIlX-0007Wc-Pa
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwIlV-0005lw-0t
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654068455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2skycOu0OWWUuBAeEnfk3uTGwVFoxmuqJtb4/zWbsg=;
 b=CIbDnPF6l+m0INqhcL7CUUccbLO0GvTvg1MqkkZajo/YRx1wtdlqrsg/NkDXdYEWRRYbyb
 enCM4veafrnrUHi0K1qlBvXqd1QUZx9L8JDpsvhzFJewBR9XnB2jTWFD1LBMG1uvEyAXib
 IqL0HTJPjNOgfFD5CtId3cEeEI/6biI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-HIq9J4dpNCWAuyRgNVdoLQ-1; Wed, 01 Jun 2022 03:27:34 -0400
X-MC-Unique: HIq9J4dpNCWAuyRgNVdoLQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d61ce000000b00210353e32b0so87364wrv.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 00:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R2skycOu0OWWUuBAeEnfk3uTGwVFoxmuqJtb4/zWbsg=;
 b=CLigD1HAcNjyihGuVMQMw0mE9u4VzFNTTb/yJKzNphpCKTpUa4zPhi6fHYqCc/OvEN
 ruq1+zwHZ62Obbp4o9M7XofjzClSBsnmE6aJhS08bgtfZC5AnEbreXrbkD2Pbf6aZ3OP
 z3ZP0tHDaaJ6KbOsZsKy/wGpNJdEdUj0EInRR3JCP2qsZF7s3vbJhRe9asOsUTz8/FD5
 R/4KEtUpGW5WsLutcl37ZYJIAbYqQRQDsR85TjwUrYwwPNAemnkJeYQUa4CskzElBWl2
 I0XZyyg/Dd5kBkcMBUl31w32Ee5A4K1ljilV0AJWLMjJUTu49Tih9KvwmWB32W8upb4U
 ulEA==
X-Gm-Message-State: AOAM533DjYJ4UyL8+65YqEMltxnJfhLLlJbTUtKB6cPy0peoNEmH3M1e
 aVqzf1li8HtD2tgN1n0QprrLK2piL/UVYIzY8EGtL4LiV72ZvYLOIXyeJVcfZXnQ7c5VD0NkeIo
 Tajya45kwwjMGWMY=
X-Received: by 2002:a5d:5590:0:b0:210:fb90:a2db with SMTP id
 i16-20020a5d5590000000b00210fb90a2dbmr744838wrv.418.1654068452852; 
 Wed, 01 Jun 2022 00:27:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6IcWLDm2cJ6JvqKjG4/ubMuYOxy5L4gGxbX8FgZVyfcZy2V1rXe1V/9b5hoBSHfW407LnfA==
X-Received: by 2002:a5d:5590:0:b0:210:fb90:a2db with SMTP id
 i16-20020a5d5590000000b00210fb90a2dbmr744825wrv.418.1654068452630; 
 Wed, 01 Jun 2022 00:27:32 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o10-20020adfeaca000000b0020c5253d8c2sm755809wrn.14.2022.06.01.00.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:27:32 -0700 (PDT)
Message-ID: <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
Date: Wed, 1 Jun 2022 09:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 mopsfelder@gmail.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220531172711.94564-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
> Update max alias to power10 so users can take advantage of a more
> recent CPU model when '-cpu max' is provided.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> ---
>   target/ppc/cpu-models.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d1..c15fcb43a1 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>       { "755", "755_v2.8" },
>       { "goldfinger", "755_v2.8" },
>       { "7400", "7400_v2.9" },
> -    { "max", "7400_v2.9" },
>       { "g4",  "7400_v2.9" },
>       { "7410", "7410_v1.4" },
>       { "nitro", "7410_v1.4" },
> @@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>       { "power8nvl", "power8nvl_v1.0" },
>       { "power9", "power9_v2.0" },
>       { "power10", "power10_v2.0" },
> +    /* Update the 'max' alias to the latest CPU model */
> +    { "max", "power10_v2.0" },
>   #endif

I'm not sure whether "max" should really be fixed alias in this list here? 
What if a user runs with KVM on a POWER8 host - then "max" won't work this 
way, will it?

And in the long run, it would also be good if this would work with other 
machines like the "g3beige", too (which don't support the new 64-bit POWER 
CPUs), so you should at least mention in the commit description that this is 
only a temporary hack for the pseries machine, I think.

  Thomas


