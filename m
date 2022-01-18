Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD354925C6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:37:26 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9njp-0002rb-Rw
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:37:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nUT-0003cD-IR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:21:33 -0500
Received: from [2a00:1450:4864:20::335] (port=46946
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nUS-0000zB-27
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:21:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so4477366wmb.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pOvMYKKMfHa8SAPb2vw7jXCssnaN3IH3OrngcQPj3CI=;
 b=hWSU/xrowX6jeSyDkSIKYH39bQTdP0F3hCyN4yrdPk7x0gxiGpTWeavEoOolWwhFeu
 3WNBTesZ5JIXsVL09VocLP9yxktqdxV63sGYYTDyW1LWOXkqOnT3mvXIQ3xg8hSRUcjT
 B3htyxLnmuEFon0D4IcbH3kerUqOZrja2e8/aSM4y0Kxn8hHYudx+vbwDgCNSssr1ZFv
 cPO6kps8ykGsQzg5d1ct1vxS7bLCHqVXvCDf3uNzgn2hOqzDpehuft0WTDh91Gxats8H
 XKYUXF08dS4BdaUY68ziD2VhxwxRvHQlFDX+D/6Jjdj2prS7w007hPtKQCwr8ju5oUyE
 0hBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pOvMYKKMfHa8SAPb2vw7jXCssnaN3IH3OrngcQPj3CI=;
 b=Yz+Pz+C1IdKU7b3Upi0nRZK5b4JazZ7ofGi/bP1R4zqPsyIyjLouenF3GpXVHIdhH9
 Yk5TUZg+zawDUlOHBnUGkc8eKeQIbZljeN+861uly9E91HNqW47/cpai72LKdnfhFOtk
 GTovbi3vdUpjjQhKtKW3iFCpn4FLcVay52QqpFLf/FfcYZRn5Ndf1zOIEI59+AGi+8uY
 pdXTHNc3yMTUJZ+3p/cz9QE46iHOTlFDyvuSIcwXDAU2oWUovBct5tTKYdphqDD9b7l1
 vfVCACwAChwvUDU/i0EXNGaG3G1hTzLuvcxVQ7G7DLDR0+sE7qRE1aqeZWNmsgCGrRWY
 hj6A==
X-Gm-Message-State: AOAM533zZTpZkaCRiG3J5KbzVPmcodGsPozqYuMaiezsOZ0nFMHzsqsd
 oFXe0y+Lnt4KTJDkP6+jZ2w=
X-Google-Smtp-Source: ABdhPJxJvbHgGEGmVC/J3Aku+lpvEJJsOS9AIFR/DMHmWKC6E/2+jbMoxwHHmFuaNHK5V0kmHeNF6g==
X-Received: by 2002:adf:e846:: with SMTP id d6mr21694258wrn.370.1642508489815; 
 Tue, 18 Jan 2022 04:21:29 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id r3sm8149658wrz.92.2022.01.18.04.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:21:29 -0800 (PST)
Message-ID: <30f67e03-0c51-aaa0-3bc5-bb7d26493f93@redhat.com>
Date: Tue, 18 Jan 2022 13:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] meson: generate trace events for qmp commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-4-vsementsov@virtuozzo.com>
 <871r15pc8p.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <871r15pc8p.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 11:30, Markus Armbruster wrote:
>> +# Please keep ordering between 'qapi' and 'trace' subdirs:
>> +# We should first handle 'qapi' subdir, so that all
>> +# generated trace events be generated prior handling 'trace'
>> +# subdir.
> I naively expect explicit dependencies to be used for ordering, but I'm
> a Meson noob.  I'd like an ACK from a non-noob on this one.
> 

The Make-time dependencies are just fine, but still the Meson language 
is imperative (with generally immutable objects in order to avoid 
aliasing horrors) and variables in Meson are all of the ":=" kind; 
there's no equivalent for Make's "=".  So you have to do

	subdir('qapi')
	subdir('trace')

in this order so that the variables defined by qapi/ are found in trace/.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

but I would replace the comment with:

# NOTE: the trace/ subdirectory needs the qapi_trace_events variable
# that is filled in by qapi/.

Paolo

