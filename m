Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3736D5A78
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 10:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjbm0-0006Wi-MU; Tue, 04 Apr 2023 04:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjblc-0006Le-66
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:11:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjblZ-0002J7-DZ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:11:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t4so26584965wra.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680595902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SQ4OM53uGJWae40egDsFihB6ynm3ZaJg0nlR+iNF1m0=;
 b=Ujmpc+1eFAYW5MBikLGTd/epaASW+i0Gsnkelksi46Fbr99rytZBANnpBZHft0GO/D
 aB0Mu1yFmmnobE30tfyYWL583CCq9jxbu9V/8ybfLeepEb9WBrUb68BRb/pMWjHi/Z3H
 Ed3fDlCxBKjOcR6rAbE7o1SZ2q+9YIYQKjlAHoCIT5vI0SYFv3cQe9V/0A+3Emib27dq
 vL8bBLlJVboFrexzdepse+wyWTdp5fO4Zx/qXvRnhnM2kU40BShO++xE8l+WS5eaFK31
 AH/SRTmP2uMMlInOnetmRXldxx2WfqtTvfeX37n4U7JTp+Ze1WZAwQPq/Lp494cgZTw0
 srRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680595902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQ4OM53uGJWae40egDsFihB6ynm3ZaJg0nlR+iNF1m0=;
 b=SC7di3IwRU5b54nJwC95RS6uqqSk65Ip9BD5vC9I1Pb4L0DWUwsIUDo944ria/EBR3
 GQ01ouKQIkDl4ZJBCefKbuVDeVshntTvQuOUrZPVSnL2UZG3ADNlLb5vtQVwQEL1GaQI
 24clVXGHUZ/3Y6D1t3mZow/oczrgQBbXDezxKzVsXpk4+mJDRYjQfWmNUzUKaG6QyrCc
 s91eLkhvQyQgxmnnZu1t0LXt7vhfpRPdvQkkSZXMnq/esPFVvXBP/Q3yrmNRnGIQDBZ9
 5bCK7d2wfG4fI/bhs972PfwOF5aH83SBFt4XKqyCI3FMBPkBaI+uWJbumXn9w1uvKERa
 /LWw==
X-Gm-Message-State: AAQBX9dYz6ItHPB3EisEId3aEZcLCzPvS8aCmUQEBAf+6y/rrKIZaEPu
 y06vyRklDgbLKX6bbY6Q9KUkbA==
X-Google-Smtp-Source: AKy350atJMMBU1Pz69o6ZW877QvdnSIbD19tEYSUEGoUL3x8WiQaDCbQ/7Z8SJUicb5raq7tUpiPxQ==
X-Received: by 2002:a5d:5302:0:b0:2cf:f486:5c31 with SMTP id
 e2-20020a5d5302000000b002cff4865c31mr1236224wrv.24.1680595902542; 
 Tue, 04 Apr 2023 01:11:42 -0700 (PDT)
Received: from [192.168.69.115] (pas38-h02-176-184-5-132.dsl.sta.abo.bbox.fr.
 [176.184.5.132]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d4a02000000b002d75ef32032sm11645924wrq.68.2023.04.04.01.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 01:11:42 -0700 (PDT)
Message-ID: <7e5598a3-cc72-a375-105a-93bf4976206e@linaro.org>
Date: Tue, 4 Apr 2023 10:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 for 8.0?] nbd/server: Request TCP_NODELAY
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Florian Westphal <fw@strlen.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20230404004047.142086-1-eblake@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230404004047.142086-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 02:40, Eric Blake wrote:
> Nagle's algorithm adds latency in order to reduce network packet
> overhead on small packets.  But when we are already using corking to
> merge smaller packets into transactional requests, the extra delay
> from TCP defaults just gets in the way (see recent commit bd2cd4a4).
> 
> For reference, qemu as an NBD client already requests TCP_NODELAY (see
> nbd_connect() in nbd/client-connection.c); as does libnbd as a client
> [1], and nbdkit as a server [2].  Furthermore, the NBD spec recommends
> the use of TCP_NODELAY [3].
> 
> [1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
> [2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430
> [3] https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#protocol-phases
> 
> CC: Florian Westphal <fw@strlen.de>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Message-Id: <20230327192947.1324372-1-eblake@redhat.com>
> ---
> 
> v2 fix typo, enhance commit message
> 
> Given that corking made it in through Kevin's tree for 8.0-rc2 but
> this one did not, but I didn't get any R-b, is there any objection to
> me doing a pull request to get this into 8.0-rc3?

FWIW, no objection.

>   nbd/server.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


