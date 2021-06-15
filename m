Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0513A82AD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:23:47 +0200 (CEST)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9yk-0006QL-Ui
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lt9pa-0001vY-UN; Tue, 15 Jun 2021 10:14:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lt9pX-0006fT-To; Tue, 15 Jun 2021 10:14:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id d184so14255997wmd.0;
 Tue, 15 Jun 2021 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ku5xfOFZiB3INB/s3/o+WCkaTospxHIfVQkNnw0+4YE=;
 b=Yqt04d3+jWLP8lP44rlFjFyQOvIUpwZwE8SCv01knpYVpBtQXZnHBwxQ2Z89hJGR8R
 2vgWGV8X293qrp2zxRFC+ux7hIMOJ053ayWjF167CVBKUq/pFgYQuIfcMYyt6LErPzgF
 94sPOdZM2TK1tEiUTbOht+DliAKcXzEKH6qop2O5id79dqvcCYnkO/nRir2xExTgkZdr
 NGDBjJoO/P4lsDQuuF4nLNYnDk9PtRu32okNemPcfHyGAmYO1CPmG7V7XJS6mSRcvgYa
 nBlWyTCG0vXDR0p3YVDkPmL0kKwc2CJEyzwD9wBOy4c048y3kfODlXkXHr+hScgXVJbm
 w9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ku5xfOFZiB3INB/s3/o+WCkaTospxHIfVQkNnw0+4YE=;
 b=HrggAazXoXwGdxccx5ZZRsp1jWIgmxawPUppfIkLWPQ/AC70vJxCJjC7jWDw/2moA4
 gWkHK9XqlP/V1gZvq1CST8zzrED5G65yCdhz2kvmfq+ds8pOOpKA4lI46NK3b09rbdxy
 +7a4LHRz2BMW4XA4FT4e9+bsuK5wFdo+omg4I/uClcAJdKZdECvQZ3VRTZhGYURDRpVU
 2NcqPBOec7Pq0Njw9YU2k309GUCpj4A1CSOB3fhaf8TFvXv5IWGRckZz37fJICKLjj4f
 IYntjs9WwgTzX+3216nYEGSQ1ZdIIW6OQHS2uyb8cHbun7lIToWWyulsxSLaDlyxXq1u
 bfDg==
X-Gm-Message-State: AOAM531Gf/BJ8terXT5qF+FtxzvGsGyk7EVojIjFO9JzSzSZfE+JTr0U
 MADrFfVSbGAtRX+XmAOdIc4=
X-Google-Smtp-Source: ABdhPJx21eBYNgKbODD0BsiiI+t1uP7d2ZMlYKdiRBqfYKkIVv6wxrOrNE78qANH59rF7zC8A54WGg==
X-Received: by 2002:a05:600c:2054:: with SMTP id
 p20mr23019119wmg.175.1623766453735; 
 Tue, 15 Jun 2021 07:14:13 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t11sm7027797wrz.7.2021.06.15.07.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:14:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1b779f0-6120-4efe-ad6f-6807888df3bd@amsat.org>
Date: Tue, 15 Jun 2021 16:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 3:57 PM, Cédric Le Goater wrote:
> On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
>> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
>>
>> This commit attempts to fix the first bug mentioned by Richard Henderson in
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>>
>> To sumarize the bug here, when radix-style mmus are translating an
>> address, they might need to call a second level of translation, with
>> hypvervisor priviledges. However, the way it was being done up until
>> this point meant that the second level translation had the same
>> priviledges as the first level. This would only happen when a TCG guest
>> was emulating KVM, which is why it hasn't been discovered yet.
> 
> What do you mean ? The QEMU PowerNV machine emulates baremetal and 
> can run KVM pseries guests. 
> 
> It has some issues under load but not related to memory translation. 
> This patch is certainly improving the model and it is worth testing 
> but this version does not apply on ppc-6.1.

Unfortunately this series misses a cover letter.
The base series is mentioned in the first patch:
Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>

