Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B84C280F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:28:01 +0100 (CET)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAPo-0007lX-NV
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNAFk-0006WE-53
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:17:39 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:19368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNAFh-0004rL-97
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:17:35 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2F61546E37;
 Thu, 24 Feb 2022 10:17:22 +0100 (CET)
Message-ID: <40352d01-3577-088d-23c6-1ab5f062d8a9@proxmox.com>
Date: Thu, 24 Feb 2022 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v8 1/3] monitor/hmp: add support for flag argument with
 value
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-2-f.ebner@proxmox.com> <87tud8f7t0.fsf@pond.sub.org>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <87tud8f7t0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.22 um 15:12 schrieb Markus Armbruster:
> Fabian Ebner <f.ebner@proxmox.com> writes:

----8<----

>> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
>> index 3da3f86c6a..a4cb307c8a 100644
>> --- a/monitor/monitor-internal.h
>> +++ b/monitor/monitor-internal.h
>> @@ -63,7 +63,8 @@
>>   * '.'          other form of optional type (for 'i' and 'l')
>>   * 'b'          boolean
>>   *              user mode accepts "on" or "off"
>> - * '-'          optional parameter (eg. '-f')
>> + * '-'          optional parameter (eg. '-f'); if followed by a 'V', it
>> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>>   *
>>   */
> 
> For what it's worth, getopt() uses ':' after the option character for
> "takes an argument".
> 

Doing that leads to e.g.
    .args_type  = "protocol:s,password:s,display:-d:,connected:s?",
so there's two different kinds of colons now. It's not a problem
functionality-wise AFAICT, but it might not be ideal. Should I still go
for it?

Also, wouldn't future non-string flag parameters need their own letter
too? What about re-using 's' here instead?

> Happy to make that tweak in my tree.  But see my review of PATCH 3
> first.
> 
> 


