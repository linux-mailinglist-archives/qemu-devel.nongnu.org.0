Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D4610B12
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:14:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooJYA-0005Bu-LE; Fri, 28 Oct 2022 03:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ooJY1-00054x-NY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:12:59 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ooJXk-0000QW-Q5
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:12:54 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1294E44C43;
 Fri, 28 Oct 2022 09:12:35 +0200 (CEST)
Message-ID: <6fdd4b06-4c9b-5a7c-d16d-c3b362fecb81@proxmox.com>
Date: Fri, 28 Oct 2022 09:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] vl: change PID file path resolve error to warning
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, hreitz@redhat.com,
 t.lamprecht@proxmox.com, d.csapak@proxmox.com
References: <20221027101443.118049-1-f.ebner@proxmox.com>
 <Y1p22/LxBASPUTcV@redhat.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <Y1p22/LxBASPUTcV@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.10.22 um 14:17 schrieb Daniel P. Berrangé:
> On Thu, Oct 27, 2022 at 12:14:43PM +0200, Fiona Ebner wrote:
>> +            warn_report("not removing PID file on exit: cannot resolve PID file"
>> +                        " path: %s: %s", pid_file, strerror(errno));
>> +            return;
>>          }
> 
> I don't think using warn_report is desirable here.
> 
> If the behaviour of passing a pre-unlinked pidfile is considered
> valid, then we should allow it without printing a warning every
> time an application does this.
> 
> warnings are to highlight non-fatal mistakes by applications, and
> this is not a mistake, it is intentionally supported behaviour.
> 
> With regards,
> Daniel

But what if the path resolution fails in a scenario where the caller did
not pre-unlik the PID file? Should the warning only be printed when the
errno is not ENOENT? Might still not be accurate in all cases though.

Best Regards,
Fiona


