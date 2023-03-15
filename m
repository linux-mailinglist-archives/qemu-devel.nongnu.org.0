Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8C6BAB37
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMsE-00005g-AJ; Wed, 15 Mar 2023 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pcMsB-0008SK-Kl
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:52:39 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pcMs9-0006Tf-Og
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:52:39 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 88721404DE;
 Wed, 15 Mar 2023 09:52:27 +0100 (CET)
Message-ID: <02f9bba3-1f3d-6f1f-af0e-a388dc2b7377@proxmox.com>
Date: Wed, 15 Mar 2023 09:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vl: defuse PID file path resolve error
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: hreitz@redhat.com, t.lamprecht@proxmox.com, d.csapak@proxmox.com,
 berrange@redhat.com
References: <20221031094716.39786-1-f.ebner@proxmox.com>
 <d4384eef-f55b-8ca8-9aeb-5ff77ceae8c2@proxmox.com>
Content-Language: en-US
In-Reply-To: <d4384eef-f55b-8ca8-9aeb-5ff77ceae8c2@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 24.01.23 um 14:55 schrieb Fiona Ebner:
> Am 31.10.22 um 10:47 schrieb Fiona Ebner:
>> Commit 85c4bf8aa6 ("vl: Unlink absolute PID file path") introduced a
>> critical error when the PID file path cannot be resolved. Before this
>> commit, it was possible to invoke QEMU when the PID file was a file
>> created with mkstemp that was already unlinked at the time of the
>> invocation. There might be other similar scenarios.
>>
>> It should not be a critical error when the PID file unlink notifier
>> can't be registered, because the path can't be resolved. If the file
>> is already gone from QEMU's perspective, silently ignore the error.
>> Otherwise, only print a warning.
>>
>> Fixes: 85c4bf8aa6 ("vl: Unlink absolute PID file path")
>> Reported-by: Dominik Csapak <d.csapak@proxmox.com>
>> Suggested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>> ---
>>
>> v1 -> v2:
>>     * Ignore error if errno == ENOENT.
>>
>>  softmmu/vl.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index b464da25bc..cf2c591ba5 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2432,10 +2432,11 @@ static void qemu_maybe_daemonize(const char *pid_file)
>>  
>>          pid_file_realpath = g_malloc0(PATH_MAX);
>>          if (!realpath(pid_file, pid_file_realpath)) {
>> -            error_report("cannot resolve PID file path: %s: %s",
>> -                         pid_file, strerror(errno));
>> -            unlink(pid_file);
>> -            exit(1);
>> +            if (errno != ENOENT) {
>> +                warn_report("not removing PID file on exit: cannot resolve PID "
>> +                            "file path: %s: %s", pid_file, strerror(errno));
>> +            }
>> +            return;
>>          }
>>  
>>          qemu_unlink_pidfile_notifier = (struct UnlinkPidfileNotifier) {
> 
> Ping
> 

Ping again. While it's not a critical patch, it's also not a big one :)

Best Regards,
Fiona


