Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE89645D3C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2vz7-00066G-6g; Wed, 07 Dec 2022 10:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2vz2-00065f-Us
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:05:19 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2vyy-0001wA-Th
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:05:16 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CA6721E69;
 Wed,  7 Dec 2022 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670425507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3kzN2s+9GE7vCX+o2t42LXwygnDTWezAYFO05irQBk=;
 b=J48e07KPsfHPIJ6HVilSeUeywP3wJtK9l4lJdZP9h5xjKU+Qi8K2KSypP01xwzrTd+4OlU
 /8JjroKnGJfc6Q3CaQcfTGcHZIt+nIuv0YSoHsAkQcLGxQjHglWYqvPnJq4wqrX82WuY42
 +6g9v/aouL6bQNCQFHYTdX0Yt8EQXDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670425507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3kzN2s+9GE7vCX+o2t42LXwygnDTWezAYFO05irQBk=;
 b=7Osv56sYHAjF81FRvGXFdLywx96pqKfRmm5PNYS8Pla2lxoP71XlKJ4eDe6gcA7vWUR8hA
 T3OS24in9IHrGRBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4E03F134CD;
 Wed,  7 Dec 2022 15:05:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id GvETEaOrkGPAJwAAGKfGzw
 (envelope-from <cfontana@suse.de>); Wed, 07 Dec 2022 15:05:07 +0000
Message-ID: <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
Date: Wed, 7 Dec 2022 16:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
Content-Language: en-US
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: wxhusst@gmail.com, Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/22 12:31, Marcel Apfelbaum wrote:
> Hi Yuval,
> Thank you for the changes.
> 
> On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>
>> Guest driver might execute HW commands when shared buffers are not yet
>> allocated.
>> This could happen on purpose (malicious guest) or because of some other
>> guest/host address mapping error.
>> We need to protect againts such case.
>>
>> Fixes: CVE-2022-1050
>>
>> Reported-by: Raven <wxhusst@gmail.com>
>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>> ---
>> v1 -> v2:
>>         * Commit message changes
>> v2 -> v3:
>>         * Exclude cosmetic changes
>> ---
>>  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>> index da7ddfa548..89db963c46 100644
>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>>
>>      dsr_info = &dev->dsr_info;
>>
>> +    if (!dsr_info->dsr) {
>> +            /* Buggy or malicious guest driver */
>> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>> +            goto out;
>> +    }
>> +
>>      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>>                        sizeof(struct cmd_handler)) {
>>          rdma_error_report("Unsupported command");
>> --
>> 2.20.1
>>
> 
> cc-ing Peter and Philippe for a question:
> Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
> have to wait a week or so.
> 
> Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Thanks,
> Marcel
> 

Hi all,

patch is reviewed, anything holding back the inclusion of this security fix?

Thanks,

Claudio

