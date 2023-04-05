Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98326D79AA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:28:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0M2-00081i-Gn; Wed, 05 Apr 2023 06:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pk0Lx-00081I-9X
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:26:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pk0Lu-00040q-Sc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:26:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v1so35666492wrv.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680690413;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lww6dDMe0bMEJli6/6ZP6j4C+of80/qR+ErByK0yw5g=;
 b=A+4oG+PJQ4lEZ6T1z8xTGbTG1pEru7t6wl92B6x2UAdtjSn4xJzf7eV7I2j4gpyXbn
 92WZ5xE3JJgQFywvuyLRJMG40XXULmggfQHz69w92CEIWEygoSuigsrjq9ht1V3Zgu4i
 z6TNY9OfzzcZUcU6HOCAxUSIK/3goyowjInTAglW7fsosL6LxLa21DNgd+90SoYxNwuq
 nd1NNnRxAH+BUWyGiJkYqmYw+QSWqTzOkEiAh19YsI+W7wvfl1+9S9BkkI5tN+bxmvJZ
 grxortISRJgmJfB1B0BK78szZCrNSh2iGdM/WCCfqUuU/hheHyQVJZmwC0sSHOmCINwS
 /EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690413;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lww6dDMe0bMEJli6/6ZP6j4C+of80/qR+ErByK0yw5g=;
 b=oAl/MYZsnlw/jMdhI9acPTRsj3KM/jCeXleZnLksRo8eqGS3u2F03JYFiyaG0Bad1r
 q3Te7s6MMJ9ub1Ff0mWb93R+peXVfoHzrTCrwTDDazkbtlxSG/6aB3Xd3LnQL8IEFkOx
 AiDX/csuqpjd0fYPFzgXE4EBxo7VJMHU/mcA1ixL9SF8x9K1GVVEmLcX4E8c3dhGip5I
 61iKR1Bx0jBGi1ApWxVPk6ccj7KzcOeYyMOhl/MG9kuWxYH72rvla1fu5bPOGCex6j3+
 JmYQVYZMzu+c2lq9J6DOHLlU9D0MVkz4D7oVN3O3mTd7TuyTu4gdpN+sWE5zWNFRH1h0
 s1HA==
X-Gm-Message-State: AAQBX9e5MjfXT7HIhl1JdNQWFBKV8pEtLLlF105ipCVthveal0IY8Z5h
 A7pfAudZGNEOlGBB4fFGhgH7yQ==
X-Google-Smtp-Source: AKy350bNr4KJH+ZbusBX8ddHYWCR5TF9ug/D4hQCNf5bE3nZzYv03gsenyNx3XTYaQjbqtu0borjcw==
X-Received: by 2002:a5d:6b0a:0:b0:2cd:bc79:5444 with SMTP id
 v10-20020a5d6b0a000000b002cdbc795444mr3747030wrw.2.1680690413210; 
 Wed, 05 Apr 2023 03:26:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bd5-20020a05600c1f0500b003f0472ffc7csm1768461wmb.11.2023.04.05.03.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:26:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DA471FFB7;
 Wed,  5 Apr 2023 11:26:52 +0100 (BST)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7> <87h6tulkae.fsf@linaro.org>
 <20230405060340-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
 Boeuf <sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Wed, 05 Apr 2023 11:24:43 +0100
In-reply-to: <20230405060340-mutt-send-email-mst@kernel.org>
Message-ID: <87cz4ilj4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Viresh Kumar <viresh.kumar@linaro.org> writes:
>>=20
>> > On 09-03-23, 14:20, Viresh Kumar wrote:
>> >> Hello,
>> >>=20
>> >> This patchset tries to update the vhost-user protocol to make it supp=
ort special
>> >> memory mapping required in case of Xen hypervisor.
>> >>=20
>> >> The first patch is mostly cleanup and second one introduces a new xen=
 specific
>> >> feature.
>> >
>> > Can we apply this now ? I have developed code for rust-vmm crates
>> > based on this and we need to get this merged/finalized first before
>> > merging those changes.
>>=20
>>=20
>> I've queued into my virtio/vhost-user-device series so I'll get merged
>> with that series unless mst wants to take it now.
>
> Well the patches are tagged and I was going to take these after the relea=
se.
> Probably easier not to work on this in two trees.
> Still if there's something in your tree being blocked
> by these patches then
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Let me know.

The virtio/vhost-user-device tree work is orthogonal to this vhost-user
enhancement although all the work is related to our latest VirtIO
project inside Linaro, Orko:
https://linaro.atlassian.net/wiki/spaces/ORKO/overview

So if you are happy please take these patches now for when the tree
re-opens.

>
>
>> >
>> > Thanks.
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

