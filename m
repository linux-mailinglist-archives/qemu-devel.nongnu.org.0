Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB74B73DE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:47:55 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0zZ-0007Mz-ON
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nK0uI-0004JG-Uz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:42:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nK0uG-0004H8-47
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:42:26 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AF7AA20780;
 Tue, 15 Feb 2022 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644943341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfxFPFokk5XOe+rX3+eyWXYRDO9TbA7IF9gvBxlfuWo=;
 b=hasfWNpR1XGRm3fRxo0QUI1warfP2/yAGo3XT4DBPoNwmE4XX9apBavOju7fOaurfyze0F
 7XKH3sxbnrkQPGxiM/+7hIlWPFMTgIXZxPqAmXkY+casmnOg8g78a7+UHzWAOxEbHj5ir5
 ev88jsRjYPSFzMLb7JfMZkJYHx3Bwac=
Message-ID: <24441ff5-ff17-40f0-d06e-64583810d006@greensocs.com>
Date: Tue, 15 Feb 2022 17:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: qdev instance_init vs realize split
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
 <CAFEAcA9P7DyYqBCLeTMRSTiw2jYMfQ97vs_u+55nCdov7LDdrw@mail.gmail.com>
 <cfca692c-db64-aeaf-73da-3d36655a44d7@greensocs.com>
 <CAFEAcA-b=7t3-0Hxam+Sfhmv9AFdZ_=qFZXjOxdnqxFkfqwvcg@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA-b=7t3-0Hxam+Sfhmv9AFdZ_=qFZXjOxdnqxFkfqwvcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/15/22 14:35, Peter Maydell wrote:
> On Tue, 15 Feb 2022 at 13:21, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> Are you saying that: if an operation like a mmio/irq definition is done
>> in realize(), in theory, we should have the unrealize() counterpart ?
> 
> I'm saying that at the moment we have two categories of device:
>   * ones which are intended to be pluggable and so might be
>     destroyed at runtime: these have to support the full
>     instance_init->realize->unrealize->finalize cycle
>   * ones which are only created in machine models and then exist
>     for the lifetime of the QEMU process: these have to support
>     instance_init->finalize (for the benefit of monitor introspection
>     which can create and delete devices in that way) but otherwise
>     only need to support the instance_init->realize and don't
>     need to handle the unrealize->finalize part
> 
> and maybe we should consider whether it would be better to write
> all our devices in the same way to handle the full set of
> state transitions.
> 
> But if we do decide that then we'd need to have a testing framework
> that actually exercised the whole lifecycle for all devices, and
> it would probably be a lot of work, so maybe it's not worthwhile.
> 
> We'd also want where we can to have APIs that arrange to do
> the handling of destruction for you. I think the GPIO line
> APIs are like this, for instance. That's much less prone to
> "forgot to clean it up" bugs.
> 
> -- PMM

Thanks for the clarification,
--
Damien

