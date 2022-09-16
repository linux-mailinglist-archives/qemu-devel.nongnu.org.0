Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C85BA716
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 08:55:41 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ5GF-0004kn-LI
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 02:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ5Cm-0001yx-8V
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 02:52:05 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ5Ck-0003yL-4B
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 02:52:03 -0400
Received: by mail-ej1-x636.google.com with SMTP id y17so42233549ejo.6
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=WOf1m7xnIM8PHRmPlY0OHQSDc5n9urwHTQ4y4O3YTz0=;
 b=DKo09I++KMr4cW1deDbscZWpspQ+DEVZ1lhZqkAjeJbPwSDqk7+wEqneGu8CQep3WX
 Ma2J7mkmaripTPBEQdMa9jzPb26Q0wl7T61f4aCC2p8HWxcgsq4ImHJ0Hi7+ig2DdbdK
 qmcYL38TQHqLEYbydSt3uAYb4tVo2ivpDEgzLTMT+jL/PjMOBaUj0xF9cP+58P+K3p6I
 9/5Y88PqUtBgzj4+Qq0d3yhZMcPcxpK8eXM5G8bVdy/gTjF//IL7FodYSLnFw0BusnmW
 ykxCZBocnHcyNJ7Me05XeTcQuQa5Yl2Sxfn0MgJDurOV/Yf4ommprhh0NNMoOj54v5tB
 LzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=WOf1m7xnIM8PHRmPlY0OHQSDc5n9urwHTQ4y4O3YTz0=;
 b=BW7FLBTM3w2z19AeQU6A5izchQVKlrlQwrLxC006roFI76J2udCBD6g3PG404jlg1R
 vnhmGxtsxfBPxyr2mPo/wNQQONPF32PHyQNk78rIyFj2qTqgOBmctNN5bpsiTq9qHWTr
 emJR0MyNEe79nNli3jpZ1UbDXvJ7hc2IxoPoZUD0YcrB8z+ISKe4sI25Taj2U5LN8GTy
 wkkwBxPrWC7bQFFQlcum1AK0dtCOXP/Q0EcMAfCddyJAs+uWV4/MrhktUZ1P6EOAdvFr
 EeAlrQnhRrOMSUSrNkLmY9rvZeqXhH8QSxp0/0EgUNemAAOjgXBWlNwm3VgjYBmXDgM3
 lAGQ==
X-Gm-Message-State: ACrzQf0u/SOb3mxyt8yg+9GoS6eMMLCZBpKoQr27M0G2F6NshdntDetK
 e0kqwGTigmtkavXbW8tJiwnB9Q==
X-Google-Smtp-Source: AMsMyM6d57c7q3hCT2QoQHNur5YwIVscnXpjddrHYH8Au2JvaNdsLWZV3nrqKtcNF6KhHIelbP1u7w==
X-Received: by 2002:a17:907:6ea3:b0:77c:4e23:9b2d with SMTP id
 sh35-20020a1709076ea300b0077c4e239b2dmr2555140ejc.6.1663311119269; 
 Thu, 15 Sep 2022 23:51:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 pv15-20020a170907208f00b0073d678f50bfsm9915745ejb.164.2022.09.15.23.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:51:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0807A1FFB7;
 Fri, 16 Sep 2022 07:51:58 +0100 (BST)
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Date: Fri, 16 Sep 2022 07:51:40 +0100
In-reply-to: <20220802095010.3330793-1-alex.bennee@linaro.org>
Message-ID: <87czbvzu9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> This is an update to the previous series which fixes the last few
> niggling CI failures I was seeing.
>
>    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio clean=
ups
>    Date: Tue, 26 Jul 2022 20:21:29 +0100
>    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
>
> The CI failures were tricky to track down because they didn't occur
> locally but after patching to dump backtraces they all seem to involve
> updates to virtio_set_status() as the machine was torn down. I think
> patch that switches all users to use virtio_device_started() along
> with consistent checking of vhost_dev->started stops this from
> happening. The clean-up seems worthwhile in reducing boilerplate
> anyway.
>
> The following patches still need review:
>
>   - tests/qtest: enable tests for virtio-gpio
>   - tests/qtest: add a get_features op to vhost-user-test
>   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
>   - tests/qtest: add assert to catch bad features
>   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
>   - tests/qtest: catch unhandled vhost-user messages
>   - tests/qtest: use qos_printf instead of g_test_message
>   - tests/qtest: pass stdout/stderr down to subtests
>   - hw/virtio: move vhd->started check into helper and add FIXME
>   - hw/virtio: move vm_running check to virtio_device_started
>   - hw/virtio: add some vhost-user trace events
>   - hw/virtio: log potentially buggy guest drivers
>   - hw/virtio: fix some coding style issues
>   - include/hw: document vhost_dev feature life-cycle
>   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
>   - hw/virtio: fix vhost_user_read tracepoint
>   - hw/virtio: handle un-configured shutdown in virtio-pci
>   - hw/virtio: gracefully handle unset vhost_dev vdev
>   - hw/virtio: incorporate backend features in features
<snip>

Ping?

--=20
Alex Benn=C3=A9e

