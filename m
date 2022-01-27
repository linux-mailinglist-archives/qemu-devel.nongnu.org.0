Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF649E23C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:22:22 +0100 (CET)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3nB-0004pW-MR
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3K3-000224-N3
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:52:15 -0500
Received: from [2a00:1450:4864:20::42e] (port=39721
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3K1-0003rY-Sf
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:52:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s9so4284018wrb.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=J32YRRvubcvH+G0DcSKEUpH881ecDRy/XA4es9r1le0=;
 b=zLgQ/J/yXDoITM3hjrhmxalkfZbFXTwl/w6gxNToy+PrPJG2ApNGJyeKW3biflrkZ6
 rZQHu3Vjtc2buuQ5ZkLc4aWFbWofRgXLxBpeC5cqAdxfg97/ddqjw97ZXvVzf9jQCasi
 DFfSvPmkKGPnrBBF0EYkkqo9NUhmvrZGS5rw9T41VAG5/BFyuF0HaRN2FAsgzpqgNXMD
 GNdNgqhd2P40OlGXGQLyu5npE/wR8l7dMafBuLt+4oQUAXe2dLEawbUK8lZAMaigcN5G
 Vw6deUD3NYoGIgaIVx8KbtiF8VEg3QyyEBrAQfO+FNiZ/LtfPV+I0VfJ69sDCn4aOGYA
 OJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=J32YRRvubcvH+G0DcSKEUpH881ecDRy/XA4es9r1le0=;
 b=1Shf/QRZo4C5gEhe+pii4rhnIh4/mWVkQLQ5Hcm00upYsuI3bNNB7GMEM3+AL1f1VG
 mc+a3sCHfr0Bx6HyIf0XwPE86GksaatvdUSqTtnDZjn4MU+6Juvod0WBi5T3nJKiEF5v
 EoDLDUiSWri1W++L3IKnktsRJZgyHzgPpEyD1IM8CVLWux2bnvKb6euogjF/tgZ0B+mp
 vXfsN/pm02Ld+4L6o8k6l6VYonz7M32215nCvrj1Jjj67FjY+/30ijYc2tQpmCoNz17x
 pkFou5tT4me7kC1V+oWUqDUs3i+bVBRTKQTvhpvThvHQ4HQ8tTytwsGNq8EYrs0Fbb4w
 BfUw==
X-Gm-Message-State: AOAM532M2lVbHWFb+CNMqUHQse4x9L6BvQG09jIt9faDNXUL+1H211xM
 M4KzbCtLYCoylwUFia/kMx+paA==
X-Google-Smtp-Source: ABdhPJxqCmE31jPx6t+vwS28BSP8f0Kn//1a2ea2JtqBkkVX9Rf/r4Uggp3lrsOeH2Ipg5wbUFb1+w==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr2699787wrr.586.1643284332327; 
 Thu, 27 Jan 2022 03:52:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm3126774wry.36.2022.01.27.03.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:52:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8102F1FFB7;
 Thu, 27 Jan 2022 11:52:10 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-10-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 09/42] hw/cxl/device: Timestamp implementation (8.2.9.3)
Date: Thu, 27 Jan 2022 11:50:08 +0000
In-reply-to: <20220124171705.10432-10-Jonathan.Cameron@huawei.com>
Message-ID: <874k5pbdlh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> Per spec, timestamp appears to be a free-running counter from a value
> set by the host via the Set Timestamp command (0301h). There are
> references to the epoch, which seem like a red herring. Therefore, the
> implementation implements the timestamp as freerunning counter from the
> last value that was issued by the Set Timestamp command.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 53 +++++++++++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_device.h |  6 +++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 1a87846356..cea4b2a59c 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -43,6 +43,9 @@ enum {
>          #define CLEAR_RECORDS   0x1
>          #define GET_INTERRUPT_POLICY   0x2
>          #define SET_INTERRUPT_POLICY   0x3
> +    TIMESTAMP   =3D 0x03,
> +        #define GET           0x0
> +        #define SET           0x1
>  };
>=20=20
>  /* 8.2.8.4.5.1 Command Return Codes */
> @@ -117,8 +120,11 @@ define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, 0x=
20);
>  define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
>  define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
>  define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
> +declare_mailbox_handler(TIMESTAMP_GET);
> +declare_mailbox_handler(TIMESTAMP_SET);
>=20=20
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_POLICY_CHANGE (1 << 3)
>  #define IMMEDIATE_LOG_CHANGE (1 << 4)
>=20=20
>  #define CXL_CMD(s, c, in, cel_effect) \
> @@ -129,10 +135,57 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
>      CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
>      CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
>      CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
> +    CXL_CMD(TIMESTAMP, GET, 0, 0),
> +    CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
>  };
>=20=20
>  #undef CXL_CMD
>=20=20
> +/*
> + * 8.2.9.3.1
> + */
> +define_mailbox_handler(TIMESTAMP_GET)
> +{
> +    struct timespec ts;
> +    uint64_t delta;
> +
> +    if (!cxl_dstate->timestamp.set) {
> +        *(uint64_t *)cmd->payload =3D 0;
> +        goto done;
> +    }
> +
> +    /* First find the delta from the last time the host set the time. */
> +    clock_gettime(CLOCK_REALTIME, &ts);

Could you consider using qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)?
Otherwise by introducing a dependency on real time you'll loose the
ability to get deterministic execution via icount.=20

> +    delta =3D (ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec) -
> +            cxl_dstate->timestamp.last_set;
> +
> +    /* Then adjust the actual time */
> +    stq_le_p(cmd->payload, cxl_dstate->timestamp.host_set + delta);
> +
> +done:
> +    *len =3D 8;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +/*
> + * 8.2.9.3.2
> + */
> +define_mailbox_handler(TIMESTAMP_SET)
> +{
> +    struct timespec ts;
> +
> +    clock_gettime(CLOCK_REALTIME, &ts);
> +
> +    cxl_dstate->timestamp.set =3D true;
> +    cxl_dstate->timestamp.last_set =3D
> +        ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec;
> +
> +    cxl_dstate->timestamp.host_set =3D le64_to_cpu(*(uint64_t *)cmd->pay=
load);
> +
> +    *len =3D 0;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
>  QemuUUID cel_uuid;
>=20=20
>  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index f88f844cb6..3dde7fb1fb 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -114,6 +114,12 @@ typedef struct cxl_device_state {
>          size_t cel_size;
>      };
>=20=20
> +    struct {
> +        bool set;
> +        uint64_t last_set;
> +        uint64_t host_set;
> +    } timestamp;
> +
>      /* memory region for persistent memory, HDM */
>      uint64_t pmem_size;
>  } CXLDeviceState;


--=20
Alex Benn=C3=A9e

