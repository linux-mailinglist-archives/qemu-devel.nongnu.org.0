Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAF6A2160
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcgy-0006fZ-4l; Fri, 24 Feb 2023 13:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcgn-0006fM-N7
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:21:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcgk-00029h-Dz
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:21:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id bt28so51932wrb.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8a4GZn4ha/5hEHiBbNnraxRAqCIgTi7PRjzwWK8+ESU=;
 b=N1DAEs2WC/OXmk0i+ZhAPYAdw9TMRfuFPwvVoLS/i4fgwhLiNb58S0qxDWWTFQKmaF
 H+G4FKG1baO9JRqcZBwejznUAe+mlZtpxsSTRaJvMVS0lQ8y84yhUmNcamMi71go3OcU
 VB6i6jotD8Vl1MPaGl4yCeRXEsSb7MTwNSoLoFSXGLPOCDFeZ6SRF22sjaPq1r5KNWTp
 6hQIj9SQcvVYtpdJqNP8+DLnhpJgspir+XLh4XWPr6K+46kHKXNN7ezcCYwSS/ofPDOU
 7rAHSLsxEHRvMwQGaSymKIMHrs0cMrBlfygbY1jHM/atrOeCGTRrdGegtGPphx7NavL/
 2bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8a4GZn4ha/5hEHiBbNnraxRAqCIgTi7PRjzwWK8+ESU=;
 b=1yZYUjcbS7RNtnN6yYwz9snlpvFtMiJt4zelPD42kcFVVxsghTZl98KoSt6a9Ug82S
 xwr0qWXDDqTe7y/y4pUpp0Cgp94dpg9D6U1QzKaBctfj5lnK4YHrW1GyCtlDO/wLCjAt
 9aN59UUhsA8TBm1RV1tjSKsww3Q5/M3abzpTbCmcA04VV4ebj7Y4Y46hkodNjiGYyI1k
 Y1tlu8D+6gxP2in5lGdCKa+sqBsTLBzI2QE3fyaQ0Y3kLNctXP/S6QEnDUlMf/qdzmns
 hQKG83wDxSXXn+i2XUG8VkQA9OK2X7XbB0ZGmM5ZH0+Ou6BwBxQl1WykwdikZ8QOe3zm
 wxyw==
X-Gm-Message-State: AO0yUKV6382F7bR8WCRSnj9RxU5D0CKjoRxBvZabQK3e4lWEF/i5ItOg
 LwBFiNV+RRLuYCUJthaRt9MsRg==
X-Google-Smtp-Source: AK7set8UPFrVTjYS0MJCgqyh+wW7y7tnk9QcLIurR75ujbKeyLojHM11V5UzbFoZuqm3NOPolHAXfA==
X-Received: by 2002:a5d:5274:0:b0:2c7:1e32:f7ff with SMTP id
 l20-20020a5d5274000000b002c71e32f7ffmr2555417wrc.16.1677262856092; 
 Fri, 24 Feb 2023 10:20:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm3967939wmq.47.2023.02.24.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:20:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53E091FFB7;
 Fri, 24 Feb 2023 18:20:55 +0000 (GMT)
References: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
 Boeuf <sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC QEMU] docs: vhost-user: Add custom memory mapping support
Date: Fri, 24 Feb 2023 18:20:31 +0000
In-reply-to: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
Message-ID: <878rgmorg8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> The current model of memory mapping at the back-end works fine with
> Qemu, where a standard call to mmap() for the respective file
> descriptor, passed from front-end, is generally all we need to do before
> the front-end can start accessing the guest memory.
>
> There are other complex cases though, where we need more information at
> the backend and need to do more than just an mmap() call. For example,
> Xen, a type-1 hypervisor, currently supports memory mapping via two
> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> followed by an ioctl() (or vice-versa), and need to pass extra
> information via the ioctl(), like the Xen domain-id of the guest whose
> memory we are trying to map.
>
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> lets the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end can send the
> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> information to the back-end.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424eb0..f2b1d705593a 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -258,6 +258,23 @@ Inflight description
>=20=20
>  :queue size: a 16-bit size of virtqueues
>=20=20
> +Custom mmap description
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+-------+
> +| flags | value |
> ++-------+-------+
> +
> +:flags: 64-bit bit field
> +
> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory map=
ping.
> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
> +
> +:value: a 64-bit hypervisor specific value.
> +
> +- For Xen foreign or grant memory access, this is set with guest's xen d=
omain
> +  id.
> +
>  C structure
>  -----------
>=20=20
> @@ -867,6 +884,7 @@ Protocol features
>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
>=20=20
>  Front-end message types
>  -----------------------
> @@ -1422,6 +1440,20 @@ Front-end message types
>    query the back-end for its device status as defined in the Virtio
>    specification.
>=20=20
> +``VHOST_USER_CUSTOM_MMAP``
> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :request payload: Custom mmap description
> +  :reply payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has be=
en
> +  successfully negotiated, this message is submitted by the front-end to
> +  notify the back-end of the special memory mapping requirements, that t=
he
> +  back-end needs to take care of, while mapping any memory regions sent
> +  over by the front-end. The front-end must send this message before
> +  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_T=
ABLE``
> +  or ``VHOST_USER_ADD_MEM_REG`` message types.
> +
>=20=20
>  Back-end message types
>  ----------------------

This looks good enough for me. We will see how it works in prototype.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

