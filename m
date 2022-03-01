Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BC4C8F86
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:59:55 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4uo-0005oS-9t
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP4tF-00054T-Ma
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:58:17 -0500
Received: from [2a00:1450:4864:20::62f] (port=38433
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP4tD-00067U-CF
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:58:16 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r13so32407528ejd.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mBA1nrxC2djQfaZpzWM/GlJwzw7WlqUdtrz34aLHs7k=;
 b=qM4vqZpm0X4RD+mmCvA12But+9ZUotM8A+cXFcivf/Vjlqy/oPavIkX7ssZd+/R047
 vrFXPjoN+J0sqJeiwyrLdlm/bPsOtEzhyavnviFBY7E+FK8DqZlYZuYmXLxO93p578TL
 quJHEbhVoybiGfToaf3FfqTTfS/XA30SxDqIiWsQcBMzJHviRctzd9XnpcSA6fANk6bU
 VuWAJvqlqbo4XX8VU76EQUHoxCN0ib4nJPNvV4sG1V2/BTUUfj1TaCLuIQkTLNzd1PGD
 C2ZJrRZf+vFls6wMecqa/1nKOEKcJk8JM9KFOVUi2eXJutyh67FWueIHvcgJBcaRws9y
 CvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mBA1nrxC2djQfaZpzWM/GlJwzw7WlqUdtrz34aLHs7k=;
 b=jZugawE6XC7EtmhvDKQ61OknhkvNQesLDNIs2XMCD1bFYBHpAq63iKk+WvdtSygI27
 KE8cKr//u/ORyaDO4ClxDf19oAOh22pDUg5vu67bHIhWRGmRsWZ0JltzfdfRLgiZ15ch
 R5hFIwaCDh9Dbm+SYffD90xw6ne/RXkI5IRVUpJTarlCJyX+unDBJ1YuAc/qEbLK64Ue
 GT9Y9rb9rxeF8ztFJMEoHxI1JDvmWWTMmyccJiQJaJ3xCPKAO/QoXU0ydjogUWqWi3HL
 2jgvbUGd/Fm1U2W5Gub8GJkUcfI+7S4Z0NxZ8W0wj7biB7lZ+KbErUnHELRdgfBqbbB7
 bWag==
X-Gm-Message-State: AOAM532Wxdl8b5xc0wYyXw0W3PFFTlhuDvIA3slUDDmBMFEVzjjz+Mad
 vPyEC79+3ayqWpZa+VMg7Dt5sg==
X-Google-Smtp-Source: ABdhPJySCdtzG5JKLMgmRecBIfVd9iUewRfAxR/jmTC9RiwKvRhrydkkK9XRtKfsmDyzEmvR27IV7g==
X-Received: by 2002:a17:906:36ce:b0:6d6:e540:ed65 with SMTP id
 b14-20020a17090636ce00b006d6e540ed65mr2862826ejc.330.1646150293918; 
 Tue, 01 Mar 2022 07:58:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ov6-20020a170906fc0600b006cf54ef58ddsm5523747ejb.149.2022.03.01.07.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:58:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE88B1FFB7;
 Tue,  1 Mar 2022 15:58:11 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-10-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 09/43] hw/cxl/device: Timestamp implementation (8.2.9.3)
Date: Tue, 01 Mar 2022 15:54:20 +0000
In-reply-to: <20220211120747.3074-10-Jonathan.Cameron@huawei.com>
Message-ID: <8735k1mzqk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
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
> Errata F4 to CXL 2.0 clarified the meaning of the timer as the
> sum of the value set with the timestamp set command and the number
> of nano seconds since it was last set.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 44 +++++++++++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_device.h |  6 +++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 8aa1b1e525..258285ab03 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -44,6 +44,9 @@ enum {
>          #define CLEAR_RECORDS   0x1
>          #define GET_INTERRUPT_POLICY   0x2
>          #define SET_INTERRUPT_POLICY   0x3
> +    TIMESTAMP   =3D 0x03,
> +        #define GET           0x0
> +        #define SET           0x1
>  };
>=20=20
>  /* 8.2.8.4.5.1 Command Return Codes */
> @@ -106,9 +109,48 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
>  DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
>  DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
>=20=20
> +/* 8.2.9.3.1 */
> +static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
> +                                  CXLDeviceState *cxl_dstate,
> +                                  uint16_t *len)
> +{
> +    uint64_t time, delta;
> +
> +    if (!cxl_dstate->timestamp.set) {
> +        *(uint64_t *)cmd->payload =3D 0;
> +        goto done;
> +    }
> +
> +    /* First find the delta from the last time the host set the time. */
> +    time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    delta =3D time - cxl_dstate->timestamp.last_set;
> +
> +    /* Then adjust the actual time */
> +    stq_le_p(cmd->payload, cxl_dstate->timestamp.host_set + delta);
> +
> +done:

Again I think an unnecessary goto for want of:

 uin64_t final_time =3D 0;
 if (cxl_dstate->timestamp.set) {
    /* First find the delta from the last time the host set the time. */
    time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
    delta =3D time - cxl_dstate->timestamp.last_set;
    final_time =3D cxl_dstate->timestamp.host_set + delta;
 }

 /* Then adjust the actual time */
 stq_le_p(cmd->payload, final_time);


> +    *len =3D 8;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +/* 8.2.9.3.2 */
> +static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
> +                                  CXLDeviceState *cxl_dstate,
> +                                  uint16_t *len)
> +{
> +    cxl_dstate->timestamp.set =3D true;
> +    cxl_dstate->timestamp.last_set =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);
> +
> +    cxl_dstate->timestamp.host_set =3D le64_to_cpu(*(uint64_t *)cmd->pay=
load);
> +
> +    *len =3D 0;
> +    return CXL_MBOX_SUCCESS;
> +}
> +
>  static QemuUUID cel_uuid;
>=20=20
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_POLICY_CHANGE (1 << 3)
>  #define IMMEDIATE_LOG_CHANGE (1 << 4)
>=20=20
>  static struct cxl_cmd cxl_cmd_set[256][256] =3D {
> @@ -120,6 +162,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
>          cmd_events_get_interrupt_policy, 0, 0 },
>      [EVENTS][SET_INTERRUPT_POLICY] =3D { "EVENTS_SET_INTERRUPT_POLICY",
>          cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
> +    [TIMESTAMP][GET] =3D { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
> +    [TIMESTAMP][SET] =3D { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDI=
ATE_POLICY_CHANGE },
>  };
>=20=20
>  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 7fd8d0f616..8102d2a813 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -117,6 +117,12 @@ typedef struct cxl_device_state {
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

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

