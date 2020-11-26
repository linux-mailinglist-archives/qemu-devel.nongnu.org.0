Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F42C5D58
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:07:14 +0100 (CET)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiOTw-0001Az-Ha
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiOSv-0000cJ-E4
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:06:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiOSt-00076U-SX
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:06:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62402ACA8;
 Thu, 26 Nov 2020 21:06:04 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
 <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
Date: Thu, 26 Nov 2020 22:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/20 3:25 PM, Paolo Bonzini wrote:
> On 26/11/20 15:13, Claudio Fontana wrote:
>> One option I see is simply to document the behavior where
>> accel_available() is declared in accel.h (ie do not use in fast
>> path), as well as in accel_find() actually, so that both accel_find()
>> and accel_available() are avoided in fast path and avoid being called
>> frequently at runtime.
>>
>> Another option could be to remove the allocation completely, and use
>> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
>> again would be to remove the allocation and use either a fixed buffer
>> + snprintf, or alloca -like builtin code to use the stack, ...
>>
>> Not a big deal, but with a general utility and short name like
>> accel_available(name) it might be tempting to use this more in the
>> future?
> 
> I think it's just that the usecase is not that common.  "Is this 
> accelerator compiled in the binary" is not something you need after 
> startup (or if querying the monitor).
> 
> Paolo
> 
> 

A script that repeatedly uses the QMP interface to query for the status could generate fragmentation this way I think.

Ciao,

Claudio

