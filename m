Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BB6FC37C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:08:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKFQ-0006AS-AR; Tue, 09 May 2023 06:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKFO-00069j-L9
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKFM-0000BH-Vq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683626823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2z54dPYkP+kjA9FpOb9Z38I7w70eCMMwdsXQh4U6QMs=;
 b=NiU28pQetypMAAUM9PoSh+MIbLgw/TWWFy4XT+kXWVtlld/SohHwH6Icwvr70Gn3R3dHS3
 a1BBTRZWOP5pyD5J67gdjxwpVmhQt2RWcF/ZBhATinKp26CpkTpf8O7sltWlwKE0Wk+hWo
 IWiO5Qc0zanoo+Qbno72ynbVXA+KCEo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-gJzd09jAP3G6Lu1uLmO-qg-1; Tue, 09 May 2023 06:07:02 -0400
X-MC-Unique: gJzd09jAP3G6Lu1uLmO-qg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30629b36d9bso2162064f8f.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683626821; x=1686218821;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2z54dPYkP+kjA9FpOb9Z38I7w70eCMMwdsXQh4U6QMs=;
 b=W8T8Ysl2CXlgXxQNCrMRxlmPuFWc3dl9IGUQQy0o6tPSEIe0TmzhZFwUTusCX5X/1q
 OsYKumkc8W13a64TS1RW7VMidVz5Eqe7I4lMx8xsWBbmZypQsalOXYQjH7mZqtEO82xM
 vkVZ3/RsKyaVy25fQjOYEMw6JBSPxOMqvOd0H1SknKH4g1s5x/OX5OewPxIlpAxfaPUf
 NIVY4wKWt/MoTkkezCyQaO/xGXLQnOh/FYDa6HArxbcO+VO2cZ8XmxNxjMyUxIvvMCwl
 4Ddso7zkYu4NiFixgbYZ4zhUVj9Ld1+SNSS0JB2zV2BYd1HxfXLi/gd/GhamTGdrUdAI
 g5sA==
X-Gm-Message-State: AC+VfDwfcjtBPD1IkHk1YT+xvyDz3I4LTLSnifXmmYTnmdZDuj0PQ2pt
 oUspg0n5brLUvhW8bLvTQGBEZAhXix2uTODcSYbE7H+9VmpwmxoLvt6gBCPbX5/uZf0nNtY83ea
 buzQDPA161a6t2l4=
X-Received: by 2002:adf:e787:0:b0:2f0:6192:92db with SMTP id
 n7-20020adfe787000000b002f0619292dbmr8362831wrm.46.1683626821192; 
 Tue, 09 May 2023 03:07:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LHoxACTSlm1Cn49UKZUruem5A+F99GJDWEka1vSeAr3EsUL5kc/Xjezenwf/8DfyMm/i0Tw==
X-Received: by 2002:adf:e787:0:b0:2f0:6192:92db with SMTP id
 n7-20020adfe787000000b002f0619292dbmr8362783wrm.46.1683626820830; 
 Tue, 09 May 2023 03:07:00 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4f11000000b003079986fd71sm4788366wru.88.2023.05.09.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 03:06:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 10/17] tests/qapi-schema/doc-good: Improve argument
 description tests
In-Reply-To: <87mt2ej79p.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 09 May 2023 09:25:38 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-11-armbru@redhat.com>
 <87edo37ubz.fsf@secure.mitica> <87mt2ej79p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 12:06:59 +0200
Message-ID: <878rdxg6nw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> Improve the comments to better describe what they test.
>>>
>>> Cover argument description starting on a new line indented.  This
>>> style isn't documented in docs/devel/qapi-code-gen.rst.  qapi-gen.py
>>> accepts it, but messes up indentation: it's stripped from the first
>>> line, not subsequent ones.  The next commit will fix this.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>>>  ##
>>>  # @Alternate:
>>>  #
>>> -# @i: an integer
>>> +# @i: description starts on the same line
>>> +#     remainder indented the same
>>>  #     @b is undocumented
>>>  #
>>>  # Features:
>>
>> Just curious, what is trying to convey this
>>    @b is undocumented
>> At the same indentation that the description of @i?
>
> Writing it like
>
>     # @i: description starts on the same line
>     #     remainder indented the same
>     # @b is undocumented
>     #
>     # Features:
>     # @alt-feat: a feature
>
> fails with "unexpected de-indent (expected at least 4 spaces)".  That's
> because the @b line is part of the argument section @i, and the doc
> parser insists its indented consistently.  Guards against some editing
> accidents, like forgetting the ':'.
>
> Writing it like
>
>     # @i: description starts on the same line
>     #     remainder indented the same
>     #
>     # @b is undocumented
>     #
>     # Features:
>     # @alt-feat: a feature
>
> fails with "'@alt-feat:' can't follow 'None' section".  That's because
> the @b line is now a section of its own, and the doc parser requires
> sections to be in a certain order.  Similar guard against editing
> accidents.  Not foolproof; it only works here because a feature section
> follows.  If we wanted sane syntax, we would've stuck to TexInfo.
>
> The error message is bad; I'll improve it.

Thanks for the explanation.


