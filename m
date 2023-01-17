Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C8670BCC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:43:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHufA-0003Rr-N0; Tue, 17 Jan 2023 17:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHuf8-0003RU-H0
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHuf4-00053n-Sw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673995352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMTWnYJpdm3Pog4m9hV4L4YvzifRvi7kKlAvAwMEhKs=;
 b=den8EoOXkT7R1NOphp6awq7ZjcxGoJHp6culqdtjE+4UgrT8tF2yQYDFQr6p+iwbgb6xOX
 KdtQ7fCHD5/yc0Ik55UyNdHnZbx1udXY8k1X+I9J3ihyCrsrZty2bCo7k9Xi9ma5IiHlSU
 YrRdroHXULsSccJHnoUdH2ivUY/dutA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-_CncAyAzOXOt54YcV0wm0Q-1; Tue, 17 Jan 2023 17:42:30 -0500
X-MC-Unique: _CncAyAzOXOt54YcV0wm0Q-1
Received: by mail-pf1-f197.google.com with SMTP id
 74-20020a62184d000000b0058b9f769609so7369328pfy.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMTWnYJpdm3Pog4m9hV4L4YvzifRvi7kKlAvAwMEhKs=;
 b=ndLmmcB9hq/ccgsPhLCyUjwIsnh8+7Flf1G+3DGb9yxC/sVMURMh5BMDWwoMgPTdtr
 7L+5ab63uY0bmPEEoB+6MhWgjRTD31a6MyNOpWCCLOuq89QB8Ts+u5hzycFxl6GKxcBy
 LsfTLMRsNGdq0/aJsOfI9I+woaBpX8UGPwHRBYMX+C2+ChXUkD0qFnKH4mbPvMB/FP2p
 pmXXtWvKW81mI61sPxYrKIlq/XmOUFpaWI1YJsQgZ9hG39k1qasUZSuMrwW7VKoSE0IO
 oRX3ar27TzW4HsGwvWB520zDCLyJFi9Uw7HTFCj3SKNEL7lHp/nWYsLErWxTKRvmkUZ2
 f77g==
X-Gm-Message-State: AFqh2krH+7o1yLowEKGFN6d5chd/JCRkJuwYBWVlpZqTRCgh6+zHyz/D
 zVrrK9Qpri/4uGyaV82vJjSYhIjEDHeXPGBaRHdzRYjslNJyoMMi5PsXy1aRz0of2jtLjwos01O
 k79idwrpFa30z90pgNU/RO6IG4t25Ty8=
X-Received: by 2002:a63:7c5:0:b0:477:b603:f754 with SMTP id
 188-20020a6307c5000000b00477b603f754mr418295pgh.232.1673995349694; 
 Tue, 17 Jan 2023 14:42:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1Ofsu0dQNKA7kEFwrM5kcAO4b6kuqjqswcDuSKAzcvqBIlRvYLedZ5n6QOckpBl62BUSu3DFKLDb7FrXHolA=
X-Received: by 2002:a63:7c5:0:b0:477:b603:f754 with SMTP id
 188-20020a6307c5000000b00477b603f754mr418277pgh.232.1673995349399; Tue, 17
 Jan 2023 14:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20230112152805.33109-1-davydov-max@yandex-team.ru>
 <20230112152805.33109-3-davydov-max@yandex-team.ru>
In-Reply-To: <20230112152805.33109-3-davydov-max@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 Jan 2023 17:42:18 -0500
Message-ID: <CAFn=p-Z95VZH=699nxKanrgUWycsHW+EX07q5Brs7uV+Ye8bHQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] python/qmp: increase read buffer size
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, armbru@redhat.com, 
 pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com, 
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com, 
 Qiuhao.Li@outlook.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 10:28 AM Maksim Davydov
<davydov-max@yandex-team.ru> wrote:
>
> Current 256KB is not enough for some real cases. As a possible solution
> limit can be chosen to be the same as libvirt (10MB)
>
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qmp_client.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index 5dcda04a75..b5772e7f32 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
>      #: Logger object used for debugging messages.
>      logger = logging.getLogger(__name__)
>
> -    # Read buffer limit; large enough to accept query-qmp-schema
> -    _limit = (256 * 1024)
> +    # Read buffer limit; 10MB like libvirt default
> +    _limit = (10 * 1024 * 1024)
>
>      # Type alias for pending execute() result items
>      _PendingT = Union[Message, ExecInterruptedError]
> --
> 2.25.1
>

I've staged this one patch to send with my next Python update.

If by chance this series should be picked up in entirety by another
maintainer before I get this one patch in: Go for it, you've got my
blessing.

Acked-by: John Snow <jsnow@redhat.com>


