Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A22B515A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:42:29 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekOS-0000qd-GU
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejmn-0006qT-NR
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:03:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:53560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejml-0008Lv-Mi
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:03:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B036FAD20;
 Mon, 16 Nov 2020 19:03:27 +0000 (UTC)
Subject: Re: [PATCH 5/7] scsi: Add mapping for generic SCSI_HOST status to
 sense codes
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-6-hare@suse.de>
 <07739b7b-2087-0279-8f4b-6c909079cf48@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <931dd292-e5fb-4956-aaaf-02429a61b730@suse.de>
Date: Mon, 16 Nov 2020 20:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <07739b7b-2087-0279-8f4b-6c909079cf48@redhat.com>
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

On 11/16/20 7:57 PM, Paolo Bonzini wrote:
> On 16/11/20 19:40, Hannes Reinecke wrote:
>> +        case SCSI_HOST_TARGET_FAILURE:
>> +            *sense = SENSE_CODE(TARGET_FAILURE);
>> +            return CHECK_CONDITION;
>> +        case SCSI_HOST_RESERVATION_ERROR:
>> +            return RESERVATION_CONFLICT;
>> +        case SCSI_HOST_ALLOCATION_FAILURE:
>> +            *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
>> +            return CHECK_CONDITION;
>> +        case SCSI_HOST_MEDIUM_ERROR:
>> +            *sense = SENSE_CODE(READ_ERROR);
>> +            return CHECK_CONDITION;
> 
> Can these actually be visible to userspace?  I'd rather avoid having 
> them in QEMU if possible.
> 
> Otherwise, the patches are completely sensible.
> 
And I did it exactly for the opposite purpose: rather than painstakingly 
figuring out which codes _might_ be returned (and be utterly surprised 
if we missed some) add an interpretation for every _possible_ code, 
avoiding nasty surprises.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

