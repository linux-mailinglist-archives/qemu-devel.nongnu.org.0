Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FA6D7931
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:02:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzxy-0004vS-Lw; Wed, 05 Apr 2023 06:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjzxd-0004rQ-Jj
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:01:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjzxc-0001JJ-0j
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:01:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j24so35650689wrd.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680688906;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDFJjTGQNkjMjQaKDKrEsiOprP+3eY5rMht1R3BPmqI=;
 b=qJuUB8lXKPAV5az5FqyOzh/WnCwEbzeWlRe/pF6mMPsBue+wMOt4jrinivf9lbjUpj
 549SQvsI4JEw1kWHpGuzNjjgtF2FaRY74NPXxJL3rebT/OBdwarrYv3hKyub+n6lHD+v
 W1KKhZQ8xjsJwLmRTzhw1Jk0CGJc9RwPZTQr83EK9C0L96NZNLAlfk8qH1mvrT1mhp9E
 V7+aPEI7hnb4bZ+spDvZL1hbXutqqILlju2OgGdfRbp7wMf7Tpzjfq2e+dBmEqUyZHIe
 XvGZlRwMbSL9yUBa64cqjZlqK/PQIpmHT+l9dqKQsfiMiQ0J67JYpgDz+eVq5o4Ks3H7
 Semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680688906;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xDFJjTGQNkjMjQaKDKrEsiOprP+3eY5rMht1R3BPmqI=;
 b=ZTErZ0DhushuQDU+gTLGgWu55vG9zx+yBOsd3uVzLMHuwHrcB7zNWrnKHcZpoNK0aS
 mY+BVfCV1093nQ6ByaSVuS7QATDuAA1crboGFHwWV7m8H1ZDIn0dJIPCQDybo7A6SbIn
 QKHaY10U0RKhruxI/XG4kmJ0vnc1sP0ivnmZQCsbpWl2oCxvTVzdNPwSFStm9uGaSAfl
 SlywwJJq9q8mwZpXfHIHQ2w/ygJ54m2Pr6uZjC0hLN5RW0VHeRs/TQFu9peB3zJQGEil
 AC7KoqhPsRteQlfIUv2RmnVb81k/Grv9BRWjHZHCdnLXHBRWrxxdvwEEGv/Ta4gLPE19
 VeOw==
X-Gm-Message-State: AAQBX9fyIQDxO6mI/Gr/zbCOVNc5nUjAFEQBP3dTOLjlMUjb/QXhdQka
 TDaTKCgCNl1s5ajSHEHCohF8Zg==
X-Google-Smtp-Source: AKy350ZtC2zcGgpmA1tObIYkI/B3t4R7tGoffPFGOXgc8gOET2D0kOgJ1A31FE4xklaO7MxIT2j8nA==
X-Received: by 2002:adf:f1cc:0:b0:2cf:e67c:8245 with SMTP id
 z12-20020adff1cc000000b002cfe67c8245mr3708097wro.44.1680688905956; 
 Wed, 05 Apr 2023 03:01:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfec47000000b002cfe687fc7asm14532282wrn.67.2023.04.05.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:01:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E04B1FFB7;
 Wed,  5 Apr 2023 11:01:45 +0100 (BST)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Liu Jiang
 <gerry@linux.alibaba.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Wed, 05 Apr 2023 11:00:34 +0100
In-reply-to: <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
Message-ID: <87h6tulkae.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 09-03-23, 14:20, Viresh Kumar wrote:
>> Hello,
>>=20
>> This patchset tries to update the vhost-user protocol to make it support=
 special
>> memory mapping required in case of Xen hypervisor.
>>=20
>> The first patch is mostly cleanup and second one introduces a new xen sp=
ecific
>> feature.
>
> Can we apply this now ? I have developed code for rust-vmm crates
> based on this and we need to get this merged/finalized first before
> merging those changes.


I've queued into my virtio/vhost-user-device series so I'll get merged
with that series unless mst wants to take it now.

>
> Thanks.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

