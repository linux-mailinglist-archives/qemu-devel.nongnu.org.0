Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5924C922C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:48:21 +0100 (CET)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6bj-00075s-L0
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6Z6-000647-LB
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:45:38 -0500
Received: from [2a00:1450:4864:20::632] (port=39451
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6Z1-0003FK-V1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:45:36 -0500
Received: by mail-ej1-x632.google.com with SMTP id dr20so8293412ejc.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dLRHgK7nPexBu1vWY80XXHBQPDHlcif0KUYC1mcwzmc=;
 b=RxMY1ZosMAOqRVJ/Q62iGfyo95fbP7PR/q3HCI0Yl5X+WKrMAtsYJcz2z5M8aA2Q65
 WiD4nvxaeVrSJC8R1TPXf3uk3gjbCXIV/y9bL107A98UMmBX2C68R1ZbBrknt1ThFpQy
 inUdpcVOP/TRbKl7oZqBorP9efVpVkA/LMBpAt9i801dSRvOE03I4sy/Fo+o4TX5Dv8U
 6lK4cbocAAOr4wqb1AHUW3delmzzmKiV/rnqVaYWFWsg3kLdjKYkdBjH9+lSbfJBsUua
 Y2yEIV1GgNmm+n3T+KYYZOfPD2juSW23n6+CQndOvnLCwlrggeRB0c9j1qGgxohbqpFf
 MTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dLRHgK7nPexBu1vWY80XXHBQPDHlcif0KUYC1mcwzmc=;
 b=AYxWlUQ56n5Xj/IUHcZU360h7t0sndRYHf1nsuENH4AhvXw4tv4yY1VwsuOgrcHs+X
 4ZoPyDV785FyWxnS2QbSJh+8EmLOM1CPXoCoXZIkLApO9np3IV3XODWxQ8+FNVLMEgZn
 PsUtfaukA5rTjPQXRBtqbTkRiH3S2ogPUcfHHKnReJCeiV9XXHI1wT+3sOUJ6Kb+52kK
 qDAXr2WDFZ7BSSWVvI3tTZVEgN1IY6pT0VfDiPLYkmCwHurdTAM9RSVvpR+44XD0utLz
 ePFdc5cP4UOwPz5e8HLW7dqWlIIZhw9034wOQ60mp3s94rbMhC/fDFKEOtx0cJQIrv9X
 GQXA==
X-Gm-Message-State: AOAM531yksUDzRgJKpzwwTUiP417CCdQsRAKQWyNNDBG5iQKjKk8SyTY
 xy4A3nimygynt0dcLXdxDO3Z7A==
X-Google-Smtp-Source: ABdhPJzmX8W2OEZNcd9SAtFhpUufuevKMDHeZSOP6NoY6+6SsTnfPsVTmH1d++kdm+Wva3rTdxEJXw==
X-Received: by 2002:a17:906:b28b:b0:6cc:734c:812d with SMTP id
 q11-20020a170906b28b00b006cc734c812dmr20182689ejz.657.1646156730177; 
 Tue, 01 Mar 2022 09:45:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 rv11-20020a17090710cb00b006d5c0cd5e0dsm5495649ejb.82.2022.03.01.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 09:45:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31FBF1FFB7;
 Tue,  1 Mar 2022 17:45:28 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-11-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 10/43] hw/cxl/device: Add log commands (8.2.9.4) + CEL
Date: Tue, 01 Mar 2022 17:45:23 +0000
In-reply-to: <20220211120747.3074-11-Jonathan.Cameron@huawei.com>
Message-ID: <87y21tlg7b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
> CXL specification provides for the ability to obtain logs from the
> device. Logs are either spec defined, like the "Command Effects Log"
> (CEL), or vendor specific. UUIDs are defined for all log types.
>
> The CEL is a mechanism to provide information to the host about which
> commands are supported. It is useful both to determine which spec'd
> optional commands are supported, as well as provide a list of vendor
> specified commands that might be used. The CEL is already created as
> part of mailbox initialization, but here it is now exported to hosts
> that use these log commands.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

