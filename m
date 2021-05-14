Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF7380A1B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:06:13 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXW8-0005ng-KY
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lhXQP-0001MK-4G
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:00:17 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lhXQM-0005RJ-Me
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:00:16 -0400
Received: from [192.168.2.107] (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E88AE20771;
 Fri, 14 May 2021 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620997212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQ8jwWqa3uNTqiwA9F7NU5SpG5m8EyRXh+4bYJme5nA=;
 b=pCC4v8tjJcxN9tPWtwjSbCSN9dD/yiCAfR2PIbDRvnCWTNYXH915GuDvYz+H/OvHrsMjNt
 gEHawtcNLz3H7XqK0sJllyK7ZYyrfFXZQz/N3fy23uDP4c2Dh/gFxEAkQvOO6oH9n3O/Yz
 5QlBp65NPZszzQxmSmrIiO19PwH3jWY=
Subject: Re: [RFC PATCH 7/9] qdev-monitor: Restructure and fix the check for
 command availability
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-8-mirela.grujic@greensocs.com>
 <f8d01067-b0ab-afb6-2e54-b7e8c8a9b0e8@redhat.com>
From: Mirela Grujic <mirela.grujic@greensocs.com>
Message-ID: <3380f22a-f6a0-3b1f-0e98-6e9390721d43@greensocs.com>
Date: Fri, 14 May 2021 15:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f8d01067-b0ab-afb6-2e54-b7e8c8a9b0e8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/13/21 7:43 PM, Paolo Bonzini wrote:
> On 13/05/21 10:25, Mirela Grujic wrote:
>> The existing code had to be restructured to make room for adding
>> checks that are specific to the machine phases.
>>
>> The fix is related to the way that commands with the 'allow-preconfig'
>> option are treated.
>>
>> Commands labelled with the 'allow-preconfig' option were meant to be 
>> allowed
>> during the 'preconfig' state, i.e. before the machine is initialized.
>> The equivalent of 'preconfig' state (after its removal) is machine init
>> phase MACHINE_INIT_PHASE_ACCEL_CREATED. Therefore, commands with
>> 'allow-preconfig' option should be allowed to run while the machine is
>> in MACHINE_INIT_PHASE_ACCEL_CREATED phase.
>> Before this patch, those commands were allowed to run if the machine is
>> not ready, which includes three more phases besides the accel-created
>> phase. Since there were no means to enter other phases via QMP, the
>> implementation was fine. However, with the introduction of
>> 'next-machine-phase' and 'advance-machine-phase' commands, one could
>> enter machine 'initialized' phase and still have available 'preconfig'
>> commands, which is incorrect.
>>
>> This patch makes available 'allow-preconfig' commands only when they're
>> needed - before the machine is initialized, in the accel-created phase.
>> To enable a command after the machine gets initialized and before it
>> becomes ready, one should use 'allow-init-config' option that will be
>> introduced in the following patch.
>
> There aren't many commands that are valid only for the accel created 
> or machine initialized phase.  I think adding allow-init-config is 
> more churn than keeping only allow-preconfig, and calling phase_check 
> in the individual commands.  (Or even better, in the internal APIs 
> that they call, so that QMP is completely oblivious to phases and just 
> gets the Error* back).
>
> In other words, allow-preconfig is there because there are many 
> commands that are allowed only after the machine-ready phase, but 
> anything in the middle can be handled just fine from C code.


To summarize, 'allow-preconfig' specifies whether a command is allowed 
to run before the machine is ready, so any command that should be 
allowed to run at phase < 'machine-ready' must have this flag set. For 
those commands, one should check the current machine phase in the 
implementation of the command to determine whether the command should 
run or not, and return an error if not. Ok, that's fine.


>
> Paolo
>

