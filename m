Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755794BF30D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:01:58 +0100 (CET)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQ7Q-00016v-TC
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMQ2p-00005e-IW
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:57:13 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMQ2n-0007uw-Jc
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:57:11 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8EEFA21C2B;
 Tue, 22 Feb 2022 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645516626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iwEAubtbHz/OhIW136oxUgkZlh3LPU58x1ebdS9upg=;
 b=ubyZ0HheifbXoZDYo1sIouzdwsDCD4fPuKWn/L9V7GQtsHfwRjwOso2cRHHoHQNjgwbXRq
 34AeXtHTGFkN6JuVsLFQlR2rAayyeMN4G8vYBtNcol/eIkp6JzyHeRxodh2oHhq0cKRC+Q
 jJdGvuurG6nt7qCkDXs+oX5LDgjrEd4=
Message-ID: <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
Date: Tue, 22 Feb 2022 08:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <87bkyzzb1q.fsf@pond.sub.org>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/22/22 07:10, Markus Armbruster wrote:
> Damien Hedde <damien.hedde@greensocs.com> writes:
> 
>> Hi,
>>
>> The main idea of this series is to be a bit more user-friendly when
>> using qmp-shell in a non-interactive way: with an input redirection
>> from a file containing a list of commands.
>>
>> I'm working on dynamic qapi config of a qemu machine, this would
>> be very useful to provide and reproduce small examples.
> 
> Why not use plain QMP for that?
> 
> [...]
> 
What do you mean by plain QMP ?

--
Damien

