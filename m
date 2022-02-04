Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBA4A993F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:26:26 +0100 (CET)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxfU-0000yx-KB
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:26:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFxTg-00014N-Qb; Fri, 04 Feb 2022 07:14:13 -0500
Received: from [2a00:1450:4864:20::52b] (port=34663
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFxTb-000199-0a; Fri, 04 Feb 2022 07:14:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id w20so8772607edc.1;
 Fri, 04 Feb 2022 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GX7yMDbwkU0XQPgA4g2Flly6H3PTU3W5Dy6WwA/4r7s=;
 b=OC/BTqHsUhkutM0tCBOAvaI3+/xRd8VYpx4jF7yzZQdXK4NbdRnb0yZ0Hl2ST3x6Eq
 XTX3w1BcBQEgjwgpkoq6ZrOFMACAwXU1hhtikKdPGRq4TL+8xjqqu877G6rq+H2CkjJs
 NvQvxln5Zq6BH7a8jTKU+RlvU6on4pTuZvF8iF4rwKTCfYu0EqRuO/PfvHxIXhfHulLC
 iy/Gth17gK3ZmZgQglTk0BFAlSePN5IvbGPxvwN+FCxClVq5JxPD7dQY9P/JOAI3DC1s
 TTiA37rjwAPxHZZLMq5QIZD1ZVyO/rmgZSBSM0et18ELbI8hTRY6a6B+4mDu3pmj5dnp
 wDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GX7yMDbwkU0XQPgA4g2Flly6H3PTU3W5Dy6WwA/4r7s=;
 b=u/jhPMR0iZSAPCEjPRH+cYlxxmES4uhhV+khl6rWHVfAptxUnMhBXaUFcN+xvaRXNF
 wIEt+VR6ou9xM9HKjFc17L+JaThN1t7yURUR+NpBonZQL4OVN+33OClP3zRQF5LSmtzh
 Io+wvMPds8y+E/tVcWajxlOkrYxyKGAw1WnX3RBqeM7kEd7rh03nLNpNcnfpQf7Ry5wk
 9aCR6hOfkb+/tpWxLuyiE98gu88cpC8tEuDu3EbVeBrxH9qJIcOG1FYSMV0J4zEEoUaa
 KuT3mkOoK+/wceiTJj3AZEErwzysqc1VL91xBchAUvKtPxHEPCT4TZPjJpVpGY31zSWl
 1uTw==
X-Gm-Message-State: AOAM530U0dT/Bu2LD5hwOhRJlU7J0Wnd4dOqcmEpB9BbjFVXUc7Hd8lj
 Wp4BpGOAk0smJ+cFZHXKekM=
X-Google-Smtp-Source: ABdhPJxJTbm/eefqq0HpqMc1gxVVcw/8xCQXfBKVZtc04SS0UOp4LC9UqB5OWpNGWk04b0cXMmY49w==
X-Received: by 2002:a50:d617:: with SMTP id x23mr366786edi.91.1643976815177;
 Fri, 04 Feb 2022 04:13:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id c5sm785255edk.43.2022.02.04.04.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 04:13:34 -0800 (PST)
Message-ID: <78359dcd-7edc-8238-47ba-3ac2e9a86757@redhat.com>
Date: Fri, 4 Feb 2022 13:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/12] introduce BDRV_POLL_WHILE_UNLOCKED
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-2-eesposit@redhat.com>
 <YfEnUG2m2AlvJqpE@stefanha-x1.localdomain>
 <6aa2ea07-2b04-89bb-b170-1319c90d4181@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <6aa2ea07-2b04-89bb-b170-1319c90d4181@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 14:57, Emanuele Giuseppe Esposito wrote:
>   * This function avoids taking the AioContext lock unnecessarly, so use
>   * it only when sure that the lock is not taken already, otherwise it
>   * might cause deadlocks.

"so use" should be "but use". :)

Paolo

>   *
>   * @cond must be thread-safe.
>   */


