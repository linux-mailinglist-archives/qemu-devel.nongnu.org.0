Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0457C9ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:49:52 +0200 (CEST)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUgg-0003f5-RJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEUe3-0001Bz-Np
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:47:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEUe1-0005Re-A2
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:47:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id tk8so2698310ejc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lqeuDuZYEy4sa25gt7za0Uolnr9nkNgnXWVttDQlLbc=;
 b=PiuUivd/MPXwAucvNcdsRbMu046sfr2QsIesNsRleb/JWmrvd1bllYF5X+OYpqqAEM
 aKhGDLw0LeYBtQ11yK91eMS8vFRO/nJQWXMQMU0NukJaahir5vkQ8yEKT8neXqE5Fa5S
 Cxj8bIN+VrMCofoHSQU7mnEVkWLHRypDoufliTL1Cj2mw1jD1/J7PJ6AAmZ4w93qUAvh
 sVIQok9iHC/fVbnDCFR4Z5OA747hQbjknMOCcntAr93nUPen72o2PGHs/3TfrDFZ8PLi
 mjiD0ZoA3jG5BKLQUoMsdiVhL4cB61C2H0v/5/Bw1BwyyAlCFLDo8IrwxY8esLSzJnmz
 /F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lqeuDuZYEy4sa25gt7za0Uolnr9nkNgnXWVttDQlLbc=;
 b=YjgKPY4ItqrxZdbIWZq4bv9NBPjtoeg6wnTwx2Ebz5Tc8tmTKFW5+BUVAweatJKsGK
 SuQ85zK6qSuH1SfB3L/JxC0nC/JV926WPVv5fFk41X+PcHq8Q/OQu6EZivcI4orxHG5C
 Pd0Xv/f26XXtScMbP1DmdyoagZnBrWaJTyu2kS4NegXLwx6wUHw3aIAYjUp8WP8l0tvF
 kp7K+zosIwXKOi5HJpuV3Qwo2P/XsUdkMMd0t+SevKUJPSGjVU9z9NpgrtCRMaWArS9w
 5M0iUTtRUk+y/TwRWUP4j2vO2IlmlGlF2eRbyVW75it3batiBkn6HcL+/fdLDKR3ZKMy
 rEGA==
X-Gm-Message-State: AJIora8APTxLIqtvkyEXx4fxK96+eMFWaL+ChuctuyiEmYUKEQEcAYzL
 AYbL7PJ65FoT0hrn4133nac=
X-Google-Smtp-Source: AGRyM1uLmVGIc4fI3Y+nzFPws6Cw1c6ZHdtzw20nwSCljPZLl5o/TVeMC+nEGm82Q12BesC92X8cPA==
X-Received: by 2002:a17:907:3f90:b0:72b:859e:8fdc with SMTP id
 hr16-20020a1709073f9000b0072b859e8fdcmr39901202ejc.735.1658404023690; 
 Thu, 21 Jul 2022 04:47:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 x4-20020aa7dac4000000b0042617ba638esm884865eds.24.2022.07.21.04.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 04:47:02 -0700 (PDT)
Message-ID: <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
Date: Thu, 21 Jul 2022 13:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220721065744-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/21/22 13:00, Michael S. Tsirkin wrote:
> Well why not.
> 
> Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> 
> who's merging this? Paolo me or you?

I don't think this should be merged as is.

The linuxboot ROM takes the data from fw_cfg, and (with the exception of 
ACPI tables) that data is not migrated.  Because reading it into the 
guest is not atomic, both sides must match.  This version of the patches 
at least doesn't move the preexisting DTB entry of the setup_data, but 
it still has a mismatching size and that can be a problem when migrating 
backwards.

So for example there is a race window where the guest has read the list 
head that points to the random number seed entry, but the entry isn't 
there on the destination.

Note that I _do_ agree that this is theoretical and basically impossible 
to hit.  On the other hand, it is there and it's just not the way that 
we've handled guest ABI compatibility: migration issues are already not 
fun to debug without having to keep track of which differences are 
intentional and "harmless" differences and which are bugs.   So for this 
particular case the structure of fw_cfg data MUST match on the source 
and destination given a machine type and options.

Thinking more about it, it's trivial to hit it if you use TCG 
record-replay, because if the record and replay side will get different 
sizes fw_cfg and then everything goes south.  This shows why this 
mindset is the correct one even for issues that are theoretical in the 
case migration: if we hadn't, record-replay would have been much harder 
to implement.

Of course I'm not going to introduce a whole machinery to migrate the 
seed: if you want determinism (as in the record-replay case) there is 
the -seed option, if you don't then it's not a huge deal to have a seed 
that could theoretically be generated half on the source half on the 
destination.

And in fact, after some refactoring, the changes aren't hard to do.  My 
patch is 35(+) 0(-).

Paolo

