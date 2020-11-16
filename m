Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C132B5170
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:46:22 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekSD-0004eo-Me
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejoX-00089g-KD
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:05:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:54368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejoT-0000Jw-Ry
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:05:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18AF9AC98;
 Mon, 16 Nov 2020 19:05:15 +0000 (UTC)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
 <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
Date: Mon, 16 Nov 2020 20:05:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 7:58 PM, Paolo Bonzini wrote:
> On 16/11/20 19:40, Hannes Reinecke wrote:
>> +    if (sreq->host_status == SCSI_HOST_OK) {
>> +        SCSISense sense;
>> +
>> +        sreq->status = scsi_sense_from_host_status(sreq->host_status, 
>> &sense);
>> +        if (sreq->status == CHECK_CONDITION) {
>> +            scsi_req_build_sense(sreq, sense);
>> +        }
>> +    }
> 
> Should be != of course.
> 
No.
scsi_req_build_sense() transfers the sense code from the second argument
into a proper SCSI sense. Which is only set if the status is 
CHECK_CONDITION...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

