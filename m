Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D775D332F51
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:52:15 +0100 (CET)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiOs-0003K3-Rm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfwn-0006Yv-Ey
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:15:06 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJfwl-0002PF-32
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:15:04 -0500
Received: by mail-ed1-x534.google.com with SMTP id d13so21796992edp.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Nmodk8SlNHNvCxRebgJC9BI+1zH7LUvcuRb0Gs+X1w=;
 b=DD7XhnSRUkX/pdxDF1LCxTuT7NfSoZCV1AtkZvdnk8MrjmWK5op/eN2oXAZ8jPpZA+
 XOmrQL7tWAp9eYS5+R+VZ/m9E6+GWIxklwWxoY68jE06UzrzCupZmLiV/Gvi+cRv+BJL
 zAOM+/UQIg53VVU8r/cz1bnzkYdxXZwOftGNq2JzieoYVmppMwtv/gIy1SLRPBLTNUNm
 rrni4suufTyqG25j0KT0s8G+ajlPQrKLHNNEASJYaJnGCtue1a3hG0+rJV/YGHtD/G+n
 9om7aFIHhRWsERy5VUuzHMUET9knkpGm++XHfUymGWt1BuJBUkrgzMNHQoMzuM2DUbyv
 qIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Nmodk8SlNHNvCxRebgJC9BI+1zH7LUvcuRb0Gs+X1w=;
 b=HPFAHMpYfIIJeoPMiPMewzPQlqSu+2uSC6NlqCer/pTmVTZWN6Kjn6rvnuWnSiS7Y/
 Ywvc6kACfpaJvRBcTDWOQ+6xpv4EHa1vIowc7T+ArofMZ/sk26cPoOlrFvaZ9JyoDVy/
 GQrmIgjTk7jxY2iE2itsMUuXucmiTJ6atWZSSzphfymaQoXHyzu7Aq9byGTjiU4p0bh5
 BGEZfczE0a6Db1KjmaNzSSUgle47GYPzXrgvfs6zGblbs2CHm8DnhOk4PcHo3HIzwB+V
 xyb4Gh3DWx97PiaiyeOdqjIJ3pvSiuKPDAbgk5q/ehAfszStF9byeK7KK5eSPAbLJsPb
 cjfQ==
X-Gm-Message-State: AOAM532N1f75sJ1/DC6w+1/a5xHPoJgF2nZFWQC3Bz2HiymaW2O5kSBY
 3/EY+sys6Y12+s5ZmBmd+EQ=
X-Google-Smtp-Source: ABdhPJwPIsL26Jghtm8q+UaO7wP+Gt+zClnqNvpk5BXTRVPQVbWVH094nf8vSj4otg27cA8wgROlGQ==
X-Received: by 2002:aa7:c6d2:: with SMTP id b18mr5266565eds.183.1615310100984; 
 Tue, 09 Mar 2021 09:15:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q16sm8522833ejd.15.2021.03.09.09.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 09:15:00 -0800 (PST)
Subject: Re: [PATCH RESEND 6/6] hw/mips/gt64xxx: Let the GT64120 manage the
 lower 512MiB hole
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-7-f4bug@amsat.org>
 <b9ef5f78-157a-723d-b527-78f58719478a@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <46641bbf-1912-e01b-a5aa-cbf91c0c2899@amsat.org>
Date: Tue, 9 Mar 2021 18:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b9ef5f78-157a-723d-b527-78f58719478a@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 4:52 PM, BALATON Zoltan wrote:
> On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
>> Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
>> range is decoded by the GT64120, so move the "empty_slot" there.
> 
> I don't know anything about it to be able to review but is this a
> feature of the GT64120 chip (in which case the change is correct) or the
> Malta board (in which case this might make the GT64120 model board
> specific that may not matter much as there's nothing else using it now).

As this is board-specific, I'll improve the description. Let's ignore
this patch for now.

Thank you for the previous reviews :)

Phil.

