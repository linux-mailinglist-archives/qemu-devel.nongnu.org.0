Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0B34E983
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:47:00 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREhu-000127-7d
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lREgC-0000C0-5t
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:45:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lREgA-0006zQ-8o
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:45:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1035521wmq.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5im11dc5pIe8yRE29vIrjhBST14Hf7+CiJe3yjy7YQU=;
 b=eFmwTNdUlRd45m+TmA+v6oF8vLKGnRXacgInGB2mHWsWzh+emSSqvkBXvILbDxlhHn
 ZeS89Prd17Wm1ZKbcrU/qH9HBFeMp+KhO6Uxc9NUHGN2x8QFi/goR5agw208gg/BxEQN
 vVGIXORHhvpRi0Oeuxy31vAlcIWU6cA123YAlRhcXQL0KV5rFPiu6GYH8O/z+g+BDYyq
 863D0yhwrt88KF5ZnFOasRnEo6havU3n/xQs1uMx+YdQV43ajlN5soMvW9XNXq3K99fT
 H11XBB0zo1bnFjKawlgEb4UAFMbNSYblD5SECsUoj+kF0lTTp3Vah5crC3U0gAFxjQKO
 A2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5im11dc5pIe8yRE29vIrjhBST14Hf7+CiJe3yjy7YQU=;
 b=fs2+P5iGuMG5yTfF9DcZ+j9imkYMwwczF1+7qX+QFxk/Wkwsk418kv/2Ri/ObrO9oa
 TdyzXloPVTedHJ6MBmwwZtt6R7h5sGKXEKBVn/x0gDK2hd4ldH0FSIzskobdsy4VHTV6
 8ZrlALShE9EZ1dYfwDkEDNqB2IzYmz0/vxIS13cSgatA2wXfPVsFmr0GuY6C1NLGKMiv
 pIWbadgxY8NzaatJstDwAcIfd+MSA9IcK/X5nnN2fPxENVVDNgY1qsPxWysQ3n6JoXeh
 wnK2ilXxBawQGck101hX75B6QJK3MIvZklhJN24U4Ut8R3UpxlJqi/qr/19uOwBnvwD9
 m2yw==
X-Gm-Message-State: AOAM533qj5mLOZkddm19MR6zNLHxORYCoLOLFoPXWGeIsRXvo7U55Qb5
 lHx4BUtahN+i6TGzRoUHGpDGIg==
X-Google-Smtp-Source: ABdhPJwx1Fn5IrHazEGg/1wtx4YXfyKELnZPhjJTXmXKYQR+vS+js6X88JdiTtjwizlKMuRR//USow==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr4184414wmh.69.1617111907370;
 Tue, 30 Mar 2021 06:45:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm3757796wmb.34.2021.03.30.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:45:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6E521FF7E;
 Tue, 30 Mar 2021 14:45:05 +0100 (BST)
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <290a8771-7273-a898-a826-c97df6eefb1b@intel.com>
 <20210325052227.fm3i25xphhu26amu@vireshk-i7>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Date: Tue, 30 Mar 2021 13:49:25 +0100
In-reply-to: <20210325052227.fm3i25xphhu26amu@vireshk-i7>
Message-ID: <87a6qkycv2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 25-03-21, 13:09, Jie Deng wrote:
>>=20
>> On 2021/3/24 15:33, Viresh Kumar wrote:
<snip>
>=20=20
>> > +/* vhost-user-i2c definitions */
>> > +
>> > +#ifndef container_of
>> > +#define container_of(ptr, type, member) ({                      \
>> > +        const typeof(((type *) 0)->member) *__mptr =3D (ptr);     \
>> > +        (type *) ((char *) __mptr - offsetof(type, member));})
>> > +#endif
>>=20
>>=20
>> This seems to be a general interface.=C2=A0 I see there is a definition =
in
>> qemu/compiler.h.
>>=20
>> Can we reuse it ?
>
> Damn. My bad (maybe not). I picked this part from the RPMB patchset
> that Alex sent and didn't bother looking for it.
>
> Though on the other hand, we are looking to make this file independent
> of qemu so it can be used by other hypervisors without any (or much)
> modifications, and maybe so it was done so.
>
> Alex ?

Yes when doing virtio-rpmb I ended up copying a bunch of helper
functions from the core QEMU to avoid a dependency on the core code.
These included the vrpmb_iov_* functions as well as the HMAC-SHA-256
implementation (which QEMU has as well).

That said maybe this is futile because I ended up having to qemuutil to
the dependencies:

  dependencies: [qemuutil, glib, gio, vhost_user],

because it ends up failing to build due to the trace_ points that have
been added to the libvhost-user library. I'm sure this wouldn't be too
difficult to overcome if needed.

That said this is all build time dependencies - the final binary does
not rely on a QEMU library as everything it needs from qemu is
statically linked in. That doesn't stop it being portable to other
hypervisors or running independently of QEMU but it does tie it to being
built as part of the source tree.

--=20
Alex Benn=C3=A9e

