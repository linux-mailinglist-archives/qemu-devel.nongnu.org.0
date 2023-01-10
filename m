Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F800664CCC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKeC-0007Qj-3u; Tue, 10 Jan 2023 14:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1pFJTb-0000Su-88; Tue, 10 Jan 2023 13:35:59 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1pFJTZ-0003e5-IZ; Tue, 10 Jan 2023 13:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1673375757; x=1704911757;
 h=from:message-id:date:mime-version:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=op4k0+8qJSgCeLHDIcYdryGtlZ/c/GEdCnpwyj51FKE=;
 b=Va8WZGRbwsCo687EM2VxxyqLf18SQtkEo4kFwsmyroAp18dffgXKrAIs
 ZYxZCrScf+oa9sm6y9YPzW08Tx23gw8XUy/jiIga/rg3NdYBVyAdO431V
 d0yeHwM4VgoOfYRvudOrYaRLqvjgWJxWm5r3ofVwW+NuFKx7VHBFOpZnV s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jan 2023 10:35:53 -0800
From: Rebecca Cran <quic_rcran@quicinc.com>
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:35:53 -0800
Received: from [10.110.12.52] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 10 Jan
 2023 10:35:53 -0800
Message-ID: <651bd2d7-efae-404b-bc1b-f0bcbc97c863@quicinc.com>
Date: Tue, 10 Jan 2023 11:35:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref.c: Start APs powered off
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230102154630.211785-1-rebecca@quicinc.com>
 <CAFEAcA8b8PCp_JVcrSFNYsOYTNWaAedkELENVNcVH9_mc-Go8A@mail.gmail.com>
In-Reply-To: <CAFEAcA8b8PCp_JVcrSFNYsOYTNWaAedkELENVNcVH9_mc-Go8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_rcran@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Jan 2023 14:50:55 -0500
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

On 1/5/23 10:34, Peter Maydell wrote:

> This board disables QEMU's own PSCI implementation and relies on
> a guest EL3 firmware to provide PSCI. So how will that EL3
> firmware implement the "power on" to bring up the secondaries?
> QEMU has the APIs to allow implementation of a model of a
> hardware power controller (target/arm/arm-powerctl.h) but
> as far as I can see the sbsa-ref board doesn't yet implement
> one, so if you start the CPUs in the powered-off state there's
> no way for them ever to be powered on.

Sorry, I've been working on a machine where the power controller _was_ 
implemented so I missed that that's not present in sbsa-ref.

-- 
Rebecca Cran


